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

.MACRO AKPRINTEND
    .DB $00 $00
.ENDM

txtShopWelcome:
;.INCBIN "src/text/bin/shopWelcome.bin"
AKPRINTRLERIGHT $1C " "
AKPRINTRLEDOWN $4 " "
AKPRINTRLELEFT $1A " "
AKPRINTRLEUP $3 " "
AKPRINTRIGHT "WELCOME! PLEASE BUY      "
AKPRINTDOWN " "
AKPRINTRLELEFT $18 " "
AKPRINTDOWN "T"
AKPRINTRIGHT "HE THINGS THAT YOU LIKE."
AKPRINTEND

txtShopInsufficientFunds:
.INCBIN "src/text/bin/shopInsufficientFunds.bin"

txtShopItemPurchased:
.INCBIN "src/text/bin/shopItemPurchased.bin"

txtParplinIntroduction:
.INCBIN "src/text/bin/parplinIntroduction.bin"

txtChokkinnaIntroduction:
.INCBIN "src/text/bin/chokkinnaIntroduction.bin"

txtGoosekaIntroduction:
.INCBIN "src/text/bin/goosekaIntroduction.bin"

txtBattleGuide:
.INCBIN "src/text/bin/battleGuide.bin"

txtBattleRoundLost:
.INCBIN "src/text/bin/battleRoundLost.bin"

txtBattleRoundWon:
.INCBIN "src/text/bin/battleRoundWon.bin"

txtBattleRoundTie:
.INCBIN "src/text/bin/battleRoundTie.bin"

txtBossFight:
.INCBIN "src/text/bin/bossFight.bin"

txtJankenIntroduction:
.INCBIN "src/text/bin/jankenIntroduction.bin"

txtSaintNurari:
.INCBIN "src/text/bin/saintNurari.bin"

txtVillageElder:
.INCBIN "src/text/bin/villageElder.bin"

txtEgle:
.INCBIN "src/text/bin/egle.bin"

txtKingHighStone:
.INCBIN "src/text/bin/kingHighStone.bin"

txtKingHighStoneNoLetter:
.INCBIN "src/text/bin/kingHighStoneNoLetter.bin"

txtPrincessLora:
.INCBIN "src/text/bin/princessLora.bin"

txtBattleLost:
.INCBIN "src/text/bin/battleLost.bin"

txtShopSoldOut:
.INCBIN "src/text/bin/shopSoldOut.bin"
