/*****************************************************************************/
/* Text-Based "Space Invaders" (SCREEN 1) + Waves + Enemy Fire + Hi-Score    */
/*                                                                           */
/*  - 3×5 = 15 enemies per wave.                                             */
/*  - If all are killed => next wave with higher enemy firing.               */
/*  - If you die => "Game Over! Press ESC to restart."                       */
/*  - Score accumulates within one round; if it's higher than "Hi" at game   */
/*    over, we update the hi-score.                                          */
/*  - The hi-score is never reset unless you exit the program entirely.      */
/*****************************************************************************/

#include "msxgl.h"               // MSXgl
#include "print.h"               // Print system
#include "math.h"                // Random
#include "font/font_ibm.h"
#include "color.h"

//================ SCREEN 1
#define SCREEN1_COLS       32
#define SCREEN1_ROWS       24

//================ Enemies
#define ENEMY_ROWS         3
#define ENEMY_PER_ROW      5
#define ENEMY_COUNT        (ENEMY_ROWS*ENEMY_PER_ROW)
#define ENEMY_START_ROW    3
#define ENEMY_ROW_SPACING  2

#define CHAR_INVADER       'X'
#define CHAR_SHIP          'A'
#define CHAR_BULLET        '^'
#define CHAR_EBULLET       'v'
#define CHAR_SPACE         ' '

#define SHIP_ROW           20
#define BULLET_OFF         255
#define ENEMY_MOVE_DELAY   15

// Enemy data
static u8   g_EnemyX[ENEMY_COUNT];
static u8   g_EnemyY[ENEMY_COUNT];
static bool g_EnemyAlive[ENEMY_COUNT];
static i8   g_EnemyDir;            // +1 => right, -1 => left
static u8   g_EnemyMoveCount;

// Player
static u8   g_PlayerX;

// Player bullet
static u8   g_BulletX;
static u8   g_BulletY; // == BULLET_OFF => no bullet

// Enemy bullets
#define MAX_EBULLETS       3
static bool g_EBActive[MAX_EBULLETS];
static u8   g_EBX[MAX_EBULLETS];
static u8   g_EBY[MAX_EBULLETS];

// Score & hi-score
static u16  g_Score;
static u16  g_HiScore = 0;   // persists across restarts
static bool g_Running;       // is the game on?

// Wave counter
static u8   g_Wave;          // each wave more difficult (enemy bullet chance)

//-----------------------------------------------------------------------------
// Basic screen-IO
static void DrawChar(u8 x, u8 y, char c)
{
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
    if (val > 999) val = 999;
    char buf[4];
    buf[3] = '\0';
    for (int i = 2;i >= 0;i--)
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

    // SC:XXX  - score
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

//-----------------------------------------------------------------------------
// For wave logic
static void ClearEnemyBullets()
{
    for (u8 i = 0;i < MAX_EBULLETS;i++)
        g_EBActive[i] = false;
}

// Setup wave of enemies
static void InitWaveEnemies()
{
    u8 idx = 0;
    for (u8 rowI = 0; rowI < ENEMY_ROWS; rowI++)
    {
        u8 rowY = ENEMY_START_ROW + rowI * ENEMY_ROW_SPACING;
        for (u8 colI = 0; colI < ENEMY_PER_ROW; colI++)
        {
            g_EnemyX[idx] = 4 + colI * 4;
            g_EnemyY[idx] = rowY;
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

// Move enemies sideways or drop down
static void MoveEnemiesIfTime()
{
    g_EnemyMoveCount++;
    if (g_EnemyMoveCount < ENEMY_MOVE_DELAY)
        return;
    g_EnemyMoveCount = 0;

    // Erase
    for (u8 i = 0;i < ENEMY_COUNT;i++)
    {
        if (g_EnemyAlive[i])
            DrawChar(g_EnemyX[i], g_EnemyY[i], CHAR_SPACE);
    }

    bool canShift = true;
    for (u8 i = 0;i < ENEMY_COUNT;i++)
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
        for (u8 i = 0;i < ENEMY_COUNT;i++)
        {
            if (g_EnemyAlive[i])
                g_EnemyX[i] += g_EnemyDir;
        }
    }
    else
    {
        for (u8 i = 0;i < ENEMY_COUNT;i++)
        {
            if (!g_EnemyAlive[i]) continue;
            g_EnemyY[i]++;
            if (g_EnemyY[i] >= SHIP_ROW)
                g_Running = false;
        }
        g_EnemyDir = -g_EnemyDir;
    }

    // redraw
    for (u8 i = 0;i < ENEMY_COUNT;i++)
    {
        if (g_EnemyAlive[i])
            DrawChar(g_EnemyX[i], g_EnemyY[i], CHAR_INVADER);
    }
}

// Check if all enemies are dead
static bool AllEnemiesDead()
{
    for (u8 i = 0;i < ENEMY_COUNT;i++)
    {
        if (g_EnemyAlive[i])
            return false;
    }
    return true;
}

// Player bullet => up
static void UpdatePlayerBullet()
{
    if (g_BulletY == BULLET_OFF) return;

    // erase old
    DrawChar(g_BulletX, g_BulletY, CHAR_SPACE);

    if (g_BulletY > 0)
        g_BulletY--;
    else
    {
        g_BulletY = BULLET_OFF;
        return;
    }
    // if row=0 => skip drawing => bullet off
    if (g_BulletY == 0)
    {
        g_BulletY = BULLET_OFF;
        return;
    }

    // draw
    DrawChar(g_BulletX, g_BulletY, CHAR_BULLET);

    // collision
    for (u8 i = 0;i < ENEMY_COUNT;i++)
    {
        if (!g_EnemyAlive[i]) continue;
        if ((g_EnemyX[i] == g_BulletX) && (g_EnemyY[i] == g_BulletY))
        {
            g_EnemyAlive[i] = false;
            DrawChar(g_BulletX, g_BulletY, CHAR_SPACE);
            g_BulletY = BULLET_OFF;
            g_Score++;
            UpdateScoreText();
            break;
        }
    }
}

// Enemy bullet logic
#define ENEMY_BULLETS 3
static u16 EnemyBulletChance()
{
    // wave1 =>600 => ~1%
    // wave2 =>500 => ~1.5%
    u16 base = 600;
    u16 sub = (g_Wave - 1) * 100;
    if (sub > 500) sub = 500;
    u16 c = (base > sub) ? (base - sub) : 100;
    return c;
}
static void ClearEnemyBulletSlot(u8 i)
{
    DrawChar(g_EBX[i], g_EBY[i], CHAR_SPACE);
    g_EBActive[i] = false;
}
static void SpawnEnemyBullet()
{
    // find free slot
    u8 slot = 0xFF;
    for (u8 i = 0;i < ENEMY_BULLETS;i++)
    {
        if (!g_EBActive[i])
        {
            slot = i;
            break;
        }
    }
    if (slot == 0xFF) return;

    // random enemy
    for (u8 tries = 0;tries < 20;tries++)
    {
        u8 eidx = (Math_GetRandom16() % ENEMY_COUNT);
        if (g_EnemyAlive[eidx])
        {
            g_EBActive[slot] = true;
            g_EBX[slot] = g_EnemyX[eidx];
            g_EBY[slot] = g_EnemyY[eidx] + 1;
            DrawChar(g_EBX[slot], g_EBY[slot], CHAR_EBULLET);
            break;
        }
    }
}
static void PossiblySpawnEnemyBullet()
{
    if (Math_GetRandom16() < EnemyBulletChance())
        SpawnEnemyBullet();
}
static void UpdateEnemyBullets()
{
    for (u8 i = 0;i < ENEMY_BULLETS;i++)
    {
        if (!g_EBActive[i]) continue;
        // erase old
        DrawChar(g_EBX[i], g_EBY[i], CHAR_SPACE);

        // move down
        if (g_EBY[i] < SCREEN1_ROWS - 1)
            g_EBY[i]++;
        else
        {
            g_EBActive[i] = false;
            continue;
        }
        // redraw
        DrawChar(g_EBX[i], g_EBY[i], CHAR_EBULLET);
        // collision w/ player row
        if (g_EBY[i] >= SHIP_ROW)
        {
            if (g_EBX[i] == g_PlayerX)
                g_Running = false;
            DrawChar(g_EBX[i], g_EBY[i], CHAR_SPACE);
            g_EBActive[i] = false;
        }
    }
}

// Draw all
static void DrawAll()
{
    // enemies
    for (u8 i = 0;i < ENEMY_COUNT;i++)
    {
        if (g_EnemyAlive[i])
            DrawChar(g_EnemyX[i], g_EnemyY[i], CHAR_INVADER);
    }
    // player
    DrawChar(g_PlayerX, SHIP_ROW, CHAR_SHIP);

    // bullet
    if (g_BulletY != BULLET_OFF)
        DrawChar(g_BulletX, g_BulletY, CHAR_BULLET);

    // e-bullets
    for (u8 i = 0;i < ENEMY_BULLETS;i++)
    {
        if (g_EBActive[i])
            DrawChar(g_EBX[i], g_EBY[i], CHAR_EBULLET);
    }
    // scoreboard
    UpdateScoreText();
}

// Run wave => returns true if success, false if died
static bool RunWave()
{
    InitWave();
    ClearScreen();
    DrawAll();

    while (g_Running)
    {
        MoveEnemiesIfTime();
        if (!g_Running) break;

        if (AllEnemiesDead())
            return true; // wave done

        PossiblySpawnEnemyBullet();

        // controls
        if (Keyboard_IsKeyPressed(KEY_LEFT))
        {
            if (g_PlayerX > 0)
            {
                DrawChar(g_PlayerX, SHIP_ROW, CHAR_SPACE);
                g_PlayerX--;
                DrawChar(g_PlayerX, SHIP_ROW, CHAR_SHIP);
            }
        }
        else if (Keyboard_IsKeyPressed(KEY_RIGHT))
        {
            if (g_PlayerX < (SCREEN1_COLS - 1))
            {
                DrawChar(g_PlayerX, SHIP_ROW, CHAR_SPACE);
                g_PlayerX++;
                DrawChar(g_PlayerX, SHIP_ROW, CHAR_SHIP);
            }
        }
        // fire
        if ((g_BulletY == BULLET_OFF) && Keyboard_IsKeyPressed(KEY_SPACE))
        {
            g_BulletX = g_PlayerX;
            g_BulletY = SHIP_ROW - 1;
            DrawChar(g_BulletX, g_BulletY, CHAR_BULLET);
        }

        UpdatePlayerBullet();
        UpdateEnemyBullets();

        Halt();
    }
    return false;
}

// entire multi-wave round
static void RunGameRound()
{
    // reset wave=1, score=0
    g_Wave = 1;
    g_Score = 0;
    g_PlayerX = SCREEN1_COLS / 2;
    g_Running = true;

    while (g_Running)
    {
        bool success = RunWave();
        if (!success)
            break;
        // next wave
        g_Wave++;
    }
}

// MAIN
// after round => if user died => check hi-score => if score>hi => hi=score => press ESC
void main()
{
    VDP_SetMode(VDP_MODE_GRAPHIC1);
    VDP_EnableVBlank(TRUE);
    VDP_ClearVRAM();

    Print_SetTextFont(g_Font_IBM, 1);
    Print_SetColor(COLOR_WHITE, COLOR_BLACK);

    while (true)
    {
        // Title line
        Print_SetPosition(0, 0);
        Print_DrawText("Invaders Waves + HI-Score => ESC=Restart");

        // run
        RunGameRound();

        // If the player's final score is bigger, update hi-score
        if (g_Score > g_HiScore)
            g_HiScore = g_Score;

        // Game Over
        Print_SetPosition(0, SHIP_ROW + 2);
        Print_DrawText("GAME OVER! Press ESC to restart.");

        while (!Keyboard_IsKeyPressed(KEY_ESC))
        {
            Halt();
        }
    }
}
