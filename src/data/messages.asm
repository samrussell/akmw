.STRINGMAPTABLE font "src/data/font.tbl"

.DEF AKPRINTRIGHT $20
.DEF AKPRINTDOWN $80
.DEF AKPRINTLEFT $60
.DEF AKPRINTUP $C0
.DEF AKPRINTRLEON $80
.DEF AKPRINTRLEOFF $00

.MACRO AKPRINT ARGS RLEON COUNT DIRECTION STRING
    .DB RLEON + COUNT
    .DB DIRECTION
    .STRINGMAP font, STRING
.ENDM

.MACRO AKPRINTRLELEFT ARGS COUNT STRING
    AKPRINT AKPRINTRLEON COUNT AKPRINTLEFT STRING
.ENDM

.MACRO AKPRINTRLEUP ARGS COUNT STRING
    AKPRINT AKPRINTRLEON COUNT AKPRINTUP STRING
.ENDM

.MACRO AKPRINTRLERIGHT ARGS COUNT STRING
    AKPRINT AKPRINTRLEON COUNT AKPRINTRIGHT STRING
.ENDM

.MACRO AKPRINTRLEDOWN ARGS COUNT STRING
    AKPRINT AKPRINTRLEON COUNT AKPRINTDOWN STRING
.ENDM

.MACRO AKPRINTRIGHT ARGS STRING
    AKPRINT AKPRINTRLEOFF STRING.length AKPRINTRIGHT STRING
.ENDM

.MACRO AKPRINTDOWN ARGS STRING
    AKPRINT AKPRINTRLEOFF STRING.length AKPRINTDOWN STRING
.ENDM

.MACRO AKPRINTLEFT ARGS STRING
    AKPRINT AKPRINTRLEOFF STRING.length AKPRINTLEFT STRING
.ENDM

.MACRO AKPRINTUP ARGS STRING
    AKPRINT AKPRINTRLEOFF STRING.length AKPRINTUP STRING
.ENDM

.MACRO AKPRINTRIGHTUTF ARGS COUNT STRING
    AKPRINT AKPRINTRLEOFF COUNT AKPRINTRIGHT STRING
.ENDM

.MACRO AKPRINTDOWNUTF ARGS COUNT STRING
    AKPRINT AKPRINTRLEOFF COUNT AKPRINTDOWN STRING
.ENDM

.MACRO AKPRINTLEFTUTF ARGS COUNT STRING
    AKPRINT AKPRINTRLEOFF COUNT AKPRINTLEFT STRING
.ENDM

.MACRO AKPRINTUPUTF ARGS COUNT STRING
    AKPRINT AKPRINTRLEOFF COUNT AKPRINTUP STRING
.ENDM


.MACRO AKPRINTEND
    .DB $00 $00
.ENDM

txtShopWelcome:
.INCLUDE "src/data/messages/shopWelcome.asm"

txtShopInsufficientFunds:
.INCLUDE "src/data/messages/shopInsufficientFunds.asm"

txtShopItemPurchased:
.INCLUDE "src/data/messages/shopItemPurchased.asm"

txtParplinIntroduction:
.INCLUDE "src/data/messages/parplinIntroduction.asm"

txtChokkinnaIntroduction:
.INCLUDE "src/data/messages/chokkinnaIntroduction.asm"

txtGoosekaIntroduction:
.INCLUDE "src/data/messages/goosekaIntroduction.asm"

txtBattleGuide:
.INCLUDE "src/data/messages/battleGuide.asm"

txtBattleRoundLost:
.INCLUDE "src/data/messages/battleRoundLost.asm"

txtBattleRoundWon:
.INCLUDE "src/data/messages/battleRoundWon.asm"

txtBattleRoundTie:
.INCLUDE "src/data/messages/battleRoundTie.asm"

txtBossFight:
.INCLUDE "src/data/messages/bossFight.asm"

txtJankenIntroduction:
.INCLUDE "src/data/messages/jankenIntroduction.asm"

txtSaintNurari:
.INCLUDE "src/data/messages/saintNurari.asm"

txtVillageElder:
.INCLUDE "src/data/messages/villageElder.asm"

txtEgle:
.INCLUDE "src/data/messages/egle.asm"

txtKingHighStone:
.INCLUDE "src/data/messages/kingHighStone.asm"

txtKingHighStoneNoLetter:
.INCLUDE "src/data/messages/kingHighStoneNoLetter.asm"

txtPrincessLora:
.INCLUDE "src/data/messages/princessLora.asm"

txtBattleLost:
.INCLUDE "src/data/messages/battleLost.asm"

txtShopSoldOut:
.INCLUDE "src/data/messages/shopSoldOut.asm"
