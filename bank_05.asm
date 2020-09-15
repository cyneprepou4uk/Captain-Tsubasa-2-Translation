.segment "BANK_05"
.include "copy_bank_ram.inc"
; тут только данные
; поинтеры в 0x000485
; перемещать код можно только после начальной таблицы поинтеров

    .word off_BA74_1D_после_победы_над_аргентиной
    .word off_BDD6_1E_цубаса_и_шнайдер_перед_матчем
    .word off_BE49_1F_перед_матчем_с_бразилией



off_BA74_1D_после_победы_над_аргентиной:
    .byte $E8, $01
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_задний_фон, $06
    .byte $FB, $01, $A3
    .byte $F3, $00
    .byte con_катсцена_номер_звука, $25
    .byte $F5, $08
    .byte con_катсцена_задержка, $14
    .byte $F7
    .byte $F5, $04
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_номер_звука, $47
    .byte $40    ; <「>
    .byte $12    ; <つ>
    .byte $AF    ; <ば>
    .byte $0B    ; <さ>
    .byte $7A    ; <、>
    .byte con_катсцена_задержка, $28
    .byte $24    ; <や>
    .byte $2F    ; <っ>
    .byte $10    ; <た>
    .byte $15    ; <な>
    .byte $7B    ; <。>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $3C
    .byte $40    ; <「>
    .byte $1B    ; <ひ>
    .byte $31    ; <ゅ>
    .byte $03    ; <う>
    .byte $A0    ; <が>
    .byte $08    ; <く>
    .byte $2E    ; <ん>
    .byte $3F    ; <•>
    .byte $3F    ; <•>
    .byte $3F    ; <•>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задний_фон, $11
    .byte $FA, $10
    .byte $FB, $01, $06
    .byte con_катсцена_номер_звука, $62
    .byte con_катсцена_осветление_экрана
    .byte $F5, $04
    .byte $40    ; <「>
    .byte $0A    ; <こ>
    .byte $19    ; <の>
    .byte $1F    ; <ま>
    .byte $1F    ; <ま>
    .byte $00
    .byte $02    ; <い>
    .byte $2F    ; <っ>
    .byte $07    ; <き>
    .byte $16    ; <に>
    .byte $00
    .byte $25    ; <ゆ>
    .byte $03    ; <う>
    .byte $0C    ; <し>
    .byte $32    ; <ょ>
    .byte $03    ; <う>
    .byte $1D    ; <へ>
    .byte con_катсцена_новая_строка
    .byte $12    ; <つ>
    .byte $2F    ; <っ>
    .byte $C8    ; <ぱ>
    .byte $0C    ; <し>
    .byte $2B    ; <ろ>
    .byte $03    ; <う>
    .byte $A8    ; <ぜ>
    .byte $7B    ; <。>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte $FB, $01, $66
    .byte $F7
    .byte $F3, $00
    .byte $40    ; <「>
    .byte $03    ; <う>
    .byte $2E    ; <ん>
    .byte $7B    ; <。>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_номер_звука, $31
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_номер_звука, $53
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_закрыть_рот
    .byte con_катсцена_скорость_текста
    .byte $06    ; <か>
    .byte $00
    .byte $06    ; <か>
    .byte $08    ; <く>
    .byte $0C    ; <し>
    .byte $13    ; <て>
    .byte $00
    .byte $12    ; <つ>
    .byte $AF    ; <ば>
    .byte $0B    ; <さ>
    .byte $10    ; <た>
    .byte $11    ; <ち>
    .byte $1A    ; <は>
    .byte con_катсцена_новая_строка
    .byte $A6    ; <じ>
    .byte $31    ; <ゅ>
    .byte $2E    ; <ん>
    .byte $09    ; <け>
    .byte $2F    ; <っ>
    .byte $0C    ; <し>
    .byte $32    ; <ょ>
    .byte $03    ; <う>
    .byte $1D    ; <へ>
    .byte $00
    .byte $4A    ; <コ>
    .byte $5F    ; <マ>
    .byte $2D    ; <を>
    .byte $0D    ; <す>
    .byte $0D    ; <す>
    .byte $22    ; <め>
    .byte $10    ; <た>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $3C
    .byte $0F    ; <そ>
    .byte $0C    ; <し>
    .byte $13    ; <て>
    .byte $00
    .byte $19    ; <の>
    .byte $0A    ; <こ>
    .byte $28    ; <り>
    .byte $00
    .byte $36    ; <3>
    .byte $51    ; <チ>
    .byte $7D    ; <ー>
    .byte $61    ; <ム>
    .byte $23    ; <も>
    .byte con_катсцена_новая_строка
    .byte $01    ; <あ>
    .byte $14    ; <と>
    .byte $2D    ; <を>
    .byte $05    ; <お>
    .byte $03    ; <う>
    .byte $06    ; <か>
    .byte $19    ; <の>
    .byte $26    ; <よ>
    .byte $03    ; <う>
    .byte $16    ; <に>
    .byte $3F    ; <•>
    .byte $3F    ; <•>
    .byte $3F    ; <•>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задний_фон, $11
    .byte $FB, $01, $5C
    .byte $F3, $00
    .byte con_катсцена_скорость_текста
    .byte $00
    .byte $F0
    .byte $4E    ; <セ>
    .byte $22    ; <め>
    .byte $5C    ; <フ>
    .byte $67    ; <ラ>
    .byte $6E    ; <ン>
    .byte $4D    ; <ス>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задний_фон, $10
    .byte $FB, $01, $5A
    .byte $F3, $00
    .byte $C5    ; <ブ>
    .byte $67    ; <ラ>
    .byte $BA    ; <ジ>
    .byte $69    ; <ル>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задний_фон, $2E
    .byte $FB, $01, $21
    .byte $F3, $00
    .byte $56    ; <ニ>
    .byte $4C    ; <シ>
    .byte $C2    ; <ド>
    .byte $42    ; <イ>
    .byte $52    ; <ツ>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_номер_звука, $01
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задний_фон, $42
    .byte $FB, $02, $98, $8F
    .byte $F3, $00
    .byte con_катсцена_задержка, $14
    .byte con_катсцена_номер_звука, $30
    .byte $12    ; <つ>
    .byte $02    ; <い>
    .byte $16    ; <に>
    .byte $00
    .byte $C6    ; <ベ>
    .byte $4D    ; <ス>
    .byte $54    ; <ト>
    .byte $37    ; <4>
    .byte $A0    ; <が>
    .byte $0F    ; <そ>
    .byte $2B    ; <ろ>
    .byte $2F    ; <っ>
    .byte $10    ; <た>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $F0
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_затереть_текст
    .byte $EE
    .byte con_катсцена_задний_фон, $28
    .byte con_катсцена_осветление_экрана
    .byte con_катсцена_номер_звука, $3E
    .byte con_катсцена_скорость_текста
    .byte $06    ; <か>
    .byte $F0
    .byte $0D    ; <す>
    .byte $21    ; <む>
    .byte $00
    .byte $26    ; <よ>
    .byte $08    ; <く>
    .byte $A6    ; <じ>
    .byte $12    ; <つ>
    .byte con_катсцена_новая_строка
    .byte $6C    ; <ワ>
    .byte $7D    ; <ー>
    .byte $69    ; <ル>
    .byte $C2    ; <ド>
    .byte $65    ; <ユ>
    .byte $7D    ; <ー>
    .byte $4D    ; <ス>
    .byte $00
    .byte $A6    ; <じ>
    .byte $31    ; <ゅ>
    .byte $2E    ; <ん>
    .byte $09    ; <け>
    .byte $2F    ; <っ>
    .byte $0C    ; <し>
    .byte $32    ; <ょ>
    .byte $03    ; <う>
    .byte con_катсцена_новая_строка
    .byte $AA    ; <だ>
    .byte $02    ; <い>
    .byte $34    ; <1>
    .byte $0C    ; <し>
    .byte $01    ; <あ>
    .byte $02    ; <い>
    .byte con_катсцена_новая_строка
    .byte $5C    ; <フ>
    .byte $67    ; <ラ>
    .byte $6E    ; <ン>
    .byte $4D    ; <ス>
    .byte $00
    .byte $91    ; <V>
    .byte $8F    ; <S>
    .byte $00
    .byte $C5    ; <ブ>
    .byte $67    ; <ラ>
    .byte $BA    ; <ジ>
    .byte $69    ; <ル>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_вид_окна_текста
    .byte $01    ; <あ>
    .byte $EC, $00
    .byte con_катсцена_задний_фон, $01
    .byte $FB, $01, $6F
    .byte con_катсцена_номер_звука, $62
    .byte $F8, $0A
    .byte $F3, $00
    .byte $F5, $00
    .byte $F0
    .byte $49    ; <ケ>
    .byte $22    ; <め>
    .byte $0B    ; <さ>
    .byte $73    ; <ヮ>
    .byte $00
    .byte $5C    ; <フ>
    .byte $67    ; <ラ>
    .byte $6E    ; <ン>
    .byte $4D    ; <ス>
    .byte $00
    .byte $91    ; <V>
    .byte $8F    ; <S>
    .byte $00
    .byte $C5    ; <ブ>
    .byte $67    ; <ラ>
    .byte $BA    ; <ジ>
    .byte $69    ; <ル>
    .byte con_катсцена_новая_строка
    .byte $14    ; <と>
    .byte $08    ; <く>
    .byte $13    ; <て>
    .byte $2E    ; <ん>
    .byte $1A    ; <は>
    .byte $00
    .byte $33    ; <0>
    .byte $10    ; <た>
    .byte $02    ; <い>
    .byte $36    ; <3>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $28
    .byte $5C    ; <フ>
    .byte $67    ; <ラ>
    .byte $6E    ; <ン>
    .byte $4D    ; <ス>
    .byte $00
    .byte $AA    ; <だ>
    .byte $02    ; <い>
    .byte $CE    ; <ピ>
    .byte $6E    ; <ン>
    .byte $51    ; <チ>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte $19    ; <の>
    .byte $0A    ; <こ>
    .byte $28    ; <り>
    .byte $A6    ; <じ>
    .byte $06    ; <か>
    .byte $2E    ; <ん>
    .byte $1A    ; <は>
    .byte $00
    .byte $01    ; <あ>
    .byte $14    ; <と>
    .byte $2C    ; <わ>
    .byte $A7    ; <ず>
    .byte $06    ; <か>
    .byte $AA    ; <だ>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_затереть_текст
    .byte $E8, $01
    .byte $EE
    .byte $EC, $FF
    .byte con_катсцена_задний_фон, $3B
    .byte $FB, $01, $7A
    .byte $F3, $00
    .byte $F5, $08
    .byte con_катсцена_номер_звука, $26
    .byte $40    ; <「>
    .byte $5C    ; <フ>
    .byte $67    ; <ラ>
    .byte $6E    ; <ン>
    .byte $4D    ; <ス>
    .byte $19    ; <の>
    .byte $0F    ; <そ>
    .byte $0A    ; <こ>
    .byte $AB    ; <ぢ>
    .byte $06    ; <か>
    .byte $27    ; <ら>
    .byte $2D    ; <を>
    .byte $00
    .byte $20    ; <み>
    .byte $0E    ; <せ>
    .byte $13    ; <て>
    .byte $24    ; <や>
    .byte $29    ; <る>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $28
    .byte $02    ; <い>
    .byte $08    ; <く>
    .byte $A9    ; <ぞ>
    .byte $00
    .byte $55    ; <ナ>
    .byte $D1    ; <ポ>
    .byte $6A    ; <レ>
    .byte $45    ; <オ>
    .byte $6E    ; <ン>
    .byte $79    ; <!>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_затереть_текст
    .byte $FB, $01, $7B
    .byte $F7
    .byte $F3, $00
    .byte $F5, $08
    .byte con_катсцена_номер_звука, $26
    .byte $40    ; <「>
    .byte $05    ; <お>
    .byte $03    ; <う>
    .byte $79    ; <!>
    .byte $00
    .byte $CE    ; <ピ>
    .byte $44    ; <エ>
    .byte $7D    ; <ー>
    .byte $69    ; <ル>
    .byte $79    ; <!>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $28
    .byte con_катсцена_затереть_текст
    .byte $FA, $59
    .byte $FB, $01, $83
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_номер_звука, $09
    .byte $F5, $01
    .byte con_катсцена_скорость_текста
    .byte $02    ; <い>
    .byte con_катсцена_вид_окна_текста
    .byte $01    ; <あ>
    .byte $EC, $00
    .byte $AD    ; <で>
    .byte $10    ; <た>
    .byte $79    ; <!>
    .byte con_катсцена_задержка, $14
    .byte $00
    .byte $4D    ; <ス>
    .byte $67    ; <ラ>
    .byte $42    ; <イ>
    .byte $BE    ; <ダ>
    .byte $7D    ; <ー>
    .byte $47    ; <キ>
    .byte $70    ; <ャ>
    .byte $59    ; <ノ>
    .byte $6E    ; <ン>
    .byte $4C    ; <シ>
    .byte $71    ; <ュ>
    .byte $7D    ; <ー>
    .byte $54    ; <ト>
    .byte $79    ; <!>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $3C
    .byte $FA, $40
    .byte $F5, $FF
    .byte con_катсцена_затереть_текст
    .byte $FB, $03, $C0, $7E, $94
    .byte $F3, $00
    .byte con_катсцена_номер_звука, $0B
    .byte $47    ; <キ>
    .byte $7D    ; <ー>
    .byte $CD    ; <パ>
    .byte $7D    ; <ー>
    .byte $00
    .byte $B7    ; <ゲ>
    .byte $69    ; <ル>
    .byte $53    ; <テ>
    .byte $74    ; <ィ>
    .byte $4D    ; <ス>
    .byte $08    ; <く>
    .byte $2E    ; <ん>
    .byte con_катсцена_новая_строка
    .byte $4D    ; <ス>
    .byte $67    ; <ラ>
    .byte $42    ; <イ>
    .byte $BE    ; <ダ>
    .byte con_катсцена_номер_звука, $2A
    .byte $F3, $1E
    .byte $7D    ; <ー>
    .byte $47    ; <キ>
    .byte $70    ; <ャ>
    .byte $59    ; <ノ>
    .byte $6E    ; <ン>
    .byte $2D    ; <を>
    .byte $14    ; <と>
    .byte $22    ; <め>
    .byte $10    ; <た>
    .byte $79    ; <!>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_номер_звука, $01
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задний_фон, $3A
    .byte $FB, $01, $8B
    .byte $F3, $00
    .byte $F5, $04
    .byte con_катсцена_номер_звука, $66
    .byte con_катсцена_скорость_текста
    .byte $06    ; <か>
    .byte $0C    ; <し>
    .byte $01    ; <あ>
    .byte $02    ; <い>
    .byte $0C    ; <し>
    .byte $31    ; <ゅ>
    .byte $03    ; <う>
    .byte $28    ; <り>
    .byte $32    ; <ょ>
    .byte $03    ; <う>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_номер_звука, $62
    .byte $C5    ; <ブ>
    .byte $67    ; <ラ>
    .byte $BA    ; <ジ>
    .byte $69    ; <ル>
    .byte $65    ; <ユ>
    .byte $7D    ; <ー>
    .byte $4D    ; <ス>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_номер_звука, $62
    .byte $09    ; <け>
    .byte $2F    ; <っ>
    .byte $0C    ; <し>
    .byte $32    ; <ょ>
    .byte $03    ; <う>
    .byte $0E    ; <せ>
    .byte $2E    ; <ん>
    .byte $00
    .byte $0C    ; <し>
    .byte $2E    ; <ん>
    .byte $0C    ; <し>
    .byte $31    ; <ゅ>
    .byte $12    ; <つ>
    .byte $AA    ; <だ>
    .byte $79    ; <!>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $F0
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_затереть_текст
    .byte $EE
    .byte $EC, $FF
    .byte con_катсцена_задний_фон, $02
    .byte $FB, $01, $4B
    .byte con_катсцена_осветление_экрана
    .byte con_катсцена_номер_звука, $46
    .byte con_катсцена_скорость_текста
    .byte $08    ; <く>
    .byte $40    ; <「>
    .byte $5C    ; <フ>
    .byte $67    ; <ラ>
    .byte $6E    ; <ン>
    .byte $4D    ; <ス>
    .byte $A0    ; <が>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затереть_текст
    .byte $FA, $10
    .byte $FB, $01, $5D
    .byte $F7
    .byte $F3, $00
    .byte $F5, $04
    .byte con_катсцена_скорость_текста
    .byte $08    ; <く>
    .byte $40    ; <「>
    .byte $1F    ; <ま>
    .byte $7A    ; <、>
    .byte con_катсцена_задержка, $3C
    .byte $1F    ; <ま>
    .byte $09    ; <け>
    .byte $10    ; <た>
    .byte $3F    ; <•>
    .byte $3F    ; <•>
    .byte $3F    ; <•>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $78
    .byte $F5, $FF
    .byte con_катсцена_затереть_текст
    .byte $FA, $02
    .byte $FB, $01, $32
    .byte $F7
    .byte $F3, $00
    .byte $40    ; <「>
    .byte $05    ; <お>
    .byte $2A    ; <れ>
    .byte $10    ; <た>
    .byte $11    ; <ち>
    .byte $A0    ; <が>
    .byte $00
    .byte $01    ; <あ>
    .byte $2A    ; <れ>
    .byte $AA    ; <だ>
    .byte $09    ; <け>
    .byte $00
    .byte $08    ; <く>
    .byte $0E    ; <せ>
    .byte $2E    ; <ん>
    .byte $0C    ; <し>
    .byte $10    ; <た>
    .byte con_катсцена_новая_строка
    .byte $5C    ; <フ>
    .byte $67    ; <ラ>
    .byte $6E    ; <ン>
    .byte $4D    ; <ス>
    .byte $A0    ; <が>
    .byte $7A    ; <、>
    .byte con_катсцена_задержка, $28
    .byte $0A    ; <こ>
    .byte $03    ; <う>
    .byte $23    ; <も>
    .byte $00
    .byte $02    ; <い>
    .byte $2F    ; <っ>
    .byte $CC    ; <ぽ>
    .byte $03    ; <う>
    .byte $13    ; <て>
    .byte $07    ; <き>
    .byte $16    ; <に>
    .byte con_катсцена_закрыть_рот
    .byte $3F    ; <•>
    .byte $3F    ; <•>
    .byte $3F    ; <•>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задний_фон, $5B
    .byte $FB, $01, $4A
    .byte con_катсцена_номер_звука, $69
    .byte con_катсцена_осветление_экрана
    .byte con_катсцена_вид_окна_текста
    .byte $00
    .byte $EC, $00
    .byte $42    ; <イ>
    .byte $50    ; <タ>
    .byte $68    ; <リ>
    .byte $41    ; <ア>
    .byte $3F    ; <•>
    .byte $42    ; <イ>
    .byte $6E    ; <ン>
    .byte $50    ; <タ>
    .byte $7D    ; <ー>
    .byte $60    ; <ミ>
    .byte $67    ; <ラ>
    .byte $6E    ; <ン>
    .byte $19    ; <の>
    .byte $00
    .byte $CF    ; <プ>
    .byte $6B    ; <ロ>
    .byte $87    ; <G>
    .byte $8B    ; <K>
    .byte $AD    ; <で>
    .byte con_катсцена_новая_строка
    .byte $47    ; <キ>
    .byte $7D    ; <ー>
    .byte $CD    ; <パ>
    .byte $7D    ; <ー>
    .byte $5F    ; <マ>
    .byte $4C    ; <シ>
    .byte $6E    ; <ン>
    .byte $19    ; <の>
    .byte $00
    .byte $02    ; <い>
    .byte $20    ; <み>
    .byte $32    ; <ょ>
    .byte $03    ; <う>
    .byte $2D    ; <を>
    .byte $14    ; <と>
    .byte $29    ; <る>
    .byte con_катсцена_новая_строка
    .byte $F4, $03
    .byte $FB, $01, $3A
    .byte con_катсцена_номер_звука, $15
    .byte con_катсцена_закрыть_рот
    .byte $F4, $01
    .byte $B7    ; <ゲ>
    .byte $69    ; <ル>
    .byte $53    ; <テ>
    .byte $74    ; <ィ>
    .byte $4D    ; <ス>
    .byte $08    ; <く>
    .byte $2E    ; <ん>
    .byte $2D    ; <を>
    .byte $08    ; <く>
    .byte $2C    ; <わ>
    .byte $04    ; <え>
    .byte con_катсцена_задержка, $28
    .byte $00
    .byte $C5    ; <ブ>
    .byte $67    ; <ラ>
    .byte $BA    ; <ジ>
    .byte $69    ; <ル>
    .byte $1A    ; <は>
    .byte con_катсцена_новая_строка
    .byte $25    ; <ゆ>
    .byte $03    ; <う>
    .byte $0C    ; <し>
    .byte $32    ; <ょ>
    .byte $03    ; <う>
    .byte $1D    ; <へ>
    .byte $00
    .byte $1B    ; <ひ>
    .byte $10    ; <た>
    .byte $1A    ; <は>
    .byte $0C    ; <し>
    .byte $28    ; <り>
    .byte $1F    ; <ま>
    .byte $0D    ; <す>
    .byte $7B    ; <。>
    .byte con_катсцена_мячик
    .byte $0A    ; <こ>
    .byte $19    ; <の>
    .byte $01    ; <あ>
    .byte $14    ; <と>
    .byte $00
    .byte $AA    ; <だ>
    .byte $02    ; <い>
    .byte $35    ; <2>
    .byte $0C    ; <し>
    .byte $01    ; <あ>
    .byte $02    ; <い>
    .byte $1A    ; <は>
    .byte con_катсцена_новая_строка
    .byte $16    ; <に>
    .byte $1E    ; <ほ>
    .byte $2E    ; <ん>
    .byte $00
    .byte $91    ; <V>
    .byte $8F    ; <S>
    .byte $00
    .byte $56    ; <ニ>
    .byte $4C    ; <シ>
    .byte $C2    ; <ド>
    .byte $42    ; <イ>
    .byte $52    ; <ツ>
    .byte $A0    ; <が>
    .byte con_катсцена_новая_строка
    .byte $47    ; <キ>
    .byte $6F    ; <ッ>
    .byte $48    ; <ク>
    .byte $45    ; <オ>
    .byte $5C    ; <フ>
    .byte $AD    ; <で>
    .byte $0D    ; <す>
    .byte $7B    ; <。>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_номер_звука, $31
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_выход



off_BDD6_1E_цубаса_и_шнайдер_перед_матчем:
    .byte $E8, $01
    .byte con_катсцена_задний_фон, $11
    .byte $FA, $10
    .byte $FB, $01, $21
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_номер_звука, $69
    .byte con_катсцена_осветление_экрана
    .byte $F5, $04
    .byte con_катсцена_номер_звука, $53
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_закрыть_рот
    .byte $40    ; <「>
    .byte $12    ; <つ>
    .byte $AF    ; <ば>
    .byte $0B    ; <さ>
    .byte $7A    ; <、>
    .byte con_катсцена_задержка, $28
    .byte $3E    ; <Jr>
    .byte $65    ; <ユ>
    .byte $7D    ; <ー>
    .byte $4D    ; <ス>
    .byte $19    ; <の>
    .byte $00
    .byte $06    ; <か>
    .byte $28    ; <り>
    .byte $1A    ; <は>
    .byte con_катсцена_новая_строка
    .byte $0A    ; <こ>
    .byte $0A    ; <こ>
    .byte $AD    ; <で>
    .byte $00
    .byte $06    ; <か>
    .byte $04    ; <え>
    .byte $0B    ; <さ>
    .byte $0E    ; <せ>
    .byte $13    ; <て>
    .byte $23    ; <も>
    .byte $27    ; <ら>
    .byte $03    ; <う>
    .byte $A8    ; <ぜ>
    .byte $7B    ; <。>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затереть_текст
    .byte $FB, $01, $6A
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_задержка, $50
    .byte $40    ; <「>
    .byte $01    ; <あ>
    .byte $0D    ; <す>
    .byte con_катсцена_задержка, $28
    .byte $00
    .byte $C5    ; <ブ>
    .byte $67    ; <ラ>
    .byte $BA    ; <ジ>
    .byte $69    ; <ル>
    .byte $14    ; <と>
    .byte $10    ; <た>
    .byte $10    ; <た>
    .byte $06    ; <か>
    .byte $03    ; <う>
    .byte $10    ; <た>
    .byte $22    ; <め>
    .byte $16    ; <に>
    .byte $23    ; <も>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $28
    .byte $0A    ; <こ>
    .byte $19    ; <の>
    .byte $0C    ; <し>
    .byte $01    ; <あ>
    .byte $02    ; <い>
    .byte $7A    ; <、>
    .byte con_катсцена_задержка, $28
    .byte $56    ; <ニ>
    .byte $4C    ; <シ>
    .byte $C2    ; <ド>
    .byte $42    ; <イ>
    .byte $52    ; <ツ>
    .byte $65    ; <ユ>
    .byte $7D    ; <ー>
    .byte $4D    ; <ス>
    .byte $2D    ; <を>
    .byte con_катсцена_новая_строка
    .byte $06    ; <か>
    .byte $15    ; <な>
    .byte $27    ; <ら>
    .byte $A7    ; <ず>
    .byte $10    ; <た>
    .byte $05    ; <お>
    .byte $0D    ; <す>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_номер_звука, $31
    .byte con_катсцена_задержка, $78
    .byte $F5, $FF
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_выход



off_BE49_1F_перед_матчем_с_бразилией:
    .byte $E8, $01
    .byte con_катсцена_задний_фон, $02
    .byte $FB, $01, $0A
    .byte con_катсцена_номер_звука, $01
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_номер_звука, $69
    .byte con_катсцена_осветление_экрана
    .byte con_катсцена_номер_звука, $49
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_закрыть_рот
    .byte $40    ; <「>
    .byte $12    ; <つ>
    .byte $02    ; <い>
    .byte $16    ; <に>
    .byte $07    ; <き>
    .byte $10    ; <た>
    .byte $15    ; <な>
    .byte con_катсцена_задержка, $28
    .byte $00
    .byte $12    ; <つ>
    .byte $AF    ; <ば>
    .byte $0B    ; <さ>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte $FA, $11
    .byte $FB, $01, $16
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_скорость_текста
    .byte $00
    .byte $40    ; <「>
    .byte $79    ; <!>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte $F5, $08
    .byte con_катсцена_задержка, $14
    .byte $F5, $04
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_задний_фон, $2A
    .byte $FB, $01, $B5
    .byte con_катсцена_осветление_экрана
    .byte $F5, $04
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_задержка, $F0
    .byte con_катсцена_задержка, $F0
    .byte con_катсцена_скорость_текста
    .byte $08    ; <く>
    .byte $40    ; <「>
    .byte $46    ; <カ>
    .byte $69    ; <ル>
    .byte $6B    ; <ロ>
    .byte $4D    ; <ス>
    .byte $7A    ; <、>
    .byte con_катсцена_задержка, $28
    .byte $24    ; <や>
    .byte $08    ; <く>
    .byte $0F    ; <そ>
    .byte $08    ; <く>
    .byte $AE    ; <ど>
    .byte $03    ; <う>
    .byte $28    ; <り>
    .byte con_катсцена_новая_строка
    .byte $23    ; <も>
    .byte $AE    ; <ど>
    .byte $2F    ; <っ>
    .byte $13    ; <て>
    .byte $07    ; <き>
    .byte $10    ; <た>
    .byte $A9    ; <ぞ>
    .byte $3F    ; <•>
    .byte $3F    ; <•>
    .byte $3F    ; <•>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $F0
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_номер_звука, $31
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_номер_звука, $01
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_затереть_текст
    .byte $EE
    .byte con_катсцена_задний_фон, $28
    .byte con_катсцена_осветление_экрана
    .byte $F0
    .byte $89    ; <I>
    .byte $21    ; <む>
    .byte $0F    ; <そ>
    .byte $0C    ; <し>
    .byte $13    ; <て>
    .byte $00
    .byte $09    ; <け>
    .byte $2F    ; <っ>
    .byte $0E    ; <せ>
    .byte $2E    ; <ん>
    .byte $19    ; <の>
    .byte $14    ; <と>
    .byte $07    ; <き>
    .byte $A0    ; <が>
    .byte $00
    .byte $07    ; <き>
    .byte $10    ; <た>
    .byte $3F    ; <•>
    .byte $3F    ; <•>
    .byte $3F    ; <•>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_номер_звука, $4C
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задний_фон, $2B
    .byte $FA, $11
    .byte con_катсцена_номер_звука, $69
    .byte con_катсцена_осветление_экрана
    .byte $F5, $04
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_вид_окна_текста
    .byte $00
    .byte $EC, $05
    .byte $F0
    .byte $49    ; <ケ>
    .byte $22    ; <め>
    .byte $0B    ; <さ>
    .byte $73    ; <ヮ>
    .byte $00
    .byte $12    ; <つ>
    .byte $02    ; <い>
    .byte $16    ; <に>
    .byte $07    ; <き>
    .byte $1F    ; <ま>
    .byte $0C    ; <し>
    .byte $10    ; <た>
    .byte con_катсцена_новая_строка
    .byte $5C    ; <フ>
    .byte $74    ; <ィ>
    .byte $55    ; <ナ>
    .byte $7D    ; <ー>
    .byte $6A    ; <レ>
    .byte $2D    ; <を>
    .byte $06    ; <か>
    .byte $A5    ; <ざ>
    .byte $29    ; <る>
    .byte $00
    .byte $09    ; <け>
    .byte $2F    ; <っ>
    .byte $0C    ; <し>
    .byte $32    ; <ょ>
    .byte $03    ; <う>
    .byte $0E    ; <せ>
    .byte $2E    ; <ん>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $28
    .byte $28    ; <り>
    .byte $32    ; <ょ>
    .byte $03    ; <う>
    .byte $51    ; <チ>
    .byte $7D    ; <ー>
    .byte $61    ; <ム>
    .byte $7A    ; <、>
    .byte $C6    ; <ベ>
    .byte $6E    ; <ン>
    .byte $51    ; <チ>
    .byte $AD    ; <で>
    .byte $00
    .byte $0B    ; <さ>
    .byte $02    ; <い>
    .byte $A4    ; <ご>
    .byte $19    ; <の>
    .byte con_катсцена_новая_строка
    .byte $60    ; <ミ>
    .byte $7D    ; <ー>
    .byte $53    ; <テ>
    .byte $74    ; <ィ>
    .byte $6E    ; <ン>
    .byte $B6    ; <グ>
    .byte $16    ; <に>
    .byte $00
    .byte $1A    ; <は>
    .byte $02    ; <い>
    .byte $2F    ; <っ>
    .byte $13    ; <て>
    .byte $02    ; <い>
    .byte $1F    ; <ま>
    .byte $0D    ; <す>
    .byte $7B    ; <。>
    .byte con_катсцена_мячик
    .byte con_катсцена_номер_звука, $62
    .byte $FB, $01, $63
    .byte $F7
    .byte $F3, $FF, $00, $0F
    .byte $FA, $10
    .byte con_катсцена_закрыть_рот
    .byte $09    ; <け>
    .byte $2F    ; <っ>
    .byte $0C    ; <し>
    .byte $32    ; <ょ>
    .byte $03    ; <う>
    .byte $19    ; <の>
    .byte $46    ; <カ>
    .byte $7D    ; <ー>
    .byte $C2    ; <ド>
    .byte $1A    ; <は>
    .byte $00
    .byte $0A    ; <こ>
    .byte $2E    ; <ん>
    .byte $06    ; <か>
    .byte $02    ; <い>
    .byte con_катсцена_новая_строка
    .byte $25    ; <ゆ>
    .byte $03    ; <う>
    .byte $0C    ; <し>
    .byte $32    ; <ょ>
    .byte $03    ; <う>
    .byte $0A    ; <こ>
    .byte $03    ; <う>
    .byte $1E    ; <ほ>
    .byte $00
    .byte $55    ; <ナ>
    .byte $6E    ; <ン>
    .byte $C3    ; <バ>
    .byte $7D    ; <ー>
    .byte $6C    ; <ワ>
    .byte $6E    ; <ン>
    .byte con_катсцена_новая_строка
    .byte $C5    ; <ブ>
    .byte $67    ; <ラ>
    .byte $BA    ; <ジ>
    .byte $69    ; <ル>
    .byte $65    ; <ユ>
    .byte $7D    ; <ー>
    .byte $4D    ; <ス>
    .byte $14    ; <と>
    .byte con_катсцена_мячик
    .byte con_катсцена_номер_звука, $62
    .byte $FB, $01, $67
    .byte $F7
    .byte $F3, $00
    .byte $A3    ; <げ>
    .byte $07    ; <き>
    .byte $0E    ; <せ>
    .byte $2E    ; <ん>
    .byte $B6    ; <グ>
    .byte $69    ; <ル>
    .byte $7D    ; <ー>
    .byte $CF    ; <プ>
    .byte $16    ; <に>
    .byte $00
    .byte $1A    ; <は>
    .byte $02    ; <い>
    .byte $28    ; <り>
    .byte $15    ; <な>
    .byte $A0    ; <が>
    .byte $27    ; <ら>
    .byte $23    ; <も>
    .byte con_катсцена_новая_строка
    .byte $51    ; <チ>
    .byte $7D    ; <ー>
    .byte $61    ; <ム>
    .byte $6C    ; <ワ>
    .byte $7D    ; <ー>
    .byte $48    ; <ク>
    .byte $AD    ; <で>
    .byte $00
    .byte $06    ; <か>
    .byte $11    ; <ち>
    .byte $17    ; <ぬ>
    .byte $02    ; <い>
    .byte $13    ; <て>
    .byte $07    ; <き>
    .byte $10    ; <た>
    .byte con_катсцена_новая_строка
    .byte $A8    ; <ぜ>
    .byte $2E    ; <ん>
    .byte $16    ; <に>
    .byte $1E    ; <ほ>
    .byte $2E    ; <ん>
    .byte $65    ; <ユ>
    .byte $7D    ; <ー>
    .byte $4D    ; <ス>
    .byte $14    ; <と>
    .byte $19    ; <の>
    .byte $00
    .byte $01    ; <あ>
    .byte $02    ; <い>
    .byte $AA    ; <だ>
    .byte $AD    ; <で>
    .byte con_катсцена_новая_строка
    .byte $05    ; <お>
    .byte $0A    ; <こ>
    .byte $15    ; <な>
    .byte $2C    ; <わ>
    .byte $2A    ; <れ>
    .byte $1F    ; <ま>
    .byte $0D    ; <す>
    .byte $7B    ; <。>
    .byte con_катсцена_мячик
    .byte $F5, $FF
    .byte $FA, $43
    .byte $FB, $01, $B1
    .byte $F7
    .byte $F3, $00
    .byte $1A    ; <は>
    .byte $10    ; <た>
    .byte $0C    ; <し>
    .byte $13    ; <て>
    .byte $00
    .byte $0C    ; <し>
    .byte $32    ; <ょ>
    .byte $03    ; <う>
    .byte $28    ; <り>
    .byte $19    ; <の>
    .byte $22    ; <め>
    .byte $A0    ; <が>
    .byte $20    ; <み>
    .byte $1A    ; <は>
    .byte con_катсцена_новая_строка
    .byte $AE    ; <ど>
    .byte $11    ; <ち>
    .byte $27    ; <ら>
    .byte $16    ; <に>
    .byte $00
    .byte $1E    ; <ほ>
    .byte $1E    ; <ほ>
    .byte $04    ; <え>
    .byte $21    ; <む>
    .byte $19    ; <の>
    .byte $06    ; <か>
    .byte $78    ; <?>
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $28
    .byte $03    ; <う>
    .byte $2E    ; <ん>
    .byte $22    ; <め>
    .byte $02    ; <い>
    .byte $19    ; <の>
    .byte $47    ; <キ>
    .byte $6F    ; <ッ>
    .byte $48    ; <ク>
    .byte $45    ; <オ>
    .byte $5C    ; <フ>
    .byte $1F    ; <ま>
    .byte $AD    ; <で>
    .byte $00
    .byte $01    ; <あ>
    .byte $14    ; <と>
    .byte $38    ; <5>
    .byte $1C    ; <ふ>
    .byte $2E    ; <ん>
    .byte $79    ; <!>
    .byte con_катсцена_новая_строка
; скрытая катсцена
    .byte $F4, $06, $04
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_выход
