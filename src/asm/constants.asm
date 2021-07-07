; Ports
Port_PSG = $7F
Port_VDPData = $BE
Port_VDPAddress = $BF
_PORT_DE_ = $DE
_PORT_DF_ = $DF

; Input Ports
Port_VDPStatus = $BF
Port_IOPort1 = $DC
Port_IOPort2 = $DD

; Mapper
Mapper_Slot2 = $FFFF


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
ALEX_DIVING                   = $13
ALEX_AUTO_WALKING_RIGHT       = $14
ALEX_JANKEN_COUNTING          = $15
ALEX_JANKEN_WALK_TO_POSITION  = $16
ALEX_JANKEN_MUSIC             = $17
ALEX_JANKEN_THROW             = $18
ALEX_JANKEN_STATUE            = $19


; Entity
ENTITY_ARRAY_SIZE = $1E

; Entity types
ENTITY_ALEX                     = $01
ENTITY_GOOSEKA_HEAD             = $0D
ENTITY_CHOKKINNA_HEAD           = $0E
ENTITY_PARPLIN_HEAD             = $0F
ENTITY_STATIC                   = $18
ENTITY_CHOKKINNA_SPELL          = $1A
ENTITY_JANKEN                   = $1C
ENTITY_GOOSEKA                  = $1D
ENTITY_CHOKKINNA                = $1E
ENTITY_PARPLIN                  = $1F
ENTITY_BAT_LEFT                 = $20
ENTITY_MERMAN_BUBBLE            = $22
ENTITY_MERMAN                   = $23
ENTITY_OCTOPUS_ARM              = $24
ENTITY_SMOKE_PUFF               = $2B
ENTITY_PLANT                    = $2C
ENTITY_MONSTERBIRD_LEFT         = $2D
ENTITY_KILLER_FISH_LEFT         = $2E
ENTITY_MONSTER_FROG             = $2F
ENTITY_SMALL_FISH_LEFT          = $30
ENTITY_SEA_HORSE_LEFT           = $31
ENTITY_SEA_HORSE_RIGHT          = $32
ENTITY_MONSTERBIRD_RIGHT        = $33
ENTITY_SMALL_FISH_RIGHT         = $34
ENTITY_KILLER_FISH_RIGHT        = $35
ENTITY_BAT_RIGHT                = $36
ENTITY_MONSTER_FROG_JUMPING     = $37
ENTITY_DEBRIS_TOP_LEFT          = $38
ENTITY_DEBRIS_BOTTOM_LEFT       = $39
ENTITY_DEBRIS_TOP_RIGHT         = $3A
ENTITY_DEBRIS_BOTTOM_RIGHT      = $3B
ENTITY_MONEY_BAG                = $3C
ENTITY_FLAME_OR_SCORPION_LEFT   = $3E
ENTITY_FLAME_OR_SCORPION_RIGHT  = $3F
ENTITY_RICE_BALL                = $44
ENTITY_SAINT_NURARI             = $45
ENTITY_NAMETABLE_CHANGER        = $4B
ENTITY_GHOST                    = $4F
ENTITY_ARROW                    = $56
ENTITY_JANKENS_CASTLE           = $58

; VDP Register constants
VDP_R0_DISABLE_VSCROLL_COLS_24_TO_32    = 1 << 7
VDP_R0_DISABLE_HSCROLL_ROWS_0_AND_1     = 1 << 6
VDP_R0_ENABLE_LINE_INTERRUPT            = 1 << 4
VDP_R0_MASK_COL_0                       = 1 << 5
VDP_R0_SHIFT_SPRITES_LEFT               = 1 << 3
VDP_R0_USE_MODE_4                       = 1 << 2
VDP_R0_CHANGE_HEIGHT_IN_MODE_4          = 1 << 1
VDP_R0_NOSYNC_MONO                      = 1

VDP_R1_DISPLAY_VISIBLE          = 1 << 6
VDP_R1_ENABLE_FRAME_INTERRUPT   = 1 << 5
VDP_R1_224_LINE_MODE4           = 1 << 4
VDP_R1_240_LINE_MODE4           = 1 << 3
VDP_R1_SPRITES_8_x_16           = 1 << 1
VDP_R1_DOUBLE_SPRITE_PIXELS     = 1

; Audio
SOUND_INTRO           = $81
SOUND_BASE_SONG       = $82
SOUND_UNDERWATER_SONG = $83
SOUND_CASTLE_SONG     = $84
SOUND_BIKE_SONG       = $85
SOUND_PETICOPTER_SONG = $88
SOUND_SMOKE_PUFF      = $8B
SOUND_COINS           = $8E
SOUND_POWERUP         = $8F
SOUND_LEVEL_STARTING  = $86
SOUND_BATTLE_LOST     = $93
SOUND_MERMAN_BUBBLES  = $97
SOUND_JANKEN_MUSIC    = $87
SOUND_BOSS_HEAD       = $AC
SOUND_JANKEN_COUNT    = $AD
SOUND_JANKEN_THROW    = $AE

; Others
ALEX_GRAVITY = $0040
DEBRIS_GRAVITY = $0030

; Score indexes
SCORE_200    = 0 * 3
SCORE_400    = 1 * 3
SCORE_600    = 2 * 3
SCORE_800    = 3 * 3
SCORE_1000   = 4 * 3
SCORE_1200   = 5 * 3
SCORE_2000   = 6 * 3
SCORE_10000  = 7 * 3

; Message indexes
TXT_JANKEN_MATCH_OPPONENT_WIN = $08
TXT_JANKEN_MATCH_OPPONENT_LOST = $09
TXT_JANKEN_MATCH_TIE = $0A
TXT_BATTLE_LOST = $15

; PSG
PSG_CONTROL_DATA  = 0
PSG_CONTROL_LATCH = 1 << 7

PSG_CHANNEL_0 = 0
PSG_CHANNEL_1 = 1 << 5
PSG_CHANNEL_2 = 2 << 5
PSG_CHANNEL_3 = 3 << 5

PSG_LATCH_DATA   = 0
PSG_LATCH_VOLUME = 1 << 4
