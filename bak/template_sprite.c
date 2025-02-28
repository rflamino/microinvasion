/*****************************************************************************/
/* "Celestial Invasion" for MSX1 using hardware sprites (MSXgl).             */
/*****************************************************************************/

#include "msxgl.h"       // MSXgl
#include "print.h"       // Print system
#include "math.h"        // Random
#include "font/font_cbios_latin_br.h"
#include "color.h"
#include "vdp.h"
#include "psg.h"
/* ------------------------------------------------------------------------- */
/*                               CONSTANTS                                   */
/* ------------------------------------------------------------------------- */
#define SCREEN1_COLS       32
#define SCREEN1_ROWS       24

// Enemies
#define ENEMY_ROWS         3
#define ENEMY_PER_ROW      4
#define ENEMY_COUNT        (ENEMY_ROWS * ENEMY_PER_ROW)
#define ENEMY_START_ROW    3
#define ENEMY_ROW_SPACING  2

// In the original text version these were characters, but now we have sprites.
#define CHAR_SPACE         ' '     // For scoreboard clearing

#define SHIP_ROW           20
#define BULLET_OFF         255     // "Off" indicator for bullet Y
#define ENEMY_MOVE_DELAY   15

// Player bullet
#define MAX_EBULLETS       3

// Scoreboard
#define MAX_SCORE          999

/* ------------------------------------------------------------------------- */
/*                      SPRITE DEFINITIONS & INDICES                         */
/* ------------------------------------------------------------------------- */
// We need up to 20 sprites total:
//   0: Player
//   1: Player bullet
//   2-4: Enemy bullets
//   5-16: Enemies (12 total)
//   17-19: Explosions (3 total)
#define SPRID_PLAYER       0
#define SPRID_BULLET       1
#define SPRID_EBULLET_BASE 2
#define SPRID_ENEMY_BASE   5
#define SPRID_EXPLOSION   17

// We will define 4 distinct patterns in VRAM (each 8 bytes for 8×8):
//   pattern #0 = Player
//   pattern #1 = Enemy
//   pattern #2 = Player bullet
//   pattern #3 = Enemy bullet
//   pattern #4 = Explosion #1
#define PATTERN_PLAYER     0
#define PATTERN_ENEMY      1
#define PATTERN_BULLET     2
#define PATTERN_EBULLET    3
#define PATTERN_EXPLOSION  4

// Simple 8×8 single-color sprite shapes (one byte per row)
const u8 g_SpritePatternShip[8] = {
    0b00000000, // Row 1:   
    0b00011000, // Row 2:   **
    0b00111100, // Row 3:  ****
    0b01111110, // Row 4: ******
    0b11111111, // Row 5:********
    0b11011011, // Row 6:** ** **
    0b01111110, // Row 7: ******
    0b00100100  // Row 8:  *  *

};
const u8 g_SpritePatternInvader[8] = {
    0b00100100, // Row 1: ..#..#..
    0b01111110, // Row 2: .######.
    0b11011011, // Row 3: ##.##.##
    0b11100111, // Row 4: ###..###
    0b11100111, // Row 5: ###..###
    0b11011011, // Row 6: ##.##.##
    0b01111110, // Row 7: .######.
    0b00100100  // Row 8: ..#..#..
};

const u8 g_SpritePatternBullet[8] = {
    0b00010000, // Row 1
    0b00010000, // Row 2
    0b00010000, // Row 3
    0b00000000, // Row 4
    0b00000000, // Row 5
    0b00000000, // Row 6
    0b00000000, // Row 7
    0b00000000  // Row 8
};
const u8 g_SpritePatternEBullet[8] = {
    0b00000000, // Row 1
    0b00000000, // Row 2
    0b00000000, // Row 3
    0b00010000, // Row 4
    0b00010000, // Row 5
    0b00010000, // Row 6
    0b00000000, // Row 7
    0b00000000  // Row 8
};
const u8 g_SpritePatternExplosion[8] = {
    0b00100100, // Row 1
    0b01011010, // Row 2
    0b10000001, // Row 3
    0b01000010, // Row 4
    0b01000010, // Row 5
    0b10000001, // Row 6
    0b01011010, // Row 7
    0b00100100  // Row 8
};


/* ------------------------------------------------------------------------- */
/*                     GLOBAL GAME STATE VARIABLES                           */
/* ------------------------------------------------------------------------- */
// Enemy data
static u8   g_EnemyX[ENEMY_COUNT];     // tile-based X
static u8   g_EnemyY[ENEMY_COUNT];     // tile-based Y
static bool g_EnemyAlive[ENEMY_COUNT];
static i8   g_EnemyDir;                // +1 => right, -1 => left
static u8   g_EnemyMoveCount;

// Player
static u8   g_PlayerX;                 // tile-based X

// Player bullet
static u8   g_BulletX;                 // tile-based
static u8   g_BulletY;                 // tile-based (BULLET_OFF => none)

// Enemy bullets
static bool g_EBActive[MAX_EBULLETS];
static u8   g_EBX[MAX_EBULLETS];       // tile-based
static u8   g_EBY[MAX_EBULLETS];       // tile-based

// Score & hi-score
static u16  g_Score;
static u16  g_HiScore = 0;            // persists across restarts
static bool g_Running;                // is the game alive?

// Wave
static u8   g_Wave;                   // each wave = more difficult enemy firing

/* ------------------------------------------------------------------------- */
/*                             HELPER MACROS                                 */
/* ------------------------------------------------------------------------- */
// Convert tile-based X,Y into sprite-based pixel coordinates
// On MSX1, the top-left is (0,0) but Y must be +1 in sprite attribute.
#define SPR_X(x)  ((u8)((x) * 8)) 
#define SPR_Y(y)  ((u8)(((y) * 8) + 1))

// Hide a sprite by sending it well off-screen (common MSX trick)
static void HideSprite(u8 sprId)
{
    // Usually Y >= 216 hides the sprite on MSX
    VDP_SetSpritePosition(sprId, 0, 216);
}

/* ------------------------------------------------------------------------- */
/*                        INITIALIZE SPRITE PATTERNS                         */
/* ------------------------------------------------------------------------- */
static void InitSpritePatterns()
{
    // Load each 8×8 pattern into VRAM
    //  Each pattern index uses 8 bytes (one for each row).
    //  The second parameter is the pattern index in VRAM.
    //  The third parameter is how many patterns (8-byte blocks) to upload.
    VDP_LoadSpritePattern(g_SpritePatternShip, PATTERN_PLAYER, 1);
    VDP_LoadSpritePattern(g_SpritePatternInvader, PATTERN_ENEMY, 1);
    VDP_LoadSpritePattern(g_SpritePatternBullet, PATTERN_BULLET, 1);
    VDP_LoadSpritePattern(g_SpritePatternEBullet, PATTERN_EBULLET, 1);
}

/* ------------------------------------------------------------------------- */
/*               SETUP ALL SPRITES (COLOR, PATTERN, HIDE, etc.)             */
/* ------------------------------------------------------------------------- */
static void InitAllSprites()
{
    // Player
    VDP_SetSpritePattern(SPRID_PLAYER, PATTERN_PLAYER);
    VDP_SetSpriteColorSM1(SPRID_PLAYER, COLOR_CYAN);
    HideSprite(SPRID_PLAYER);

    // Player bullet
    VDP_SetSpritePattern(SPRID_BULLET, PATTERN_BULLET);
    VDP_SetSpriteColorSM1(SPRID_BULLET, COLOR_WHITE);
    HideSprite(SPRID_BULLET);

    // Enemy bullets
    for (u8 i = 0; i < MAX_EBULLETS; i++)
    {
        u8 sprId = SPRID_EBULLET_BASE + i;
        VDP_SetSpritePattern(sprId, PATTERN_EBULLET);
        VDP_SetSpriteColorSM1(sprId, COLOR_LIGHT_YELLOW);
        HideSprite(sprId);
    }

    // Enemies
    for (u8 i = 0; i < ENEMY_COUNT; i++)
    {
        u8 sprId = SPRID_ENEMY_BASE + i;
        VDP_SetSpritePattern(sprId, PATTERN_ENEMY);
        VDP_SetSpriteColorSM1(sprId, COLOR_LIGHT_RED);
        HideSprite(sprId);
    }
}

/* ------------------------------------------------------------------------- */
/*                          SCREEN / TEXT UTILS                              */
/* ------------------------------------------------------------------------- */
static void DrawChar(u8 x, u8 y, char c)
{
    // Only used for scoreboard or messages. 
    Print_SetPosition(x, y);
    Print_DrawChar(c);
}

static void ClearScreen(void)
{
    for (u8 row = 0; row < SCREEN1_ROWS; row++)
    {
        Print_SetPosition(0, row);
        for (u8 col = 0; col < SCREEN1_COLS; col++)
            Print_DrawChar(CHAR_SPACE);
    }
}

// Minimal integer printing up to 999
static void PrintNum(u16 val)
{
    if (val > MAX_SCORE) val = MAX_SCORE;
    char buf[4];
    buf[3] = '\0';
    for (int i = 2; i >= 0; i--)
    {
        buf[i] = (char)('0' + (val % 10));
        val /= 10;
    }
    Print_DrawText(buf);
}

// Show scoreboard in row=0 => "HI:XXX SC:XXX WV:XX"
static void UpdateScoreText()
{
    // HI:XXX - hi score
    Print_SetPosition(0, 0);
    Print_DrawText("HI:");
    Print_SetPosition(3, 0);
    PrintNum(g_HiScore);

    // SC:XXX - score
    Print_SetPosition(8, 0);
    Print_DrawText("SC:");
    Print_SetPosition(11, 0);
    PrintNum(g_Score);

    // WV:XX - wave
    Print_SetPosition(16, 0);
    Print_DrawText("WV:");
    // up to 99
    char buf[3];
    buf[2] = '\0';
    buf[1] = (char)('0' + (g_Wave % 10));
    buf[0] = (g_Wave < 10) ? ' ' : (char)('0' + (g_Wave / 10));
    Print_DrawText(buf);
}

/* ------------------------------------------------------------------------- */
/*                          ENEMY-WAVE LOGIC                                 */
/* ------------------------------------------------------------------------- */
static void ClearEnemyBullets()
{
    for (u8 i = 0; i < MAX_EBULLETS; i++)
    {
        g_EBActive[i] = false;
        HideSprite(SPRID_EBULLET_BASE + i);
    }
}

static void InitWaveEnemies()
{
    u8 idx = 0;
    for (u8 rowI = 0; rowI < ENEMY_ROWS; rowI++)
    {
        u8 rowY = ENEMY_START_ROW + (rowI * ENEMY_ROW_SPACING);
        for (u8 colI = 0; colI < ENEMY_PER_ROW; colI++)
        {
            g_EnemyX[idx] = 4 + colI * 4; // tile-based
            g_EnemyY[idx] = rowY;        // tile-based
            g_EnemyAlive[idx] = true;
            idx++;
        }
    }
    g_EnemyDir = 1;
    g_EnemyMoveCount = 0;
}

// Full wave init
static void InitWave()
{
    InitWaveEnemies();
    g_BulletY = BULLET_OFF;
    ClearEnemyBullets();
    g_Running = true;
}

/* ------------------------------------------------------------------------- */
/*                     SPRITE UPDATES FOR OBJECTS                            */
/* ------------------------------------------------------------------------- */
static void UpdateEnemySprite(u8 i)
{
    // If alive, place in sprite coords. If not, hide.
    if (g_EnemyAlive[i])
    {
        u8 sprId = SPRID_ENEMY_BASE + i;
        VDP_SetSpritePosition(sprId, SPR_X(g_EnemyX[i]), SPR_Y(g_EnemyY[i]));
    }
    else
    {
        HideSprite(SPRID_ENEMY_BASE + i);
    }
}

static void UpdateAllEnemiesSprites()
{
    for (u8 i = 0; i < ENEMY_COUNT; i++)
        UpdateEnemySprite(i);
}

static void UpdatePlayerSprite()
{
    // Player is always "alive" in logic, but we hide if game is over
    VDP_SetSpritePosition(SPRID_PLAYER, SPR_X(g_PlayerX), SPR_Y(SHIP_ROW));
}

static void UpdatePlayerBulletSprite()
{
    // If bullet is off, hide it; else show it
    if (g_BulletY == BULLET_OFF)
        HideSprite(SPRID_BULLET);
    else
        VDP_SetSpritePosition(SPRID_BULLET, SPR_X(g_BulletX), SPR_Y(g_BulletY));
}

static void UpdateEnemyBulletSprite(u8 i)
{
    // If active, show. Else, hide.
    if (g_EBActive[i])
    {
        u8 sprId = (u8)(SPRID_EBULLET_BASE + i);
        VDP_SetSpritePosition(sprId, SPR_X(g_EBX[i]), SPR_Y(g_EBY[i]));
    }
    else
    {
        HideSprite(SPRID_EBULLET_BASE + i);
    }
}

static void UpdateAllEnemyBulletsSprites()
{
    for (u8 i = 0; i < MAX_EBULLETS; i++)
        UpdateEnemyBulletSprite(i);
}

/* ------------------------------------------------------------------------- */
/*                 REFRESH ALL SPRITES TO CURRENT LOGIC STATE                */
/* ------------------------------------------------------------------------- */
static void DrawAll()
{
    // Scoreboard text
    UpdateScoreText();

    // Sprites
    UpdateAllEnemiesSprites();
    UpdatePlayerSprite();
    UpdatePlayerBulletSprite();
    UpdateAllEnemyBulletsSprites();
}

/* ------------------------------------------------------------------------- */
/*                 EXPLOSION SOUND                                           */
/* ------------------------------------------------------------------------- */
static void PlayExplosionSound()
{
    PSG_SetMixer(0b001000);  // Enable noise on **ALL channels**
    PSG_EnableNoise(2, 1);
    PSG_EnableEnvelope(2, 1); // Use envelope for controlled decay

    // **Initial powerful explosion burst**
    PSG_SetNoise(0x03);      // VERY low noise frequency for deep impact
    PSG_SetVolume(2, 0xF);   // Max volume
    PSG_SetEnvelope(0x2000); // Longer decay time for extended explosion
    PSG_SetShape(0x09);      // Fast attack, slow decay
    PSG_Apply();

    // **Sustain explosion & increase chaos (longer duration)**
    for (u8 i = 0; i < 20; i++)  // Longer effect
    {
        PSG_SetNoise(0x03 + i * 2);  // Gradually increase noise frequency for expansion effect
        PSG_Apply();
    }

    // **Final deep rumble before fading**
    for (u8 i = 0; i < 10; i++)
    {
        PSG_SetNoise(0x20 - i);  // Shift noise frequency for rolling thunder effect
        PSG_Apply();
    }

    // **Final sizzling effect**
    for (u8 i = 0; i < 5; i++)
    {
        PSG_SetNoise(0x1F);  // High-frequency crackle
        PSG_SetVolume(2, 6 - (i * 1));  // Gradual fade
        PSG_Apply();
    }

    // **Ensure explosion fully stops**
    PSG_SetMixer(0);
    PSG_EnableNoise(2, 0);
    PSG_EnableEnvelope(2, 0);
    PSG_SetVolume(2, 0);
    PSG_Apply();
}




/* ------------------------------------------------------------------------- */
/*                   ENEMY MOVEMENT (SIDEWAYS / DROP)                        */
/* ------------------------------------------------------------------------- */
static void MoveEnemiesIfTime()
{
    // Ensure mode_delay is always >= 2 (prevents instant movement)
    u8 mode_delay = (ENEMY_MOVE_DELAY > g_Wave) ? (ENEMY_MOVE_DELAY - g_Wave) : 2;

    g_EnemyMoveCount++;
    if (g_EnemyMoveCount < mode_delay)
        return;
    g_EnemyMoveCount = 0;

    // Decide whether we can shift horizontally or must drop
    bool canShift = true;
    for (u8 i = 0; i < ENEMY_COUNT; i++)
    {
        if (!g_EnemyAlive[i]) continue;
        int nx = (int)g_EnemyX[i] + g_EnemyDir;
        if (nx < 0 || nx >= SCREEN1_COLS)
        {
            canShift = false;
            break;
        }
    }
    if (canShift)
    {
        // Shift horizontally
        for (u8 i = 0; i < ENEMY_COUNT; i++)
        {
            if (g_EnemyAlive[i])
                g_EnemyX[i] += g_EnemyDir;
        }
    }
    else
    {
        // Drop down
        for (u8 i = 0; i < ENEMY_COUNT; i++)
        {
            if (!g_EnemyAlive[i]) continue;
            g_EnemyY[i]++;
            if (g_EnemyY[i] >= SHIP_ROW)
                g_Running = false;  // The enemies reached player row => lose
        }
        g_EnemyDir = -g_EnemyDir;
    }
    // Update sprite positions
    UpdateAllEnemiesSprites();
}

/* ------------------------------------------------------------------------- */
/*                       CHECK IF ALL ENEMIES ARE DEAD                       */
/* ------------------------------------------------------------------------- */
static bool AllEnemiesDead()
{
    for (u8 i = 0; i < ENEMY_COUNT; i++)
    {
        if (g_EnemyAlive[i])
            return false;
    }
    return true;
}

/* ------------------------------------------------------------------------- */
/*                        PLAYER BULLET LOGIC                                */
/* ------------------------------------------------------------------------- */
static void UpdatePlayerBullet()
{
    if (g_BulletY == BULLET_OFF)
        return;

    // Move up
    if (g_BulletY > 0)
        g_BulletY--;
    else
    {
        g_BulletY = BULLET_OFF;
        UpdatePlayerBulletSprite();
        return;
    }

    // If row=0 => bullet disappears
    if (g_BulletY == 0)
    {
        g_BulletY = BULLET_OFF;
        UpdatePlayerBulletSprite();
        return;
    }

    // Collision with enemies?
    for (u8 i = 0; i < ENEMY_COUNT; i++)
    {
        if (!g_EnemyAlive[i]) continue;
        if ((g_EnemyX[i] == g_BulletX) && (g_EnemyY[i] == g_BulletY))
        {
            // Enemy destroyed
            g_EnemyAlive[i] = false;
            g_BulletY = BULLET_OFF;
            g_Score++;
            UpdateScoreText();  // increment score
            UpdateEnemySprite(i);
            PlayExplosionSound(); // play explosion
            break;
        }
    }

    // Update bullet sprite position
    UpdatePlayerBulletSprite();
}

/* ------------------------------------------------------------------------- */
/*                         ENEMY BULLET LOGIC                                */
/* ------------------------------------------------------------------------- */
static void ClearEnemyBulletSlot(u8 i)
{
    g_EBActive[i] = false;
    HideSprite((u8)(SPRID_EBULLET_BASE + i));
}

static u16 EnemyBulletChance()
{
    // wave1 => ~1%, wave2 => ~1.5%, wave3 => ~2%, etc.
    // base = 600, subtract (wave-1)*100
    u16 base = 600;
    u16 sub = (g_Wave - 1) * 100;
    if (sub > 500) sub = 500;
    u16 c = (base > sub) ? (base - sub) : 100; // never < 100
    return c;
}

static void SpawnEnemyBullet()
{
    // find free slot
    u8 slot = 0xFF;
    for (u8 i = 0; i < MAX_EBULLETS; i++)
    {
        if (!g_EBActive[i])
        {
            slot = i;
            break;
        }
    }
    if (slot == 0xFF) return; // no free slot

    // pick random alive enemy
    for (u8 tries = 0; tries < 20; tries++)
    {
        u8 eidx = (Math_GetRandom16() % ENEMY_COUNT);
        if (g_EnemyAlive[eidx])
        {
            g_EBActive[slot] = true;
            g_EBX[slot] = g_EnemyX[eidx];
            g_EBY[slot] = g_EnemyY[eidx] + 1;
            UpdateEnemyBulletSprite(slot);
            return;
        }
    }
}

static void PossiblySpawnEnemyBullet()
{
    // Random chance based on wave
    if (Math_GetRandom16() < EnemyBulletChance())
        SpawnEnemyBullet();
}

static void UpdateEnemyBullets()
{
    for (u8 i = 0; i < MAX_EBULLETS; i++)
    {
        if (!g_EBActive[i]) continue;
        // move down
        if (g_EBY[i] < (SCREEN1_ROWS - 1))
            g_EBY[i]++;
        else
        {
            // bullet off-screen
            ClearEnemyBulletSlot(i);
            continue;
        }
        // collision with player row
        if (g_EBY[i] >= SHIP_ROW)
        {
            if (g_EBX[i] == g_PlayerX)
            {
                g_Running = false; // player hit
            }
            ClearEnemyBulletSlot(i);
        }
        else
        {
            // update bullet sprite
            UpdateEnemyBulletSprite(i);
        }
    }
}

/* ------------------------------------------------------------------------- */
/*                   RUN A SINGLE WAVE (returns success/die)                 */
/* ------------------------------------------------------------------------- */
static bool RunWave()
{
    static u8 fire_cnt = 0;
    static u8 fire_tone = 0x20;

    InitWave();
    ClearScreen();
    DrawAll();  // initial

    while (g_Running)
    {
        MoveEnemiesIfTime();
        if (!g_Running) break;

        if (AllEnemiesDead())
            return true; // wave complete

        PossiblySpawnEnemyBullet();

        // controls
        if (Keyboard_IsKeyPressed(KEY_LEFT))
        {
            if (g_PlayerX > 0)
            {
                g_PlayerX--;
                UpdatePlayerSprite();
            }
        }
        else if (Keyboard_IsKeyPressed(KEY_RIGHT))
        {
            if (g_PlayerX < (SCREEN1_COLS - 1))
            {
                g_PlayerX++;
                UpdatePlayerSprite();
            }
        }
        // fire
        if ((g_BulletY == BULLET_OFF) && Keyboard_IsKeyPressed(KEY_SPACE))
        {
            g_BulletX = g_PlayerX;
            g_BulletY = SHIP_ROW - 1;
            UpdatePlayerBulletSprite();
            fire_cnt = 5;

        }
        if (fire_cnt > 0) {
            PSG_EnableTone(0, 1);
            fire_cnt--;
            fire_tone--;
        }
        else {
            PSG_EnableTone(0, 0);
            fire_cnt = 0;
            fire_tone = 0x20;
        }

        PSG_SetTone(0, fire_tone);
        PSG_Apply(); //Send data to PSG registers

        UpdatePlayerBullet();
        UpdateEnemyBullets();

        Halt(); // Wait for next frame
    }
    return false; // died
}

/* ------------------------------------------------------------------------- */
/*                        RUN MULTIPLE WAVES (ROUND)                         */
/* ------------------------------------------------------------------------- */
static void RunGameRound()
{
    // reset wave=1, score=0, player pos ~ middle
    g_Wave = 1;
    g_Score = 0;
    g_PlayerX = SCREEN1_COLS / 2;
    g_Running = true;

    // Show the player sprite
    UpdatePlayerSprite();

    while (g_Running)
    {
        bool success = RunWave();
        if (!success)
            break; // died
        // next wave
        g_Wave++;
    }
}

void DisableKeyClick()
{
    POKE(0xF3DB, 0);  // Disable key click in the BIOS system variable
}

/* ------------------------------------------------------------------------- */
/*                                   MAIN                                    */
/* ------------------------------------------------------------------------- */
void main()
{
    // Set SCREEN 1 (GRAPHIC1) mode
    VDP_SetMode(VDP_MODE_GRAPHIC1);
    VDP_EnableVBlank(TRUE);
    VDP_ClearVRAM();

    // Initialize print (text) system
    Print_SetTextFont(g_Font_CBIOS_BR, 1);
    Print_SetColor(COLOR_WHITE, COLOR_BLACK);

    // Setup sprite patterns in VRAM and configure sprite attributes
    InitSpritePatterns();
    InitAllSprites();

    // Setup PSG
    PSG_SetTone(0, 0x400);
    PSG_SetTone(1, 0x800);
    PSG_SetTone(2, 0xA00);
    PSG_SetNoise(0x10);
    PSG_SetMixer(0);
    PSG_SetVolume(0, 0xF);
    PSG_SetVolume(1, 0xF);
    PSG_SetVolume(2, 0xF);
    PSG_SetEnvelope(0x800);
    PSG_SetShape(0xE);

    PSG_EnableTone(0, 0);
    PSG_EnableTone(1, 0);
    PSG_EnableTone(2, 0);

    PSG_EnableNoise(0, 0);
    PSG_EnableNoise(1, 0);
    PSG_EnableNoise(2, 0);

    PSG_EnableEnvelope(0, 0);
    PSG_EnableEnvelope(1, 0);
    PSG_EnableEnvelope(2, 0);

    PSG_Apply(); //Send data to PSG registers

    DisableKeyClick();

    while (true)
    {

        // Run game waves
        RunGameRound();

        // If the player's final score is bigger, update hi-score
        if (g_Score > g_HiScore)
            g_HiScore = g_Score;

        // Game Over
        Print_SetPosition(0, SHIP_ROW + 2);
        Print_DrawText("GAME OVER! Press RTN to restart.");

        // Hide the player sprite (optional)
        HideSprite(SPRID_PLAYER);

        // Wait for ESC
        while (!Keyboard_IsKeyPressed(KEY_RETURN))
        {
            Halt();
        }
    }
}
