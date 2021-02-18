
; Money bag values (BCD)
SMALL_MONEY_BAG_VALUE = $01 $00 $00 ; 100
BIG_MONEY_BAG_VALUE =   $02 $00 $00 ; 200

STATE_TITLE             = $0
STATE_DEMO              = $2
STATE_LEVEL_STARTING    = $3
STATE_LEVEL_COMPLETED   = $4
STATE_SHOP              = $5
STATE_LIFE_LOST         = $6
STATE_TEXT_BOX          = $7
STATE_BONUS_LEVEL       = $8
STATE_JANKEN_GAME       = $9
STATE_GAMEPLAY          = $A
STATE_MAP               = $B

; Initial game values
INITIAL_GAME_STATE = STATE_LEVEL_STARTING
INITIAL_SCORE = $00 $00 $00 ; 0
INITIAL_LEVEL = $01 $01
INITIAL_LIFES = $03
INITIAL_MONEY = $00 $00 $00

TITLE_SCREEN_DURATION = $3C

JOY_UP_BIT = 0
JOY_DOWN_BIT = 1
JOY_LEFT_BIT = 2
JOY_RIGHT_BIT = 3
JOY_BTN1_BIT = 4
JOY_BTN2_BIT = 5

; Input pins
JOY_UP    = 1 << JOY_UP_BIT
JOY_DOWN  = 1 << JOY_DOWN_BIT
JOY_LEFT  = 1 << JOY_LEFT_BIT
JOY_RIGHT = 1 << JOY_RIGHT_BIT
JOY_FIREA = 1 << JOY_BTN1_BIT
JOY_FIREB = 1 << JOY_BTN2_BIT

; Alex states
ALEX_SPAWNING                 = $00
ALEX_IDLE                     = $01
ALEX_WALKING                  = $02
ALEX_IN_AIR                   = $03
ALEX_CROUCHED                 = $04
ALEX_SWIMING                  = $05
ALEX_FLYING_PETICOPTER        = $06
ALEX_RIDING_MOTORCYCLE        = $08
ALEX_RIDING_MOTORCYCLE_IN_AIR = $09
ALEX_RIDING_BOAT              = $0B
ALEX_RIDING_BOAT_IN_AIR       = $0C 
ALEX_DEAD                     = $0F
ALEX_AUTO_WALKING_RIGHT       = $14


; Entity types
ENTITY_STATIC               = $18
ENTITY_BAT_LEFT             = $20
ENTITY_MONSTERBIRD_LEFT     = $2D
ENTITY_MONSTER_FROG         = $2F
ENTITY_SMALL_FISH_LEFT      = $30
ENTITY_MONSTERBIRD_RIGHT    = $33
ENTITY_SMALL_FISH_RIGHT     = $34
ENTITY_BAT_RIGHT            = $36
ENTITY_MONSTER_FROG_JUMPING = $37
ENTITY_DEBRIS_TOP_LEFT      = $38
ENTITY_DEBRIS_BOTTOM_LEFT   = $39
ENTITY_DEBRIS_TOP_RIGHT     = $3A
ENTITY_DEBRIS_BOTTOM_RIGHT  = $3B
ENTITY_MONEY_BAG            = $3C
ENTITY_SCORPION_LEFT        = $3E
ENTITY_GHOST                = $4F
ENTITY_ARROW                = $56
ENTITY_JANKENS_CASTLE       = $58

; VDP Register constants
VDP_R0_DISABLE_VSCROLL_COLS_24_TO_32 = 1 << 7
VDP_R0_DISABLE_HSCROLL_ROWS_0_AND_1  = 1 << 6
VDP_R0_ENABLE_LINE_INTERRUPT          = 1 << 4
VDP_R0_MASK_COL_0                      = 1 << 5
VDP_R0_SHIFT_SPRITES_LEFT              = 1 << 3
VDP_R0_USE_MODE_4                      = 1 << 2
VDP_R0_CHANGE_HEIGHT_IN_MODE_4          = 1 << 1
VDP_R0_NOSYNC_MONO                     = 1

VDP_R1_DISPLAY_VISIBLE            = 1 << 6
VDP_R1_ENABLE_FRAME_INTERRUPT     = 1 << 5
VDP_R1_224_LINE_MODE4             = 1 << 4
VDP_R1_240_LINE_MODE4             = 1 << 3
VDP_R1_SPRITES_8_x_16             = 1 << 1
VDP_R1_DOUBLE_SPRITE_PIXELS     = 1

; Audio
SOUND_INTRO          = $81
SOUND_COINS          = $8E
SOUND_POWERUP        = $8F
SOUND_LEVEL_STARTING = $86

; Others
ALEX_GRAVITY = $0040
DEBRIS_GRAVITY = $0030
