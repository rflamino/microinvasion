/*****************************************************************************/
/* "Micro Invasion" for MSX1  (Powered by MSXgl).                            */
/*****************************************************************************/
/*
to do:
1- make ship walk walls using the left right commands (keyboard and joystick). It should climb the right wall when g_WallWalkActive is true, the ship is located extreme right and right command (keyboard and joystick) is active. The same for left wall.
2- change runwave() function for that.

*/


#include "mi.h"


static void PlayPowerUpSound(void)
{
    g_PowerUpSoundActive = true;
    g_PowerUpSoundTimer = 10;  // effect lasts for 10 frames

    PSG_EnableTone(1, 1);
    PSG_SetTone(1, NOTE_C5);   // starting frequency
    PSG_SetVolume(1, 15);

    // Optional: Set up an envelope for a fading effect.
    PSG_SetEnvelope(0x1800);  // now only one parameter
    PSG_SetShape(0x09);       // now only one parameter
    PSG_EnableEnvelope(1, 1);

    PSG_Apply();
}

static void UpdatePowerUpSound(void)
{
    if (!g_PowerUpSoundActive)
        return;

    if (g_PowerUpSoundTimer > 0)
    {
        g_PowerUpSoundTimer--;
        return;
    }

    // Turn off the power-up sound effect.
    PSG_EnableTone(1, 0);
    PSG_EnableEnvelope(1, 0);
    PSG_SetVolume(1, 0);
    PSG_Apply();

    g_PowerUpSoundActive = false;
}


//------------------------------------------------------------------------------
// STARFIELD ENTRANCE FX
//------------------------------------------------------------------------------
void StartStarfieldEntranceFX(void)
{
    s_StarfieldFXIndex = 0;
    s_StarfieldFXTimer = g_StarfieldEntranceFX[0].duration;
    s_StarfieldFXActive = true;
    PSG_EnableTone(1, 1);
    PSG_SetTone(1, g_StarfieldEntranceFX[0].tone);
    PSG_SetVolume(1, g_StarfieldEntranceFX[0].volume);
    PSG_Apply();
}

void UpdateStarfieldEntranceFX(void)
{
    if (!s_StarfieldFXActive) return;
    if (s_StarfieldFXTimer > 0)
    {
        s_StarfieldFXTimer--;
        return;
    }
    s_StarfieldFXIndex++;
    if (g_StarfieldEntranceFX[s_StarfieldFXIndex].tone == NOTE_REST &&
        g_StarfieldEntranceFX[s_StarfieldFXIndex].duration == 0)
    {
        s_StarfieldFXActive = false;
        PSG_SetVolume(1, 0);
        PSG_Apply();
        return;
    }
    s_StarfieldFXTimer = g_StarfieldEntranceFX[s_StarfieldFXIndex].duration;
    PSG_SetTone(1, g_StarfieldEntranceFX[s_StarfieldFXIndex].tone);
    PSG_SetVolume(1, g_StarfieldEntranceFX[s_StarfieldFXIndex].volume);
    PSG_Apply();
}

//------------------------------------------------------------------------------
// BACKGROUND DRAWING
//------------------------------------------------------------------------------
static void DrawBackground(void)
{
    // Draw starry sky.
    for (u8 row = 1; row < SKY_ROWS; row++)
    {
        Print_SetPosition(0, row);
        for (u8 col = 0; col < SCREEN1_COLS; col++)
        {
            if ((Math_GetRandom16() % STAR_DENSITY) == 0)
                Print_DrawChar(CHAR_STAR);
            else
                Print_DrawChar(CHAR_SPACE);
        }
    }
    // Draw ground.
    for (u8 row = SKY_ROWS; row < (SKY_ROWS + GROUND_ROWS); row++)
    {
        Print_SetPosition(0, row);
        for (u8 col = 0; col < SCREEN1_COLS; col++)
            Print_DrawChar(CHAR_GROUND);
    }

    Print_DrawLineH(0, 1, 32);// top line
}

//------------------------------------------------------------------------------
// MENU CALLBACKS
//------------------------------------------------------------------------------
const c8* MenuAction_GameStart(u8 op, i8 value)
{
    if (op == MENU_ACTION_SET)
    {
        if (value == 1)
            g_StartGame = true;
        else
            g_Exit = true;
    }
    return NULL;
}

const c8* MenuAction_About(u8 op, i8 value)
{
    (void)value;  // Suppress "unused parameter" warning

    if (op == MENU_ACTION_SET)
    {
        ClearScreen();
        Print_SetPosition(2, 5);
        Print_DrawText("Micro Invasion");
        Print_SetPosition(2, 7);
        Print_DrawText(VERSION_NUMBER);
        Print_SetPosition(2, 9);
        Print_DrawText("Developed by:");
        Print_SetPosition(2, 11);
        Print_DrawText("Reinaldo de Sales Flamino");
        Print_SetPosition(2, 13);
        Print_DrawText("Intro Music by:");
        Print_SetPosition(2, 15);
        Print_DrawText("Ludwig van Beethoven");
        Print_SetPosition(2, 22);
        Print_DrawText("Press SPACE key to return...");
        while (!Keyboard_IsKeyPressed(KEY_SPACE) && !Joystick_IsButtonPressed(JOY_PORT_1, JOY_INPUT_TRIGGER_A))
        {
            Halt();
            UpdateIntroMusic();
        }
        ClearScreen();
        Menu_DrawPage(0);
    }

    return NULL;
}

u8 Menu_Input_CB(void)
{
    u8 new = 0;

    if (Keyboard_IsKeyPressed(KEY_UP))    new |= MENU_INPUT_UP;
    if (Keyboard_IsKeyPressed(KEY_DOWN))  new |= MENU_INPUT_DOWN;
    if (Keyboard_IsKeyPressed(KEY_LEFT))  new |= MENU_INPUT_LEFT;
    if (Keyboard_IsKeyPressed(KEY_RIGHT)) new |= MENU_INPUT_RIGHT;
    if (Keyboard_IsKeyPressed(KEY_SPACE)) new |= MENU_INPUT_TRIGGER;

    // Joystick input from port 1
    u8 joyDir = Joystick_GetDirection(JOY_PORT_1);
    if (joyDir & JOY_INPUT_DIR_UP)           new |= MENU_INPUT_UP;
    if (joyDir & JOY_INPUT_DIR_DOWN)         new |= MENU_INPUT_DOWN;
    if (joyDir & JOY_INPUT_DIR_LEFT)         new |= MENU_INPUT_LEFT;
    if (joyDir & JOY_INPUT_DIR_RIGHT)        new |= MENU_INPUT_RIGHT;
    if (Joystick_IsButtonPressed(JOY_PORT_1, JOY_INPUT_TRIGGER_A))
        new |= MENU_INPUT_TRIGGER;

    u8 ret = (new & g_MenuInputPrev) ^ new;
    g_MenuInputPrev = new;

    return ret;
}

//------------------------------------------------------------------------------
// SPRITE HELPERS
//------------------------------------------------------------------------------
static void HideSprite(u8 sprId)
{
    VDP_SetSpritePosition(sprId, 0, 216);
}

static void LoadCommonSpritePatterns(void)
{
    VDP_LoadSpritePattern(g_SpritePatternShip, PATTERN_PLAYER, 1);
    VDP_LoadSpritePattern(g_SpritePatternEBullet, PATTERN_EBULLET, 1);
    // NEW: Load the shield power–up sprite pattern.
    VDP_LoadSpritePattern(g_SpritePatternPowerUp, PATTERN_POWERUP, 1);
    // NEW: Load the wall–walk power–up sprite pattern.
    VDP_LoadSpritePattern(g_SpritePatternWallWalkPowerUp, PATTERN_WALLWALK_POWERUP, 1);
    // NEW: Load the gravity power–up sprite pattern.
    VDP_LoadSpritePattern(g_SpritePatternGravityPowerUp, PATTERN_GRAVITY_POWERUP, 1);

}



static void LoadEnemyPatternForWave(u8 wave)
{
    switch (wave % 13)
    {
    case 1:
        VDP_LoadSpritePattern(g_SpritePatternCrab, PATTERN_ENEMY, 1);
        break;
    case 2:
        VDP_LoadSpritePattern(g_SpritePatternClassicInvader, PATTERN_ENEMY, 1);
        break;
    case 3:
        VDP_LoadSpritePattern(g_SpritePatternBat, PATTERN_ENEMY, 1);
        break;
    case 4:
        VDP_LoadSpritePattern(g_SpritePatternSpike, PATTERN_ENEMY, 1);
        break;
    case 5:
        VDP_LoadSpritePattern(g_SpritePatternScorpion, PATTERN_ENEMY, 1);
        break;
    case 6:
        VDP_LoadSpritePattern(g_SpritePatternUFO, PATTERN_ENEMY, 1);
        break;
    case 7:
        VDP_LoadSpritePattern(g_SpritePatternSpider, PATTERN_ENEMY, 1);
        break;
    case 8:
        VDP_LoadSpritePattern(g_SpritePatternCyclops, PATTERN_ENEMY, 1);
        break;
    case 9:
        VDP_LoadSpritePattern(g_SpritePatternCrab2, PATTERN_ENEMY, 1);
        break;
    case 10:
        VDP_LoadSpritePattern(g_SpritePatternInvader, PATTERN_ENEMY, 1);
        break;
    case 11:
        VDP_LoadSpritePattern(g_SpritePatternInvader2, PATTERN_ENEMY, 1);
        break;
    case 12:
        VDP_LoadSpritePattern(g_SpritePatternStar, PATTERN_ENEMY, 1);
        break;
    case 0:
        VDP_LoadSpritePattern(g_SpritePatternXInvader, PATTERN_ENEMY, 1);
        break;
    }
}

static u8 GetEnemyColorForWave(u8 wave)
{
    switch (wave % 12)
    {
    case 1:  return COLOR_LIGHT_RED;
    case 2:  return COLOR_LIGHT_BLUE;
    case 3:  return COLOR_MAGENTA;
    case 4:  return COLOR_DARK_GREEN;
    case 5:  return COLOR_LIGHT_YELLOW;
    case 6:  return COLOR_CYAN;
    case 7:  return COLOR_MEDIUM_RED;
    case 8:  return COLOR_DARK_YELLOW;
    case 9:  return COLOR_LIGHT_GREEN;
    case 10: return COLOR_GRAY;
    case 11: return COLOR_MEDIUM_GREEN;
    case 12: return COLOR_DARK_RED;
    case 0:  return COLOR_DARK_BLUE;
    default: return COLOR_WHITE;
    }
}

static void InitAllSprites(void)
{
    // Player sprite
    VDP_SetSpritePattern(SPRID_PLAYER, PATTERN_PLAYER);
    VDP_SetSpriteColorSM1(SPRID_PLAYER, COLOR_CYAN);
    HideSprite(SPRID_PLAYER);

    // Player bullet sprite
    VDP_SetSpritePattern(SPRID_BULLET, PATTERN_BULLET);
    VDP_SetSpriteColorSM1(SPRID_BULLET, COLOR_WHITE);
    HideSprite(SPRID_BULLET);

    // Enemy bullet sprites
    for (u8 i = 0; i < MAX_EBULLETS; i++)
    {
        u8 sprId = SPRID_EBULLET_BASE + i;
        VDP_SetSpritePattern(sprId, PATTERN_EBULLET);
        VDP_SetSpriteColorSM1(sprId, COLOR_LIGHT_YELLOW);
        HideSprite(sprId);
    }

    // Enemy sprites
    for (u8 i = 0; i < ENEMY_COUNT; i++)
    {
        u8 sprId = SPRID_ENEMY_BASE + i;
        VDP_SetSpritePattern(sprId, PATTERN_ENEMY);
        HideSprite(sprId);
    }

    // NEW: Power-up sprite initialization.
    VDP_SetSpritePattern(SPRID_POWERUP, PATTERN_POWERUP);
    VDP_SetSpriteColorSM1(SPRID_POWERUP, COLOR_LIGHT_GREEN);
    HideSprite(SPRID_POWERUP);
}

//------------------------------------------------------------------------------
// SCREEN / TEXT
//------------------------------------------------------------------------------
static void ClearScreen(void)
{
    for (u8 row = 0; row < SCREEN1_ROWS; row++)
    {
        Print_SetPosition(0, row);
        for (u8 col = 0; col < SCREEN1_COLS; col++)
            Print_DrawChar(CHAR_SPACE);
    }
}

static void PrintNum(u16 val)
{
    if (val > MAX_SCORE) val = MAX_SCORE;
    char buf[4];
    buf[3] = '\0';
    for (int i = 2; i >= 0; i--)
    {
        buf[i] = '0' + (val % 10);
        val /= 10;
    }
    Print_DrawText(buf);
}

static void UpdateScoreText(void)
{
    Print_SetPosition(0, 0);
    Print_DrawText("HI:");
    Print_SetPosition(3, 0);
    PrintNum(g_HiScore);

    Print_SetPosition(8, 0);
    Print_DrawText("SCORE:");
    Print_SetPosition(14, 0);
    PrintNum(g_Score);

    Print_SetPosition(19, 0);
    Print_DrawText("WAVE:");
    Print_SetPosition(24, 0);
    PrintNum(g_Wave);

}

//------------------------------------------------------------------------------
// ENEMY / WAVE SETUP
//------------------------------------------------------------------------------
static void ClearEnemyBullets(void)
{
    for (u8 i = 0; i < MAX_EBULLETS; i++)
    {
        g_EBActive[i] = false;
        HideSprite(SPRID_EBULLET_BASE + i);
    }
}

static void InitWaveEnemies(void)
{
    u8 idx = 0;
    for (u8 rowI = 0; rowI < ENEMY_ROWS; rowI++)
    {
        u8 rowY = ENEMY_START_ROW + (rowI * ENEMY_ROW_SPACING);
        for (u8 colI = 0; colI < ENEMY_PER_ROW; colI++)
        {
            g_EnemyX[idx] = 4 + colI * 4;
            g_EnemyY[idx] = rowY;
            g_EnemyAlive[idx++] = true;
        }
    }
    g_EnemyDir = 1;
    g_EnemyMoveCount = 0;
}

static void SetWaveBackdropColor(u8 wave)
{
    (void)wave;  // Suppress "unused parameter" warning

    // Use a classic deep-space backdrop.
    VDP_SetColor2(COLOR_BLACK, COLOR_WHITE);
}

static void InitWave(void)
{
    LoadEnemyPatternForWave(g_Wave);
    InitAllSprites();
    u8 enemyColor = GetEnemyColorForWave(g_Wave);
    for (u8 i = 0; i < ENEMY_COUNT; i++)
    {
        VDP_SetSpriteColorSM1(SPRID_ENEMY_BASE + i, enemyColor);
    }
    SetWaveBackdropColor(g_Wave);
    InitWaveEnemies();
    g_BulletY = BULLET_OFF;
    ClearEnemyBullets();
    g_Running = true;
}

//------------------------------------------------------------------------------
// SPRITE UPDATES
//------------------------------------------------------------------------------
static void UpdateEnemySprite(u8 i)
{
    if (g_EnemyAlive[i])
        VDP_SetSpritePosition(SPRID_ENEMY_BASE + i, SPR_X(g_EnemyX[i]), SPR_Y(g_EnemyY[i]));
    else
        HideSprite(SPRID_ENEMY_BASE + i);
}

static void UpdateAllEnemiesSprites(void)
{
    for (u8 i = 0; i < ENEMY_COUNT; i++)
        UpdateEnemySprite(i);
}
/*
static void UpdatePlayerSprite(void)
{
    u8 color = (g_PlayerShield > 0) ? COLOR_LIGHT_YELLOW :
        (g_WallWalkActive ? COLOR_LIGHT_RED : COLOR_CYAN);

    VDP_SetSpriteColorSM1(SPRID_PLAYER, color);

    if (g_WallWalkActive)
        VDP_SetSpritePosition(SPRID_PLAYER, SPR_X(g_PlayerX), SPR_Y(g_PlayerY));
    else
        VDP_SetSpritePosition(SPRID_PLAYER, SPR_X(g_PlayerX), SPR_Y(SHIP_ROW));
}
*/
static void UpdatePlayerSprite(void)
{
    // Select color based on shield, wall–walk, and gravity power–up status.
    u8 color = (g_SlowDownActive) ? COLOR_LIGHT_YELLOW :
        (g_WallWalkActive) ? COLOR_DARK_BLUE :
        (g_BulletGravityActive) ? COLOR_MAGENTA :
        COLOR_CYAN;
    VDP_SetSpriteColorSM1(SPRID_PLAYER, color);


    // Create a local mutable buffer initialized with the original ship pattern.
    u8 ship_buffer[8];
    // Copy the original (constant) ship sprite into ship_buffer.
    // (Assumes Mem_Copy copies sizeof(ship_buffer) bytes.)
    Mem_Copy(g_SpritePatternShip, ship_buffer, sizeof(ship_buffer));

    // Only rotate the ship if a sideways bullet is active.
    if (g_BulletSideways)
    {
        u8 temp_buffer[8] = { 0 };

        if (g_BulletHorizontalRight)
        {
            // Rotate 90° clockwise.
            SpriteFX_Rotate90_8(ship_buffer, temp_buffer);
            Mem_Copy(temp_buffer, ship_buffer, sizeof(temp_buffer));
        }
        else
        {
            // Rotate 90° counter-clockwise.
            // If no dedicated left rotation exists, simulate it by rotating right three times.
            for (int i = 0; i < 3; i++)
            {
                SpriteFX_Rotate90_8(ship_buffer, temp_buffer);
                Mem_Copy(temp_buffer, ship_buffer, sizeof(temp_buffer));
            }
        }
    }

    // Load the (possibly rotated) ship_buffer into the VDP sprite pattern memory.
    VDP_LoadSpritePattern(ship_buffer, PATTERN_PLAYER, 1);

    // Set the sprite position.
    if (g_WallWalkActive)
        VDP_SetSpritePosition(SPRID_PLAYER, SPR_X(g_PlayerX), SPR_Y(g_PlayerY));
    else
        VDP_SetSpritePosition(SPRID_PLAYER, SPR_X(g_PlayerX), SPR_Y(SHIP_ROW));
}





static void UpdatePlayerBulletSprite(void)
{
    if (g_BulletY == BULLET_OFF)
        HideSprite(SPRID_BULLET);
    else
        VDP_SetSpritePosition(SPRID_BULLET, SPR_X(g_BulletX), SPR_Y(g_BulletY));
}

static void UpdateEnemyBulletSprite(u8 i)
{
    if (g_EBActive[i])
        VDP_SetSpritePosition(SPRID_EBULLET_BASE + i, SPR_X(g_EBX[i]), SPR_Y(g_EBY[i]));
    else
        HideSprite(SPRID_EBULLET_BASE + i);
}

static void UpdateAllEnemyBulletsSprites(void)
{
    for (u8 i = 0; i < MAX_EBULLETS; i++)
        UpdateEnemyBulletSprite(i);
}

static void DrawAll(void)
{
    UpdateScoreText();
    UpdateAllEnemiesSprites();
    UpdatePlayerSprite();
    UpdatePlayerBulletSprite();
    UpdateAllEnemyBulletsSprites();

}

//------------------------------------------------------------------------------
// MUSIC HANDLING
//------------------------------------------------------------------------------
// Initializes the intro music on channels 0, 1, and 2.
void InitIntroMusic(void)
{
    s_IntroMusicIndex = 0;
    s_IntroMusicTimer = g_IntroMusic[0].duration;

    // Enable tones on all three channels.
    PSG_EnableTone(0, 1);
    PSG_EnableTone(1, 1);
    //PSG_EnableTone(2, 1);

    // Set initial tones and volumes.
    PSG_SetTone(0, g_IntroMusic[0].tone[0]);
    PSG_SetTone(1, g_IntroMusic[0].tone[1]);
    //PSG_SetTone(2, g_IntroMusic[0].tone[2]);

    PSG_SetVolume(0, g_IntroMusic[0].volume[0]);
    PSG_SetVolume(1, g_IntroMusic[0].volume[1]);
    //PSG_SetVolume(2, g_IntroMusic[0].volume[2]);

    PSG_Apply();
}

// Updates the multi-channel intro music each frame.
void UpdateIntroMusic(void)
{
    if (s_IntroMusicTimer > 0)
    {
        s_IntroMusicTimer--;
        return;
    }

    s_IntroMusicIndex++;
    // If we've reached the end, loop back to the beginning.
    if (g_IntroMusic[s_IntroMusicIndex].duration == 0)
    {
        s_IntroMusicIndex = 0;
    }
    s_IntroMusicTimer = g_IntroMusic[s_IntroMusicIndex].duration;

    // Update tones and volumes on channels 0, 1, and 2.
    PSG_SetTone(0, g_IntroMusic[s_IntroMusicIndex].tone[0]);
    PSG_SetTone(1, g_IntroMusic[s_IntroMusicIndex].tone[1]);
    //PSG_SetTone(2, g_IntroMusic[s_IntroMusicIndex].tone[2]);

    PSG_SetVolume(0, g_IntroMusic[s_IntroMusicIndex].volume[0]);
    PSG_SetVolume(1, g_IntroMusic[s_IntroMusicIndex].volume[1]);
    //PSG_SetVolume(2, g_IntroMusic[s_IntroMusicIndex].volume[2]);

    PSG_Apply();
}


void CutFx(void)
{
    PSG_SetVolume(2, 0);
    PSG_Apply();
}

//------------------------------------------------------------------------------
// EXPLOSION (SFX STATE MACHINE)
//------------------------------------------------------------------------------
void StartExplosion(void)
{
    g_ExplosionActive = true;
    g_ExplosionPhase = 0;
    g_ExplosionStep = 0;
    PSG_EnableNoise(2, 1);
    PSG_EnableEnvelope(2, 1);
    PSG_SetNoise(0x03);
    PSG_SetVolume(2, 0xF);
    PSG_SetEnvelope(0x2000);
    PSG_SetShape(0x09);
    PSG_Apply();
}

void UpdateExplosion(void)
{
    if (!g_ExplosionActive) return;
    switch (g_ExplosionPhase)
    {
    case 0:
        PSG_SetNoise(0x03 + (g_ExplosionStep << 1));
        PSG_Apply();
        g_ExplosionStep++;
        if (g_ExplosionStep >= 20)
        {
            g_ExplosionPhase++;
            g_ExplosionStep = 0;
        }
        break;
    case 1:
        PSG_SetNoise(0x20 - g_ExplosionStep);
        PSG_Apply();
        g_ExplosionStep++;
        if (g_ExplosionStep >= 10)
        {
            g_ExplosionPhase++;
            g_ExplosionStep = 0;
        }
        break;
    case 2:
        PSG_SetVolume(2, 15 - g_ExplosionStep);
        PSG_Apply();
        g_ExplosionStep++;
        if (g_ExplosionStep >= 16)
        {
            PSG_EnableNoise(2, 0);
            PSG_EnableEnvelope(2, 0);
            PSG_SetVolume(2, 0);
            PSG_Apply();
            g_ExplosionActive = false;
        }
        break;
    }
}

//------------------------------------------------------------------------------
// ENEMY MOVEMENT
//------------------------------------------------------------------------------
static void MoveEnemiesIfTime(void)
{
    u8 mode_delay = (ENEMY_MOVE_DELAY > g_Wave) ? (ENEMY_MOVE_DELAY - g_Wave) : ENEMY_MOVE_DELAY_MIN;
    mode_delay = (mode_delay < ENEMY_MOVE_DELAY_MIN) ? ENEMY_MOVE_DELAY_MIN : mode_delay;


    // Apply slowdown if the shield is active.
    float mod_delay_f = mode_delay;
    if (g_SlowDownActive)
        mod_delay_f *= SLOWDOWN_FACTOR;
    mode_delay = (u8)mod_delay_f;


    /*
    if (g_PlayerShield > 0)
    {
        mode_delay = ENEMY_MOVE_DELAY; //slow down if powerup catched
    }
    */

    g_EnemyMoveCount++;
    if (g_EnemyMoveCount < mode_delay) return;
    g_EnemyMoveCount = 0;
    bool canShift = true;
    for (u8 i = 0; i < ENEMY_COUNT; i++)
    {
        if (!g_EnemyAlive[i]) continue;
        int nx = g_EnemyX[i] + g_EnemyDir;
        if (nx < 0 || nx >= SCREEN1_COLS)
        {
            canShift = false;
            break;
        }
    }
    if (canShift)
    {
        for (u8 i = 0; i < ENEMY_COUNT; i++)
        {
            if (g_EnemyAlive[i])
                g_EnemyX[i] += g_EnemyDir;
        }
    }
    else
    {
        for (u8 i = 0; i < ENEMY_COUNT; i++)
        {
            if (!g_EnemyAlive[i]) continue;
            g_EnemyY[i]++;
            if (g_EnemyY[i] >= SHIP_ROW)
                g_Running = false;
        }
        g_EnemyDir = -g_EnemyDir;
    }
    UpdateAllEnemiesSprites();
}

static bool AllEnemiesDead(void)
{
    for (u8 i = 0; i < ENEMY_COUNT; i++)
    {
        if (g_EnemyAlive[i]) return false;
    }
    return true;
}

//------------------------------------------------------------------------------
// PLAYER BULLET LOGIC
//------------------------------------------------------------------------------
static void UpdatePlayerBullet(void)
{
    // If bullet is off, nothing to do.
    if (g_BulletY == BULLET_OFF) return;

    if (g_BulletGravityActive)
    {
        // Gravity bullet: update velocity and position using simple physics.
        g_BulletVelY += GRAVITY_ACCEL;  // accelerate downward
        g_BulletY_f += g_BulletVelY;      // update position using velocity
        g_BulletY = (u8)g_BulletY_f;      // convert to integer for display

        // If the bullet has fallen back to (or below) the ship's row, remove it.
        if (g_BulletY >= SHIP_ROW)
        {
            g_BulletY = BULLET_OFF;
            UpdatePlayerBulletSprite();
            return;
        }
    }
    else if (g_BulletSideways)
    {
        // Sideways bullet (from wall–walk mode)
        if (g_BulletHorizontalRight)
        {
            if (g_BulletX < (SCREEN1_COLS - 1))
                g_BulletX++;
            else
            {
                g_BulletY = BULLET_OFF;
                UpdatePlayerBulletSprite();
                return;
            }
        }
        else
        {
            if (g_BulletX > 0)
                g_BulletX--;
            else
            {
                g_BulletY = BULLET_OFF;
                UpdatePlayerBulletSprite();
                return;
            }
        }
    }
    else
    {
        // Normal upward bullet movement.
        if (g_BulletY > 0)
            g_BulletY--;
        else
        {
            g_BulletY = BULLET_OFF;
            UpdatePlayerBulletSprite();
            return;
        }
    }

    // Check for collision with any enemy.
    for (u8 i = 0; i < ENEMY_COUNT; i++)
    {
        if (!g_EnemyAlive[i]) continue;
        if ((g_EnemyX[i] == g_BulletX) && (g_EnemyY[i] == g_BulletY))
        {
            g_EnemyAlive[i] = false;
            g_BulletY = BULLET_OFF;
            g_Score++;
            UpdateScoreText();
            UpdateEnemySprite(i);
            StartExplosion();
            if (!g_PowerUpActive && (Math_GetRandom16() % 10) == 0)
            {
                g_PowerUpActive = true;
                g_PowerUpX = g_EnemyX[i];
                g_PowerUpY = g_EnemyY[i];
                g_PowerUpType = (Math_GetRandom16() % 3); // 0 = shield, 1 = wall–walk, 2 = gravity
            }
            break;
        }
    }
    UpdatePlayerBulletSprite();
}


//------------------------------------------------------------------------------
// ENEMY BULLET LOGIC
//------------------------------------------------------------------------------
static void ClearEnemyBulletSlot(u8 i)
{
    g_EBActive[i] = false;
    HideSprite(SPRID_EBULLET_BASE + i);
}

static u16 EnemyBulletChance(void)
{
    u16 base = 600;
    u16 sub = (g_Wave - 1) * 100;
    if (sub > 500) sub = 500;
    u16 c = (base > sub) ? (base - sub) : 100;
    return c;
}

static void SpawnEnemyBullet(void)
{
    u8 slot = 0xFF;
    for (u8 i = 0; i < MAX_EBULLETS; i++)
    {
        if (!g_EBActive[i])
        {
            slot = i;
            break;
        }
    }
    if (slot == 0xFF) return;
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

static void PossiblySpawnEnemyBullet(void)
{
    if (Math_GetRandom16() < EnemyBulletChance())
        SpawnEnemyBullet();
}

static void UpdateEnemyBullets(void)
{
    for (u8 i = 0; i < MAX_EBULLETS; i++)
    {
        if (!g_EBActive[i]) continue;
        if (g_EBY[i] < (SCREEN1_ROWS - 1))
            g_EBY[i]++;
        else
        {
            ClearEnemyBulletSlot(i);
            continue;
        }
        // Check for collision with the player row.
        if (g_EBY[i] >= (g_WallWalkActive ? g_PlayerY : SHIP_ROW))
        {
            if (g_EBX[i] == g_PlayerX)
            {
                g_Running = false;
            }
            ClearEnemyBulletSlot(i);
        }
        else
        {
            UpdateEnemyBulletSprite(i);
        }
    }
}

void UpdateBulletAnimation(u8 counter)
{
    (void)counter;  // Suppress "unused parameter" warning

    u8 temp_buffer[8] = { 0 };

    VDP_LoadSpritePattern(g_SpritePatternBullet, PATTERN_BULLET, 1);

    SpriteFX_Rotate90_8(g_SpritePatternBullet, temp_buffer);

    //void Mem_Copy( const 	void* src, void* dest,  u16 	size  )
    Mem_Copy(temp_buffer, g_SpritePatternBullet, sizeof(temp_buffer));

    /*

    if (counter % 2 == 0)
        VDP_LoadSpritePattern(g_SpritePatternBullet, PATTERN_BULLET, 1);
    else
        VDP_LoadSpritePattern(g_SpritePatternBullet_Glow, PATTERN_BULLET, 1);

    */
}

//------------------------------------------------------------------------------
// NEW: POWER-UP LOGIC (SLOWED DROP)
//------------------------------------------------------------------------------
static void UpdatePowerUp(void)
{
    static u8 s_PowerUpDelayCounter = 0;

    if (!g_PowerUpActive)
        return;

    // Choose the appropriate sprite pattern based on the power–up type.
    if (g_PowerUpType == 0)
    {
        VDP_SetSpritePattern(SPRID_POWERUP, PATTERN_POWERUP);
    }
    else if (g_PowerUpType == 1)
    {
        VDP_SetSpritePattern(SPRID_POWERUP, PATTERN_WALLWALK_POWERUP);
    }
    else if (g_PowerUpType == 2)  // gravity powerup
    {
        VDP_SetSpritePattern(SPRID_POWERUP, PATTERN_GRAVITY_POWERUP);
    }

    // Draw the power–up sprite at its current position.
    VDP_SetSpritePosition(SPRID_POWERUP, SPR_X(g_PowerUpX), SPR_Y(g_PowerUpY));

    // Update the falling position every 3 frames.
    s_PowerUpDelayCounter++;
    if (s_PowerUpDelayCounter >= 3)
    {
        s_PowerUpDelayCounter = 0;
        if (g_PowerUpY < (SHIP_ROW - 1))
            g_PowerUpY++;
        else
        {
            // If it reaches the bottom without being collected, remove it.
            g_PowerUpActive = false;
            HideSprite(SPRID_POWERUP);
            return;
        }
    }

    // Check for collision with the player.
    // (Since the player normally sits on the ground, we check when the power-up reaches near SHIP_ROW.)
    if ((g_PowerUpY >= SHIP_ROW - 1) &&
        ((g_PowerUpX == g_PlayerX) || (g_PowerUpX == g_PlayerX - 1) || (g_PowerUpX == g_PlayerX + 1)))
    {
        if (g_PowerUpType == 0) {
            // Slowdown effect: enable enemy slowdown.
            g_SlowDownActive = true;
            g_SlowDownTimer = POWERUP_SLOWDOWN_TIME;
        }
        else if (g_PowerUpType == 1) {
            // Wall–walk effect:
            g_WallWalkActive = true;
            g_WallWalkTimer = POWERUP_WALLWALK_TIME;
            // Snap the ship to the left or right wall.
            if (g_PlayerX <= SCREEN1_COLS / 2)
                g_PlayerX = 0;  // left wall
            else
                g_PlayerX = SCREEN1_COLS - 1;  // right wall
            g_PlayerY = SHIP_ROW;
        }
        else if (g_PowerUpType == 2) {
            // Gravity effect: enable gravity for fired bullets.
            g_BulletGravityActive = true;
            g_BulletGravityTimer = GRAVITY_POWERUP_TIME;
        }



        g_PowerUpActive = false;
        g_Score += 1; // Award one point for collecting the power–up.
        UpdateScoreText();
        HideSprite(SPRID_POWERUP);
        PlayPowerUpSound();
    }

}


//------------------------------------------------------------------------------
// WAVE LOGIC
//------------------------------------------------------------------------------
static bool RunWave(void)
{
    static u8 fire_fx_cnt = 0;
    static u8 fire_tone = 0x20;
    bool fire_pressed = false;
    bool go_left = false;
    bool go_right = false;
    bool go_up = false;
    bool go_down = false;

    u8 frame_counter = 0;

    InitWave();
    ClearScreen();
    DrawAll();
    DrawBackground();

    while (g_Running)
    {
        frame_counter++;

        MoveEnemiesIfTime();
        if (!g_Running)
            break;
        if (AllEnemiesDead())
            return true;

        PossiblySpawnEnemyBullet();

        // Player input handling.
        u8 direction = Joystick_GetDirection(JOY_PORT_1);
        go_left = ((direction & JOY_INPUT_DIR_LEFT) || (Keyboard_IsKeyPressed(KEY_LEFT)));
        go_right = ((direction & JOY_INPUT_DIR_RIGHT) || (Keyboard_IsKeyPressed(KEY_RIGHT)));
        fire_pressed = (Joystick_IsButtonPressed(JOY_PORT_1, JOY_INPUT_TRIGGER_A) ||
            Keyboard_IsKeyPressed(KEY_SPACE));

        if (g_WallWalkActive) {
            // In wall–walk mode the ship is fixed to a wall.
            // Allow UP/DOWN movement along the wall and let left/right change which wall is used.
            go_up = ((direction & JOY_INPUT_DIR_UP) || (Keyboard_IsKeyPressed(KEY_UP)));
            go_down = ((direction & JOY_INPUT_DIR_DOWN) || (Keyboard_IsKeyPressed(KEY_DOWN)));
            if (go_up && (g_PlayerY > 0))
                g_PlayerY--;
            if (go_down && (g_PlayerY < SHIP_ROW))
                g_PlayerY++;
            if (go_left)
                g_PlayerX = 0;
            if (go_right)
                g_PlayerX = SCREEN1_COLS - 1;
        }
        else {
            // Normal movement: only horizontal and fixed vertical (ground level).
            if (go_left && (g_PlayerX > 0))
                g_PlayerX--;
            else if (go_right && (g_PlayerX < (SCREEN1_COLS - 1)))
                g_PlayerX++;
            g_PlayerY = SHIP_ROW;
        }

        if ((g_BulletY == BULLET_OFF) && fire_pressed)
        {
            if (g_WallWalkActive)
            {
                // When wall–walking, fire sideways.
                g_BulletX = g_PlayerX;
                g_BulletY = g_PlayerY;  // use the player's current vertical position
                g_BulletSideways = true;
                // Determine bullet horizontal direction based on which wall the ship is on.
                if (g_PlayerX == 0)
                    g_BulletHorizontalRight = true;   // on left wall: fire to the right
                else if (g_PlayerX == (SCREEN1_COLS - 1))
                    g_BulletHorizontalRight = false;  // on right wall: fire to the left
                else
                    g_BulletHorizontalRight = true;   // default if not exactly at an edge
            }
            else if (g_BulletGravityActive)
            {
                // Gravity bullet mode: initialize bullet position and velocity.
                g_BulletX = g_PlayerX;
                g_BulletY_f = (float)SHIP_ROW;   // start at the ship's row
                g_BulletVelY = -1.5f;            // give an initial upward speed (negative value)
                g_BulletY = (u8)g_BulletY_f;
                g_BulletSideways = false;
            }
            else
            {
                // Normal bullet: fire straight upward.
                g_BulletX = g_PlayerX;
                g_BulletY = SHIP_ROW - 1;
                g_BulletSideways = false;
            }
            UpdatePlayerBulletSprite();
            fire_fx_cnt = 5;
            frame_counter = 0;
        }

        // Update player sprite.
        UpdatePlayerSprite();

        if (fire_fx_cnt > 0)
        {
            PSG_EnableTone(0, 1);
            fire_fx_cnt--;
            fire_tone--;
        }
        else
        {
            PSG_EnableTone(0, 0);
            fire_fx_cnt = 0;
            fire_tone = 0x20;
        }

        PSG_SetTone(0, fire_tone);
        PSG_Apply();

        UpdateBulletAnimation(frame_counter);
        UpdatePlayerBullet();
        UpdateEnemyBullets();

        // NEW: Update the falling power-up.
        UpdatePowerUp();

        // Decrement the slowdown timer (if active).
        if (g_SlowDownActive)
        {
            if (g_SlowDownTimer > 0)
                g_SlowDownTimer--;
            else
                g_SlowDownActive = false;
        }

        // Update wall–walk power–up timer.
        if (g_WallWalkActive)
        {
            if (g_WallWalkTimer > 0)
                g_WallWalkTimer--;
            else {
                // When the timer expires, exit wall–walk mode and return to the ground.
                g_WallWalkActive = false;
                g_PlayerY = SHIP_ROW;
            }
        }

        // Update gravity power–up timer independently.
        if (g_BulletGravityActive)
        {
            if (g_BulletGravityTimer > 0)
                g_BulletGravityTimer--;
            else
                g_BulletGravityActive = false;
        }

        UpdateStarfieldEntranceFX();
        UpdateExplosion();
        UpdatePowerUpSound();  // Update the power-up sound effect state machine.

        Halt(); // Wait for next frame.
    }
    return false; // Player died.
}

static void RunGameRound(void)
{
    g_Wave = 1;
    g_Score = 0;
    g_PlayerX = SCREEN1_COLS / 2;
    g_Running = true;
    UpdatePlayerSprite();

    while (g_Running)
    {
        bool success = RunWave();
        if (!success) break;
        g_Wave++;
    }
}

//==============================================================================
// UTILITY FUNCTIONS
//==============================================================================
void initPsg(void)
{
    PSG_SetMixer(0);
    PSG_SetTone(0, 0x400);
    PSG_SetTone(1, 0x800);
    PSG_SetTone(2, 0xA00);
    PSG_EnableTone(0, 0);
    PSG_EnableTone(1, 0);
    PSG_EnableTone(2, 0);
    PSG_SetNoise(0x10);
    PSG_EnableNoise(0, 0);
    PSG_EnableNoise(1, 0);
    PSG_EnableNoise(2, 0);
    PSG_SetShape(0xE);
    PSG_SetEnvelope(0x800);
    PSG_EnableEnvelope(0, 0);
    PSG_EnableEnvelope(1, 0);
    PSG_EnableEnvelope(2, 0);
    PSG_SetVolume(0, 0xF);
    PSG_SetVolume(1, 0xF);
    PSG_SetVolume(2, 0xF);
    PSG_Apply();
}

void hideAllSprites(void)
{
    HideSprite(SPRID_PLAYER);
    HideSprite(SPRID_BULLET);
    for (u8 i = 0; i < ENEMY_COUNT; i++)
        HideSprite(SPRID_ENEMY_BASE + i);
    for (u8 j = 0; j < MAX_EBULLETS; j++)
        HideSprite(SPRID_EBULLET_BASE + j);
    HideSprite(SPRID_POWERUP);
}

void printGameOver(void)
{
    Print_SetPosition(0, SHIP_ROW + 2);
    Print_DrawText("GAME OVER!");
}

void getHiScore(void)
{
    if (g_Score > g_HiScore)
        g_HiScore = g_Score;
}

//==============================================================================
// MAIN FUNCTION
//==============================================================================
void main(void)
{
    //DEBUG_INIT();
    //DEBUG_LOG("Start debug session!");

    VDP_SetMode(VDP_MODE_GRAPHIC1);
    VDP_EnableVBlank(TRUE);
    VDP_ClearVRAM();
    Print_SetTextFont(g_Font_MI, 1);
    Print_SetColor(COLOR_WHITE, COLOR_BLACK);
    LoadCommonSpritePatterns();

    Bios_SetKeyClick(FALSE);

    while (!g_Exit)
    {
        g_StartGame = false;

        Menu_Initialize(g_Menus);
        Menu_SetInputCallback(Menu_Input_CB); //set the menu input callback
        Menu_SetScreenWidth(SCREEN1_COLS);
        Menu_DrawPage(0);

        InitIntroMusic();
        CutFx();

        while (!g_Exit && !g_StartGame)
        {
            Halt();
            Menu_Update();
            UpdateIntroMusic();
        }

        if (g_Exit) break;

        initPsg();

        StartStarfieldEntranceFX();

        RunGameRound();

        getHiScore();
        printGameOver();
        hideAllSprites();
    }

    Bios_Exit(0);

    //DEBUG_LOG("End debug session!");
}