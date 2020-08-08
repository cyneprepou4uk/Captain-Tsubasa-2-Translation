.segment "BANK_27"
.include "copy_bank_ram.inc"
; данные катсцен
; поинтеры в 0x000485

    .word off_AE6D_07_цубаса_и_карлос_перед_матчем
    .word off_AEEA_08_цубаса_победил_карлоса
    .word $0000     ; раньше это была катсцена 09, вторая часть 08





off_AE6D_07_цубаса_и_карлос_перед_матчем:
    .byte $E8, $01
    .byte con_катсцена_задний_фон, $11
    .byte $FA, $10
    .byte $FB, $01, $15
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_номер_звука, $69
    .byte con_катсцена_осветление_экрана
    .byte $F5, $04
    .byte con_катсцена_номер_звука, $53
    .byte con_катсцена_задержка, $1E
    .byte con_катсцена_вид_окна_текста, $00
    .byte $EC, $00
    .byte con_катсцена_скорость_текста, $04
    .byte con_катсцена_смещение_текста, $09
    .text "Just seconds before"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "the whistle blows,"
    .byte con_катсцена_задержка, $0F
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "all players are"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "in position -"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_частично_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte con_катсцена_смещение_текста, $09
    .text "eagerly awaiting"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "the start of the"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "match."
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_частично_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte $FB, $01, $58
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_смещение_текста, $09
    .text "The stadium is"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "packed with"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "cheering fans,"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_частично_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte con_катсцена_смещение_текста, $09
    .text "as the final match"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "of the Rio Cup is"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "about to kick off!"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_номер_звука, $31
    .byte con_катсцена_задержка, $78
    .byte $F5, $FF
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_выход






off_AEEA_08_цубаса_победил_карлоса:
    .byte $E8, $01
    .byte con_катсцена_задний_фон, $2B
    .byte $FA, $10
    .byte $FB, $01, $43
    .byte con_катсцена_номер_звука, $69
    .byte con_катсцена_осветление_экрана
    .byte $F5, $04
    .byte con_катсцена_номер_звука, $4D
    .byte con_катсцена_вид_окна_текста, $00
    .byte $EC, $02
    .byte con_катсцена_скорость_текста, $04
    .byte con_катсцена_смещение_текста, $09
    .text "Sao Paulo has beaten"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "Flamengo, and have"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "against all odds,"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "won the Rio Cup!"
; скрытая катсцена
    .byte $F4, $06, $03
    .byte con_катсцена_номер_звука, $62
    .byte $EC, $FF
    .byte $EE
    .byte $FB, $01, $2A
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_задержка, $14
    .byte $FB, $01, $2B
    .byte $E1
    .byte $40    ; <「>
    .byte $24    ; <や>
    .byte $2F    ; <っ>
    .byte $10    ; <た>
    .byte $18    ; <ね>
    .byte $00
    .byte $20    ; <み>
    .byte $2E    ; <ん>
    .byte $15    ; <な>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $3C
    .byte $FA, $11
    .byte con_катсцена_затереть_текст
    .byte $FB, $01, $3B
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_задержка, $3C
    .byte $EF
    .byte $E1
    .byte $40    ; <「>
    .byte $12    ; <つ>
    .byte $AF    ; <ば>
    .byte $0B    ; <さ>
    .byte $3F    ; <•>
    .byte $3F    ; <•>
    .byte $3F    ; <•>
    .byte con_катсцена_задержка, $3C
    .byte $26    ; <よ>
    .byte $08    ; <く>
    .byte $00
    .byte $24    ; <や>
    .byte $2F    ; <っ>
    .byte $10    ; <た>
    .byte $15    ; <な>
    .byte $7B    ; <。>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $3C
    .byte $01    ; <あ>
    .byte $27    ; <ら>
    .byte $10    ; <た>
    .byte $15    ; <な>
    .byte $67    ; <ラ>
    .byte $42    ; <イ>
    .byte $C3    ; <バ>
    .byte $69    ; <ル>
    .byte $10    ; <た>
    .byte $11    ; <ち>
    .byte $14    ; <と>
    .byte $00
    .byte $AD    ; <で>
    .byte $01    ; <あ>
    .byte $2F    ; <っ>
    .byte $10    ; <た>
    .byte con_катсцена_новая_строка
    .byte $68    ; <リ>
    .byte $45    ; <オ>
    .byte $46    ; <カ>
    .byte $6F    ; <ッ>
    .byte $CF    ; <プ>
    .byte $23    ; <も>
    .byte $00
    .byte $0A    ; <こ>
    .byte $2A    ; <れ>
    .byte $AD    ; <で>
    .byte $05    ; <お>
    .byte $2C    ; <わ>
    .byte $28    ; <り>
    .byte $AA    ; <だ>
    .byte $7B    ; <。>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затереть_текст
    .byte $FB, $01, $3C
    .byte $EF
    .byte $E1
    .byte $40    ; <「>
    .byte $AA    ; <だ>
    .byte $A0    ; <が>
    .byte $00
    .byte $0E    ; <せ>
    .byte $06    ; <か>
    .byte $02    ; <い>
    .byte $16    ; <に>
    .byte $1A    ; <は>
    .byte $00
    .byte $1F    ; <ま>
    .byte $AA    ; <だ>
    .byte $1F    ; <ま>
    .byte $AA    ; <だ>
    .byte con_катсцена_новая_строка
    .byte $0D    ; <す>
    .byte $A4    ; <ご>
    .byte $02    ; <い>
    .byte $24    ; <や>
    .byte $12    ; <つ>
    .byte $27    ; <ら>
    .byte $A0    ; <が>
    .byte $00
    .byte $02    ; <い>
    .byte $29    ; <る>
    .byte $2E    ; <ん>
    .byte $AA    ; <だ>
    .byte $7B    ; <。>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $3C
    .byte $1E    ; <ほ>
    .byte $2E    ; <ん>
    .byte $14    ; <と>
    .byte $03    ; <う>
    .byte $19    ; <の>
    .byte $10    ; <た>
    .byte $10    ; <た>
    .byte $06    ; <か>
    .byte $02    ; <い>
    .byte $1A    ; <は>
    .byte $00
    .byte $0A    ; <こ>
    .byte $2A    ; <れ>
    .byte $06    ; <か>
    .byte $27    ; <ら>
    .byte $AA    ; <だ>
    .byte $7B    ; <。>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задний_фон, $0F
    .byte $FB, $01, $0C
    .byte con_катсцена_осветление_экрана
    .byte con_катсцена_номер_звука, $62
    .byte $E1
    .byte $40    ; <「>
    .byte $24    ; <や>
    .byte $2F    ; <っ>
    .byte $10    ; <た>
    .byte $A8    ; <ぜ>
    .byte $00
    .byte $12    ; <つ>
    .byte $AF    ; <ば>
    .byte $0B    ; <さ>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte $05    ; <お>
    .byte $2A    ; <れ>
    .byte $10    ; <た>
    .byte $11    ; <ち>
    .byte $19    ; <の>
    .byte $00
    .byte $25    ; <ゆ>
    .byte $03    ; <う>
    .byte $0C    ; <し>
    .byte $32    ; <ょ>
    .byte $03    ; <う>
    .byte $AA    ; <だ>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $3C
    .byte $E1
    .byte $40    ; <「>
    .byte $0A    ; <こ>
    .byte $2A    ; <れ>
    .byte $23    ; <も>
    .byte $00
    .byte $20    ; <み>
    .byte $2E    ; <ん>
    .byte $15    ; <な>
    .byte $19    ; <の>
    .byte $05    ; <お>
    .byte $06    ; <か>
    .byte $A3    ; <げ>
    .byte $AA    ; <だ>
    .byte $26    ; <よ>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $28
    .byte $01    ; <あ>
    .byte $28    ; <り>
    .byte $A0    ; <が>
    .byte $14    ; <と>
    .byte $03    ; <う>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_скорость_текста
    .byte $02    ; <い>
    .byte con_катсцена_задержка, $3C
    .byte $E1
    .byte $40    ; <「>
    .byte $12    ; <つ>
    .byte $AF    ; <ば>
    .byte $0B    ; <さ>
    .byte $79    ; <!>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_затереть_текст
    .byte $FA, $10
    .byte $FB, $01, $13
    .byte $F7
    .byte $F3, $00
    .byte $F5, $04
    .byte $E1
    .byte $40    ; <「>
    .byte $04    ; <え>
    .byte $2F    ; <っ>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_затереть_текст
    .byte $FB, $01, $12
    .byte $FA, $11
    .byte con_катсцена_задержка, $3C
    .byte $FB, $01, $15
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_скорость_текста
    .byte $08    ; <く>
    .byte con_катсцена_задержка, $3C
    .byte $E1
    .byte $40    ; <「>
    .byte $46    ; <カ>
    .byte $69    ; <ル>
    .byte $6B    ; <ロ>
    .byte $4D    ; <ス>
    .byte $3F    ; <•>
    .byte $3F    ; <•>
    .byte $3F    ; <•>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte $FB, $01, $63
    .byte $E1
    .byte con_катсцена_задержка, $3C
    .byte $40    ; <「>
    .byte $0A    ; <こ>
    .byte $19    ; <の>
    .byte $10    ; <た>
    .byte $02    ; <い>
    .byte $06    ; <か>
    .byte $02    ; <い>
    .byte $00
    .byte $1A    ; <は>
    .byte $A6    ; <じ>
    .byte $22    ; <め>
    .byte $13    ; <て>
    .byte $1F    ; <ま>
    .byte $09    ; <け>
    .byte $10    ; <た>
    .byte $26    ; <よ>
    .byte $7A    ; <、>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $28
    .byte $0B    ; <さ>
    .byte $0D    ; <す>
    .byte $A0    ; <が>
    .byte $00
    .byte $6B    ; <ロ>
    .byte $C6    ; <ベ>
    .byte $69    ; <ル>
    .byte $54    ; <ト>
    .byte $A0    ; <が>
    .byte $00
    .byte $20    ; <み>
    .byte $0A    ; <こ>
    .byte $2E    ; <ん>
    .byte $AA    ; <だ>
    .byte $05    ; <お>
    .byte $14    ; <と>
    .byte $0A    ; <こ>
    .byte $AA    ; <だ>
    .byte $7B    ; <。>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $3C
    .byte $12    ; <つ>
    .byte $AF    ; <ば>
    .byte $0B    ; <さ>
    .byte $7A    ; <、>
    .byte con_катсцена_задержка, $28
    .byte $25    ; <ゆ>
    .byte $03    ; <う>
    .byte $0C    ; <し>
    .byte $32    ; <ょ>
    .byte $03    ; <う>
    .byte $00
    .byte $05    ; <お>
    .byte $22    ; <め>
    .byte $AD    ; <で>
    .byte $14    ; <と>
    .byte $03    ; <う>
    .byte $7B    ; <。>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задний_фон, $06
    .byte $FB, $01, $A3
    .byte $F3, $00
    .byte con_катсцена_номер_звука, $25
    .byte $F5, $08
    .byte con_катсцена_задержка, $14
    .byte $F7
    .byte $F5, $04
    .byte con_катсцена_номер_звука, $62
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_задний_фон, $10
    .byte $FA, $11
    .byte $FB, $01, $4E
    .byte con_катсцена_осветление_экрана
    .byte $F5, $04
    .byte $E1
    .byte $40    ; <「>
    .byte $46    ; <カ>
    .byte $69    ; <ル>
    .byte $6B    ; <ロ>
    .byte $4D    ; <ス>
    .byte $7A    ; <、>
    .byte con_катсцена_задержка, $28
    .byte $01    ; <あ>
    .byte $28    ; <り>
    .byte $A0    ; <が>
    .byte $14    ; <と>
    .byte $03    ; <う>
    .byte $7B    ; <。>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затереть_текст
    .byte $FB, $01, $63
    .byte $F7
    .byte $F3, $00
    .byte $E1
    .byte $40    ; <「>
    .byte $12    ; <つ>
    .byte $A1    ; <ぎ>
    .byte $16    ; <に>
    .byte $00
    .byte $01    ; <あ>
    .byte $03    ; <う>
    .byte $19    ; <の>
    .byte $1A    ; <は>
    .byte $00
    .byte $CF    ; <プ>
    .byte $6B    ; <ロ>
    .byte $19    ; <の>
    .byte $B6    ; <グ>
    .byte $67    ; <ラ>
    .byte $43    ; <ウ>
    .byte $6E    ; <ン>
    .byte $C2    ; <ド>
    .byte $19    ; <の>
    .byte con_катсцена_новая_строка
    .byte $03    ; <う>
    .byte $04    ; <え>
    .byte $06    ; <か>
    .byte $23    ; <も>
    .byte $15    ; <な>
    .byte $7A    ; <、>
    .byte con_катсцена_задержка, $28
    .byte $0F    ; <そ>
    .byte $19    ; <の>
    .byte $14    ; <と>
    .byte $07    ; <き>
    .byte $1A    ; <は>
    .byte $00
    .byte $1F    ; <ま>
    .byte $09    ; <け>
    .byte $15    ; <な>
    .byte $02    ; <い>
    .byte $A8    ; <ぜ>
    .byte $7B    ; <。>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затереть_текст
    .byte $FB, $01, $4E
    .byte $F7
    .byte $F3, $00
    .byte $E1
    .byte $40    ; <「>
    .byte $19    ; <の>
    .byte $A9    ; <ぞ>
    .byte $21    ; <む>
    .byte $14    ; <と>
    .byte $0A    ; <こ>
    .byte $2B    ; <ろ>
    .byte $0B    ; <さ>
    .byte $7B    ; <。>
    .byte con_катсцена_новая_строка
    .byte $EF
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_скорость_текста
    .byte $04    ; <え>
    .byte $E1
    .byte $40    ; <「>
    .byte $0C    ; <し>
    .byte $32    ; <ょ>
    .byte $08    ; <く>
    .byte $2E    ; <ん>
    .byte $7A    ; <、>
    .byte con_катсцена_задержка, $28
    .byte con_катсцена_номер_звука, $01
    .byte $1F    ; <ま>
    .byte $AA    ; <だ>
    .byte $00
    .byte $1B    ; <ひ>
    .byte $14    ; <と>
    .byte $0C    ; <し>
    .byte $32    ; <ょ>
    .byte $03    ; <う>
    .byte $B1    ; <ぶ>
    .byte $00
    .byte $01    ; <あ>
    .byte $29    ; <る>
    .byte $A9    ; <ぞ>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte $FB, $01, $12
    .byte con_катсцена_задержка, $78
    .byte $F5, $FF
    .byte con_катсцена_затереть_текст
    .byte $FA, $23
    .byte $FB, $01, $AE
    .byte $F7
    .byte $F3, $00
    .byte $F5, $08
    .byte con_катсцена_номер_звука, $43
    .byte con_катсцена_задержка, $78
    .byte $FA, $10
    .byte $FB, $01, $40
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_номер_звука, $52
    .byte con_катсцена_задержка, $28
    .byte $EF
    .byte $E1
    .byte $40    ; <「>
    .byte $06    ; <か>
    .byte $10    ; <た>
    .byte $A1    ; <ぎ>
    .byte $28    ; <り>
    .byte $0B    ; <さ>
    .byte $2E    ; <ん>
    .byte $7A    ; <、>
    .byte con_катсцена_задержка, $28
    .byte $AE    ; <ど>
    .byte $03    ; <う>
    .byte $0C    ; <し>
    .byte $13    ; <て>
    .byte $00
    .byte $0A    ; <こ>
    .byte $0A    ; <こ>
    .byte $16    ; <に>
    .byte $79    ; <!>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $78
    .byte $F3, $FF, $24, $42
    .byte con_катсцена_задержка
    .byte $06    ; <か>
    .byte $F3, $FF, $23, $41
    .byte $F4, $05
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_номер_звука, $53
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_скорость_текста
    .byte $06    ; <か>
    .byte $F4, $04
    .byte $A3    ; <げ>
    .byte $07    ; <き>
    .byte $0E    ; <せ>
    .byte $2E    ; <ん>
    .byte $19    ; <の>
    .byte $0D    ; <す>
    .byte $04    ; <え>
    .byte $00
    .byte $25    ; <ゆ>
    .byte $03    ; <う>
    .byte $0C    ; <し>
    .byte $32    ; <ょ>
    .byte $03    ; <う>
    .byte $2D    ; <を>
    .byte $13    ; <て>
    .byte $16    ; <に>
    .byte $0C    ; <し>
    .byte $10    ; <た>
    .byte con_катсцена_новая_строка
    .byte $4B    ; <サ>
    .byte $6E    ; <ン>
    .byte $CD    ; <パ>
    .byte $43    ; <ウ>
    .byte $6B    ; <ロ>
    .byte $86    ; <F>
    .byte $83    ; <C>
    .byte con_катсцена_задержка, $28
    .byte $00
    .byte $0F    ; <そ>
    .byte $0A    ; <こ>
    .byte $16    ; <に>
    .byte $1A    ; <は>
    .byte $00
    .byte $01    ; <あ>
    .byte $10    ; <た>
    .byte $27    ; <ら>
    .byte $0C    ; <し>
    .byte $02    ; <い>
    .byte con_катсцена_новая_строка
    .byte $0E    ; <せ>
    .byte $06    ; <か>
    .byte $02    ; <い>
    .byte $AD    ; <で>
    .byte $00
    .byte $CF    ; <プ>
    .byte $6B    ; <ロ>
    .byte $2D    ; <を>
    .byte $22    ; <め>
    .byte $A5    ; <ざ>
    .byte $0D    ; <す>
    .byte $00
    .byte $12    ; <つ>
    .byte $AF    ; <ば>
    .byte $0B    ; <さ>
    .byte $A0    ; <が>
    .byte $02    ; <い>
    .byte $10    ; <た>
    .byte con_катсцена_мячик
    .byte $AA    ; <だ>
    .byte $A0    ; <が>
    .byte $00
    .byte $14    ; <と>
    .byte $12    ; <つ>
    .byte $A6    ; <じ>
    .byte $32    ; <ょ>
    .byte $00
    .byte $12    ; <つ>
    .byte $AF    ; <ば>
    .byte $0B    ; <さ>
    .byte $19    ; <の>
    .byte $1F    ; <ま>
    .byte $04    ; <え>
    .byte $16    ; <に>
    .byte con_катсцена_новая_строка
    .byte $01    ; <あ>
    .byte $27    ; <ら>
    .byte $2C    ; <わ>
    .byte $2A    ; <れ>
    .byte $10    ; <た>
    .byte $00
    .byte $06    ; <か>
    .byte $10    ; <た>
    .byte $A1    ; <ぎ>
    .byte $28    ; <り>
    .byte $16    ; <に>
    .byte $26    ; <よ>
    .byte $2F    ; <っ>
    .byte $13    ; <て>
    .byte con_катсцена_задержка, $28
    .byte $00
    .byte $A6    ; <じ>
    .byte $10    ; <た>
    .byte $02    ; <い>
    .byte $1A    ; <は>
    .byte con_катсцена_новая_строка
    .byte $01    ; <あ>
    .byte $27    ; <ら>
    .byte $10    ; <た>
    .byte $15    ; <な>
    .byte $13    ; <て>
    .byte $2E    ; <ん>
    .byte $06    ; <か>
    .byte $02    ; <い>
    .byte $2D    ; <を>
    .byte $00
    .byte $21    ; <む>
    .byte $06    ; <か>
    .byte $04    ; <え>
    .byte $29    ; <る>
    .byte $0A    ; <こ>
    .byte $14    ; <と>
    .byte $16    ; <に>
    .byte $15    ; <な>
    .byte $29    ; <る>
    .byte con_катсцена_мячик
    .byte $02    ; <い>
    .byte $2F    ; <っ>
    .byte $CC    ; <ぽ>
    .byte $03    ; <う>
    .byte $00
    .byte $34    ; <1>
    .byte $0C    ; <し>
    .byte $31    ; <ゅ>
    .byte $03    ; <う>
    .byte $06    ; <か>
    .byte $2E    ; <ん>
    .byte $1F    ; <ま>
    .byte $04    ; <え>
    .byte $19    ; <の>
    .byte con_катсцена_новая_строка
    .byte $00
    .byte $00
    .byte $00
    .byte $16    ; <に>
    .byte $1E    ; <ほ>
    .byte $2E    ; <ん>
    .byte $AD    ; <で>
    .byte $1A    ; <は>
    .byte $3F    ; <•>
    .byte $3F    ; <•>
    .byte $3F    ; <•>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_номер_звука, $31
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_номер_звука, $01
    .byte con_катсцена_затереть_текст
    
    
    
    .byte $E8, $01
    .byte con_катсцена_задержка, $F0
    .byte con_катсцена_номер_звука, $69
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_задний_фон, $0C
    .byte $FB, $01, $43
    .byte con_катсцена_осветление_экрана
    .byte $F5, $04
    .byte con_катсцена_номер_звука, $51
    .byte con_катсцена_вид_окна_текста, $00
    .byte $EC, $00
    .byte con_катсцена_скорость_текста
    .byte $08    ; <く>
    .byte $06    ; <か>
    .byte $0A    ; <こ>
    .byte $00
    .byte $35    ; <2>
    .byte $18    ; <ね>
    .byte $2E    ; <ん>
    .byte $19    ; <の>
    .byte $00
    .byte $25    ; <ゆ>
    .byte $03    ; <う>
    .byte $0C    ; <し>
    .byte $32    ; <ょ>
    .byte $03    ; <う>
    .byte $2D    ; <を>
    .byte con_катсцена_новая_строка
    .byte $15    ; <な>
    .byte $2E    ; <ん>
    .byte $06    ; <か>
    .byte $12    ; <つ>
    .byte $7A    ; <、>
    .byte con_катсцена_задержка, $14
    .byte $14    ; <と>
    .byte $03    ; <う>
    .byte $1E    ; <ほ>
    .byte $03    ; <う>
    .byte $A0    ; <が>
    .byte $00
    .byte $2C    ; <わ>
    .byte $09    ; <け>
    .byte $01    ; <あ>
    .byte $02    ; <い>
    .byte con_катсцена_новая_строка
    .byte $91    ; <V>
    .byte $35    ; <2>
    .byte $09    ; <け>
    .byte $2F    ; <っ>
    .byte $0E    ; <せ>
    .byte $2E    ; <ん>
    .byte $19    ; <の>
    .byte $00
    .byte $0C    ; <し>
    .byte $25    ; <ゆ>
    .byte $03    ; <う>
    .byte $2D    ; <を>
    .byte $09    ; <け>
    .byte $2F    ; <っ>
    .byte $0D    ; <す>
    .byte $29    ; <る>
    .byte con_катсцена_новая_строка
    .byte $14    ; <と>
    .byte $07    ; <き>
    .byte $A0    ; <が>
    .byte $00
    .byte $07    ; <き>
    .byte $1F    ; <ま>
    .byte $0C    ; <し>
    .byte $10    ; <た>
    .byte $7B    ; <。>
    .byte con_катсцена_мячик
    .byte $1C    ; <ふ>
    .byte $25    ; <ゆ>
    .byte $19    ; <の>
    .byte $00
    .byte $A8    ; <ぜ>
    .byte $2E    ; <ん>
    .byte $0A    ; <こ>
    .byte $08    ; <く>
    .byte $0A    ; <こ>
    .byte $03    ; <う>
    .byte $0A    ; <こ>
    .byte $03    ; <う>
    .byte $4B    ; <サ>
    .byte $6F    ; <ッ>
    .byte $46    ; <カ>
    .byte $7D    ; <ー>
    .byte con_катсцена_новая_строка
    .byte $0E    ; <せ>
    .byte $2E    ; <ん>
    .byte $0C    ; <し>
    .byte $31    ; <ゅ>
    .byte $09    ; <け>
    .byte $2E    ; <ん>
    .byte $10    ; <た>
    .byte $02    ; <い>
    .byte $06    ; <か>
    .byte $02    ; <い>
    .byte con_катсцена_новая_строка
    .byte $12    ; <つ>
    .byte $02    ; <い>
    .byte $16    ; <に>
    .byte $00
    .byte $06    ; <か>
    .byte $02    ; <い>
    .byte $1F    ; <ま>
    .byte $08    ; <く>
    .byte $AD    ; <で>
    .byte $0D    ; <す>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte $FA, $11
    .byte con_катсцена_мячик
    .byte con_катсцена_номер_звука, $62
    .byte $FB, $01, $49
    .byte $F7
    .byte $F3, $00
    .byte $FA, $10
    .byte $25    ; <ゆ>
    .byte $03    ; <う>
    .byte $0C    ; <し>
    .byte $32    ; <ょ>
    .byte $03    ; <う>
    .byte $0A    ; <こ>
    .byte $03    ; <う>
    .byte $1E    ; <ほ>
    .byte $19    ; <の>
    .byte $00
    .byte $1B    ; <ひ>
    .byte $14    ; <と>
    .byte $12    ; <つ>
    .byte con_катсцена_новая_строка
    .byte $05    ; <お>
    .byte $14    ; <と>
    .byte $14    ; <と>
    .byte $0C    ; <し>
    .byte $91    ; <V>
    .byte $34    ; <1>
    .byte $19    ; <の>
    .byte $00
    .byte $14    ; <と>
    .byte $03    ; <う>
    .byte $1E    ; <ほ>
    .byte $03    ; <う>
    .byte $2D    ; <を>
    .byte $1B    ; <ひ>
    .byte $07    ; <き>
    .byte $02    ; <い>
    .byte $29    ; <る>
    .byte con_катсцена_новая_строка
    .byte $47    ; <キ>
    .byte $70    ; <ャ>
    .byte $CF    ; <プ>
    .byte $53    ; <テ>
    .byte $6E    ; <ン>
    .byte $00
    .byte $1B    ; <ひ>
    .byte $31    ; <ゅ>
    .byte $03    ; <う>
    .byte $A0    ; <が>
    .byte $08    ; <く>
    .byte $2E    ; <ん>
    .byte $7B    ; <。>
    .byte con_катсцена_мячик
    .byte con_катсцена_номер_звука, $62
    .byte $FB, $01, $1E
    .byte $F7
    .byte $F3, $00
    .byte $FA, $2B
    .byte $0B    ; <さ>
    .byte $08    ; <く>
    .byte $18    ; <ね>
    .byte $2E    ; <ん>
    .byte $91    ; <V>
    .byte $34    ; <1>
    .byte $00
    .byte $0F    ; <そ>
    .byte $0C    ; <し>
    .byte $13    ; <て>
    .byte $00
    .byte $91    ; <V>
    .byte $35    ; <2>
    .byte $10    ; <た>
    .byte $2F    ; <っ>
    .byte $0E    ; <せ>
    .byte $02    ; <い>
    .byte $16    ; <に>
    .byte con_катсцена_новая_строка
    .byte $23    ; <も>
    .byte $04    ; <え>
    .byte $29    ; <る>
    .byte $00
    .byte $15    ; <な>
    .byte $2E    ; <ん>
    .byte $06    ; <か>
    .byte $12    ; <つ>
    .byte $47    ; <キ>
    .byte $70    ; <ャ>
    .byte $CF    ; <プ>
    .byte $53    ; <テ>
    .byte $6E    ; <ン>
    .byte con_катсцена_новая_строка
    .byte $20    ; <み>
    .byte $0B    ; <さ>
    .byte $07    ; <き>
    .byte $08    ; <く>
    .byte $2E    ; <ん>
    .byte $7B    ; <。>
    .byte con_катсцена_мячик
    .byte $FB, $01, $43
    .byte $F7
    .byte $EC, $05
    .byte con_катсцена_номер_звука, $62
    .byte $0A    ; <こ>
    .byte $0A    ; <こ>
    .byte $00
    .byte $0A    ; <こ>
    .byte $08    ; <く>
    .byte $28    ; <り>
    .byte $12    ; <つ>
    .byte $07    ; <き>
    .byte $32    ; <ょ>
    .byte $03    ; <う>
    .byte $A1    ; <ぎ>
    .byte $A6    ; <じ>
    .byte $32    ; <ょ>
    .byte $03    ; <う>
    .byte $16    ; <に>
    .byte con_катсцена_новая_строка
    .byte $1F    ; <ま>
    .byte $07    ; <き>
    .byte $05    ; <お>
    .byte $0A    ; <こ>
    .byte $29    ; <る>
    .byte $00
    .byte $5E    ; <ホ>
    .byte $6F    ; <ッ>
    .byte $54    ; <ト>
    .byte $5C    ; <フ>
    .byte $73    ; <ヮ>
    .byte $42    ; <イ>
    .byte $54    ; <ト>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $28
    .byte $0C    ; <し>
    .byte $2E    ; <ん>
    .byte $08    ; <く>
    .byte $19    ; <の>
    .byte $00
    .byte $25    ; <ゆ>
    .byte $03    ; <う>
    .byte $0C    ; <し>
    .byte $32    ; <ょ>
    .byte $03    ; <う>
    .byte $07    ; <き>
    .byte $2D    ; <を>
    .byte $22    ; <め>
    .byte $A5    ; <ざ>
    .byte $0D    ; <す>
    .byte con_катсцена_новая_строка
    .byte $10    ; <た>
    .byte $10    ; <た>
    .byte $06    ; <か>
    .byte $02    ; <い>
    .byte $A0    ; <が>
    .byte $00
    .byte $1A    ; <は>
    .byte $A6    ; <じ>
    .byte $1F    ; <ま>
    .byte $28    ; <り>
    .byte $1F    ; <ま>
    .byte $0D    ; <す>
    .byte $7B    ; <。>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $78
    .byte $F5, $FF
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_номер_звука, $31
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_номер_звука, $01
    .byte con_катсцена_выход




.export off_0x040005_скрытая_катсцена_из_08
off_0x040005_скрытая_катсцена_из_08:
    .byte con_катсцена_частично_затереть_текст
    .byte $E8, $01
    .byte con_катсцена_номер_звука, $43
    .byte $EC, $01
    .byte con_катсцена_скорость_текста, $04
    .byte con_катсцена_смещение_текста, $09
    .text "Huh?"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "Why'd the music stop?"
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_задержка, $F0
    .byte con_катсцена_частично_затереть_текст
    
    
    
    .byte $FB, $01, $C2
    .byte $F3, $00
    .byte con_катсцена_номер_звука, $27
    .byte $EC, $05
    .byte con_катсцена_смещение_текста, $09
    .text "Oh my goodness!"
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_номер_звука, $62
    .byte con_катсцена_номер_звука, $3C
    .byte con_катсцена_частично_затереть_текст
    
    
    
    .byte $EC, $04
    .byte con_катсцена_смещение_текста, $09
    .text "Running onto the"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "field is the star"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "of the hit game,"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "Mighty Bomb Jack!"
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_частично_затереть_текст
    
    
    
    .byte $EC, $02
    .byte con_катсцена_смещение_текста, $09
    .text "He's shown up to"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "celebrate Sao"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "Paulo's victory,"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_частично_затереть_текст
    
    
    
    
    .byte con_катсцена_смещение_текста, $09
    .text "shouting @Banzai@"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "again and again!"
    .byte con_катсцена_мячик
    .byte con_катсцена_частично_затереть_текст
    
    
    
    .byte $FB, $01, $C3
    .byte con_катсцена_номер_звука, $62
    .byte $EC, $04
    .byte con_катсцена_смещение_текста, $09
    .text "Farewell and thank"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "you, Jack!"
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_частично_затереть_текст
    
    
    
    .byte $EC, $02
    .byte con_катсцена_смещение_текста, $09
    .text "Now, back to our"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "regular celebration!"
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_номер_звука, $31
    .byte con_катсцена_задержка, $78
    .byte $FA, $10
    .byte $F5, $04
    .byte con_катсцена_номер_звука, $4D
    .byte $F4, $07
