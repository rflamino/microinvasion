/******************************************************************************
 * File: mi.h
 * Description: Header definitions for Micro Invasion (MSX1 game powered by MSXgl).
 * Author: Reinaldo de Sales Flamino
 * Date: 14/Feb/2025
 *****************************************************************************/

#ifndef MI_H
#define MI_H

// Project includes
#include "msxgl.h"
#include "font_mi.h"

#include "psg.h"
#include "game_menu.h"
#include "sprite_fx.h"
#include "debug.h"

 // Standard library includes
#include <stdio.h>   // For sprintf()


#include "arkos/akg_player.h"
#include "arkos/akm_player.h"
#include "arkos/aky_player.h"
#include "compress/pletter.h"


#include "teste.h"
#define MUSIC_ADDRESS 0xD000
#define MUSIC_SIZE (sizeof(g_teste))

// V-blank synchronization flag
bool g_VBlank = FALSE;

#define VERSION_NUMBER "Version 0.0.1"

 //------------------------------------------------------------------------------
 // SCREEN / GAME CONSTANTS
 //------------------------------------------------------------------------------
#define SCREEN1_COLS       32
#define SCREEN1_ROWS       24

//------------------------------------------------------------------------------
// ENEMY CONFIGURATION
//------------------------------------------------------------------------------
#define ENEMY_ROWS         3
#define ENEMY_PER_ROW      4
#define ENEMY_COUNT        (ENEMY_ROWS * ENEMY_PER_ROW)
#define ENEMY_START_ROW    3
#define ENEMY_ROW_SPACING  2

// For scoreboard clearing
#define CHAR_SPACE         ' '     

#define SHIP_ROW              20
#define BULLET_OFF            255     // "Off" indicator for bullet Y
#define ENEMY_MOVE_DELAY      22
#define ENEMY_MOVE_DELAY_MIN  2

// Player bullet
#define MAX_EBULLETS       3

// Scoreboard
#define MAX_SCORE          999

// NEW: Power-up and shield constants
#define SLOWDOWN_FACTOR       2  // Enemies slow by this factor while shield active

// NEW: Slowdown power–up variables.
#define POWERUP_SLOWDOWN_TIME   300   // Duration (in frames) for which enemy movement is slowed

static bool g_SlowDownActive = false;  // When true, enemy movement is slowed
static u16  g_SlowDownTimer = 0;         // Timer for the slowdown effect (in frames)


//------------------------------------------------------------------------------
// SPRITE DEFINITIONS & INDICES
//------------------------------------------------------------------------------
// Sprite slots (tile-based):
//   0: Player
//   1: Player bullet
//   2-4: Enemy bullets (3 total)
//   5-16: Enemies (12 total)
//   17-19: Explosions (3 total)
//   20: Power-up (new)
#define SPRID_PLAYER         0
#define SPRID_BULLET         1
#define SPRID_EBULLET_BASE    2
#define SPRID_ENEMY_BASE      5
#define SPRID_EXPLOSION_BASE  17
#define SPRID_POWERUP         20  // NEW: Power-up sprite

// Sprite pattern indices:
//   0: Player
//   1: Enemy
//   2: Player bullet
//   3: Enemy bullet
//   4: Explosion
//   5: Power-up (new)
#define PATTERN_PLAYER     0
#define PATTERN_ENEMY      1
#define PATTERN_BULLET     2
#define PATTERN_EBULLET    3
#define PATTERN_EXPLOSION  4
#define PATTERN_POWERUP    5  // NEW: Power-up pattern
#define PATTERN_WALLWALK_POWERUP   6  // NEW: Wall–walk powerup pattern index
#define PATTERN_GRAVITY_POWERUP 7  // Choose an unused pattern index

//------------------------------------------------------------------------------
// SPRITE PATTERNS (8×8 pixel shapes) with binary values and right‐side preview
//------------------------------------------------------------------------------

// Ship sprite
static const u8 g_SpritePatternShip[8] = {
    0b00000000, // ........
    0b00011000, // ...##...
    0b00111100, // ..####..
    0b01111110, // .######.
    0b11111111, // ########
    0b11011011, // ##.##.##
    0b01111110, // .######.
    0b00100100  // ..#..#..
};

// Bullet sprite
static u8 g_SpritePatternBullet[8] = {
    0b00000000, // ........
    0b00000000, // ........
    0b00100000, // ..#.....
    0b00010000, // ...#....
    0b00001000, // ....#...
    0b00000000, // ........
    0b00000000, // ........
    0b00000000  // ........
};

// Enemy bullet sprite
static const u8 g_SpritePatternEBullet[8] = {
    0b00000000, // ........
    0b00000000, // ........
    0b00000000, // ........
    0b00010000, // ...#....
    0b00010000, // ...#....
    0b00010000, // ...#....
    0b00000000, // ........
    0b00000000  // ........
};

// Explosion sprite
static const u8 g_SpritePatternExplosion[8] = {
    0b00100100, // ..#..#..
    0b01011010, // .#.##.#.
    0b10000001, // #......#
    0b01000010, // .#....#.
    0b01000010, // .#....#.
    0b10000001, // #......#
    0b01011010, // .#.##.#.
    0b00100100  // ..#..#..
};

// Crab sprite
static const u8 g_SpritePatternCrab[8] = {
    0b00111100, // ..####..
    0b01011010, // .#.##.#.
    0b11011011, // ##.##.##
    0b11111111, // ########
    0b01111110, // .######.
    0b00100100, // ..#..#..
    0b01000010, // .#....#.
    0b10000001  // #......#
};

// Cyclops sprite
static const u8 g_SpritePatternCyclops[8] = {
    0b00111100, // ..####..
    0b01000010, // .#....#.
    0b10110001, // #.##...#
    0b10100001, // #.#....#
    0b10000001, // #......#
    0b10000101, // #....#.#
    0b01000010, // .#....#.
    0b00111100  // ..####..
};

// Bat sprite
static const u8 g_SpritePatternBat[8] = {
    0b00100100, // ..#..#..
    0b01111110, // .######.
    0b11011011, // ##.##.##
    0b11111111, // ########
    0b01111110, // .######.
    0b00100100, // ..#..#..
    0b01000010, // .#....#.
    0b00000000  // ........
};

// Spike sprite
static const u8 g_SpritePatternSpike[8] = {
    0b00100100, // ..#..#..
    0b01111110, // .######.
    0b11111111, // ########
    0b11011011, // ##.##.##
    0b00011000, // ...##...
    0b00011000, // ...##...
    0b00100100, // ..#..#..
    0b01000010  // .#....#.
};

// Scorpion sprite
static const u8 g_SpritePatternScorpion[8] = {
    0x38, /* ..###... */
    0x7C, /* .#####.. */
    0x92, /* #..#..#. */
    0x92, /* #..#..#. */
    0xFE, /* #######. */
    0xEE, /* ###.###. */
    0x7C, /* .#####.. */
    0x54  /* .#.#.#.. */
};

// UFO sprite
static const u8 g_SpritePatternUFO[8] = {
    0b00011000, // ...##...
    0b00111100, // ..####..
    0b01100110, // .##..##.
    0b11111111, // ########
    0b11111111, // ########
    0b01111110, // .######.
    0b00000000, // ........
    0b00000000  // ........
};

// Spider sprite
static const u8 g_SpritePatternSpider[8] = {
    0b00100100, // ..#..#..
    0b01111110, // .######.
    0b11011011, // ##.##.##
    0b11111111, // ########
    0b01111110, // .######.
    0b01011010, // .#.##.#.
    0b10000001, // #......#
    0b00000000  // ........
};

// Invader sprite
static const u8 g_SpritePatternInvader[8] = {
    0b00100100, // ..#..#..
    0b01111110, // .######.
    0b11011011, // ##.##.##
    0b11100111, // ###..###
    0b11100111, // ###..###
    0b11011011, // ##.##.##
    0b01111110, // .######.
    0b00100100  // ..#..#..
};

// Invader2 sprite
static const u8 g_SpritePatternInvader2[8] = {
    0x3C, /* ..####.. */
    0x7E, /* .######. */
    0xDF, /* ##.##### */
    0xF1, /* ####...# */
    0xF5, /* ####.#.# */
    0xE1, /* ###....# */
    0x42, /* .#....#. */
    0x3C, /* ..####.. */
};

// Crab2 sprite
static const u8 g_SpritePatternCrab2[8] = {
    0b00011000, // ...##...
    0b01111110, // .######.
    0b11011011, // ##.##.##
    0b10111101, // #.####.#
    0b10111101, // #.####.#
    0b11011011, // ##.##.##
    0b01111110, // .######.
    0b00100100  // ..#..#..
};

// X-Invader sprite
static const u8 g_SpritePatternXInvader[8] = {
    0b00011000, // ...##...
    0b00111100, // ..####..
    0b01111110, // .######.
    0b11011011, // ##.##.##
    0b11111111, // ########
    0b00100100, // ..#..#..
    0b01011010, // .#.##.#.
    0b10000001  // #......#
};

// Classic Invader sprite
static const u8 g_SpritePatternClassicInvader[8] = {
    0b00111100, // ..####..
    0b01111110, // .######.
    0b11011011, // ##.##.##
    0b11111111, // ########
    0b11100111, // ###..###
    0b01111110, // .######.
    0b01000010, // .#....#.
    0b10000001  // #......#
};

// Star sprite
static const u8 g_SpritePatternStar[8] = {
    0b00100100, // ..#..#..
    0b00011000, // ...##...
    0b11111111, // ########
    0b01011010, // .#.##.#.
    0b01011010, // .#.##.#.
    0b11111111, // ########
    0b00011000, // ...##...
    0b00100100  // ..#..#..
};

// Power-up sprite
static const u8 g_SpritePatternPowerUp[8] = {
    0b01111000, // .####...
    0b11111100, // ######..
    0b11111110, // #######.
    0b11010101, // ##.#.#.#
    0b01000101, // .#...#.#
    0b01000110, // .#...##.
    0b01000100, // .#...#..
    0b01111100  // .#####..
};
// NEW: Wall–walk powerup sprite pattern (8×8 pixels)
static const u8 g_SpritePatternWallWalkPowerUp[8] = {
    0x20, /* ..#..... */
    0x10, /* ...#.... */
    0x20, /* ..#..... */
    0xFE, /* #######. */
    0x8A, /* #...#.#. */
    0x8A, /* #...#.#. */
    0x8C, /* #...##.. */
    0x70, /* .###.... */
};

// Gravity powerup sprite (8×8 pixels)
static const u8 g_SpritePatternGravityPowerUp[8] = {
    0x04, /* .....#.. */
    0x08, /* ....#... */
    0x7C, /* .#####.. */
    0x44, /* .#...#.. */
    0x28, /* ..#.#... */
    0x10, /* ...#.... */
    0x10, /* ...#.... */
    0x7C, /* .#####.. */
};




//------------------------------------------------------------------------------
// GLOBAL GAME STATE VARIABLES
//------------------------------------------------------------------------------
static u8   g_EnemyX[ENEMY_COUNT];     // tile-based X for enemies
static u8   g_EnemyY[ENEMY_COUNT];     // tile-based Y for enemies
static bool g_EnemyAlive[ENEMY_COUNT];
static i8   g_EnemyDir;                // +1 => right, -1 => left
static u8   g_EnemyMoveCount;

static u8   g_PlayerX;                 // player X (tile-based)

static u8   g_BulletX;                 // player bullet X (tile-based)
static u8   g_BulletY;                 // player bullet Y (tile-based; BULLET_OFF means none)

static bool g_EBActive[MAX_EBULLETS];    // enemy bullet active flags
static u8   g_EBX[MAX_EBULLETS];       // enemy bullet X (tile)
static u8   g_EBY[MAX_EBULLETS];       // enemy bullet Y (tile)

static u16  g_Score;
static u16  g_HiScore = 0;
static bool g_Running;

static u8   g_Wave;                    // current wave number

// --- NEW: Power-up and player shield variables ---
static bool g_PowerUpActive = false;   // Is a power-up currently on screen?
static u8   g_PowerUpX;                // Power-up X (tile)
static u8   g_PowerUpY;                // Power-up Y (tile)

//------------------------------------------------------------------------------
// HELPER MACROS
//------------------------------------------------------------------------------
#define SPR_X(x)  ((u8)((x) * 8))
#define SPR_Y(y)  ((u8)(((y) * 8) + 1))

//------------------------------------------------------------------------------
// MUSIC DEFINITIONS
//------------------------------------------------------------------------------
typedef struct
{
    u16 tone;
    u8  volume;
    u8  duration;  // in frames
} MusicStep;

typedef struct
{
    u16 tone[2];    // Tones for channels 0, 1
    u8  volume[2];  // Volumes for channels 0, 1
    u8  duration;   // Duration in frames for this step
} MultiMusicStep;

// NOTE definitions for the MSX PSG (approximate tone periods)
#define NOTE_C1   0xD5C
#define NOTE_Cs1  0xC9C
#define NOTE_D1   0xBE8
#define NOTE_Ds1  0xB40
#define NOTE_E1   0xAA0
#define NOTE_F1   0x9F4
#define NOTE_Fs1  0x970
#define NOTE_G1   0x8F4
#define NOTE_Gs1  0x87C  // G#1 (or Ab1)
#define NOTE_A1   0x80A
#define NOTE_As1  0x79E  // A#1 (or Bb1)
#define NOTE_B1   0x73A

#define NOTE_C2   0x6AE
#define NOTE_Cs2  0x64E
#define NOTE_D2   0x5F4
#define NOTE_Ds2  0x5A0  // D#2 (or Eb2)
#define NOTE_E2   0x550
#define NOTE_F2   0x4FA
#define NOTE_Fs2  0x4B8
#define NOTE_G2   0x47A
#define NOTE_Gs2  0x43E  // G#2 (or Ab2)
#define NOTE_A2   0x405
#define NOTE_As2  0x3CF  // A#2 (or Bb2)
#define NOTE_B2   0x39D

#define NOTE_C3   0x357
#define NOTE_Cs3  0x327
#define NOTE_D3   0x2FA
#define NOTE_Ds3  0x2CF  // D#3 (or Eb3)
#define NOTE_E3   0x2A7
#define NOTE_F3   0x281
#define NOTE_Fs3  0x25D
#define NOTE_G3   0x23B
#define NOTE_Gs3  0x21B  // G#3 (or Ab3)
#define NOTE_A3   0x1FD
#define NOTE_As3  0x1E0  // A#3 (or Bb3)
#define NOTE_B3   0x1C5

#define NOTE_C4   0x1AC
#define NOTE_Cs4  0x194
#define NOTE_D4   0x17D
#define NOTE_Ds4  0x168  // D#4 (or Eb4)
#define NOTE_E4   0x153
#define NOTE_F4   0x140
#define NOTE_Fs4  0x12E
#define NOTE_G4   0x11D
#define NOTE_Gs4  0x10D  // G#4 (or Ab4)
#define NOTE_A4   0x0FE
#define NOTE_As4  0x0F0  // A#4 (or Bb4)
#define NOTE_B4   0x0E3

#define NOTE_C5   0x0D6
#define NOTE_Cs5  0x0CA
#define NOTE_D5   0x0BE
#define NOTE_Ds5  0x0B4  // D#5 (or Eb5)
#define NOTE_E5   0x0AA
#define NOTE_F5   0x0A0
#define NOTE_Fs5  0x097
#define NOTE_G5   0x08F
#define NOTE_Gs5  0x087  // G#5 (or Ab5)
#define NOTE_A5   0x07F
#define NOTE_As5  0x078  // A#5 (or Bb5)
#define NOTE_B5   0x071

#define NOTE_C6   0x06B
#define NOTE_Cs6  0x064
#define NOTE_D6   0x05C
#define NOTE_Ds6  0x054  // D#6 (or Eb6)
#define NOTE_E6   0x04D
#define NOTE_F6   0x047
#define NOTE_Fs6  0x041
#define NOTE_G6   0x03C
#define NOTE_Gs6  0x037  // G#6 (or Ab6)
#define NOTE_A6   0x032
#define NOTE_As6  0x02E  // A#6 (or Bb6)
#define NOTE_B6   0x02A

// Special note for silence.
#define NOTE_REST 0x000

static const MultiMusicStep g_IntroMusic[] =
{
    //===========================================================================
    // Section 1: The famous motif “da-da-da-dum” (mid register)
    // 3 quick staccato notes followed by a longer accented note.
    //===========================================================================
    { { NOTE_G3,   NOTE_As3 }, { 15, 10 }, 10 },  // Note 1: G3 (lead) with Ab3 (harmony)
    { { NOTE_G3,   NOTE_As3 }, { 15, 10 }, 10 },  // Note 2: repeat
    { { NOTE_G3,   NOTE_As3 }, { 15, 10 }, 10 },  // Note 3: repeat
    { { NOTE_Ds3,  NOTE_G3  }, { 15, 10 }, 30 },  // Note 4: Eb3 (accent) with G3

    //===========================================================================
    // Section 2: Lower octave variation for contrast
    //===========================================================================
    { { NOTE_G2,   NOTE_As2 }, { 15, 10 }, 10 },
    { { NOTE_G2,   NOTE_As2 }, { 15, 10 }, 10 },
    { { NOTE_G2,   NOTE_As2 }, { 15, 10 }, 10 },
    { { NOTE_Ds2,  NOTE_G2  }, { 15, 10 }, 30 },
    { { NOTE_G2,   NOTE_As2 }, { 15, 10 }, 40 },
    { { NOTE_REST, NOTE_REST }, { 15, 15 }, 10 },

    //===========================================================================
    // Section 3: Motif variation in mid register with a subtle harmonic shift
    //===========================================================================
    { { NOTE_F3,   NOTE_Gs3 }, { 15, 10 }, 10 },  // F3 with Gb3
    { { NOTE_F3,   NOTE_Gs3 }, { 15, 10 }, 10 },
    { { NOTE_F3,   NOTE_Gs3 }, { 15, 10 }, 10 },
    { { NOTE_D3,   NOTE_F3  }, { 15, 10 }, 15 },
    { { NOTE_F2,   NOTE_Gs2 }, { 15, 10 }, 10 },
    { { NOTE_F2,   NOTE_Gs2 }, { 15, 10 }, 10 },
    { { NOTE_F2,   NOTE_Gs2 }, { 15, 10 }, 10 },
    { { NOTE_D2,   NOTE_F2  }, { 15, 10 }, 15 },

    { { NOTE_REST, NOTE_REST }, { 15, 15 }, 10 },

    //===========================================================================
    // Section 4: Combined motif sequence in mid register
    //===========================================================================
    { { NOTE_Ds3,  NOTE_G3  }, { 15, 10 }, 20 },
    { { NOTE_F3,   NOTE_Gs3 }, { 15, 10 }, 20 },
    { { NOTE_G3,   NOTE_As3 }, { 15, 10 }, 20 },
    { { NOTE_Ds3,  NOTE_G3  }, { 15, 10 }, 20 },
    { { NOTE_F3,   NOTE_Gs3 }, { 15, 10 }, 20 },
    { { NOTE_D3,   NOTE_F3  }, { 15, 10 }, 30 },

    //===========================================================================
    // Section 5: Combined motif sequence in lower octave
    //===========================================================================
    { { NOTE_Ds2,  NOTE_G2  }, { 15, 10 }, 20 },
    { { NOTE_F2,   NOTE_Gs2 }, { 15, 10 }, 20 },
    { { NOTE_G2,   NOTE_As2 }, { 15, 10 }, 20 },
    { { NOTE_Ds2,  NOTE_G2  }, { 15, 10 }, 20 },
    { { NOTE_F2,   NOTE_Gs2 }, { 15, 10 }, 20 },
    { { NOTE_D2,   NOTE_F2  }, { 15, 10 }, 30 },

    { { NOTE_REST, NOTE_REST }, { 15, 15 }, 10 },

    //===========================================================================
    // Section 6: Repeating the motif (mid register) with slight variation
    //===========================================================================
    { { NOTE_G3,   NOTE_As3 }, { 15, 10 }, 10 },
    { { NOTE_G3,   NOTE_As3 }, { 15, 10 }, 10 },
    { { NOTE_G3,   NOTE_As3 }, { 15, 10 }, 10 },
    { { NOTE_Ds3,  NOTE_G3  }, { 15, 10 }, 20 },
    { { NOTE_F3,   NOTE_Gs3 }, { 15, 10 }, 10 },
    { { NOTE_F3,   NOTE_Gs3 }, { 15, 10 }, 10 },
    { { NOTE_F3,   NOTE_Gs3 }, { 15, 10 }, 10 },
    { { NOTE_D3,   NOTE_F3  }, { 15, 10 }, 20 },

    //===========================================================================
    // Section 7: Final cadence in lower octave
    //===========================================================================
    { { NOTE_G2,   NOTE_As2 }, { 15, 10 }, 10 },
    { { NOTE_G2,   NOTE_As2 }, { 15, 10 }, 10 },
    { { NOTE_G2,   NOTE_As2 }, { 15, 10 }, 10 },
    { { NOTE_Ds2,  NOTE_G2  }, { 15, 10 }, 20 },
    { { NOTE_F2,   NOTE_Gs2 }, { 15, 10 }, 10 },
    { { NOTE_F2,   NOTE_Gs2 }, { 15, 10 }, 10 },
    { { NOTE_F2,   NOTE_Gs2 }, { 15, 10 }, 10 },
    { { NOTE_D2,   NOTE_F2  }, { 15, 10 }, 20 },
    { { NOTE_G2,   NOTE_As2 }, { 15, 10 }, 40 },
    { { NOTE_REST, NOTE_REST }, { 15, 15 }, 10 },

    //===========================================================================
    // Section 8: Return to mid register for the final variation
    //===========================================================================
    { { NOTE_F3,   NOTE_Gs3 }, { 15, 10 }, 10 },
    { { NOTE_F3,   NOTE_Gs3 }, { 15, 10 }, 10 },
    { { NOTE_F3,   NOTE_Gs3 }, { 15, 10 }, 10 },
    { { NOTE_D3,   NOTE_F3  }, { 15, 10 }, 40 },
    { { NOTE_F2,   NOTE_Gs2 }, { 15, 10 }, 10 },
    { { NOTE_F2,   NOTE_Gs2 }, { 15, 10 }, 10 },
    { { NOTE_F2,   NOTE_Gs2 }, { 15, 10 }, 10 },
    { { NOTE_D2,   NOTE_F2  }, { 15, 10 }, 40 },
    { { NOTE_REST, NOTE_REST }, { 15, 15 }, 20 },

    // End marker
    { { NOTE_REST, NOTE_REST }, { 0,  0 }, 0 }
};



static const MusicStep g_StarfieldEntranceFX[] =
{
    { NOTE_C2,  15, 15 },
    { NOTE_F2,  15, 12 },
    { NOTE_A2,  15, 10 },
    { NOTE_C3,  15, 10 },
    { NOTE_F3,  15, 10 },
    { NOTE_A3,  15, 8 },
    { NOTE_C4,  14, 6 },
    { NOTE_F4,  14, 6 },
    { NOTE_A4,  14, 6 },
    { NOTE_C5,  14, 5 },
    { NOTE_F5,  14, 5 },
    { NOTE_A5,  14, 5 },
    { NOTE_C6,  13, 3 },
    { NOTE_F6,  13, 3 },
    { NOTE_A6,  13, 3 },
    { NOTE_C6,  12, 2 },
    { NOTE_F6,  12, 2 },
    { NOTE_A6,  12, 2 },
    { NOTE_G5,  12, 6 },
    { NOTE_F5,  12, 8 },
    { NOTE_Ds5, 12, 8 },
    { NOTE_C5,  12, 10 },
    { NOTE_REST, 15, 20 },
    { NOTE_REST,  0, 0 }
};

#define STARFIELD_FX_LEN (sizeof(g_StarfieldEntranceFX) / sizeof(MusicStep))

//------------------------------------------------------------------------------
// PROGRAM FLOW / MENU GLOBALS
//------------------------------------------------------------------------------
// These globals are defined (not just declared) in microinvasion.c.
extern bool g_Exit;
extern bool g_StartGame;
extern const MenuItem g_MenuMain[];
extern const Menu g_Menus[];

//------------------------------------------------------------------------------
// GROUND / STARS
//------------------------------------------------------------------------------
#define SKY_ROWS       21   // rows for the starry sky
#define GROUND_ROWS     1   // row for the ground
#define STAR_DENSITY   38  // lower = more stars
#define CHAR_STAR      250
#define CHAR_SUN       15
#define CHAR_GROUND    220  
#define MOUNTAIN_TILE    219  // Tile index for a mountain (or mountain part)


// NEW: Duration for the wall–walk power–up.
#define POWERUP_WALLWALK_TIME   500   // Frames the wall–walk powerup lasts

typedef enum {
    POWERUP_SLOWDOWN,
    POWERUP_WALLWALK,
    POWERUP_GRAVITY
} PowerUpType;

// NEW: New globals for wall–walking mode.
static bool g_WallWalkActive = false;  // When true, the ship “sticks” to a wall.
static u16   g_WallWalkTimer = 0;         // Duration timer for wall–walk mode.
static u8   g_PlayerY = SHIP_ROW;        // Player vertical position (normally SHIP_ROW).
static PowerUpType g_PowerUpType = POWERUP_SLOWDOWN;


// NEW globals for bullet behavior when firing sideways:
static bool g_BulletSideways = false;       // true when the active bullet is fired sideways
static bool g_BulletHorizontalRight = false;  // true = bullet moves right; false = left

// NEW: Gravity power–up constants using fixed-point arithmetic (8.8 format)
#define GRAVITY_ACCEL_FP         16    // Fixed-point representation of gravity acceleration (approx 0.0625).
#define GRAVITY_INITIAL_VELOCITY -384  // Fixed-point representation of initial upward velocity (-1.5).
#define GRAVITY_POWERUP_TIME     500   // Duration (in frames) for which gravity mode is active

// NEW: Gravity bullet globals using fixed-point integers (i16 for signed values).
static bool   g_BulletGravityActive = false;   // When true, fired bullets are affected by gravity.
static u16    g_BulletGravityTimer = 0;        // Timer for gravity power–up effect.
static i16    g_BulletY_fp = 0;                // Fixed-point vertical position for the bullet.
static i16    g_BulletVelY_fp = 0;             // Fixed-point vertical velocity for the gravity bullet.


// Global variables for the intro music state.
static u8 s_IntroMusicIndex = 0;
static u8 s_IntroMusicTimer = 0;

// Power-up sound effect state (using PSG channel 2)
static bool g_PowerUpSoundActive = false;
static u8   g_PowerUpSoundTimer = 0;


/* -------------------------------------------------------------------------
   Define globals that were declared as extern in the header.
   ------------------------------------------------------------------------- */
bool g_Exit = false;         // Signal to exit the program.
bool g_StartGame = false;    // Signal to start the game from the menu.

const MenuItem g_MenuMain[] =
{
    { "Start Game", MENU_ITEM_ACTION, MenuAction_GameStart, 1 },
    { "About",      MENU_ITEM_ACTION, MenuAction_About,     0 },
    { "Exit",       MENU_ITEM_ACTION, MenuAction_GameStart, 0 },
};

const Menu g_Menus[] =
{
    { "Micro Invasion", g_MenuMain, (sizeof(g_MenuMain) / sizeof(g_MenuMain[0])), NULL }
};

extern u8 g_MenuInputPrev; //from game menu lib

/* -------------------------------------------------------------------------
   Static internal variables for music, explosion, and FX state.
   ------------------------------------------------------------------------- */
static u8 s_MusicIndex = 0;
static u8 s_MusicTimer = 0;

static bool g_ExplosionActive = false;
static u8   g_ExplosionPhase = 0;
static u8   g_ExplosionStep = 0;

static u8 s_StarfieldFXIndex = 0;
static u8 s_StarfieldFXTimer = 0;
static bool s_StarfieldFXActive = false;

//------------------------------------------------------------------------------
// PROTOTYPES
//------------------------------------------------------------------------------
void StartStarfieldEntranceFX(void);
void UpdateStarfieldEntranceFX(void);
static void DrawBackground(void);
const c8* MenuAction_GameStart(u8 op, i8 value);
const c8* MenuAction_About(u8 op, i8 value);
static void HideSprite(u8 sprId);
static void LoadCommonSpritePatterns(void);
static void LoadEnemyPatternForWave(u8 wave);
static u8 GetEnemyColorForWave(u8 wave);
static void InitAllSprites(void);
static void ClearScreen(void);
static void PrintNum(u16 val);
static void UpdateScoreText(void);
static void ClearEnemyBullets(void);
static void InitWaveEnemies(void);
static void SetWaveBackdropColor(u8 wave);
static void InitWave(void);
static void UpdateEnemySprite(u8 i);
static void UpdateAllEnemiesSprites(void);
static void UpdatePlayerSprite(void);
static void UpdatePlayerBulletSprite(void);
static void UpdateEnemyBulletSprite(u8 i);
static void UpdateAllEnemyBulletsSprites(void);
static void DrawAll(void);
void InitIntroMusic(void);
void UpdateIntroMusic(void);
void CutFx(void);
void StartExplosion(void);
void UpdateExplosion(void);
static void MoveEnemiesIfTime(void);
static bool AllEnemiesDead(void);
static void UpdatePlayerBullet(void);
static void ClearEnemyBulletSlot(u8 i);
static u16 EnemyBulletChance(void);
static void SpawnEnemyBullet(void);
static void PossiblySpawnEnemyBullet(void);
static void UpdateEnemyBullets(void);
void UpdateBulletAnimation(u8 counter);
static bool RunWave(void);
static void RunGameRound(void);
void initPsg(void);
void hideAllSprites(void);
void printGameOver(void);
void getHiScore(void);
/* Forward declaration for power-up update function */
static void UpdatePowerUp(void);
u8 Menu_Input_CB(void);
static void ResetAllPowerUps(void);

#endif // MI_H
