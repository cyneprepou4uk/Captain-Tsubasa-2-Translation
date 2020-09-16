.segment "BANK_27"
.include "copy_bank_ram.inc"
; данные катсцен
; поинтеры в 0x000485

    .word off_AE6D_07_цубаса_и_карлос_перед_матчем
    .word off_AEEA_08_цубаса_победил_карлоса
    .word $0000     ; раньше это была катсцена 09, вторая часть 08
    .word off_B327_0A_мисуги_во_втором_тайме
    .word off_B3EE_0B_мисуги_после_матча
    .word off_B506_0C_мацуяма_перед_матчем
    .word off_B590_0D_мацуяма_после_матча
    .word off_B6C8_0E_мисаки_и_хюга_перед_матчем





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
    .byte con_катсцена_комментатор, $00
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
    .byte con_катсцена_задержка, $78
    .byte $E8, $01
    .byte con_катсцена_задний_фон, $2B
    .byte $FA, $10
    .byte $FB, $01, $43
    .byte con_катсцена_номер_звука, $69
    .byte con_катсцена_осветление_экрана
    .byte $F5, $04
    .byte con_катсцена_номер_звука, $4D
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_вид_окна_текста, $00
    .byte con_катсцена_комментатор, $02
    .byte con_катсцена_смещение_текста, $09
    .text "Sao Paulo has beaten"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "Flamengo,"
    .byte con_катсцена_задержка, $14
    .text " and have"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "against all odds,"
    .byte con_катсцена_задержка, $0F
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "won the Rio Cup!"
; скрытая катсцена
    .byte $F4, $06, $03
    .byte con_катсцена_номер_звука, $62
    .byte con_катсцена_комментатор, $FF
    .byte $EE
    .byte $FB, $01, $2A
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_задержка, $1E
    .byte $FB, $01, $2B
    .byte con_катсцена_смещение_текста, $0A
    .text "@We did it!@"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    
    
    
    .byte $FA, $11
    .byte $FB, $01, $3B
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_закрыть_рот
    .byte con_катсцена_смещение_текста, $04
    .text "(Excellent job,"
    .byte con_катсцена_задержка, $14
    .text " Tsubasa."
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "You've lead your team"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "to this victory,"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte con_катсцена_смещение_текста, $05
    .text "and proven that you're"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "the equal to any of"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "this country's aces.)"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $3C
    
    
    
    .byte $FB, $01, $3C
    .byte con_катсцена_закрыть_рот
    .byte con_катсцена_задержка, $0A
    .byte con_катсцена_смещение_текста, $04
    .text "(But if you truly want"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "your name to be known,"
    .byte con_катсцена_задержка, $1E
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "you can't be satisfied"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "with just this.)"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte con_катсцена_смещение_текста, $05
    .text "(The entire world is"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "waiting,"
    .byte con_катсцена_задержка, $14
    .text " filled with"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "strong competitors.)"
    .byte con_катсцена_задержка, $50
    
    
    
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задний_фон, $0F
    .byte $FB, $01, $0C
    .byte con_катсцена_осветление_экрана
    .byte con_катсцена_номер_звука, $62
    .byte con_катсцена_задержка, $1E
    .byte con_катсцена_смещение_текста, $02
    .text "@We really did it,"
    .byte con_катсцена_задержка, $0F
    .text " Tsubasa!@"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $1E
    .byte con_катсцена_скорость_текста, $02
    .byte con_катсцена_смещение_текста, $0A
    .text "@Yahoo~~~!!@"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_скорость_текста, $04
    .byte con_катсцена_смещение_текста, $02
    .text "@You were all magnificent"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $03
    .text "out there!@"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $3C
    
    
    
    .byte con_катсцена_скорость_текста, $02
    .byte con_катсцена_смещение_текста, $0F
    .text "@Tsubasa!@"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_задержка, $1E
    .byte con_катсцена_затереть_текст
    
    
    
    .byte $FA, $10
    .byte $FB, $01, $13
    .byte $F7
    .byte $F3, $00
    .byte $F5, $04
    .byte con_катсцена_задержка, $14
    .byte con_катсцена_скорость_текста, $02
    .byte con_катсцена_смещение_текста, $08
    .text "@Huh?@"
    .byte con_катсцена_задержка, $28
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $14
    
    
    
    .byte $FB, $01, $4E
    .byte con_катсцена_задержка, $14
    .byte $FB, $01, $12
    .byte con_катсцена_скорость_текста, $02
    .byte con_катсцена_смещение_текста, $07
    .text "@Oh", $3A, $3B
    .byte $FA, $11
    
    
    
    .byte $FB, $01, $15
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_скорость_текста, $04
    .text "Carlos"
    .byte con_катсцена_скорость_текста, $08
    .text "..."
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_новая_строка
    .byte con_катсцена_скорость_текста, $04
    .byte con_катсцена_смещение_текста, $08
    .text "Good match.@"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte $FB, $01, $63
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_смещение_текста, $05
    .text "@It was."
    .byte con_катсцена_задержка, $3C
    .text " This is the"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "first time I've lost"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "the Rio Cup final,"
    .byte con_катсцена_задержка, $0F
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "you know.@"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte con_катсцена_смещение_текста, $03
    .text "@Congratulations -"
    .byte con_катсцена_задержка, $1E
    .text " if I"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $04
    .text "had to lose,"
    .byte con_катсцена_задержка, $14
    .text " I'm glad I"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $04
    .text "did to one of Roberto"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $04
    .text "Hongo's pupils.@"
    .byte con_катсцена_задержка, $50
    
    
    
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
    .byte con_катсцена_задержка, $14
    .byte con_катсцена_смещение_текста, $03
    .text "@Thanks,"
    .byte con_катсцена_задержка, $0F
    .text " Carlos."
    .byte con_катсцена_задержка, $14
    .text " He's the"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $04
    .text "reason I'm here at all.@"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte $FB, $01, $63
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_задержка, $1E
    .byte con_катсцена_смещение_текста, $04
    .text "@Hey."
    .byte con_катсцена_задержка, $1E
    .text " We'll meet again,"
    .byte con_катсцена_задержка, $14
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "you and I,"
    .byte con_катсцена_задержка, $14
    .text " in the pro"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "leagues."
    .byte con_катсцена_задержка, $1E
    .text " But when that"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "happens,"
    .byte con_катсцена_задержка, $1E
    .byte con_катсцена_скорость_текста, $08
    .text " I'LL "
    .byte con_катсцена_скорость_текста, $04
    .text "win.@"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte $FB, $01, $4E
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_задержка, $14
    .byte con_катсцена_смещение_текста, $06
    .text "@I'm looking"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $07
    .text "forward to it.@"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $3C
    
    
    
    .byte con_катсцена_закрыть_рот
    .byte con_катсцена_скорость_текста, $02
    .byte con_катсцена_смещение_текста, $06
    .text "@Tsubasa!"
    .byte con_катсцена_задержка, $14
    .byte $FB, $01, $12
    .byte con_катсцена_задержка, $14
    .byte con_катсцена_новая_строка
    .byte con_катсцена_скорость_текста, $04
    .byte con_катсцена_смещение_текста, $07
    .text "We need to talk!@"
    .byte con_катсцена_задержка, $1E
    .byte con_катсцена_номер_звука, $01
    
    
    
    
    .byte con_катсцена_задержка, $3C
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
    .byte con_катсцена_закрыть_рот
    .byte con_катсцена_смещение_текста, $05
    .text "@Mister Katagiri,"
    .byte con_катсцена_задержка, $14
    .text " what"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "are you doing here?!@"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte $F3, $FF, $24, $42
    .byte con_катсцена_задержка, $06
    .byte $F3, $FF, $23, $41
    .byte $F4, $05
    .byte con_катсцена_номер_звука, $53
    .byte con_катсцена_задержка, $3C
    
    
    
    .byte $F4, $04
    .byte con_катсцена_скорость_текста, $03
    .byte con_катсцена_смещение_текста, $03
    .text "Having brought victory to"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $03
    .text "Sao Paulo in the Rio Cup,"
    .byte con_катсцена_мячик
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte con_катсцена_смещение_текста, $04
    .text "Tsubasa's journey towards"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "becoming a pro takes"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "another step forward."
    .byte con_катсцена_мячик
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte con_катсцена_смещение_текста, $03
    .text "But a face from the past,"
    .byte con_катсцена_задержка, $1E
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $03
    .text "Munemasa Katagiri,"
    .byte con_катсцена_задержка, $1E
    .text " brings"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "sudden word from home."
    .byte con_катсцена_мячик
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $3C
    
    
    
    .byte con_катсцена_скорость_текста, $06
    .byte con_катсцена_смещение_текста, $09
    .text "One week ago,"
    .byte con_катсцена_задержка, $14
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $08
    .text "back in Japan"
    .byte con_катсцена_скорость_текста, $08
    .text "..."
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_номер_звука, $31
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_номер_звука, $01
    
    
    
    .byte $E8, $01
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_номер_звука, $69
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_задний_фон, $0C
    .byte $FB, $01, $43
    .byte con_катсцена_осветление_экрана
    .byte $F5, $04
    .byte con_катсцена_номер_звука, $51
    .byte con_катсцена_задержка, $3C
    
    
    
    .byte con_катсцена_вид_окна_текста, $00
    .byte con_катсцена_комментатор, $00
    .byte con_катсцена_скорость_текста, $04
    .byte con_катсцена_смещение_текста, $09
    .text "The high schools"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "Nankatsu and Toho"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "have dominated the"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "National Football"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_частично_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte con_катсцена_смещение_текста, $09
    .text "Tournament for the"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "past two years,"
    .byte con_катсцена_задержка, $14
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "and they seem fated"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "to meet once again."
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_частично_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte con_катсцена_смещение_текста, $09
    .text "The time has come"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "for the High School"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "Nationals to begin!"
    .byte $FA, $11
    .byte con_катсцена_мячик
    .byte con_катсцена_частично_затереть_текст
    
    
    
    .byte con_катсцена_номер_звука, $62
    .byte $FB, $01, $49
    .byte $F7
    .byte $F3, $00
    .byte $FA, $10
    .byte con_катсцена_смещение_текста, $09
    .text "Toho,"
    .byte con_катсцена_задержка, $0F
    .text " led by captain"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "Hyuga,"
    .byte con_катсцена_задержка, $0F
    .text " won the"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "tournament two"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "years ago."
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_частично_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte con_катсцена_смещение_текста, $09
    .text "They are huge"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "favorites to claim"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "the title as"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "champions again."
    .byte con_катсцена_мячик
    .byte con_катсцена_частично_затереть_текст
    
    
    
    .byte con_катсцена_номер_звука, $62
    .byte $FB, $01, $1E
    .byte $F7
    .byte $F3, $00
    .byte $FA, $2B
    .byte con_катсцена_смещение_текста, $09
    .text "But having won the"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "previous year,"
    .byte con_катсцена_задержка, $0F
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "Nankatsu,"
    .byte con_катсцена_задержка, $14
    .text " led by"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "captain Misaki,"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_частично_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte con_катсцена_смещение_текста, $09
    .text "are ready to lay"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "down a fierce"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "challenge for a"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "second title."
    .byte con_катсцена_мячик
    .byte con_катсцена_частично_затереть_текст
    
    
    
    .byte $FB, $01, $43
    .byte $F7
    .byte con_катсцена_комментатор, $05
    .byte con_катсцена_номер_звука, $62
    .byte con_катсцена_смещение_текста, $09
    .text "The stage is all set"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "for an intense"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "showdown here at"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "the National Stadium!"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_частично_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte con_катсцена_смещение_текста, $09
    .text "The battle for the"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "pennant and glory"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "is about to begin!"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_номер_звука, $31
    .byte con_катсцена_задержка, $50
    
    
    
    .byte $F5, $FF
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_номер_звука, $01
    .byte con_катсцена_выход




.export off_0x040005_скрытая_катсцена_из_08
off_0x040005_скрытая_катсцена_из_08:
    .byte con_катсцена_частично_затереть_текст
    .byte con_катсцена_номер_звука, $01
    .byte con_катсцена_задержка, $78
    .byte $E8, $01
    .byte con_катсцена_номер_звука, $43
    .byte con_катсцена_комментатор, $01
    .byte con_катсцена_скорость_текста, $01
    .byte con_катсцена_смещение_текста, $09
    .text "Huh?"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_новая_строка
    .byte con_катсцена_скорость_текста, $04
    .byte con_катсцена_смещение_текста, $09
    .text "Why'd the music stop?"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_частично_затереть_текст
    .byte con_катсцена_задержка, $50
    
    
    
    .byte $FB, $01, $C2
    .byte $F3, $00
    .byte con_катсцена_номер_звука, $27
    .byte con_катсцена_комментатор, $05
    .byte con_катсцена_задержка, $1E
    .byte con_катсцена_скорость_текста, $06
    .byte con_катсцена_смещение_текста, $09
; доп пробел в конце чтобы комментатор закончил с открытым ртом
    .text "Oh my goodness! "
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_номер_звука, $62
    .byte con_катсцена_номер_звука, $3C
    .byte con_катсцена_частично_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte con_катсцена_комментатор, $04
    .byte con_катсцена_скорость_текста, $04
    .byte con_катсцена_смещение_текста, $09
    .text "Running onto the"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "field is the star"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "of the hit game,"
    .byte con_катсцена_задержка, $0F
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "Mighty Bomb Jack!"
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_частично_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte con_катсцена_комментатор, $02
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
    .byte con_катсцена_задержка, $0A
    
    
    
    
    .byte con_катсцена_смещение_текста, $09
    .text "shouting @Banzai@"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "again and again!"
    .byte con_катсцена_мячик
    .byte con_катсцена_номер_звука, $62
    .byte con_катсцена_частично_затереть_текст
    .byte $FB, $01, $C3
    .byte con_катсцена_задержка, $50
    
    
    
    .byte con_катсцена_комментатор, $04
    .byte con_катсцена_смещение_текста, $09
    .text "Thank you and"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "farewell,"
    .byte con_катсцена_задержка, $0F
    .text " mister"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "Jack!"
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_комментатор, $02
    .text " Let's meet"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "again somewhere!"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_частично_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte con_катсцена_смещение_текста, $09
    .text "Now,"
    .byte con_катсцена_задержка, $1E
    .text " back to our"
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






off_B327_0A_мисуги_во_втором_тайме:
    .byte $E8, $01
    .byte con_катсцена_номер_звука, $01
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_номер_звука, $69
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_задний_фон, $19
    .byte $FB, $01, $18
    .byte con_катсцена_осветление_экрана
    .byte con_катсцена_номер_звука, $53
    .byte $F5, $04
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_вид_окна_текста, $00
    .byte con_катсцена_комментатор, $05
    .byte con_катсцена_смещение_текста, $09
    .text "Musashi's finally"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "decided to play"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "Misugi in the"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "second half!"
    .byte con_катсцена_задержка, $50
    .byte $FA, $30
    .byte $F5, $FF
    .byte con_катсцена_комментатор, $FF
    
    
    
    .byte $EE
    .byte $FB, $01, $2E
    .byte $F7
    .byte $F3, $00
    .byte $FA, $11
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_смещение_текста, $02
    .text "Yayoi: "
    .byte con_катсцена_задержка, $0F
    .text "(Dear God,"
    .byte con_катсцена_задержка, $1E
    .text " please"
    .byte con_катсцена_скорость_текста, $08
    .text "..."
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_новая_строка
    .byte con_катсцена_скорость_текста, $04
    .byte con_катсцена_смещение_текста, $0A
    .text "don't let Jun push"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $0A
    .text "himself too far"
    .byte con_катсцена_скорость_текста, $08
    .text "...)"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte $FB, $01, $20
    .byte $F7
    .byte $F3, $00
    .byte $F5, $04
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_закрыть_рот
    .byte con_катсцена_скорость_текста, $04
    .byte con_катсцена_смещение_текста, $06
    .text "(I'm finally back on"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $07
    .text "the field again"
    .byte con_катсцена_скорость_текста, $08
    .text "...)"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $1E
    
    
    
    .byte con_катсцена_скорость_текста, $04
    .byte con_катсцена_смещение_текста, $04
    .text "(Misaki,"
    .byte con_катсцена_задержка, $0F
    .text " everyone -"
    .byte con_катсцена_задержка, $1E
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "you've shown your stuff."
    .byte con_катсцена_задержка, $0F
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "Now it's my turn!)"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_номер_звука, $31
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_выход






off_B3EE_0B_мисуги_после_матча:
    .byte $E8, $01
    .byte con_катсцена_задний_фон, $10
    .byte $FA, $11
    .byte $FB, $01, $1B
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_осветление_экрана
    .byte con_катсцена_номер_звука, $47
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_смещение_текста, $06
    .text "@But Misugi,"
    .byte con_катсцена_задержка, $1E
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $07
    .text "your condition"
    .byte con_катсцена_закрыть_рот
    .byte con_катсцена_скорость_текста, $08
    .text "...@"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte $FB, $01, $20
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_скорость_текста, $04
    .byte con_катсцена_смещение_текста, $05
    .text "@You mean my heart,"
    .byte con_катсцена_задержка, $1E
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "Misaki."
    .byte con_катсцена_задержка, $3C
    .text " I won't hide"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "it from you,"
    .byte con_катсцена_задержка, $14
    .text " it's in"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "a bad shape.@"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte con_катсцена_смещение_текста, $05
    .text "@But as I play,"
    .byte con_катсцена_задержка, $1E
    .text " little"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "by little,"
    .byte con_катсцена_задержка, $1E
    .text " it's"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "getting stronger.@"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $3C
    
    
    
    .byte con_катсцена_смещение_текста, $05
    .text "@Even if it's only for"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "a minute or two,"
    .byte con_катсцена_задержка, $14
    .text " I'm"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "not coming off this"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "pitch yet.@"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte con_катсцена_смещение_текста, $05
    .text "@And someday"
    .byte con_катсцена_закрыть_рот
    .byte con_катсцена_скорость_текста, $08
    .text "..."
    .byte con_катсцена_закрыть_рот
    .byte con_катсцена_задержка, $1E
    .byte con_катсцена_скорость_текста, $04
    .text "I"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "will beat this heart"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "disease."
    .byte con_катсцена_задержка, $1E
    .text " Because"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "football is my life.@"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte $FB, $01, $19
    .byte $F7
    .byte $F3, $00
    .byte $FA, $30
    .byte con_катсцена_задержка, $1E
    .byte con_катсцена_смещение_текста, $04
    .text "@You can do it,"
    .byte con_катсцена_задержка, $0F
    .text " Misugi.@"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte $FB, $01, $2E
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_смещение_текста, $08
    .text "(Jun,"
    .byte con_катсцена_задержка, $1E
    .text " be safe"
    .byte con_катсцена_скорость_текста, $08
    .text "...)"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_номер_звука, $31
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_выход






off_B506_0C_мацуяма_перед_матчем:
    .byte $E8, $01
    .byte con_катсцена_задний_фон, $11
    .byte $FA, $10
    .byte $FB, $01, $1D
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_осветление_экрана
    .byte con_катсцена_номер_звука, $53
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_смещение_текста, $04
    .text "@Misaki,"
    .byte con_катсцена_задержка, $14
    .text " we're the ones"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "going on to the final,"
    .byte con_катсцена_задержка, $0F
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "you hear?@"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte $FB, $01, $1B
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_задержка, $1E
    .byte con_катсцена_смещение_текста, $04
    .text "@We've come too far to"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "stop now,"
    .byte con_катсцена_задержка, $14
    .text " Matsuyama!@"
    .byte con_катсцена_задержка, $50
    
    
    
    .byte $FA, $30
    .byte con_катсцена_затереть_текст
    .byte $FB, $01, $2F
    .byte $F7
    .byte $F3, $00
    .byte $FA, $10
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_смещение_текста, $03
    .text "(Matsuyama,"
    .byte con_катсцена_задержка, $1E
    .text " good luck"
    .byte con_катсцена_скорость_текста, $08
    .text "...)"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte $FB, $01, $1C
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_закрыть_рот
    .byte con_катсцена_скорость_текста, $06
    .byte con_катсцена_смещение_текста, $05
    .text "(Fujisawa,"
    .byte con_катсцена_задержка, $1E
    .text " watch me"
    .byte con_катсцена_скорость_текста, $08
    .text "..."
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_новая_строка
    .byte con_катсцена_скорость_текста, $04
    .byte con_катсцена_смещение_текста, $06
    .text "this one's for you.)"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_номер_звука, $31
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_выход






off_B590_0D_мацуяма_после_матча:
    .byte $E8, $01
    .byte con_катсцена_задний_фон, $11
    .byte $FA, $10
    .byte $FB, $01, $1D
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_осветление_экрана
    .byte con_катсцена_номер_звука, $47
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_смещение_текста, $04
    .text "@It looks like Nankatsu"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "was the better team"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "after all."
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "Good game,"
    .byte con_катсцена_задержка, $14
    .text " Misaki.@"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte $FB, $01, $19
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_задержка, $1E
    .byte con_катсцена_смещение_текста, $04
    .text "@Good game,"
    .byte con_катсцена_задержка, $14
    .text " Matsuyama.@"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte $FB, $01, $1D
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_смещение_текста, $03
    .text "@I'm glad we could face"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $04
    .text "off like this."
    .byte con_катсцена_задержка, $3C
    .text " Do me"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $04
    .text "a favor and win"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $04
    .text "tomorrow's final,"
    .byte con_катсцена_задержка, $0F
    .text " yeah?@"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte $FB, $01, $19
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_задержка, $1E
    .byte con_катсцена_смещение_текста, $06
    .text "@Sure thing.@"
    .byte con_катсцена_номер_звука, $31
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $1E
    
    
    
    .byte con_катсцена_номер_звука, $37
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_задний_фон, $0C
    .byte con_катсцена_номер_звука, $69
    .byte con_катсцена_осветление_экрана
    .byte $F5, $04
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_вид_окна_текста, $00
    .byte con_катсцена_комментатор, $00
    .byte con_катсцена_смещение_текста, $09
    .text "At last we've reached"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "the final,"
    .byte con_катсцена_задержка, $14
    .text " where"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "Nankatsu and Toho"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "stand face-"
    .byte con_катсцена_задержка, $08
    .text "to-"
    .byte con_катсцена_задержка, $08
    .text "face"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_частично_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte con_катсцена_смещение_текста, $09
    .text "for the honor of a"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "2nd championship win."
    .byte con_катсцена_задержка, $1E
    .byte con_катсцена_новая_строка
    .byte con_катсцена_комментатор, $05
    .byte con_катсцена_смещение_текста, $09
    .text "This battle will"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "close out the season!"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_частично_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte con_катсцена_смещение_текста, $09
    .text "Who will take home"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "the glory?"
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_комментатор, $03
    .byte con_катсцена_номер_звука, $62
    .text " Ahh,"
    .byte con_катсцена_задержка, $14
    .text " I"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $09
    .text "can hardly wait!"
    .byte con_катсцена_мячик
    
    
    
    .byte $F5, $FF
    .byte $EE
    .byte con_катсцена_комментатор, $FF
    .byte $FA, $02
    .byte $FB, $01, $49
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_смещение_текста, $03
    .text "(I figured it'd be you,"
    .byte con_катсцена_задержка, $14
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $04
    .text "Misaki."
    .byte con_катсцена_задержка, $3C
    .text " But your winning"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $04
    .text "streak ends here!)"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_номер_звука, $31
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_выход






off_B6C8_0E_мисаки_и_хюга_перед_матчем:
    .byte $E8, $01
    .byte con_катсцена_задний_фон, $11
    .byte $FA, $10
    .byte $FB, $01, $49
    .byte con_катсцена_задержка, $78
    .byte con_катсцена_номер_звука, $69
    .byte con_катсцена_осветление_экрана
    .byte $F5, $04
    .byte con_катсцена_номер_звука, $53
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_смещение_текста, $05
    .text "(Misaki,"
    .byte con_катсцена_задержка, $14
    .text " I'll make the"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "score sheet and win"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "the final,"
    .byte con_катсцена_задержка, $1E
    .text " just wait"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $06
    .text "and see!)"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_затереть_текст
    .byte con_катсцена_задержка, $0A
    
    
    
    .byte $FB, $01, $1E
    .byte $F7
    .byte $F3, $00
    .byte con_катсцена_задержка, $3C
    .byte con_катсцена_смещение_текста, $04
    .text "(Hyuga,"
    .byte con_катсцена_задержка, $14
    .text " we're bringing"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "the pennant back with"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "us again,"
    .byte con_катсцена_задержка, $1E
    .text " no matter"
    .byte con_катсцена_новая_строка
    .byte con_катсцена_смещение_текста, $05
    .text "what!)"
    .byte con_катсцена_задержка, $50
    .byte con_катсцена_номер_звука, $31
    .byte con_катсцена_задержка, $78
    .byte $F5, $FF
    .byte con_катсцена_затемнение_экрана
    .byte con_катсцена_выход


