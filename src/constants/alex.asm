; Alex states
ALEX_SPAWNING                   = $00
ALEX_IDLE                       = $01
ALEX_WALKING                    = $02
ALEX_IN_AIR                     = $03
ALEX_CROUCHED                   = $04
ALEX_SWIMING                    = $05
ALEX_FLYING_PETICOPTER          = $06
ALEX_RIDING_MOTORCYCLE          = $08
ALEX_RIDING_MOTORCYCLE_IN_AIR   = $09
ALEX_RIDING_BOAT                = $0B
ALEX_RIDING_BOAT_IN_AIR         = $0C
ALEX_REACHING_DOOR              = $0D
ALEX_CROSSING_DOOR              = $0E
ALEX_DEAD                       = $0F
ALEX_DIVING                     = $13
ALEX_AUTO_WALKING_RIGHT         = $14
ALEX_BATTLE_COUNTING            = $15
ALEX_BATTLE_GO_TO_POSITION      = $16
ALEX_BATTLE_DANCING             = $17
ALEX_BATTLE_THROW               = $18
ALEX_BATTLE_STATUE              = $19

; Alex action states
ALEX_C054_STATE_0               = $00
ALEX_C054_STATE_1               = $01
ALEX_C054_INVINCIBLE            = $02
ALEX_C054_MAGIC_CAPSULE_A       = $03
ALEX_C054_MAGIC_CAPSULE_B       = $04
ALEX_C054_POWER_BRACELET        = $05
ALEX_C054_RIDING_MOTORCYCLES    = $07
ALEX_C054_RIDING_BOAT           = $08
ALEX_C054_FLYING_PETICOPTER     = $09

; Alex config
ALEX_ACCEL          = $0040
ALEX_MAX_SPEED      = $0200
ALEX_FRICTION       = $0020
ALEX_BRAKE          = ALEX_ACCEL

ALEX_AIR_ACCEL      = $0010
ALEX_AIR_MAX_SPEED  = ALEX_MAX_SPEED
ALEX_AIR_FRICTION   = $0008
ALEX_AIR_BRAKE      = ALEX_AIR_ACCEL

ALEX_JUMP_FORCE     = $0200
ALEX_GRAVITY        = $0040

ALEX_PUNCH_TIME     = $0A

ALEX_RESPAWN_GRADE  = $FF

; Alex unknown3 bits
ALEX_UKNW3_FACING_RIGHT_BIT = 0
ALEX_UKNW3_MOVING_RIGHT_BIT = 1
ALEX_UKNW3_MOVING_BIT       = 2

ALEX_UKNW3_FACING_RIGHT = 1 << ALEX_UKNW3_FACING_RIGHT_BIT
ALEX_UKNW3_MOVING_RIGHT = 1 << ALEX_UKNW3_MOVING_RIGHT_BIT
ALEX_UKNW3_MOVING       = 1 << ALEX_UKNW3_MOVING_BIT

; Alex unknown8 bits
ALEX_UKNW8_PUNCH_BIT  = 0
ALEX_UKNW8_JITTER_BIT = 4

ALEX_UKNW8_PUNCH = 1 << ALEX_UKNW8_PUNCH_BIT
ALEX_UKNW8_JITTER = 1 << ALEX_UKNW8_JITTER_BIT
