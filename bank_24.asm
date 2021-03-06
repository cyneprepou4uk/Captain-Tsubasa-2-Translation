.segment "BANK_24"
.include "copy_bank_ram.inc"
; !!! нельзя перемещать коды раньше чем 0x03803D
; так как сюда будут прыжки через 0x03CE7E
; лучше придумать что-то более удобное для ассемблера, например таблицу как в гол3, или просто указывать младший и старший байты
; так как локацию все равно надо передвигать, зашкварно оставлять ссылки на другие ссылки

.export sub_0x038010
sub_0x038010:
C D - - - 0x038010 24:8000: 4C 2D 80  JMP loc_802D_00

.export sub_0x038013_подготовить_параметры_для_команды_соперников
sub_0x038013_подготовить_параметры_для_команды_соперников:
C - - - - 0x038013 24:8003: 4C 22 8B  JMP loc_8B22_01_подготовить_параметры_для_команды_соперников

; bzk 06 0x03CE7E
.export sub_0x038016
sub_0x038016:
C - J - - 0x038016 24:8006: 4C 09 86  JMP loc_8609_02

.export sub_0x038019
sub_0x038019:
C - - - - 0x038019 24:8009: 4C 06 8C  JMP loc_8C06_03

.export sub_0x03801C
sub_0x03801C:
C - - - - 0x03801C 24:800C: 4C 58 8D  JMP loc_8D58_04

; bzk пока нельзя удалять
- - - - - 0x03801F 24:800F: 4C A6 8D  JMP loc_8DA6_05

; bzk 06 0x03CE7E
.export sub_0x038022
sub_0x038022:
C - J - - 0x038022 24:8012: 4C 9D 81  JMP loc_819D_06

; bzk 07 0x03CE7E
.export sub_0x038025
sub_0x038025:
C - J - - 0x038025 24:8015: 4C 24 82  JMP loc_8224_07

; bzk 08 0x03CE7E
C - J - - 0x038028 24:8018: 4C 8F 82  JMP loc_828F_08

; bzk 09 0x03CE7E
C - J - - 0x03802B 24:801B: 4C 2E 85  JMP loc_852E_09

; bzk 0A 0x03CE7E
C - J - - 0x03802E 24:801E: 4C 6A 84  JMP loc_846A_0A

; bzk прыжок сам на себя, пока нельзя удалять
loc_8021_0B:
- - - - - 0x038031 24:8021: 4C 21 80  JMP loc_8021_0B

.export sub_0x038034
sub_0x038034:
C - - - - 0x038034 24:8024: 4C CA 82  JMP loc_82CA_0C

; bzk 0D 0x03CE7E
C - J - - 0x038037 24:8027: 4C FF 84  JMP loc_84FF_0D_рандом_стороны_кипера_в_пк

; bzk 0E 0x03CE7E
C - J - - 0x03803A 24:802A: 4C C1 84  JMP loc_84C1_0E

loc_802D_00:
C D - - - 0x03803D 24:802D: 20 3A 80  JSR sub_803A
C - - - - 0x038040 24:8030: B9 4E 9E  LDA tbl_9E4E,Y
C - - - - 0x038043 24:8033: 85 32     STA ram_0032
C - - - - 0x038045 24:8035: A9 00     LDA #$00
C - - - - 0x038047 24:8037: 85 33     STA ram_0033
C - - - - 0x038049 24:8039: 60        RTS

sub_803A:
; нельзя изменять X
C - - - - 0x03804A 24:803A: 48        PHA
C - - - - 0x03804B 24:803B: 20 0C C5  JSR sub_0x03CD8C_адрес_игрока
C - - - - 0x03804E 24:803E: A0 00     LDY #con_игрок_номер
C - - - - 0x038050 24:8040: B1 34     LDA (ram_plr_data),Y
C - - - - 0x038052 24:8042: D0 0C     BNE bra_8050_это_не_клон
C - - - - 0x038054 24:8044: 68        PLA
C - - - - 0x038055 24:8045: 48        PHA
C - - - - 0x038056 24:8046: 38        SEC
C - - - - 0x038057 24:8047: E9 0B     SBC #$0B
C - - - - 0x038059 24:8049: A8        TAY
C - - - - 0x03805A 24:804A: B9 8E 81  LDA tbl_818E_индекс_для_параметров_команды,Y
C - - - - 0x03805D 24:804D: A8        TAY
C - - - - 0x03805E 24:804E: B1 38     LDA (ram_enemy_data),Y
bra_8050_это_не_клон:
C - - - - 0x038060 24:8050: C9 23     CMP #$23      ; начиная с 23 идут компьютерные игроки
C - - - - 0x038062 24:8052: 08        PHP
C - - - - 0x038063 24:8053: 90 0F     BCC bra_8064_это_один_из_игрков_нашей_команды
C - - - - 0x038065 24:8055: 48        PHA
C - - - - 0x038066 24:8056: A0 01     LDY #con_бот_флаг_1_ХЗ
C - - - - 0x038068 24:8058: B1 34     LDA (ram_plr_data),Y
C - - - - 0x03806A 24:805A: 10 05     BPL bra_8061
C - - - - 0x03806C 24:805C: 68        PLA
C - - - - 0x03806D 24:805D: C8        INY           ; con_бот_флаг_2_ХЗ
C - - - - 0x03806E 24:805E: B1 34     LDA (ram_plr_data),Y
C - - - - 0x038070 24:8060: 48        PHA
bra_8061:
C - - - - 0x038071 24:8061: 68        PLA
C - - - - 0x038072 24:8062: E9 23     SBC #$23
bra_8064_это_один_из_игрков_нашей_команды:
C - - - - 0x038074 24:8064: A0 00     LDY #$00
C - - - - 0x038076 24:8066: 84 33     STY ram_0033
C - - - - 0x038078 24:8068: 0A        ASL
C - - - - 0x038079 24:8069: 26 33     ROL ram_0033
C - - - - 0x03807B 24:806B: 0A        ASL
C - - - - 0x03807C 24:806C: 26 33     ROL ram_0033
C - - - - 0x03807E 24:806E: 85 32     STA ram_0032
C - - - - 0x038080 24:8070: 28        PLP
C - - - - 0x038081 24:8071: 90 10     BCC bra_8083_это_один_из_игрков_нашей_команды
C - - - - 0x038083 24:8073: A4 33     LDY ram_0033
C - - - - 0x038085 24:8075: 0A        ASL
C - - - - 0x038086 24:8076: 26 33     ROL ram_0033
C - - - - 0x038088 24:8078: 65 32     ADC ram_0032
C - - - - 0x03808A 24:807A: 85 32     STA ram_0032
C - - - - 0x03808C 24:807C: 98        TYA
C - - - - 0x03808D 24:807D: 65 33     ADC ram_0033
C - - - - 0x03808F 24:807F: 85 33     STA ram_0033
C - - - - 0x038091 24:8081: A0 02     LDY #$02
bra_8083_это_один_из_игрков_нашей_команды:
C - - - - 0x038093 24:8083: 18        CLC
C - - - - 0x038094 24:8084: A5 32     LDA ram_0032
C - - - - 0x038096 24:8086: 79 99 81  ADC tbl_8199,Y
C - - - - 0x038099 24:8089: 85 32     STA ram_0032
C - - - - 0x03809B 24:808B: A5 33     LDA ram_0033
C - - - - 0x03809D 24:808D: 79 9A 81  ADC tbl_8199 + 1,Y
C - - - - 0x0380A0 24:8090: 85 33     STA ram_0033
C - - - - 0x0380A2 24:8092: 68        PLA
C - - - - 0x0380A3 24:8093: E0 1F     CPX #$1F
C - - - - 0x0380A5 24:8095: 90 03     BCC bra_809A
C - - - - 0x0380A7 24:8097: 4C 3F 81  JMP loc_813F
bra_809A:
C - - - - 0x0380AA 24:809A: 48        PHA
C - - - - 0x0380AB 24:809B: 68        PLA
C - - - - 0x0380AC 24:809C: F0 0A     BEQ bra_80A8
C - - - - 0x0380AE 24:809E: C9 0B     CMP #$0B
C - - - - 0x0380B0 24:80A0: F0 06     BEQ bra_80A8
C - - - - 0x0380B2 24:80A2: C9 1E     CMP #$1E
C - - - - 0x0380B4 24:80A4: F0 02     BEQ bra_80A8
C - - - - 0x0380B6 24:80A6: C9 1F     CMP #$1F
bra_80A8:
C - - - - 0x0380B8 24:80A8: 08        PHP
C - - - - 0x0380B9 24:80A9: A0 00     LDY #$00
C - - - - 0x0380BB 24:80AB: B1 32     LDA (ram_0032),Y
C - - - - 0x0380BD 24:80AD: 84 33     STY ram_0033
C - - - - 0x0380BF 24:80AF: 28        PLP
C - - - - 0x0380C0 24:80B0: D0 1F     BNE bra_80D1
C - - - - 0x0380C2 24:80B2: 0A        ASL
C - - - - 0x0380C3 24:80B3: 26 33     ROL ram_0033
C - - - - 0x0380C5 24:80B5: 0A        ASL
C - - - - 0x0380C6 24:80B6: 26 33     ROL ram_0033
C - - - - 0x0380C8 24:80B8: 0A        ASL
C - - - - 0x0380C9 24:80B9: 26 33     ROL ram_0033
C - - - - 0x0380CB 24:80BB: 69 86     ADC #< tbl_AE86
C - - - - 0x0380CD 24:80BD: 85 32     STA ram_0032
C - - - - 0x0380CF 24:80BF: A5 33     LDA ram_0033
C - - - - 0x0380D1 24:80C1: 69 AE     ADC #> tbl_AE86
C - - - - 0x0380D3 24:80C3: 85 33     STA ram_0033
C - - - - 0x0380D5 24:80C5: 8A        TXA
C - - - - 0x0380D6 24:80C6: F0 03     BEQ bra_80CB
C - - - - 0x0380D8 24:80C8: 38        SEC
C - - - - 0x0380D9 24:80C9: E9 17     SBC #$17
bra_80CB:
C - - - - 0x0380DB 24:80CB: A8        TAY
C - - - - 0x0380DC 24:80CC: B1 32     LDA (ram_0032),Y
C - - - - 0x0380DE 24:80CE: 4C F9 80  JMP loc_80F9
bra_80D1:
C - - - - 0x0380E1 24:80D1: 0A        ASL
C - - - - 0x0380E2 24:80D2: 26 33     ROL ram_0033
C - - - - 0x0380E4 24:80D4: 0A        ASL
C - - - - 0x0380E5 24:80D5: 26 33     ROL ram_0033
C - - - - 0x0380E7 24:80D7: 0A        ASL
C - - - - 0x0380E8 24:80D8: 26 33     ROL ram_0033
C - - - - 0x0380EA 24:80DA: A4 33     LDY ram_0033
C - - - - 0x0380EC 24:80DC: 85 32     STA ram_0032
C - - - - 0x0380EE 24:80DE: 0A        ASL
C - - - - 0x0380EF 24:80DF: 26 33     ROL ram_0033
C - - - - 0x0380F1 24:80E1: 65 32     ADC ram_0032
C - - - - 0x0380F3 24:80E3: 85 32     STA ram_0032
C - - - - 0x0380F5 24:80E5: 98        TYA
C - - - - 0x0380F6 24:80E6: 65 33     ADC ram_0033
C - - - - 0x0380F8 24:80E8: 85 33     STA ram_0033
C - - - - 0x0380FA 24:80EA: 18        CLC
C - - - - 0x0380FB 24:80EB: A5 32     LDA ram_0032
C - - - - 0x0380FD 24:80ED: 69 CE     ADC #< tbl_9FCE
C - - - - 0x0380FF 24:80EF: 85 32     STA ram_0032
C - - - - 0x038101 24:80F1: A5 33     LDA ram_0033
C - - - - 0x038103 24:80F3: 69 9F     ADC #> tbl_9FCE
C - - - - 0x038105 24:80F5: 85 33     STA ram_0033
C - - - - 0x038107 24:80F7: 8A        TXA
C - - - - 0x038108 24:80F8: A8        TAY
loc_80F9:
C D - - - 0x038109 24:80F9: 8A        TXA
C - - - - 0x03810A 24:80FA: F0 17     BEQ bra_8113
C - - - - 0x03810C 24:80FC: B1 32     LDA (ram_0032),Y
C - - - - 0x03810E 24:80FE: 48        PHA
C - - - - 0x03810F 24:80FF: A0 03     LDY #con_игрок_уровень
C - - - - 0x038111 24:8101: B1 34     LDA (ram_plr_data),Y
C - - - - 0x038113 24:8103: 0A        ASL
C - - - - 0x038114 24:8104: 85 32     STA ram_0032
C - - - - 0x038116 24:8106: 68        PLA
C - - - - 0x038117 24:8107: 65 32     ADC ram_0032
C - - - - 0x038119 24:8109: A8        TAY
C - - - - 0x03811A 24:810A: C0 C0     CPY #$C0
C - - - - 0x03811C 24:810C: 90 02     BCC bra_8110_не_overflow
- - - - - 0x03811E 24:810E: A0 BF     LDY #$BF
bra_8110_не_overflow:
C - - - - 0x038122 24:8112: 60        RTS
bra_8113:
; чтение уровня игрока и вычисление его параметров
C - - - - 0x038123 24:8113: B1 32     LDA (ram_0032),Y
C - - - - 0x038125 24:8115: 48        PHA
C - - - - 0x038126 24:8116: A0 03     LDY #con_игрок_уровень
C - - - - 0x038128 24:8118: B1 34     LDA (ram_plr_data),Y
C - - - - 0x03812A 24:811A: 85 32     STA ram_0032
C - - - - 0x03812C 24:811C: 68        PLA
C - - - - 0x03812D 24:811D: 65 32     ADC ram_0032
C - - - - 0x03812F 24:811F: C9 5F     CMP #$5F
C - - - - 0x038131 24:8121: 90 02     BCC bra_8125_не_overflow
- - - - - 0x038133 24:8123: A9 5F     LDA #$5F
bra_8125_не_overflow:
C - - - - 0x038135 24:8125: A0 9F     LDY #> tbl_9F0E
C - - - - 0x03813B 24:812B: 84 33     STY ram_0033
C - - - - 0x03813D 24:812D: A0 0E     LDY #< tbl_9F0E
C - - - - 0x03813F 24:812F: 84 32     STY ram_0032
                                      ASL
C - - - - 0x038141 24:8131: A8        TAY
C - - - - 0x038142 24:8132: B1 32     LDA (ram_0032),Y
C - - - - 0x038144 24:8134: AA        TAX
C - - - - 0x038145 24:8135: C8        INY
C - - - - 0x038146 24:8136: B1 32     LDA (ram_0032),Y
C - - - - 0x038148 24:8138: 85 33     STA ram_0033
C - - - - 0x03814A 24:813A: 86 32     STX ram_0032
C - - - - 0x03814C 24:813C: 4C 8B 81  PLA
                                      PLA
                                      RTS

loc_813F:
C D - - - 0x03814F 24:813F: E0 25     CPX #$25
C - - - - 0x038151 24:8141: B0 3B     BCS bra_817E
C - - - - 0x038153 24:8143: A0 01     LDY #$01
C - - - - 0x038155 24:8145: B1 32     LDA (ram_0032),Y
C - - - - 0x038157 24:8147: 88        DEY
C - - - - 0x038158 24:8148: 84 33     STY ram_0033
C - - - - 0x03815A 24:814A: 0A        ASL
C - - - - 0x03815B 24:814B: 26 33     ROL ram_0033
C - - - - 0x03815D 24:814D: 0A        ASL
C - - - - 0x03815E 24:814E: 26 33     ROL ram_0033
C - - - - 0x038160 24:8150: 85 32     STA ram_0032
C - - - - 0x038162 24:8152: A4 33     LDY ram_0033
C - - - - 0x038164 24:8154: 0A        ASL
C - - - - 0x038165 24:8155: 26 33     ROL ram_0033
C - - - - 0x038167 24:8157: 65 32     ADC ram_0032
C - - - - 0x038169 24:8159: 85 32     STA ram_0032
C - - - - 0x03816B 24:815B: 98        TYA
C - - - - 0x03816C 24:815C: 65 33     ADC ram_0033
C - - - - 0x03816E 24:815E: A8        TAY
C - - - - 0x03816F 24:815F: A5 32     LDA ram_0032
C - - - - 0x038171 24:8161: 18        CLC
C - - - - 0x038172 24:8162: 69 AE     ADC #< tbl_AFAE
C - - - - 0x038174 24:8164: 85 32     STA ram_0032
C - - - - 0x038176 24:8166: 98        TYA
C - - - - 0x038177 24:8167: 69 AF     ADC #> tbl_AFAE
C - - - - 0x038179 24:8169: 85 33     STA ram_0033
C - - - - 0x03817B 24:816B: 8A        TXA
C - - - - 0x03817C 24:816C: 38        SEC
C - - - - 0x03817D 24:816D: E9 1F     SBC #$1F
C - - - - 0x03817F 24:816F: 0A        ASL
C - - - - 0x038180 24:8170: A8        TAY
C - - - - 0x038181 24:8171: B1 32     LDA (ram_0032),Y
C - - - - 0x038183 24:8173: AA        TAX
C - - - - 0x038184 24:8174: C8        INY
C - - - - 0x038185 24:8175: B1 32     LDA (ram_0032),Y
C - - - - 0x038187 24:8177: 85 33     STA ram_0033
C - - - - 0x038189 24:8179: 86 32     STX ram_0032
C - - - - 0x03818B 24:817B: 4C 8B 81  PLA
                                      PLA
                                      RTS
bra_817E:
C - - - - 0x03818E 24:817E: 8A        TXA
C - - - - 0x03818F 24:817F: 38        SEC
C - - - - 0x038190 24:8180: E9 23     SBC #$23
C - - - - 0x038192 24:8182: A8        TAY
C - - - - 0x038193 24:8183: B1 32     LDA (ram_0032),Y
C - - - - 0x038195 24:8185: 85 32     STA ram_0032
C - - - - 0x038197 24:8187: A9 00     LDA #$00
C - - - - 0x038199 24:8189: 85 33     STA ram_0033
C D - - - 0x03819B 24:818B: 68        PLA
C - - - - 0x03819C 24:818C: 68        PLA
C - - - - 0x03819D 24:818D: 60        RTS

tbl_818E_индекс_для_параметров_команды:
    .byte $02    ; GK 1
    .byte $03    ; DF 2
    .byte $03    ; DF 3
    .byte $03    ; DF 4
    .byte $03    ; DF 5
    .byte $04    ; MF 6
    .byte $05    ; FW 7
    .byte $04    ; MF 8
    .byte $05    ; FW 9
    .byte $04    ; MF 10
    .byte $05    ; FW 11

tbl_8199:
- D - - - 0x0381A9 24:8199: D6 95     .word off_95D6_игроки_нашей_команды
- D - - - 0x0381AB 24:819B: 62 96     .word off_9662_игроки_команды_соперников

loc_819D_06:
C D - - - 0x0381AD 24:819D: AD 3B 04  LDA ram_действие_атаки
C - - - - 0x0381B0 24:81A0: 08        PHP
C - - - - 0x0381B1 24:81A1: 0A        ASL
C - - - - 0x0381B2 24:81A2: 6D 3B 04  ADC ram_действие_атаки
C - - - - 0x0381B5 24:81A5: 6D 4E 04  ADC ram_высота_мяча
C - - - - 0x0381B8 24:81A8: A8        TAY
C - - - - 0x0381B9 24:81A9: 28        PLP
C - - - - 0x0381BA 24:81AA: D0 0F     BNE bra_81BB_пропустить_высоту
C - - - - 0x0381BC 24:81AC: AD 3C 04  LDA ram_подтип_действия_атаки
C - - - - 0x0381BF 24:81AF: 29 7F     AND #$7F
C - - - - 0x0381C1 24:81B1: C9 03     CMP #$03
C - - - - 0x0381C3 24:81B3: 90 06     BCC bra_81BB_пропустить_высоту
C - - - - 0x0381C5 24:81B5: 98        TYA
C - - - - 0x0381C6 24:81B6: 38        SEC
C - - - - 0x0381C7 24:81B7: ED 4E 04  SBC ram_высота_мяча
C - - - - 0x0381CA 24:81BA: A8        TAY
bra_81BB_пропустить_высоту:
C - - - - 0x0381CB 24:81BB: BE 06 82  LDX tbl_8206,Y
C - - - - 0x0381D2 24:81C2: AD 41 04  LDA ram_игрок_с_мячом
C - - - - 0x0381D5 24:81C5: 20 3A 80  JSR sub_803A
C - - - - 0x0381D8 24:81C8: 98        TYA
C - - - - 0x0381D9 24:81C9: 48        PHA
C - - - - 0x0381DA 24:81CA: AD 3B 04  LDA ram_действие_атаки
C - - - - 0x0381DD 24:81CD: 0A        ASL
C - - - - 0x0381DE 24:81CE: AA        TAX
C - - - - 0x0381DF 24:81CF: BD 60 94  LDA tbl_9460_стоимость_действий,X
C - - - - 0x0381E2 24:81D2: 85 32     STA ram_0032
C - - - - 0x0381E4 24:81D4: BD 61 94  LDA tbl_9460_стоимость_действий + 1,X
C - - - - 0x0381E7 24:81D7: 85 33     STA ram_0033
C - - - - 0x0381E9 24:81D9: AD 3C 04  LDA ram_подтип_действия_атаки
C - - - - 0x0381EC 24:81DC: 0A        ASL
C - - - - 0x0381ED 24:81DD: 0A        ASL
C - - - - 0x0381EE 24:81DE: A8        TAY
C - - - - 0x0381EF 24:81DF: B1 32     LDA (ram_0032),Y
C - - - - 0x0381F1 24:81E1: 8D 44 04  STA ram_спешал_атакующего
C - - - - 0x0381F4 24:81E4: C8        INY
C - - - - 0x0381F5 24:81E5: B1 32     LDA (ram_0032),Y
C - - - - 0x0381F7 24:81E7: AA        TAX
C - - - - 0x0381F8 24:81E8: C8        INY
C - - - - 0x0381F9 24:81E9: B1 32     LDA (ram_0032),Y
C - - - - 0x0381FB 24:81EB: 8D 3F 04  STA ram_затрата_энергии_lo
C - - - - 0x0381FE 24:81EE: C8        INY
C - - - - 0x0381FF 24:81EF: B1 32     LDA (ram_0032),Y
C - - - - 0x038201 24:81F1: 29 03     AND #$03
C - - - - 0x038203 24:81F3: 8D 40 04  STA ram_затрата_энергии_hi
C - - - - 0x038206 24:81F6: B1 32     LDA (ram_0032),Y
C - - - - 0x038208 24:81F8: 29 F8     AND #$F8
C - - - - 0x03820A 24:81FA: 4A        LSR
C - - - - 0x03820B 24:81FB: 4A        LSR
C - - - - 0x03820C 24:81FC: 4A        LSR
C - - - - 0x03820D 24:81FD: 8D 43 04  STA $0443
C - - - - 0x038210 24:8200: 4C 78 82  JMP loc_8278

tbl_8206:
    .byte $01       ; 
    .byte $07       ; 
    .byte $0F       ; 
    .byte $02       ; 
    .byte $08       ; 
    .byte $10       ; 
    .byte $03       ; 
    .byte $FF       ; unused
    .byte $FF       ; unused
    .byte $02       ; 
    .byte $FF       ; unused
    .byte $FF       ; unused
    .byte $FF       ; unused
    .byte $09       ; 
    .byte $11       ; 
    .byte $FF       ; unused
    .byte $0A       ; 
    .byte $12       ; 
    .byte $FF       ; unused
    .byte $0B       ; 
    .byte $13       ; 
    .byte $01       ; 
    .byte $FF       ; unused
    .byte $FF       ; unused
    .byte $01       ; 
    .byte $FF       ; unused
    .byte $FF       ; unused
    .byte $01       ; 
    .byte $FF       ; unused
    .byte $FF       ; unused

loc_8224_07:
C D - - - 0x038234 24:8224: AD 3D 04  LDA ram_действие_защиты
C - - - - 0x038237 24:8227: 0A        ASL
C - - - - 0x038238 24:8228: 6D 3D 04  ADC ram_действие_защиты
C - - - - 0x03823B 24:822B: 6D 4E 04  ADC ram_высота_мяча
C - - - - 0x03823E 24:822E: A8        TAY
C - - - - 0x03823F 24:822F: BE 4C 82  LDX tbl_824C,Y
C - - - - 0x038242 24:8232: AD 42 04  LDA ram_игрок_без_мяча
C - - - - 0x038245 24:8235: 20 3A 80  JSR sub_803A
C - - - - 0x038248 24:8238: 98        TYA
C - - - - 0x038249 24:8239: 48        PHA
C - - - - 0x03824A 24:823A: AD 3D 04  LDA ram_действие_защиты
C - - - - 0x03824D 24:823D: 0A        ASL
C - - - - 0x03824E 24:823E: AA        TAX
C - - - - 0x03824F 24:823F: BD 54 95  LDA tbl_9554,X
C - - - - 0x038252 24:8242: 85 32     STA ram_0032
C - - - - 0x038254 24:8244: BD 55 95  LDA tbl_9554 + 1,X
C - - - - 0x038257 24:8247: 85 33     STA ram_0033
C - - - - 0x038259 24:8249: 4C 5B 82  JMP loc_825B

tbl_824C:
- D - - - 0x03825C 24:824C: 04        .byte $04    ; <え>
- D - - - 0x03825D 24:824D: 04        .byte $04    ; <え>
- D - - - 0x03825E 24:824E: 04        .byte $04    ; <え>
- D - - - 0x03825F 24:824F: 05        .byte $05    ; <お>
- D - - - 0x038260 24:8250: 05        .byte $05    ; <お>
- D - - - 0x038261 24:8251: 05        .byte $05    ; <お>
- D - - - 0x038262 24:8252: 06        .byte $06    ; <か>
- D - - - 0x038263 24:8253: 0E        .byte $0E    ; <せ>
- D - - - 0x038264 24:8254: 16        .byte $16    ; <に>
- - - - - 0x038265 24:8255: FF        .byte $FF
- D - - - 0x038266 24:8256: 0C        .byte $0C    ; <し>
- D - - - 0x038267 24:8257: 14        .byte $14    ; <と>
- - - - - 0x038268 24:8258: FF        .byte $FF
- D - - - 0x038269 24:8259: 0D        .byte $0D    ; <す>
- D - - - 0x03826A 24:825A: 15        .byte $15    ; <な>

loc_825B:
C D - - - 0x03826B 24:825B: AD 3E 04  LDA ram_подтип_действия_защиты
C - - - - 0x03826E 24:825E: 0A        ASL
C - - - - 0x03826F 24:825F: 0A        ASL
C - - - - 0x038270 24:8260: A8        TAY
C - - - - 0x038271 24:8261: B1 32     LDA (ram_0032),Y
C - - - - 0x038273 24:8263: 8D 45 04  STA ram_спешал_защитника
C - - - - 0x038276 24:8266: C8        INY
C - - - - 0x038277 24:8267: B1 32     LDA (ram_0032),Y
C - - - - 0x038279 24:8269: AA        TAX
C - - - - 0x03827A 24:826A: C8        INY
C - - - - 0x03827B 24:826B: B1 32     LDA (ram_0032),Y
C - - - - 0x03827D 24:826D: 8D 3F 04  STA ram_затрата_энергии_lo
C - - - - 0x038280 24:8270: C8        INY
C - - - - 0x038281 24:8271: B1 32     LDA (ram_0032),Y
C - - - - 0x038283 24:8273: 29 03     AND #$03
C - - - - 0x038285 24:8275: 8D 40 04  STA ram_затрата_энергии_hi
loc_8278:
C D - - - 0x038288 24:8278: 86 32     STX ram_0032
C - - - - 0x03828A 24:827A: 68        PLA
C - - - - 0x03828B 24:827B: 18        CLC
C - - - - 0x03828C 24:827C: 65 32     ADC ram_0032
C - - - - 0x03828E 24:827E: C9 C0     CMP #$C0
C - - - - 0x038290 24:8280: 90 02     BCC bra_8284_не_overflow
; !!! подозрительное место, первый байт A9 считывался где-то, но такая инструкция точно должна быть тут так как проверка на overflow
- D - - - 0x038292 24:8282: A9 BF     LDA #$BF
bra_8284_не_overflow:
C - - - - 0x038294 24:8284: AA        TAX
C - - - - 0x038295 24:8285: BD 4E 9E  LDA tbl_9E4E,X
C - - - - 0x038298 24:8288: 85 32     STA ram_0032
C - - - - 0x03829A 24:828A: A9 00     LDA #$00
C - - - - 0x03829C 24:828C: 85 33     STA ram_0033
C - - - - 0x03829E 24:828E: 60        RTS

loc_828F_08:
C D - - - 0x03829F 24:828F: AC 3D 04  LDY ram_действие_защиты
C - - - - 0x0382A2 24:8292: C0 03     CPY #$03
C - - - - 0x0382A4 24:8294: D0 06     BNE bra_829C
C - - - - 0x0382A6 24:8296: 88        DEY
C - - - - 0x0382A7 24:8297: 98        TYA
C - - - - 0x0382A8 24:8298: 18        CLC
C - - - - 0x0382A9 24:8299: 69 03     ADC #$03
C - - - - 0x0382AB 24:829B: A8        TAY
bra_829C:
C - - - - 0x0382AC 24:829C: BE C0 82  LDX tbl_82C0,Y
C - - - - 0x0382AF 24:829F: AD FB 05  LDA ram_команда_с_мячом
C - - - - 0x0382B2 24:82A2: 49 0B     EOR #$0B
C - - - - 0x0382B4 24:82A4: 20 3A 80  JSR sub_803A
C - - - - 0x0382B7 24:82A7: 98        TYA
C - - - - 0x0382B8 24:82A8: 48        PHA
C - - - - 0x0382B9 24:82A9: AD 3D 04  LDA ram_действие_защиты
C - - - - 0x0382BC 24:82AC: 0A        ASL
C - - - - 0x0382BD 24:82AD: AA        TAX
C - - - - 0x0382BE 24:82AE: BD 9E 95  LDA tbl_959E,X
C - - - - 0x0382C1 24:82B1: 85 32     STA ram_0032
C - - - - 0x0382C3 24:82B3: BD 9F 95  LDA tbl_959E + 1,X
C - - - - 0x0382C6 24:82B6: 85 33     STA ram_0033
C - - - - 0x0382C8 24:82B8: A9 00     LDA #$00
C - - - - 0x0382CA 24:82BA: 8D 45 04  STA ram_спешал_защитника
C - - - - 0x0382CD 24:82BD: 4C 5B 82  JMP loc_825B

tbl_82C0:
- D - - - 0x0382D0 24:82C0: 19        .byte $19    ; <の>
- D - - - 0x0382D1 24:82C1: 1A        .byte $1A    ; <は>
- D - - - 0x0382D2 24:82C2: 19        .byte $19    ; <の>
- - - - - 0x0382D3 24:82C3: 1D        .byte $1D    ; <へ>
- - - - - 0x0382D4 24:82C4: 1E        .byte $1E    ; <ほ>
- D - - - 0x0382D5 24:82C5: 1C        .byte $1C    ; <ふ>
- D - - - 0x0382D6 24:82C6: 1B        .byte $1B    ; <ひ>
- D - - - 0x0382D7 24:82C7: 1A        .byte $1A    ; <は>
- D - - - 0x0382D8 24:82C8: 1A        .byte $1A    ; <は>
- D - - - 0x0382D9 24:82C9: 1A        .byte $1A    ; <は>

loc_82CA_0C:
; срабатывает один раз перед тем когда игрок начинает передвигаться по полю
C D - - - 0x0382DA 24:82CA: 20 2D C5  JSR sub_0x03CC56_очистить_нижнюю_половину_экрана
C - - - - 0x0382E3 24:82D3: A9 4A     LDA #< tbl_834A
C - - - - 0x0382E5 24:82D5: 85 61     STA ram_0061
C - - - - 0x0382E7 24:82D7: A9 83     LDA #> tbl_834A
C - - - - 0x0382E9 24:82D9: 85 62     STA ram_0062
C - - - - 0x0382EB 24:82DB: A9 00     LDA #$00
C - - - - 0x0382DF 24:82CF: 85 11     STA ram_0011
C - - - - 0x0382E1 24:82D1: 85 12     STA ram_0012
bra_82DD:
C - - - - 0x0382ED 24:82DD: 48        PHA
bra_82DE_ожидание_освобождения_буфера:
C - - - - 0x0382EE 24:82DE: A9 01     LDA #$01
C - - - - 0x0382F0 24:82E0: 20 15 C5  JSR sub_0x03CB1F_задержка
C - - - - 0x0382F3 24:82E3: AD 15 05  LDA $0515
C - - - - 0x0382F6 24:82E6: D0 F6     BNE bra_82DE_ожидание_освобождения_буфера
C - - - - 0x0382F8 24:82E8: A9 01     LDA #$01
C - - - - 0x0382FA 24:82EA: 8D 15 05  STA $0515
C - - - - 0x0382FD 24:82ED: 68        PLA
C - - - - 0x0382FE 24:82EE: 48        PHA
C - - - - 0x0382FF 24:82EF: A2 00     LDX #$00
C - - - - 0x038301 24:82F1: 20 0A 83  JSR sub_830A_отрисовка_миникарты_перед_бегом
C - - - - 0x038304 24:82F4: 68        PLA
C - - - - 0x038305 24:82F5: 18        CLC
C - - - - 0x038306 24:82F6: 69 01     ADC #$01
C - - - - 0x038308 24:82F8: 48        PHA
C - - - - 0x038309 24:82F9: 20 0A 83  JSR sub_830A_отрисовка_миникарты_перед_бегом
C - - - - 0x03830C 24:82FC: A9 80     LDA #$80
C - - - - 0x03830E 24:82FE: 8D 15 05  STA $0515
C - - - - 0x038311 24:8301: 68        PLA
C - - - - 0x038312 24:8302: 18        CLC
C - - - - 0x038313 24:8303: 69 01     ADC #$01
C - - - - 0x038315 24:8305: C9 0C     CMP #$0C
C - - - - 0x038317 24:8307: D0 D4     BNE bra_82DD
C - - - - 0x038319 24:8309: 60        RTS

sub_830A_отрисовка_миникарты_перед_бегом:
C - - - - 0x03831A 24:830A: 48        PHA
C - - - - 0x03831B 24:830B: A9 18     LDA #$18
C - - - - 0x03831D 24:830D: 9D A5 04  STA $04A5,X
C - - - - 0x038320 24:8310: A9 40     LDA #$40
C - - - - 0x038322 24:8312: 9D A6 04  STA $04A6,X
C - - - - 0x038325 24:8315: 68        PLA
C - - - - 0x038326 24:8316: 18        CLC
C - - - - 0x038327 24:8317: 69 11     ADC #$11
C - - - - 0x038329 24:8319: 4A        LSR
C - - - - 0x03832A 24:831A: 7E A6 04  ROR $04A6,X
C - - - - 0x03832D 24:831D: 4A        LSR
C - - - - 0x03832E 24:831E: 7E A6 04  ROR $04A6,X
C - - - - 0x038331 24:8321: 4A        LSR
C - - - - 0x038332 24:8322: 7E A6 04  ROR $04A6,X
C - - - - 0x038335 24:8325: 09 20     ORA #$20
C - - - - 0x038337 24:8327: 9D A7 04  STA $04A7,X
C - - - - 0x03833A 24:832A: E8        INX
C - - - - 0x03833B 24:832B: E8        INX
C - - - - 0x03833C 24:832C: E8        INX
C - - - - 0x03833D 24:832D: A0 00     LDY #$00
bra_832F_цикл:
C - - - - 0x03833F 24:832F: B1 61     LDA (ram_0061),Y
C - - - - 0x038341 24:8331: 9D A5 04  STA $04A5,X
C - - - - 0x038344 24:8334: E8        INX
C - - - - 0x038345 24:8335: C8        INY
C - - - - 0x038346 24:8336: C0 18     CPY #$18
C - - - - 0x038348 24:8338: D0 F5     BNE bra_832F_цикл
C - - - - 0x03834A 24:833A: A9 00     LDA #$00
C - - - - 0x03834C 24:833C: 9D A5 04  STA $04A5,X
C - - - - 0x03834F 24:833F: 98        TYA
C - - - - 0x038350 24:8340: 18        CLC
C - - - - 0x038351 24:8341: 65 61     ADC ram_0061
C - - - - 0x038353 24:8343: 85 61     STA ram_0061
C - - - - 0x038355 24:8345: 90 02     BCC bra_8349_выход
C - - - - 0x038357 24:8347: E6 62     INC ram_0062
bra_8349_выход:
C - - - - 0x038359 24:8349: 60        RTS



tbl_834A:
; графика миникарты когда игрок бежит по полю, каждые 24 байта это 1 строка
; считывается из 0x03833F
- D - I - 0x03835A 24:834A: 00        .byte $00
- D - I - 0x03835B 24:834B: 00        .byte $00
- D - I - 0x03835C 24:834C: C9        .byte $C9    ; <ぴ>
- D - I - 0x03835D 24:834D: D2        .byte $D2
- D - I - 0x03835E 24:834E: D2        .byte $D2
- D - I - 0x03835F 24:834F: D2        .byte $D2
- D - I - 0x038360 24:8350: D2        .byte $D2
- D - I - 0x038361 24:8351: D2        .byte $D2
- D - I - 0x038362 24:8352: D2        .byte $D2
- D - I - 0x038363 24:8353: D2        .byte $D2
- D - I - 0x038364 24:8354: D2        .byte $D2
- D - I - 0x038365 24:8355: D2        .byte $D2
- D - I - 0x038366 24:8356: C9        .byte $C9    ; <ぴ>
- D - I - 0x038367 24:8357: D2        .byte $D2
- D - I - 0x038368 24:8358: D2        .byte $D2
- D - I - 0x038369 24:8359: D2        .byte $D2
- D - I - 0x03836A 24:835A: D2        .byte $D2
- D - I - 0x03836B 24:835B: D2        .byte $D2
- D - I - 0x03836C 24:835C: D2        .byte $D2
- D - I - 0x03836D 24:835D: D2        .byte $D2
- D - I - 0x03836E 24:835E: D2        .byte $D2
- D - I - 0x03836F 24:835F: D2        .byte $D2
- D - I - 0x038370 24:8360: D0        .byte $D0    ; <ペ>
- D - I - 0x038371 24:8361: 00        .byte $00

- D - I - 0x038372 24:8362: 00        .byte $00
- D - I - 0x038373 24:8363: 00        .byte $00
- D - I - 0x038374 24:8364: CC        .byte $CC    ; <ぽ>
- D - I - 0x038375 24:8365: FF        .byte $FF
- D - I - 0x038376 24:8366: FF        .byte $FF
- D - I - 0x038377 24:8367: FF        .byte $FF
- D - I - 0x038378 24:8368: FF        .byte $FF
- D - I - 0x038379 24:8369: FF        .byte $FF
- D - I - 0x03837A 24:836A: FF        .byte $FF
- D - I - 0x03837B 24:836B: FF        .byte $FF
- D - I - 0x03837C 24:836C: FF        .byte $FF
- D - I - 0x03837D 24:836D: FF        .byte $FF
- D - I - 0x03837E 24:836E: CC        .byte $CC    ; <ぽ>
- D - I - 0x03837F 24:836F: FF        .byte $FF
- D - I - 0x038380 24:8370: FF        .byte $FF
- D - I - 0x038381 24:8371: FF        .byte $FF
- D - I - 0x038382 24:8372: FF        .byte $FF
- D - I - 0x038383 24:8373: FF        .byte $FF
- D - I - 0x038384 24:8374: FF        .byte $FF
- D - I - 0x038385 24:8375: FF        .byte $FF
- D - I - 0x038386 24:8376: FF        .byte $FF
- D - I - 0x038387 24:8377: FF        .byte $FF
- D - I - 0x038388 24:8378: D0        .byte $D0    ; <ペ>
- D - I - 0x038389 24:8379: 00        .byte $00

- D - I - 0x03838A 24:837A: 00        .byte $00
- D - I - 0x03838B 24:837B: 00        .byte $00
- D - I - 0x03838C 24:837C: C9        .byte $C9    ; <ぴ>
- D - I - 0x03838D 24:837D: D2        .byte $D2
- D - I - 0x03838E 24:837E: D2        .byte $D2
- D - I - 0x03838F 24:837F: D2        .byte $D2
- D - I - 0x038390 24:8380: CC        .byte $CC    ; <ぽ>
- D - I - 0x038391 24:8381: FF        .byte $FF
- D - I - 0x038392 24:8382: FF        .byte $FF
- D - I - 0x038393 24:8383: FF        .byte $FF
- D - I - 0x038394 24:8384: FF        .byte $FF
- D - I - 0x038395 24:8385: FF        .byte $FF
- D - I - 0x038396 24:8386: CC        .byte $CC    ; <ぽ>
- D - I - 0x038397 24:8387: FF        .byte $FF
- D - I - 0x038398 24:8388: FF        .byte $FF
- D - I - 0x038399 24:8389: FF        .byte $FF
- D - I - 0x03839A 24:838A: FF        .byte $FF
- D - I - 0x03839B 24:838B: FF        .byte $FF
- D - I - 0x03839C 24:838C: C9        .byte $C9    ; <ぴ>
- D - I - 0x03839D 24:838D: D2        .byte $D2
- D - I - 0x03839E 24:838E: D2        .byte $D2
- D - I - 0x03839F 24:838F: D2        .byte $D2
- D - I - 0x0383A0 24:8390: D0        .byte $D0    ; <ペ>
- D - I - 0x0383A1 24:8391: 00        .byte $00

- D - I - 0x0383A2 24:8392: 00        .byte $00
- D - I - 0x0383A3 24:8393: 00        .byte $00
- D - I - 0x0383A4 24:8394: CC        .byte $CC    ; <ぽ>
- D - I - 0x0383A5 24:8395: FF        .byte $FF
- D - I - 0x0383A6 24:8396: FF        .byte $FF
- D - I - 0x0383A7 24:8397: FF        .byte $FF
- D - I - 0x0383A8 24:8398: CC        .byte $CC    ; <ぽ>
- D - I - 0x0383A9 24:8399: FF        .byte $FF
- D - I - 0x0383AA 24:839A: FF        .byte $FF
- D - I - 0x0383AB 24:839B: FF        .byte $FF
- D - I - 0x0383AC 24:839C: FF        .byte $FF
- D - I - 0x0383AD 24:839D: FF        .byte $FF
- D - I - 0x0383AE 24:839E: CC        .byte $CC    ; <ぽ>
- D - I - 0x0383AF 24:839F: FF        .byte $FF
- D - I - 0x0383B0 24:83A0: FF        .byte $FF
- D - I - 0x0383B1 24:83A1: FF        .byte $FF
- D - I - 0x0383B2 24:83A2: FF        .byte $FF
- D - I - 0x0383B3 24:83A3: FF        .byte $FF
- D - I - 0x0383B4 24:83A4: CC        .byte $CC    ; <ぽ>
- D - I - 0x0383B5 24:83A5: FF        .byte $FF
- D - I - 0x0383B6 24:83A6: FF        .byte $FF
- D - I - 0x0383B7 24:83A7: FF        .byte $FF
- D - I - 0x0383B8 24:83A8: D0        .byte $D0    ; <ペ>
- D - I - 0x0383B9 24:83A9: 00        .byte $00

- D - I - 0x0383BA 24:83AA: 00        .byte $00
- D - I - 0x0383BB 24:83AB: 00        .byte $00
- D - I - 0x0383BC 24:83AC: C9        .byte $C9    ; <ぴ>
- D - I - 0x0383BD 24:83AD: D2        .byte $D2
- D - I - 0x0383BE 24:83AE: CC        .byte $CC    ; <ぽ>
- D - I - 0x0383BF 24:83AF: FF        .byte $FF
- D - I - 0x0383C0 24:83B0: CC        .byte $CC    ; <ぽ>
- D - I - 0x0383C1 24:83B1: FF        .byte $FF
- D - I - 0x0383C2 24:83B2: FF        .byte $FF
- D - I - 0x0383C3 24:83B3: FF        .byte $FF
- D - I - 0x0383C4 24:83B4: C0        .byte $C0    ; <ヅ>
- D - I - 0x0383C5 24:83B5: C1        .byte $C1    ; <デ>
- D - I - 0x0383C6 24:83B6: C4        .byte $C4    ; <ビ>
- D - I - 0x0383C7 24:83B7: C5        .byte $C5    ; <ブ>
- D - I - 0x0383C8 24:83B8: FF        .byte $FF
- D - I - 0x0383C9 24:83B9: FF        .byte $FF
- D - I - 0x0383CA 24:83BA: FF        .byte $FF
- D - I - 0x0383CB 24:83BB: FF        .byte $FF
- D - I - 0x0383CC 24:83BC: CC        .byte $CC    ; <ぽ>
- D - I - 0x0383CD 24:83BD: FF        .byte $FF
- D - I - 0x0383CE 24:83BE: C9        .byte $C9    ; <ぴ>
- D - I - 0x0383CF 24:83BF: D2        .byte $D2
- D - I - 0x0383D0 24:83C0: D0        .byte $D0    ; <ペ>
- D - I - 0x0383D1 24:83C1: 00        .byte $00

- D - I - 0x0383D2 24:83C2: 00        .byte $00
- D - I - 0x0383D3 24:83C3: C9        .byte $C9    ; <ぴ>
- D - I - 0x0383D4 24:83C4: CC        .byte $CC    ; <ぽ>
- D - I - 0x0383D5 24:83C5: FF        .byte $FF
- D - I - 0x0383D6 24:83C6: CC        .byte $CC    ; <ぽ>
- D - I - 0x0383D7 24:83C7: FF        .byte $FF
- D - I - 0x0383D8 24:83C8: CC        .byte $CC    ; <ぽ>
- D - I - 0x0383D9 24:83C9: FF        .byte $FF
- D - I - 0x0383DA 24:83CA: FF        .byte $FF
- D - I - 0x0383DB 24:83CB: FF        .byte $FF
- D - I - 0x0383DC 24:83CC: C2        .byte $C2    ; <ド>
- D - I - 0x0383DD 24:83CD: FF        .byte $FF
- D - I - 0x0383DE 24:83CE: CC        .byte $CC    ; <ぽ>
- D - I - 0x0383DF 24:83CF: C7        .byte $C7    ; <ボ>
- D - I - 0x0383E0 24:83D0: FF        .byte $FF
- D - I - 0x0383E1 24:83D1: FF        .byte $FF
- D - I - 0x0383E2 24:83D2: FF        .byte $FF
- D - I - 0x0383E3 24:83D3: FF        .byte $FF
- D - I - 0x0383E4 24:83D4: CC        .byte $CC    ; <ぽ>
- D - I - 0x0383E5 24:83D5: FF        .byte $FF
- D - I - 0x0383E6 24:83D6: CC        .byte $CC    ; <ぽ>
- D - I - 0x0383E7 24:83D7: FF        .byte $FF
- D - I - 0x0383E8 24:83D8: C9        .byte $C9    ; <ぴ>
- D - I - 0x0383E9 24:83D9: D0        .byte $D0    ; <ペ>

- D - I - 0x0383EA 24:83DA: 00        .byte $00
- D - I - 0x0383EB 24:83DB: C6        .byte $C6    ; <ベ>
- D - I - 0x0383EC 24:83DC: CC        .byte $CC    ; <ぽ>
- D - I - 0x0383ED 24:83DD: FF        .byte $FF
- D - I - 0x0383EE 24:83DE: CC        .byte $CC    ; <ぽ>
- D - I - 0x0383EF 24:83DF: FF        .byte $FF
- D - I - 0x0383F0 24:83E0: CC        .byte $CC    ; <ぽ>
- D - I - 0x0383F1 24:83E1: FF        .byte $FF
- D - I - 0x0383F2 24:83E2: FF        .byte $FF
- D - I - 0x0383F3 24:83E3: FF        .byte $FF
- D - I - 0x0383F4 24:83E4: C8        .byte $C8    ; <ぱ>
- D - I - 0x0383F5 24:83E5: FF        .byte $FF
- D - I - 0x0383F6 24:83E6: CC        .byte $CC    ; <ぽ>
- D - I - 0x0383F7 24:83E7: CD        .byte $CD    ; <パ>
- D - I - 0x0383F8 24:83E8: FF        .byte $FF
- D - I - 0x0383F9 24:83E9: FF        .byte $FF
- D - I - 0x0383FA 24:83EA: FF        .byte $FF
- D - I - 0x0383FB 24:83EB: FF        .byte $FF
- D - I - 0x0383FC 24:83EC: CC        .byte $CC    ; <ぽ>
- D - I - 0x0383FD 24:83ED: FF        .byte $FF
- D - I - 0x0383FE 24:83EE: CC        .byte $CC    ; <ぽ>
- D - I - 0x0383FF 24:83EF: FF        .byte $FF
- D - I - 0x038400 24:83F0: C6        .byte $C6    ; <ベ>
- D - I - 0x038401 24:83F1: D0        .byte $D0    ; <ペ>

- D - I - 0x038402 24:83F2: 00        .byte $00
- D - I - 0x038403 24:83F3: 00        .byte $00
- D - I - 0x038404 24:83F4: C6        .byte $C6    ; <ベ>
- D - I - 0x038405 24:83F5: C3        .byte $C3    ; <バ>
- D - I - 0x038406 24:83F6: CC        .byte $CC    ; <ぽ>
- D - I - 0x038407 24:83F7: FF        .byte $FF
- D - I - 0x038408 24:83F8: CC        .byte $CC    ; <ぽ>
- D - I - 0x038409 24:83F9: FF        .byte $FF
- D - I - 0x03840A 24:83FA: FF        .byte $FF
- D - I - 0x03840B 24:83FB: FF        .byte $FF
- D - I - 0x03840C 24:83FC: CA        .byte $CA    ; <ぷ>
- D - I - 0x03840D 24:83FD: CB        .byte $CB    ; <ぺ>
- D - I - 0x03840E 24:83FE: CE        .byte $CE    ; <ピ>
- D - I - 0x03840F 24:83FF: CF        .byte $CF    ; <プ>
- D - I - 0x038410 24:8400: FF        .byte $FF
- D - I - 0x038411 24:8401: FF        .byte $FF
- D - I - 0x038412 24:8402: FF        .byte $FF
- D - I - 0x038413 24:8403: FF        .byte $FF
- D - I - 0x038414 24:8404: CC        .byte $CC    ; <ぽ>
- D - I - 0x038415 24:8405: FF        .byte $FF
- D - I - 0x038416 24:8406: C6        .byte $C6    ; <ベ>
- D - I - 0x038417 24:8407: C3        .byte $C3    ; <バ>
- D - I - 0x038418 24:8408: D0        .byte $D0    ; <ペ>
- D - I - 0x038419 24:8409: 00        .byte $00

- D - I - 0x03841A 24:840A: 00        .byte $00
- D - I - 0x03841B 24:840B: 00        .byte $00
- D - I - 0x03841C 24:840C: CC        .byte $CC    ; <ぽ>
- D - I - 0x03841D 24:840D: FF        .byte $FF
- D - I - 0x03841E 24:840E: FF        .byte $FF
- D - I - 0x03841F 24:840F: FF        .byte $FF
- D - I - 0x038420 24:8410: CC        .byte $CC    ; <ぽ>
- D - I - 0x038421 24:8411: FF        .byte $FF
- D - I - 0x038422 24:8412: FF        .byte $FF
- D - I - 0x038423 24:8413: FF        .byte $FF
- D - I - 0x038424 24:8414: FF        .byte $FF
- D - I - 0x038425 24:8415: FF        .byte $FF
- D - I - 0x038426 24:8416: CC        .byte $CC    ; <ぽ>
- D - I - 0x038427 24:8417: FF        .byte $FF
- D - I - 0x038428 24:8418: FF        .byte $FF
- D - I - 0x038429 24:8419: FF        .byte $FF
- D - I - 0x03842A 24:841A: FF        .byte $FF
- D - I - 0x03842B 24:841B: FF        .byte $FF
- D - I - 0x03842C 24:841C: CC        .byte $CC    ; <ぽ>
- D - I - 0x03842D 24:841D: FF        .byte $FF
- D - I - 0x03842E 24:841E: FF        .byte $FF
- D - I - 0x03842F 24:841F: FF        .byte $FF
- D - I - 0x038430 24:8420: D0        .byte $D0    ; <ペ>
- D - I - 0x038431 24:8421: 00        .byte $00

- D - I - 0x038432 24:8422: 00        .byte $00
- D - I - 0x038433 24:8423: 00        .byte $00
- D - I - 0x038434 24:8424: C6        .byte $C6    ; <ベ>
- D - I - 0x038435 24:8425: C3        .byte $C3    ; <バ>
- D - I - 0x038436 24:8426: C3        .byte $C3    ; <バ>
- D - I - 0x038437 24:8427: C3        .byte $C3    ; <バ>
- D - I - 0x038438 24:8428: CC        .byte $CC    ; <ぽ>
- D - I - 0x038439 24:8429: FF        .byte $FF
- D - I - 0x03843A 24:842A: FF        .byte $FF
- D - I - 0x03843B 24:842B: FF        .byte $FF
- D - I - 0x03843C 24:842C: FF        .byte $FF
- D - I - 0x03843D 24:842D: FF        .byte $FF
- D - I - 0x03843E 24:842E: CC        .byte $CC    ; <ぽ>
- D - I - 0x03843F 24:842F: FF        .byte $FF
- D - I - 0x038440 24:8430: FF        .byte $FF
- D - I - 0x038441 24:8431: FF        .byte $FF
- D - I - 0x038442 24:8432: FF        .byte $FF
- D - I - 0x038443 24:8433: FF        .byte $FF
- D - I - 0x038444 24:8434: C6        .byte $C6    ; <ベ>
- D - I - 0x038445 24:8435: C3        .byte $C3    ; <バ>
- D - I - 0x038446 24:8436: C3        .byte $C3    ; <バ>
- D - I - 0x038447 24:8437: C3        .byte $C3    ; <バ>
- D - I - 0x038448 24:8438: D0        .byte $D0    ; <ペ>
- D - I - 0x038449 24:8439: 00        .byte $00

- D - I - 0x03844A 24:843A: 00        .byte $00
- D - I - 0x03844B 24:843B: 00        .byte $00
- D - I - 0x03844C 24:843C: CC        .byte $CC    ; <ぽ>
- D - I - 0x03844D 24:843D: FF        .byte $FF
- D - I - 0x03844E 24:843E: FF        .byte $FF
- D - I - 0x03844F 24:843F: FF        .byte $FF
- D - I - 0x038450 24:8440: FF        .byte $FF
- D - I - 0x038451 24:8441: FF        .byte $FF
- D - I - 0x038452 24:8442: FF        .byte $FF
- D - I - 0x038453 24:8443: FF        .byte $FF
- D - I - 0x038454 24:8444: FF        .byte $FF
- D - I - 0x038455 24:8445: FF        .byte $FF
- D - I - 0x038456 24:8446: CC        .byte $CC    ; <ぽ>
- D - I - 0x038457 24:8447: FF        .byte $FF
- D - I - 0x038458 24:8448: FF        .byte $FF
- D - I - 0x038459 24:8449: FF        .byte $FF
- D - I - 0x03845A 24:844A: FF        .byte $FF
- D - I - 0x03845B 24:844B: FF        .byte $FF
- D - I - 0x03845C 24:844C: FF        .byte $FF
- D - I - 0x03845D 24:844D: FF        .byte $FF
- D - I - 0x03845E 24:844E: FF        .byte $FF
- D - I - 0x03845F 24:844F: FF        .byte $FF
- D - I - 0x038460 24:8450: D0        .byte $D0    ; <ペ>
- D - I - 0x038461 24:8451: 00        .byte $00

- D - I - 0x038462 24:8452: 00        .byte $00
- D - I - 0x038463 24:8453: 00        .byte $00
- D - I - 0x038464 24:8454: C6        .byte $C6    ; <ベ>
- D - I - 0x038465 24:8455: C3        .byte $C3    ; <バ>
- D - I - 0x038466 24:8456: C3        .byte $C3    ; <バ>
- D - I - 0x038467 24:8457: C3        .byte $C3    ; <バ>
- D - I - 0x038468 24:8458: C3        .byte $C3    ; <バ>
- D - I - 0x038469 24:8459: C3        .byte $C3    ; <バ>
- D - I - 0x03846A 24:845A: C3        .byte $C3    ; <バ>
- D - I - 0x03846B 24:845B: C3        .byte $C3    ; <バ>
- D - I - 0x03846C 24:845C: C3        .byte $C3    ; <バ>
- D - I - 0x03846D 24:845D: C3        .byte $C3    ; <バ>
- D - I - 0x03846E 24:845E: C6        .byte $C6    ; <ベ>
- D - I - 0x03846F 24:845F: C3        .byte $C3    ; <バ>
- D - I - 0x038470 24:8460: C3        .byte $C3    ; <バ>
- D - I - 0x038471 24:8461: C3        .byte $C3    ; <バ>
- D - I - 0x038472 24:8462: C3        .byte $C3    ; <バ>
- D - I - 0x038473 24:8463: C3        .byte $C3    ; <バ>
- D - I - 0x038474 24:8464: C3        .byte $C3    ; <バ>
- D - I - 0x038475 24:8465: C3        .byte $C3    ; <バ>
- D - I - 0x038476 24:8466: C3        .byte $C3    ; <バ>
- D - I - 0x038477 24:8467: C3        .byte $C3    ; <バ>
- D - I - 0x038478 24:8468: D0        .byte $D0    ; <ペ>
- D - I - 0x038479 24:8469: 00        .byte $00



loc_846A_0A:
C D - - - 0x03847A 24:846A: A9 00     LDA #$00
C - - - - 0x03847C 24:846C: 8D 28 06  STA ram_индекс_буфера
C - - - - 0x03847F 24:846F: AD 3C 04  LDA ram_подтип_действия_атаки
C - - - - 0x038482 24:8472: 29 3F     AND #$3F
C - - - - 0x038484 24:8474: D0 22     BNE bra_8498_выход
C - - - - 0x038486 24:8476: AE 35 06  LDX $0635
C - - - - 0x038489 24:8479: AC 37 06  LDY $0637
C - - - - 0x03848C 24:847C: 20 99 84  JSR sub_8499
C - - - - 0x03848F 24:847F: AA        TAX
C - - - - 0x038490 24:8480: D0 16     BNE bra_8498_выход
C - - - - 0x038492 24:8482: AD 38 06  LDA $0638
C - - - - 0x038495 24:8485: 20 36 C5  JSR sub_0x03CDD9_проверить_координаты_игрока
C - - - - 0x038498 24:8488: 20 99 84  JSR sub_8499
C - - - - 0x03849B 24:848B: C9 00     CMP #$00
C - - - - 0x03849D 24:848D: F0 09     BEQ bra_8498_выход
C - - - - 0x03849F 24:848F: C9 04     CMP #$04
C - - - - 0x0384A1 24:8491: F0 05     BEQ bra_8498_выход
C - - - - 0x0384A3 24:8493: A9 80     LDA #$80
C - - - - 0x0384A5 24:8495: 8D 28 06  STA ram_индекс_буфера
bra_8498_выход:
C - - - - 0x0384A8 24:8498: 60        RTS

sub_8499:
C - - - - 0x0384A9 24:8499: AD FB 05  LDA ram_команда_с_мячом
C - - - - 0x0384AC 24:849C: D0 04     BNE bra_84A2
C - - - - 0x0384AE 24:849E: 8A        TXA
C - - - - 0x0384AF 24:849F: 49 FF     EOR #$FF
C - - - - 0x0384B1 24:84A1: AA        TAX
bra_84A2:
C - - - - 0x0384B2 24:84A2: E0 60     CPX #$60
C - - - - 0x0384B4 24:84A4: B0 18     BCS bra_84BE_выход
C - - - - 0x0384B6 24:84A6: 98        TYA
C - - - - 0x0384B7 24:84A7: 10 02     BPL bra_84AB
C - - - - 0x0384B9 24:84A9: 49 FF     EOR #$FF
bra_84AB:
C - - - - 0x0384BB 24:84AB: A8        TAY
C - - - - 0x0384BC 24:84AC: 20 39 C5  JSR sub_0x03CDF2
C - - - - 0x0384BF 24:84AF: A2 00     LDX #$00
bra_84B1:
C - - - - 0x0384C1 24:84B1: DD BE 8B  CMP tbl_8BBE,X
C - - - - 0x0384C4 24:84B4: F0 04     BEQ bra_84BA
C - - - - 0x0384C6 24:84B6: E8        INX
C - - - - 0x0384C7 24:84B7: E8        INX
C - - - - 0x0384C8 24:84B8: D0 F7     BNE bra_84B1
bra_84BA:
C - - - - 0x0384CA 24:84BA: BD BF 8B  LDA tbl_8BBE + 1,X
C - - - - 0x0384CD 24:84BD: 60        RTS
bra_84BE_выход:
C - - - - 0x0384CE 24:84BE: 68        PLA
C - - - - 0x0384CF 24:84BF: 68        PLA
C - - - - 0x0384D0 24:84C0: 60        RTS

loc_84C1_0E:
C D - - - 0x0384D1 24:84C1: AD FB 05  LDA ram_команда_с_мячом
C - - - - 0x0384D4 24:84C4: F0 2D     BEQ bra_84F3
C - - - - 0x0384D6 24:84C6: A9 00     LDA #$00
C - - - - 0x0384D8 24:84C8: 8D 3C 04  STA ram_подтип_действия_атаки
C - - - - 0x0384DB 24:84CB: 8D 3E 04  STA ram_подтип_действия_защиты
C - - - - 0x0384DE 24:84CE: A2 00     LDX #$00
C - - - - 0x0384E0 24:84D0: AD E2 00  LDA ram_рандом_2
C - - - - 0x0384E3 24:84D3: C9 1F     CMP #$1F
C - - - - 0x0384E5 24:84D5: B0 08     BCS bra_84DF
C - - - - 0x0384E7 24:84D7: 20 20 8A  JSR sub_8A20
C - - - - 0x0384EA 24:84DA: 20 09 8A  JSR sub_8A09_запись_номера_принимающего
C - - - - 0x0384ED 24:84DD: A2 01     LDX #$01
bra_84DF:
C - - - - 0x0384EF 24:84DF: 8E 3B 04  STX ram_действие_атаки
C - - - - 0x0384F2 24:84E2: AD 41 04  LDA ram_игрок_с_мячом
C - - - - 0x0384F5 24:84E5: 20 06 8C  JSR sub_8C06
C - - - - 0x0384F8 24:84E8: AD 30 04  LDA $0430
C - - - - 0x0384FB 24:84EB: F0 03     BEQ bra_84F0
C - - - - 0x0384FD 24:84ED: AD 31 04  LDA $0431
bra_84F0:
C - - - - 0x038500 24:84F0: 8D 3C 04  STA ram_подтип_действия_атаки
bra_84F3:
C - - - - 0x038503 24:84F3: AD E3 00  LDA ram_рандом_3
C - - - - 0x038506 24:84F6: 29 01     AND #$01
C - - - - 0x038508 24:84F8: 4D 12 06  EOR ram_результат_защитника
C - - - - 0x03850B 24:84FB: 8D 12 06  STA ram_результат_защитника
C - - - - 0x03850E 24:84FE: 60        RTS

loc_84FF_0D_рандом_стороны_кипера_в_пк:
C D - - - 0x03850F 24:84FF: AE FB 05  LDX ram_команда_с_мячом
C - - - - 0x038512 24:8502: F0 02     BEQ bra_8506_мяч_у_команды_слева
C - - - - 0x038514 24:8504: A2 03     LDX #$03
bra_8506_мяч_у_команды_слева:
C - - - - 0x038516 24:8506: AD E2 00  LDA ram_рандом_2
C - - - - 0x038519 24:8509: 6D E3 00  ADC ram_рандом_3
C - - - - 0x03851C 24:850C: A0 00     LDY #$00
bra_850E_цикл:
C - - - - 0x03851E 24:850E: DD 28 85  CMP tbl_8528,X
C - - - - 0x038521 24:8511: B0 04     BCS bra_8517
C - - - - 0x038523 24:8513: C8        INY
C - - - - 0x038524 24:8514: E8        INX
C - - - - 0x038525 24:8515: D0 F7     BNE bra_850E_цикл
bra_8517:
C - - - - 0x038527 24:8517: 98        TYA
C - - - - 0x038528 24:8518: 18        CLC
C - - - - 0x038529 24:8519: 69 07     ADC #$07
C - - - - 0x03852B 24:851B: AE FB 05  LDX ram_команда_с_мячом
C - - - - 0x03852E 24:851E: F0 04     BEQ bra_8524_мяч_у_команды_слева
C - - - - 0x038530 24:8520: 8D 3B 04  STA ram_действие_атаки
C - - - - 0x038533 24:8523: 60        RTS
bra_8524_мяч_у_команды_слева:
C - - - - 0x038534 24:8524: 8D 3D 04  STA ram_действие_защиты
C - - - - 0x038537 24:8527: 60        RTS

tbl_8528:
- D - - - 0x038538 24:8528: B3        .byte $B3    ; <ぼ>
- D - - - 0x038539 24:8529: 4F        .byte $4F    ; <ソ>
- D - - - 0x03853A 24:852A: 00        .byte $00
- D - - - 0x03853B 24:852B: AA        .byte $AA    ; <だ>
- D - - - 0x03853C 24:852C: 54        .byte $54    ; <ト>
- D - - - 0x03853D 24:852D: 00        .byte $00

loc_852E_09:
C D - - - 0x03853E 24:852E: A0 06     LDY #$06
C - - - - 0x038540 24:8530: B1 38     LDA (ram_enemy_data),Y
C - - - - 0x038542 24:8532: 29 01     AND #$01
C - - - - 0x038544 24:8534: 0A        ASL
C - - - - 0x038545 24:8535: 6D 1E 06  ADC $061E
C - - - - 0x038548 24:8538: 8D 1E 06  STA $061E
C - - - - 0x03854B 24:853B: B1 38     LDA (ram_enemy_data),Y
C - - - - 0x03854D 24:853D: 4A        LSR
C - - - - 0x03854E 24:853E: 4A        LSR
C - - - - 0x03854F 24:853F: 4A        LSR
C - - - - 0x038550 24:8540: 4A        LSR
C - - - - 0x038551 24:8541: 18        CLC
C - - - - 0x038552 24:8542: 69 0A     ADC #$0A
C - - - - 0x038554 24:8544: 8D 41 04  STA ram_игрок_с_мячом
C - - - - 0x038557 24:8547: A9 00     LDA #$00
C - - - - 0x038559 24:8549: 85 3C     STA ram_003C
C - - - - 0x03855B 24:854B: A0 07     LDY #$07
C - - - - 0x03855D 24:854D: B1 38     LDA (ram_enemy_data),Y
C - - - - 0x03855F 24:854F: 20 EB 8A  JSR sub_8AEB_умножить_на_30h
C - - - - 0x038562 24:8552: 18        CLC
C - - - - 0x038563 24:8553: A5 3C     LDA ram_003C
C - - - - 0x038565 24:8555: 69 2E     ADC #< tbl_B12E
C - - - - 0x038567 24:8557: 85 3C     STA ram_003C
C - - - - 0x038569 24:8559: 8A        TXA
C - - - - 0x03856A 24:855A: 69 B1     ADC #> tbl_B12E
C - - - - 0x03856C 24:855C: 85 3D     STA ram_003D
C - - - - 0x03856E 24:855E: A9 00     LDA #$00
C - - - - 0x038570 24:8560: 8D 3C 04  STA ram_подтип_действия_атаки
C - - - - 0x038573 24:8563: 85 3E     STA ram_003E
C - - - - 0x038575 24:8565: 20 0B 8B  JSR sub_8B0B_рандом_действия
C - - - - 0x038578 24:8568: 8D 3B 04  STA ram_действие_атаки
C - - - - 0x03857E 24:856E: 20 09 C5  JSR sub_0x03CBA9_байты_после_JSR_для_непрямого_прыжка
- - - - - 0x038581 24:8571: DF 87     .word ofs_87DF_00_shoot
- D - I - 0x038583 24:8573: E9 87     .word ofs_87E9_01_pass
- D - I - 0x038585 24:8575: 83 85     .word ofs_8583_02_dribble___
; bzk наверняка куча лишнего, а судя по 0x0387ED возможно немного неправильно закомментировано
- - - - - 0x038587 24:8577: 83 85     .word ofs_8583_02_dribble___      ; 1-2 pass
- - - - - 0x038589 24:8579: 83 85     .word ofs_8583_02_dribble___      ; trap
- - - - - 0x03858B 24:857B: 83 85     .word ofs_8583_02_dribble___      ; through
- - - - - 0x03858D 24:857D: 83 85     .word ofs_8583_02_dribble___      ; clear
- - - - - 0x03858F 24:857F: 83 85     .word ofs_8583_02_dribble___      ; ???
- - - - - 0x038591 24:8581: 83 85     .word ofs_8583_02_dribble___      ; ???

ofs_8583_02_dribble___:
C - J - - 0x038593 24:8583: A0 08     LDY #$08
C - - - - 0x038595 24:8585: B1 38     LDA (ram_enemy_data),Y
C - - - - 0x038597 24:8587: 20 5E 89  JSR sub_895E
C - - - - 0x03859A 24:858A: 4A        LSR
C - - - - 0x03859B 24:858B: 4A        LSR
C - - - - 0x03859C 24:858C: C9 0F     CMP #$0F
C - - - - 0x03859E 24:858E: D0 06     BNE bra_8596
- - - - - 0x0385A0 24:8590: 20 20 8A  JSR sub_8A20
- - - - - 0x0385A3 24:8593: 4C 99 85  JMP loc_8599
bra_8596:
C - - - - 0x0385A6 24:8596: 18        CLC
C - - - - 0x0385A7 24:8597: 69 0A     ADC #$0A
loc_8599:
C - - - - 0x0385A9 24:8599: CD 41 04  CMP ram_игрок_с_мячом
C - - - - 0x0385AC 24:859C: D0 09     BNE bra_85A7
C - - - - 0x0385AE 24:859E: 18        CLC
C - - - - 0x0385AF 24:859F: 69 01     ADC #$01
C - - - - 0x0385B1 24:85A1: C9 16     CMP #$16
C - - - - 0x0385B3 24:85A3: 90 02     BCC bra_85A7
- - - - - 0x0385B5 24:85A5: A9 0C     LDA #$0C
bra_85A7:
C - - - - 0x0385B7 24:85A7: 20 09 8A  JSR sub_8A09_запись_номера_принимающего
C - - - - 0x0385BA 24:85AA: A9 01     LDA #$01
C - - - - 0x0385BC 24:85AC: 8D 3B 04  STA ram_действие_атаки
C - - - - 0x0385BF 24:85AF: A9 00     LDA #$00
C - - - - 0x0385C1 24:85B1: 8D 3C 04  STA ram_подтип_действия_атаки
C - - - - 0x0385C4 24:85B4: 60        RTS

loc_85B5:
C D - - - 0x0385C5 24:85B5: A9 00     LDA #$00
C - - - - 0x0385C7 24:85B7: 85 3D     STA ram_003D
C - - - - 0x0385C9 24:85B9: AE 21 06  LDX $0621
C - - - - 0x0385CC 24:85BC: BC 04 86  LDY tbl_8604,X
C - - - - 0x0385CF 24:85BF: 98        TYA
C - - - - 0x0385D0 24:85C0: 0A        ASL
C - - - - 0x0385D1 24:85C1: 0A        ASL
C - - - - 0x0385D2 24:85C2: 85 3E     STA ram_003E
C - - - - 0x0385D4 24:85C4: C8        INY
C - - - - 0x0385D5 24:85C5: C8        INY
C - - - - 0x0385D6 24:85C6: C8        INY
C - - - - 0x0385D7 24:85C7: C8        INY
C - - - - 0x0385D8 24:85C8: B1 3A     LDA (ram_003A),Y
C - - - - 0x0385DA 24:85CA: 0A        ASL
C - - - - 0x0385DB 24:85CB: 26 3D     ROL ram_003D
C - - - - 0x0385DD 24:85CD: 0A        ASL
C - - - - 0x0385DE 24:85CE: 26 3D     ROL ram_003D
C - - - - 0x0385E0 24:85D0: 85 3C     STA ram_003C
C - - - - 0x0385E2 24:85D2: A6 3D     LDX ram_003D
C - - - - 0x0385E4 24:85D4: 0A        ASL
C - - - - 0x0385E5 24:85D5: 26 3D     ROL ram_003D
C - - - - 0x0385E7 24:85D7: 65 3C     ADC ram_003C
C - - - - 0x0385E9 24:85D9: 85 3C     STA ram_003C
C - - - - 0x0385EB 24:85DB: 8A        TXA
C - - - - 0x0385EC 24:85DC: 65 3D     ADC ram_003D
C - - - - 0x0385EE 24:85DE: AA        TAX
C - - - - 0x0385EF 24:85DF: A5 3C     LDA ram_003C
C - - - - 0x0385F1 24:85E1: 18        CLC
C - - - - 0x0385F2 24:85E2: 69 2E     ADC #< tbl_BA2E
C - - - - 0x0385F4 24:85E4: 85 3C     STA ram_003C
C - - - - 0x0385F6 24:85E6: 8A        TXA
C - - - - 0x0385F7 24:85E7: 69 BA     ADC #> tbl_BA2E
C - - - - 0x0385F9 24:85E9: 85 3D     STA ram_003D
C - - - - 0x0385FB 24:85EB: 20 0B 8B  JSR sub_8B0B_рандом_действия
C - - - - 0x0385FE 24:85EE: 8D 3D 04  STA ram_действие_защиты
C - - - - 0x038601 24:85F1: AA        TAX
C - - - - 0x038602 24:85F2: AD 42 04  LDA ram_игрок_без_мяча
C - - - - 0x038605 24:85F5: 20 A6 8D  JSR sub_8DA6
C - - - - 0x038608 24:85F8: AD 30 04  LDA $0430
C - - - - 0x03860B 24:85FB: F0 03     BEQ bra_8600
C - - - - 0x03860D 24:85FD: AD 31 04  LDA $0431
bra_8600:
C - - - - 0x038610 24:8600: 8D 3E 04  STA ram_подтип_действия_защиты
C - - - - 0x038613 24:8603: 60        RTS

tbl_8604:
- D - - - 0x038614 24:8604: 00        .byte $00
- D - - - 0x038615 24:8605: 01        .byte $01    ; <あ>
- - - - - 0x038616 24:8606: FF        .byte $FF
- D - - - 0x038617 24:8607: 02        .byte $02    ; <い>
- D - - - 0x038618 24:8608: 00        .byte $00

loc_8609_02:
C D - - - 0x038619 24:8609: AD FB 05  LDA ram_команда_с_мячом
C - - - - 0x03861C 24:860C: F0 03     BEQ bra_8611
C - - - - 0x03861E 24:860E: 4C 5D 87  JMP loc_875D
bra_8611:
C - - - - 0x038621 24:8611: AD 00 06  LDA ram_колво_защитников
C - - - - 0x038624 24:8614: F0 28     BEQ bra_863E_выход
C - - - - 0x038626 24:8616: A9 00     LDA #$00
bra_8618_цикл:
C - - - - 0x038628 24:8618: 48        PHA
C - - - - 0x038629 24:8619: A9 01     LDA #$01
C - - - - 0x03862B 24:861B: 20 15 C5  JSR sub_0x03CB1F_задержка
C - - - - 0x03862E 24:861E: 68        PLA
C - - - - 0x03862F 24:861F: 48        PHA
C - - - - 0x038630 24:8620: 85 40     STA ram_0040
C - - - - 0x038632 24:8622: AA        TAX
C - - - - 0x038633 24:8623: BD 01 06  LDA ram_номер_защитника,X
C - - - - 0x038636 24:8626: 20 3F 86  JSR sub_863F
C - - - - 0x038639 24:8629: 68        PLA
C - - - - 0x03863A 24:862A: AA        TAX
C - - - - 0x03863B 24:862B: AD 3D 04  LDA ram_действие_защиты
C - - - - 0x03863E 24:862E: 9D 0B 06  STA ram_действие_защитника,X
C - - - - 0x038641 24:8631: AD 3E 04  LDA ram_подтип_действия_защиты
C - - - - 0x038644 24:8634: 9D 06 06  STA ram_подтип_действия_защитника,X
C - - - - 0x038647 24:8637: E8        INX
C - - - - 0x038648 24:8638: 8A        TXA
C - - - - 0x038649 24:8639: CD 00 06  CMP ram_колво_защитников
C - - - - 0x03864C 24:863C: D0 DA     BNE bra_8618_цикл
bra_863E_выход:
C - - - - 0x03864E 24:863E: 60        RTS

sub_863F:
C - - - - 0x03864F 24:863F: 8D 42 04  STA ram_игрок_без_мяча
C - - - - 0x038652 24:8642: 20 62 8A  JSR sub_8A62
C - - - - 0x038655 24:8645: A9 00     LDA #$00
C - - - - 0x038657 24:8647: 85 3C     STA ram_003C
C - - - - 0x038659 24:8649: AD 42 04  LDA ram_игрок_без_мяча
C - - - - 0x03865C 24:864C: C9 0B     CMP #$0B
C - - - - 0x03865E 24:864E: D0 03     BNE bra_8653
C - - - - 0x038660 24:8650: 4C B5 85  JMP loc_85B5
bra_8653:
C - - - - 0x038663 24:8653: AC 21 06  LDY $0621
C - - - - 0x038666 24:8656: B9 B5 86  LDA tbl_86B5,Y
C - - - - 0x038669 24:8659: 85 3C     STA ram_003C
C - - - - 0x03866B 24:865B: F0 06     BEQ bra_8663
C - - - - 0x03866D 24:865D: 20 B3 8A  JSR sub_8AB3
C - - - - 0x038670 24:8660: 4C 8E 86  JMP loc_868E
bra_8663:
C - - - - 0x038673 24:8663: AD 35 06  LDA $0635
C - - - - 0x038676 24:8666: 49 FF     EOR #$FF
C - - - - 0x038678 24:8668: AA        TAX
C - - - - 0x038679 24:8669: A9 14     LDA #$14
C - - - - 0x03867B 24:866B: E0 A0     CPX #$A0
C - - - - 0x03867D 24:866D: B0 1F     BCS bra_868E
C - - - - 0x03867F 24:866F: A9 10     LDA #$10
C - - - - 0x038681 24:8671: E0 60     CPX #$60
C - - - - 0x038683 24:8673: B0 19     BCS bra_868E
C - - - - 0x038685 24:8675: AD 37 06  LDA $0637
C - - - - 0x038688 24:8678: 10 02     BPL bra_867C
C - - - - 0x03868A 24:867A: 49 FF     EOR #$FF
bra_867C:
C - - - - 0x03868C 24:867C: A8        TAY
C - - - - 0x03868D 24:867D: 20 39 C5  JSR sub_0x03CDF2
C - - - - 0x038690 24:8680: A2 00     LDX #$00
bra_8682:
C - - - - 0x038692 24:8682: DD BE 8B  CMP tbl_8BBE,X
C - - - - 0x038695 24:8685: F0 04     BEQ bra_868B
C - - - - 0x038697 24:8687: E8        INX
C - - - - 0x038698 24:8688: E8        INX
C - - - - 0x038699 24:8689: D0 F7     BNE bra_8682
bra_868B:
C - - - - 0x03869B 24:868B: BD BF 8B  LDA tbl_8BBE + 1,X
bra_868E:
loc_868E:
C D - - - 0x03869E 24:868E: A0 07     LDY #$07
C - - - - 0x0386A0 24:8690: 20 DE 8A  JSR sub_8ADE
C - - - - 0x0386A3 24:8693: 18        CLC
C - - - - 0x0386A4 24:8694: A5 3C     LDA ram_003C
C - - - - 0x0386A6 24:8696: 69 AE     ADC #< tbl_B8AE
C - - - - 0x0386A8 24:8698: 85 3C     STA ram_003C
C - - - - 0x0386AA 24:869A: 8A        TXA
C - - - - 0x0386AB 24:869B: 69 B8     ADC #> tbl_B8AE
C - - - - 0x0386AD 24:869D: 85 3D     STA ram_003D
C - - - - 0x0386AF 24:869F: 20 0B 8B  JSR sub_8B0B_рандом_действия
C - - - - 0x0386B2 24:86A2: 8D 3D 04  STA ram_действие_защиты
C - - - - 0x0386B5 24:86A5: A9 00     LDA #$00
C - - - - 0x0386B7 24:86A7: 8D 3E 04  STA ram_подтип_действия_защиты
C - - - - 0x0386BA 24:86AA: A5 3F     LDA ram_003F
C - - - - 0x0386BC 24:86AC: 20 09 C5  JSR sub_0x03CBA9_байты_после_JSR_для_непрямого_прыжка
- D - I - 0x0386BF 24:86AF: BA 86     .word ofs_86BA_00
- D - I - 0x0386C1 24:86B1: EB 86     .word ofs_86EB_01
- D - I - 0x0386C3 24:86B3: 10 87     .word ofs_8710_02

tbl_86B5:
- D - - - 0x0386C5 24:86B5: 00        .byte $00
- D - - - 0x0386C6 24:86B6: 02        .byte $02    ; <い>
- D - - - 0x0386C7 24:86B7: 01        .byte $01    ; <あ>
- - - - - 0x0386C8 24:86B8: 00        .byte $00
- - - - - 0x0386C9 24:86B9: 00        .byte $00

ofs_86BA_00:
C - J - - 0x0386CA 24:86BA: AD 3D 04  LDA ram_действие_защиты
C - - - - 0x0386CD 24:86BD: 20 09 C5  JSR sub_0x03CBA9_байты_после_JSR_для_непрямого_прыжка
- D - I - 0x0386D0 24:86C0: C8 86     .word ofs_86C8_00
- D - I - 0x0386D2 24:86C2: D0 86     .word ofs_86D0_01
- D - I - 0x0386D4 24:86C4: D8 86     .word ofs_86D8_02
- D - I - 0x0386D6 24:86C6: E0 86     .word ofs_86E0_03

ofs_86C8_00:
C - J - - 0x0386D8 24:86C8: A9 01     LDA #$01
C - - - - 0x0386DA 24:86CA: 8D 3D 04  STA ram_действие_защиты
C - - - - 0x0386DD 24:86CD: 4C 32 87  JMP loc_8732

ofs_86D0_01:
ofs_8705_02:
ofs_8727_02:
C D J - - 0x0386E0 24:86D0: A9 02     LDA #$02
C - - - - 0x0386E2 24:86D2: 8D 3D 04  STA ram_действие_защиты
C - - - - 0x0386E5 24:86D5: 4C 32 87  JMP loc_8732

ofs_86D8_02:
C - J - - 0x0386E8 24:86D8: A9 00     LDA #$00
C - - - - 0x0386EA 24:86DA: 8D 3D 04  STA ram_действие_защиты
C - - - - 0x0386ED 24:86DD: 4C 32 87  JMP loc_8732

ofs_86E0_03:
C - J - - 0x0386F0 24:86E0: A9 01     LDA #$01
C - - - - 0x0386F2 24:86E2: 8D 3D 04  STA ram_действие_защиты
C - - - - 0x0386F5 24:86E5: A9 05     LDA #$05
C - - - - 0x0386F7 24:86E7: 8D 3E 04  STA ram_подтип_действия_защиты
C - - - - 0x0386FA 24:86EA: 60        RTS

ofs_86EB_01:
C - J - - 0x0386FB 24:86EB: AD 3D 04  LDA ram_действие_защиты
C - - - - 0x0386FE 24:86EE: 20 09 C5  JSR sub_0x03CBA9_байты_после_JSR_для_непрямого_прыжка
- D - I - 0x038701 24:86F1: F9 86     .word ofs_86F9_00
- D - I - 0x038703 24:86F3: FF 86     .word ofs_86FF_01
- D - I - 0x038705 24:86F5: 05 87     .word ofs_8705_02
- D - I - 0x038707 24:86F7: 08 87     .word ofs_8708_03

ofs_871E_00:
ofs_86F9_00:
C D - - - 0x038709 24:86F9: A9 05     LDA #$05
C - - - - 0x03870B 24:86FB: 8D 3D 04  STA ram_действие_защиты
C - - - - 0x03870E 24:86FE: 60        RTS

loc_86FF:
ofs_86FF_01:
C D J - - 0x03870F 24:86FF: A9 04     LDA #$04
C - - - - 0x038711 24:8701: 8D 3D 04  STA ram_действие_защиты
C - - - - 0x038714 24:8704: 60        RTS

ofs_8708_03:
C - J - - 0x038718 24:8708: A9 01     LDA #$01
C - - - - 0x03871A 24:870A: 8D 3E 04  STA ram_подтип_действия_защиты
C - - - - 0x03871D 24:870D: 4C FF 86  JMP loc_86FF

ofs_8710_02:
C - J - - 0x038720 24:8710: AD 3D 04  LDA ram_действие_защиты
C - - - - 0x038723 24:8713: 20 09 C5  JSR sub_0x03CBA9_байты_после_JSR_для_непрямого_прыжка
- D - I - 0x038726 24:8716: 1E 87     .word ofs_871E_00
- D - I - 0x038728 24:8718: 21 87     .word ofs_8721_01
- D - I - 0x03872A 24:871A: 27 87     .word ofs_8727_02
- D - I - 0x03872C 24:871C: 2A 87     .word ofs_872A_03

loc_8721:
ofs_8721_01:
C D J - - 0x038731 24:8721: A9 03     LDA #$03
C - - - - 0x038733 24:8723: 8D 3D 04  STA ram_действие_защиты
C - - - - 0x038736 24:8726: 60        RTS

ofs_872A_03:
C - J - - 0x03873A 24:872A: A9 01     LDA #$01
C - - - - 0x03873C 24:872C: 8D 3E 04  STA ram_подтип_действия_защиты
C - - - - 0x03873F 24:872F: 4C 21 87  JMP loc_8721

loc_8732:
C D - - - 0x038742 24:8732: AD 42 04  LDA ram_игрок_без_мяча
C - - - - 0x038745 24:8735: AE 3D 04  LDX ram_действие_защиты
C - - - - 0x038748 24:8738: 20 58 8D  JSR sub_8D58
C - - - - 0x03874B 24:873B: AD 30 04  LDA $0430
C - - - - 0x03874E 24:873E: F0 03     BEQ bra_8743
C - - - - 0x038750 24:8740: AD 31 04  LDA $0431
bra_8743:
C - - - - 0x038753 24:8743: 8D 3E 04  STA ram_подтип_действия_защиты
C - - - - 0x038756 24:8746: 60        RTS

loc_875D:
C D - - - 0x03876D 24:875D: AD 41 04  LDA ram_игрок_с_мячом
C - - - - 0x038770 24:8760: 20 62 8A  JSR sub_8A62
C - - - - 0x038773 24:8763: AC 21 06  LDY $0621
C - - - - 0x038776 24:8766: B9 C3 87  LDA tbl_87C3,Y
C - - - - 0x038779 24:8769: 85 3C     STA ram_003C
C - - - - 0x03877B 24:876B: F0 06     BEQ bra_8773
C - - - - 0x03877D 24:876D: 20 B3 8A  JSR sub_8AB3
C - - - - 0x038780 24:8770: 4C 9C 87  JMP loc_879C
bra_8773:
C - - - - 0x038783 24:8773: A9 14     LDA #$14
C - - - - 0x038785 24:8775: AE 35 06  LDX $0635
C - - - - 0x038788 24:8778: E0 A0     CPX #$A0
C - - - - 0x03878A 24:877A: B0 20     BCS bra_879C
C - - - - 0x03878C 24:877C: A9 10     LDA #$10
C - - - - 0x03878E 24:877E: E0 60     CPX #$60
C - - - - 0x038790 24:8780: B0 1A     BCS bra_879C
C - - - - 0x038792 24:8782: AC 37 06  LDY $0637
C - - - - 0x038795 24:8785: 10 04     BPL bra_878B
C - - - - 0x038797 24:8787: 98        TYA
C - - - - 0x038798 24:8788: 49 FF     EOR #$FF
C - - - - 0x03879A 24:878A: A8        TAY
bra_878B:
C - - - - 0x03879B 24:878B: 20 39 C5  JSR sub_0x03CDF2
C - - - - 0x03879E 24:878E: A2 00     LDX #$00
bra_8790:
C - - - - 0x0387A0 24:8790: DD BE 8B  CMP tbl_8BBE,X
C - - - - 0x0387A3 24:8793: F0 04     BEQ bra_8799
C - - - - 0x0387A5 24:8795: E8        INX
C - - - - 0x0387A6 24:8796: E8        INX
C - - - - 0x0387A7 24:8797: D0 F7     BNE bra_8790
bra_8799:
C - - - - 0x0387A9 24:8799: BD BF 8B  LDA tbl_8BBE + 1,X
bra_879C:
loc_879C:
C D - - - 0x0387AC 24:879C: A0 04     LDY #$04
C - - - - 0x0387AE 24:879E: 20 DE 8A  JSR sub_8ADE
C - - - - 0x0387B1 24:87A1: 18        CLC
C - - - - 0x0387B2 24:87A2: A5 3C     LDA ram_003C
C - - - - 0x0387B4 24:87A4: 69 2E     ADC #< tbl_B12E
C - - - - 0x0387B6 24:87A6: 85 3C     STA ram_003C
C - - - - 0x0387B8 24:87A8: 8A        TXA
C - - - - 0x0387B9 24:87A9: 69 B1     ADC #> tbl_B12E
C - - - - 0x0387BB 24:87AB: 85 3D     STA ram_003D
C - - - - 0x0387BD 24:87AD: 20 0B 8B  JSR sub_8B0B_рандом_действия
C - - - - 0x0387C0 24:87B0: 8D 3B 04  STA ram_действие_атаки
C - - - - 0x0387C3 24:87B3: A9 00     LDA #$00
C - - - - 0x0387C5 24:87B5: 8D 3C 04  STA ram_подтип_действия_атаки
C - - - - 0x0387C8 24:87B8: A5 3F     LDA ram_003F
C - - - - 0x0387CA 24:87BA: 20 09 C5  JSR sub_0x03CBA9_байты_после_JSR_для_непрямого_прыжка
- D - I - 0x0387CD 24:87BD: C7 87     .word ofs_87C7_00
- D - I - 0x0387CF 24:87BF: DA 88     .word ofs_88DA_01
- D - I - 0x0387D1 24:87C1: FD 88     .word ofs_88FD_02

tbl_87C3:
- D - - - 0x0387D3 24:87C3: 00        .byte $00
- D - - - 0x0387D4 24:87C4: 01        .byte $01    ; <あ>
- D - - - 0x0387D5 24:87C5: 02        .byte $02    ; <い>
- D - - - 0x0387D6 24:87C6: 00        .byte $00

ofs_87C7_00:
C - J - - 0x0387D7 24:87C7: AD 3B 04  LDA ram_действие_атаки
C - - - - 0x0387DA 24:87CA: 20 09 C5  JSR sub_0x03CBA9_байты_после_JSR_для_непрямого_прыжка
- - - - - 0x0387DD 24:87CD: DF 87     .word ofs_87DF_00_shoot
- D - I - 0x0387DF 24:87CF: E9 87     .word ofs_87E9_01_pass
- D - I - 0x0387E1 24:87D1: EF 87     .word ofs_8933_02_dribble
- D - I - 0x0387E3 24:87D3: F2 87     .word ofs_87F2_03_1_2_pass
- D - I - 0x0387E5 24:87D5: FA 87     .word ofs_87FA_04_trap
- D - I - 0x0387E7 24:87D7: 4A 88     .word ofs_884A_05_through
- D - I - 0x0387E9 24:87D9: 55 88     .word ofs_8855_06_clear
- D - I - 0x0387EB 24:87DB: 60 88     .word ofs_8860_07     ; ???
- D - I - 0x0387ED 24:87DD: A8 88     .word ofs_88A8_08     ; ???

ofs_87DF_00_shoot:
- - - - - 0x0387EF 24:87DF: AD E2 00  LDA ram_рандом_2
- - - - - 0x0387F2 24:87E2: 29 20     AND #$20
- - - - - 0x0387F4 24:87E4: D0 03     BNE bra_87E9
- - - - - 0x0387F6 24:87E6: 4C 27 89  JMP loc_8927
bra_87E9:
ofs_87E9_01_pass:
C - J - - 0x0387F9 24:87E9: 20 27 89  JSR sub_8927
C - - - - 0x0387FC 24:87EC: 4C 3F 8A  JMP loc_8A3F

loc_87F2_pass:
ofs_87F2_03_1_2_pass:
C D J - - 0x038802 24:87F2: A9 02     LDA #$02
C - - - - 0x038804 24:87F4: 8D 3B 04  STA ram_действие_атаки
C - - - - 0x038807 24:87F7: 4C 3F 8A  JMP loc_8A3F

ofs_87FA_04_trap:
C - J - - 0x03880A 24:87FA: A9 03     LDA #$03
C - - - - 0x03880C 24:87FC: 8D 3B 04  STA ram_действие_атаки
C - - - - 0x03880F 24:87FF: 20 3F 8A  JSR sub_8A3F
C - - - - 0x038812 24:8802: AD 3C 04  LDA ram_подтип_действия_атаки
C - - - - 0x038815 24:8805: D0 42     BNE bra_8849_выход
C - - - - 0x038817 24:8807: A9 0C     LDA #$0C
C - - - - 0x038819 24:8809: 85 3A     STA ram_003A
bra_880B_цикл:
C - - - - 0x03881B 24:880B: A5 3A     LDA ram_003A
C - - - - 0x03881D 24:880D: CD 41 04  CMP ram_игрок_с_мячом
C - - - - 0x038820 24:8810: F0 27     BEQ bra_8839
C - - - - 0x038822 24:8812: 20 0C C5  JSR sub_0x03CD8C_адрес_игрока
C - - - - 0x038825 24:8815: A0 06     LDY #con_игрок_координата_X_hi
C - - - - 0x038827 24:8817: B1 34     LDA (ram_plr_data),Y
C - - - - 0x038829 24:8819: 38        SEC
C - - - - 0x03882A 24:881A: ED 35 06  SBC $0635
C - - - - 0x03882D 24:881D: B0 04     BCS bra_8823
C - - - - 0x03882F 24:881F: 49 FF     EOR #$FF
C - - - - 0x038831 24:8821: 69 01     ADC #$01
bra_8823:
C - - - - 0x038833 24:8823: C9 14     CMP #$14
C - - - - 0x038835 24:8825: B0 12     BCS bra_8839
C - - - - 0x038837 24:8827: A0 08     LDY #con_игрок_координата_Y_hi
C - - - - 0x038839 24:8829: B1 34     LDA (ram_plr_data),Y
C - - - - 0x03883B 24:882B: 38        SEC
C - - - - 0x03883C 24:882C: ED 37 06  SBC $0637
C - - - - 0x03883F 24:882F: B0 04     BCS bra_8835
C - - - - 0x038841 24:8831: 49 FF     EOR #$FF
C - - - - 0x038843 24:8833: 69 01     ADC #$01
bra_8835:
C - - - - 0x038845 24:8835: C9 14     CMP #$14
C - - - - 0x038847 24:8837: 90 0B     BCC bra_8844
bra_8839:
C - - - - 0x038849 24:8839: E6 3A     INC ram_003A
C - - - - 0x03884B 24:883B: A5 3A     LDA ram_003A
C - - - - 0x03884D 24:883D: C9 16     CMP #$16
C - - - - 0x03884F 24:883F: D0 CA     BNE bra_880B_цикл
C - - - - 0x038851 24:8841: 4C F2 87  JMP loc_87F2_pass
bra_8844:
C - - - - 0x038854 24:8844: A5 3A     LDA ram_003A
C - - - - 0x038856 24:8846: 20 09 8A  JSR sub_8A09_запись_номера_принимающего
bra_8849_выход:
C - - - - 0x038859 24:8849: 60        RTS

ofs_884A_05_through:
C - J - - 0x03885A 24:884A: A9 00     LDA #$00
C - - - - 0x03885C 24:884C: 8D 3B 04  STA ram_действие_атаки
C - - - - 0x03885F 24:884F: A9 0C     LDA #$0C
C - - - - 0x038861 24:8851: 8D 3C 04  STA ram_подтип_действия_атаки
C - - - - 0x038864 24:8854: 60        RTS

ofs_8855_06_clear:
C - J - - 0x038865 24:8855: A9 00     LDA #$00
C - - - - 0x038867 24:8857: 8D 3B 04  STA ram_действие_атаки
C - - - - 0x03886A 24:885A: A9 0D     LDA #$0D
C - - - - 0x03886C 24:885C: 8D 3C 04  STA ram_подтип_действия_атаки
C - - - - 0x03886F 24:885F: 60        RTS

ofs_8860_07:
C - J - - 0x038870 24:8860: A9 02     LDA #$02
C - - - - 0x038872 24:8862: 8D 3B 04  STA ram_действие_атаки
C - - - - 0x038875 24:8865: 2C 4B 04  BIT $044B
C - - - - 0x038878 24:8868: 30 3D     BMI bra_88A7_выход
C - - - - 0x03887A 24:886A: A9 80     LDA #$80
C - - - - 0x03887C 24:886C: 8D 4B 04  STA $044B
C - - - - 0x03887F 24:886F: A9 0C     LDA #$0C
bra_8871:
C - - - - 0x038881 24:8871: 48        PHA
C - - - - 0x038882 24:8872: 20 0C C5  JSR sub_0x03CD8C_адрес_игрока
C - - - - 0x038885 24:8875: A0 01     LDY #con_игрок_энергия_lo
C - - - - 0x038887 24:8877: A9 80     LDA #$80
C - - - - 0x038889 24:8879: 91 34     STA (ram_plr_data),Y
C - - - - 0x03888B 24:887B: C8        INY
C - - - - 0x03888C 24:887C: A9 C8     LDA #$C8
C - - - - 0x03888E 24:887E: 91 34     STA (ram_plr_data),Y
C - - - - 0x038890 24:8880: 68        PLA
C - - - - 0x038891 24:8881: 18        CLC
C - - - - 0x038892 24:8882: 69 01     ADC #$01
C - - - - 0x038894 24:8884: C9 16     CMP #$16
C - - - - 0x038896 24:8886: D0 E9     BNE bra_8871
C - - - - 0x038898 24:8888: A9 01     LDA #$01
C - - - - 0x03889A 24:888A: 8D 2F 00  STA ram_защита_справа
C - - - - 0x03889D 24:888D: A9 00     LDA #$00
C - - - - 0x03889F 24:888F: 8D 2D 06  STA $062D
C - - - - 0x0388A2 24:8892: AD 15 06  LDA $0615
C - - - - 0x0388A5 24:8895: 29 BF     AND #$BF
C - - - - 0x0388A7 24:8897: 8D 15 06  STA $0615
C - - - - 0x0388AA 24:889A: A9 15     LDA #$15
C - - - - 0x0388AC 24:889C: 20 4E C5  JSR sub_0x03CBC0_запись_номера_сценария
C - - - - 0x0388AF 24:889F: 2C 15 06  BIT $0615
C - - - - 0x0388B2 24:88A2: 10 03     BPL bra_88A7_выход
C - - - - 0x0388B4 24:88A4: 20 75 C5  JSR sub_0x03E243
bra_88A7_выход:
C - - - - 0x0388B7 24:88A7: 60        RTS

ofs_88A8_08:
C - J - - 0x0388B8 24:88A8: A9 02     LDA #$02
C - - - - 0x0388BA 24:88AA: 8D 3B 04  STA ram_действие_атаки
C - - - - 0x0388BD 24:88AD: 2C 4C 04  BIT $044C
C - - - - 0x0388C0 24:88B0: 30 27     BMI bra_88D9_выход
C - - - - 0x0388C2 24:88B2: A9 80     LDA #$80
C - - - - 0x0388C4 24:88B4: 8D 4C 04  STA $044C
C - - - - 0x0388C7 24:88B7: 8D F1 03  STA $03F1
C - - - - 0x0388CA 24:88BA: A9 C9     LDA #$C9
C - - - - 0x0388CC 24:88BC: 8D F2 03  STA $03F2
C - - - - 0x0388CF 24:88BF: A9 00     LDA #$00
C - - - - 0x0388D1 24:88C1: 8D 2D 06  STA $062D
C - - - - 0x0388D4 24:88C4: AD 15 06  LDA $0615
C - - - - 0x0388D7 24:88C7: 29 BF     AND #$BF
C - - - - 0x0388D9 24:88C9: 8D 15 06  STA $0615
C - - - - 0x0388DC 24:88CC: A9 16     LDA #$16
C - - - - 0x0388DE 24:88CE: 20 4E C5  JSR sub_0x03CBC0_запись_номера_сценария
C - - - - 0x0388E1 24:88D1: 2C 15 06  BIT $0615
C - - - - 0x0388E4 24:88D4: 10 03     BPL bra_88D9_выход
C - - - - 0x0388E6 24:88D6: 20 75 C5  JSR sub_0x03E243
bra_88D9_выход:
C - - - - 0x0388E9 24:88D9: 60        RTS

ofs_88DA_01:
C - J - - 0x0388EA 24:88DA: AD 3B 04  LDA ram_действие_атаки
C - - - - 0x0388ED 24:88DD: 20 09 C5  JSR sub_0x03CBA9_байты_после_JSR_для_непрямого_прыжка
- D - I - 0x0388F0 24:88E0: E8 88     .word ofs_88E8_00_shoot
- D - I - 0x0388F2 24:88E2: EE 88     .word ofs_88EE_01_pass
- D - I - 0x0388F4 24:88E4: F4 88     .word ofs_8933_02_dribble
- D - I - 0x0388F6 24:88E6: F7 88     .word ofs_88F7_03_1_2_pass

ofs_88E8_00_shoot:
C - J - - 0x0388F8 24:88E8: 20 27 89  JSR sub_8927
C - - - - 0x0388FB 24:88EB: 4C 3F 8A  JMP loc_8A3F

ofs_88EE_01_pass:
C - J - - 0x0388FE 24:88EE: A9 05     LDA #$05
C - - - - 0x038900 24:88F0: 8D 3B 04  STA ram_действие_атаки
C - - - - 0x038903 24:88F3: 60        RTS

ofs_88F7_03_1_2_pass:
C - J - - 0x038907 24:88F7: A9 04     LDA #$04
C - - - - 0x038909 24:88F9: 8D 3B 04  STA ram_действие_атаки
C - - - - 0x03890C 24:88FC: 60        RTS

ofs_88FD_02:
C - J - - 0x03890D 24:88FD: AD 3B 04  LDA ram_действие_атаки
C - - - - 0x038910 24:8900: 20 09 C5  JSR sub_0x03CBA9_байты_после_JSR_для_непрямого_прыжка
- D - I - 0x038913 24:8903: 0B 89     .word ofs_890B_00
- D - I - 0x038915 24:8905: 11 89     .word ofs_8911_01
- D - I - 0x038917 24:8907: 17 89     .word ofs_8917_02
- D - I - 0x038919 24:8909: 1A 89     .word ofs_891A_03

ofs_890B_00:
C - J - - 0x03891B 24:890B: A9 04     LDA #$04
C - - - - 0x03891D 24:890D: 8D 3B 04  STA ram_действие_атаки
C - - - - 0x038920 24:8910: 60        RTS

loc_8911:
ofs_8911_01:
C D J - - 0x038921 24:8911: A9 06     LDA #$06
C - - - - 0x038923 24:8913: 8D 3B 04  STA ram_действие_атаки
C - - - - 0x038926 24:8916: 60        RTS

ofs_891A_03:
C - J - - 0x03892A 24:891A: A9 06     LDA #$06
C - - - - 0x03892C 24:891C: 8D 3B 04  STA ram_действие_атаки
C - - - - 0x03892F 24:891F: A9 01     LDA #$01
C - - - - 0x038931 24:8921: 8D 3C 04  STA ram_подтип_действия_атаки
C - - - - 0x038934 24:8924: 4C 11 89  JMP loc_8911

loc_8927:
sub_8927:
C - - - - 0x038937 24:8927: A9 00     LDA #$00
C - - - - 0x038939 24:8929: 8D 3B 04  STA ram_действие_атаки
C - - - - 0x03893C 24:892C: AD 4E 04  LDA ram_высота_мяча
C - - - - 0x03893F 24:892F: 8D 3C 04  STA ram_подтип_действия_атаки
C - - - - 0x038942 24:8932: 60        RTS

ofs_8933_02_dribble:
ofs_8917_02:
C D - - - 0x038943 24:8933: A0 0A     LDY #$0A
C - - - - 0x038945 24:8935: B1 3A     LDA (ram_003A),Y
C - - - - 0x038947 24:8937: 20 5E 89  JSR sub_895E
C - - - - 0x03894A 24:893A: 29 03     AND #$03
C - - - - 0x03894C 24:893C: 48        PHA
C - - - - 0x03894D 24:893D: B1 3C     LDA (ram_003C),Y
C - - - - 0x03894F 24:893F: 4A        LSR
C - - - - 0x038950 24:8940: 4A        LSR
C - - - - 0x038951 24:8941: C9 0F     CMP #$0F
C - - - - 0x038953 24:8943: F0 08     BEQ bra_894D
C - - - - 0x038955 24:8945: 18        CLC
C - - - - 0x038956 24:8946: 69 0A     ADC #$0A
C - - - - 0x038958 24:8948: CD 41 04  CMP ram_игрок_с_мячом
C - - - - 0x03895B 24:894B: D0 03     BNE bra_8950
bra_894D:
C - - - - 0x03895D 24:894D: 20 20 8A  JSR sub_8A20
bra_8950:
C - - - - 0x038960 24:8950: 85 3C     STA ram_003C
C - - - - 0x038962 24:8952: 68        PLA
C - - - - 0x038963 24:8953: 20 09 C5  JSR sub_0x03CBA9_байты_после_JSR_для_непрямого_прыжка
- D - I - 0x038966 24:8956: 7E 89     .word ofs_897E_00
- D - I - 0x038968 24:8958: 84 89     .word ofs_8984_01
- D - I - 0x03896A 24:895A: 93 89     .word ofs_8993_02
- D - I - 0x03896C 24:895C: 9C 89     .word ofs_899C_03

sub_895E:
C - - - - 0x03896E 24:895E: A2 00     LDX #$00
C - - - - 0x038970 24:8960: 86 3D     STX ram_003D
C - - - - 0x038972 24:8962: 0A        ASL
C - - - - 0x038973 24:8963: 26 3D     ROL ram_003D
C - - - - 0x038975 24:8965: 0A        ASL
C - - - - 0x038976 24:8966: 26 3D     ROL ram_003D
C - - - - 0x038978 24:8968: 0A        ASL
C - - - - 0x038979 24:8969: 26 3D     ROL ram_003D
C - - - - 0x03897B 24:896B: 69 2E     ADC #< tbl_B72E
C - - - - 0x03897D 24:896D: 85 3C     STA ram_003C
C - - - - 0x03897F 24:896F: A5 3D     LDA ram_003D
C - - - - 0x038981 24:8971: 69 B7     ADC #> tbl_B72E
C - - - - 0x038983 24:8973: 85 3D     STA ram_003D
C - - - - 0x038985 24:8975: AD E2 00  LDA ram_рандом_2
C - - - - 0x038988 24:8978: 29 07     AND #$07
C - - - - 0x03898A 24:897A: A8        TAY
C - - - - 0x03898B 24:897B: B1 3C     LDA (ram_003C),Y
C - - - - 0x03898D 24:897D: 60        RTS

ofs_897E_00:
C - J - - 0x03898E 24:897E: 20 B3 89  JSR sub_89B3
C - - - - 0x038991 24:8981: 4C A5 89  JMP loc_89A5

ofs_8984_01:
C - J - - 0x038994 24:8984: 20 B3 89  JSR sub_89B3
loc_8987:
C D - - - 0x038997 24:8987: 6E E2 00  ROR ram_рандом_2
C - - - - 0x03899A 24:898A: 20 20 8A  JSR sub_8A20
C - - - - 0x03899D 24:898D: 20 B3 89  JSR sub_89B3
C - - - - 0x0389A0 24:8990: 4C A5 89  JMP loc_89A5

ofs_8993_02:
C - J - - 0x0389A3 24:8993: 20 B3 89  JSR sub_89B3
C - - - - 0x0389A6 24:8996: 20 DA 89  JSR sub_89DA
C - - - - 0x0389A9 24:8999: 4C 87 89  JMP loc_8987

ofs_899C_03:
C - J - - 0x0389AC 24:899C: 20 DA 89  JSR sub_89DA
C - - - - 0x0389AF 24:899F: 20 B3 89  JSR sub_89B3
C - - - - 0x0389B2 24:89A2: 4C 87 89  JMP loc_8987

loc_89A5:
C D - - - 0x0389B5 24:89A5: AE 21 06  LDX $0621
C - - - - 0x0389B8 24:89A8: BD AF 89  LDA tbl_89AF,X
C - - - - 0x0389BB 24:89AB: 8D 3B 04  STA ram_действие_атаки
C - - - - 0x0389BE 24:89AE: 60        RTS

tbl_89AF:
- D - - - 0x0389BF 24:89AF: 02        .byte $02    ; <い>
- - - - - 0x0389C0 24:89B0: 04        .byte $04    ; <え>
- D - - - 0x0389C1 24:89B1: 04        .byte $04    ; <え>
- - - - - 0x0389C2 24:89B2: 02        .byte $02    ; <い>

sub_89B3:
C - - - - 0x0389C3 24:89B3: A5 3C     LDA ram_003C
C - - - - 0x0389C5 24:89B5: 20 0C C5  JSR sub_0x03CD8C_адрес_игрока
C - - - - 0x0389C8 24:89B8: A0 06     LDY #con_игрок_координата_X_hi
C - - - - 0x0389CA 24:89BA: AD 35 06  LDA $0635
C - - - - 0x0389CD 24:89BD: 38        SEC
C - - - - 0x0389CE 24:89BE: F1 34     SBC (ram_plr_data),Y
C - - - - 0x0389D0 24:89C0: B0 08     BCS bra_89CA
C - - - - 0x0389D2 24:89C2: AD 35 06  LDA $0635
C - - - - 0x0389D5 24:89C5: C9 60     CMP #$60
C - - - - 0x0389D7 24:89C7: 90 01     BCC bra_89CA
C - - - - 0x0389D9 24:89C9: 60        RTS
bra_89CA:
C - - - - 0x0389DA 24:89CA: A5 3C     LDA ram_003C
C - - - - 0x0389DC 24:89CC: 20 09 8A  JSR sub_8A09_запись_номера_принимающего
C - - - - 0x0389DF 24:89CF: A9 01     LDA #$01
C - - - - 0x0389E1 24:89D1: 8D 3B 04  STA ram_действие_атаки
C - - - - 0x0389E4 24:89D4: 20 3F 8A  JSR sub_8A3F
C - - - - 0x0389E7 24:89D7: 68        PLA
C - - - - 0x0389E8 24:89D8: 68        PLA
C - - - - 0x0389E9 24:89D9: 60        RTS

sub_89DA:
C - - - - 0x0389EA 24:89DA: A9 0C     LDA #$0C
C - - - - 0x0389EC 24:89DC: 85 3E     STA ram_003E
bra_89DE:
C - - - - 0x0389EE 24:89DE: A5 3E     LDA ram_003E
C - - - - 0x0389F0 24:89E0: CD 41 04  CMP ram_игрок_с_мячом
C - - - - 0x0389F3 24:89E3: F0 0B     BEQ bra_89F0
C - - - - 0x0389F5 24:89E5: 20 0C C5  JSR sub_0x03CD8C_адрес_игрока
C - - - - 0x0389F8 24:89E8: A0 06     LDY #con_игрок_координата_X_hi
C - - - - 0x0389FA 24:89EA: B1 34     LDA (ram_plr_data),Y
C - - - - 0x0389FC 24:89EC: C9 60     CMP #$60
C - - - - 0x0389FE 24:89EE: 90 09     BCC bra_89F9
bra_89F0:
C - - - - 0x038A00 24:89F0: E6 3E     INC ram_003E
C - - - - 0x038A02 24:89F2: A5 3E     LDA ram_003E
C - - - - 0x038A04 24:89F4: C9 16     CMP #$16
C - - - - 0x038A06 24:89F6: D0 E6     BNE bra_89DE
C - - - - 0x038A08 24:89F8: 60        RTS
bra_89F9:
C - - - - 0x038A09 24:89F9: A5 3E     LDA ram_003E
C - - - - 0x038A0B 24:89FB: 20 09 8A  JSR sub_8A09_запись_номера_принимающего
C - - - - 0x038A0E 24:89FE: A9 01     LDA #$01
C - - - - 0x038A10 24:8A00: 8D 3B 04  STA ram_действие_атаки
C - - - - 0x038A13 24:8A03: 20 3F 8A  JSR sub_8A3F
C - - - - 0x038A16 24:8A06: 68        PLA
C - - - - 0x038A17 24:8A07: 68        PLA
C - - - - 0x038A18 24:8A08: 60        RTS

sub_8A09_запись_номера_принимающего:
C - - - - 0x038A19 24:8A09: 8D FC 05  STA ram_принимающий
C - - - - 0x038A1C 24:8A0C: 20 0C C5  JSR sub_0x03CD8C_адрес_игрока
C - - - - 0x038A1F 24:8A0F: A0 06     LDY #con_игрок_координата_X_hi
C - - - - 0x038A21 24:8A11: B1 34     LDA (ram_plr_data),Y
C - - - - 0x038A23 24:8A13: AA        TAX
C - - - - 0x038A24 24:8A14: A0 08     LDY #con_игрок_координата_Y_hi
C - - - - 0x038A26 24:8A16: B1 34     LDA (ram_plr_data),Y
C - - - - 0x038A28 24:8A18: A8        TAY
C - - - - 0x038A29 24:8A19: 20 39 C5  JSR sub_0x03CDF2
C - - - - 0x038A2C 24:8A1C: 8D 38 06  STA $0638
C - - - - 0x038A2F 24:8A1F: 60        RTS

sub_8A20:
C - - - - 0x038A30 24:8A20: AD E2 00  LDA ram_рандом_2
C - - - - 0x038A33 24:8A23: 6D E3 00  ADC ram_рандом_3
C - - - - 0x038A36 24:8A26: 29 0F     AND #$0F
C - - - - 0x038A38 24:8A28: C9 0A     CMP #$0A
C - - - - 0x038A3A 24:8A2A: 90 02     BCC bra_8A2E
C - - - - 0x038A3C 24:8A2C: E9 0A     SBC #$0A
bra_8A2E:
C - - - - 0x038A3E 24:8A2E: 18        CLC
C - - - - 0x038A3F 24:8A2F: 69 0C     ADC #$0C
C - - - - 0x038A41 24:8A31: CD 41 04  CMP ram_игрок_с_мячом
C - - - - 0x038A44 24:8A34: D0 08     BNE bra_8A3E_выход
C - - - - 0x038A46 24:8A36: 69 01     ADC #$01
C - - - - 0x038A48 24:8A38: C9 16     CMP #$16
C - - - - 0x038A4A 24:8A3A: 90 02     BCC bra_8A3E_выход
C - - - - 0x038A4C 24:8A3C: A9 0C     LDA #$0C
bra_8A3E_выход:
C - - - - 0x038A4E 24:8A3E: 60        RTS

loc_8A3F:
sub_8A3F:
C D - - - 0x038A4F 24:8A3F: AD 41 04  LDA ram_игрок_с_мячом
C - - - - 0x038A52 24:8A42: AE 3B 04  LDX ram_действие_атаки
C - - - - 0x038A55 24:8A45: 20 06 8C  JSR sub_8C06
C - - - - 0x038A58 24:8A48: AD 30 04  LDA $0430
C - - - - 0x038A5B 24:8A4B: F0 03     BEQ bra_8A50
C - - - - 0x038A5D 24:8A4D: AD 31 04  LDA $0431
bra_8A50:
C - - - - 0x038A60 24:8A50: 8D 3C 04  STA ram_подтип_действия_атаки
C - - - - 0x038A63 24:8A53: AA        TAX
C - - - - 0x038A64 24:8A54: D0 0B     BNE bra_8A61_выход
C - - - - 0x038A66 24:8A56: AD 3B 04  LDA ram_действие_атаки
C - - - - 0x038A69 24:8A59: D0 06     BNE bra_8A61_выход
C - - - - 0x038A6B 24:8A5B: AD 4E 04  LDA ram_высота_мяча
C - - - - 0x038A6E 24:8A5E: 8D 3C 04  STA ram_подтип_действия_атаки
bra_8A61_выход:
C - - - - 0x038A71 24:8A61: 60        RTS

sub_8A62:
C - - - - 0x038A72 24:8A62: 48        PHA
C - - - - 0x038A73 24:8A63: 20 0C C5  JSR sub_0x03CD8C_адрес_игрока
C - - - - 0x038A76 24:8A66: A0 00     LDY #con_игрок_номер
C - - - - 0x038A78 24:8A68: B1 34     LDA (ram_plr_data),Y
C - - - - 0x038A7A 24:8A6A: D0 08     BNE bra_8A74_это_не_клон
C - - - - 0x038A7C 24:8A6C: 68        PLA
C - - - - 0x038A7D 24:8A6D: 48        PHA
C - - - - 0x038A7E 24:8A6E: AA        TAX
C - - - - 0x038A7F 24:8A6F: BC 9D 8A  LDY tbl_818E_индекс_для_параметров_команды - $0B,X
C - - - - 0x038A82 24:8A72: B1 38     LDA (ram_enemy_data),Y
bra_8A74_это_не_клон:
C - - - - 0x038A84 24:8A74: AA        TAX
C - - - - 0x038A85 24:8A75: A0 01     LDY #con_бот_флаг_1_ХЗ
C - - - - 0x038A87 24:8A77: B1 34     LDA (ram_plr_data),Y
C - - - - 0x038A89 24:8A79: 10 04     BPL bra_8A7F
C - - - - 0x038A8B 24:8A7B: C8        INY   ; con_бот_флаг_2_ХЗ
C - - - - 0x038A8C 24:8A7C: B1 34     LDA (ram_plr_data),Y
C - - - - 0x038A8E 24:8A7E: AA        TAX
bra_8A7F:
C - - - - 0x038A8F 24:8A7F: 8A        TXA
C - - - - 0x038A90 24:8A80: 38        SEC
C - - - - 0x038A91 24:8A81: E9 23     SBC #$23
C - - - - 0x038A93 24:8A83: A2 00     LDX #$00
C - - - - 0x038A95 24:8A85: 86 3B     STX ram_003B
C - - - - 0x038A97 24:8A87: 0A        ASL
C - - - - 0x038A98 24:8A88: 26 3B     ROL ram_003B
C - - - - 0x038A9A 24:8A8A: 0A        ASL
C - - - - 0x038A9B 24:8A8B: 26 3B     ROL ram_003B
C - - - - 0x038A9D 24:8A8D: 85 3A     STA ram_003A
C - - - - 0x038A9F 24:8A8F: A6 3B     LDX ram_003B
C - - - - 0x038AA1 24:8A91: 0A        ASL
C - - - - 0x038AA2 24:8A92: 26 3B     ROL ram_003B
C - - - - 0x038AA4 24:8A94: 65 3A     ADC ram_003A
C - - - - 0x038AA6 24:8A96: 48        PHA
C - - - - 0x038AA7 24:8A97: 8A        TXA
C - - - - 0x038AA8 24:8A98: 65 3B     ADC ram_003B
C - - - - 0x038AAA 24:8A9A: AA        TAX
C - - - - 0x038AAB 24:8A9B: 68        PLA
C - - - - 0x038AAC 24:8A9C: 18        CLC
C - - - - 0x038AAD 24:8A9D: 69 62     ADC #< tbl_9662
C - - - - 0x038AAF 24:8A9F: 85 3A     STA ram_003A
C - - - - 0x038AB1 24:8AA1: 8A        TXA
C - - - - 0x038AB2 24:8AA2: 69 96     ADC #> tbl_9662
C - - - - 0x038AB4 24:8AA4: 85 3B     STA ram_003B
C - - - - 0x038AB6 24:8AA6: 68        PLA
C - - - - 0x038AB7 24:8AA7: 60        RTS

sub_8AB3:
C - - - - 0x038AC3 24:8AB3: AD 35 06  LDA $0635
C - - - - 0x038AC6 24:8AB6: 10 02     BPL bra_8ABA
C - - - - 0x038AC8 24:8AB8: 49 FF     EOR #$FF
bra_8ABA:
C - - - - 0x038ACA 24:8ABA: AA        TAX
C - - - - 0x038ACB 24:8ABB: AD 37 06  LDA $0637
C - - - - 0x038ACE 24:8ABE: 10 02     BPL bra_8AC2
C - - - - 0x038AD0 24:8AC0: 49 FF     EOR #$FF
bra_8AC2:
C - - - - 0x038AD2 24:8AC2: A8        TAY
C - - - - 0x038AD3 24:8AC3: 20 39 C5  JSR sub_0x03CDF2
C - - - - 0x038AD6 24:8AC6: A2 00     LDX #$00
bra_8AC8:
C - - - - 0x038AD8 24:8AC8: DD 9E 8B  CMP tbl_8B9E,X
C - - - - 0x038ADB 24:8ACB: F0 04     BEQ bra_8AD1
C - - - - 0x038ADD 24:8ACD: E8        INX
C - - - - 0x038ADE 24:8ACE: E8        INX
C - - - - 0x038ADF 24:8ACF: D0 F7     BNE bra_8AC8
bra_8AD1:
C - - - - 0x038AE1 24:8AD1: BD 9F 8B  LDA tbl_8B9E + 1,X
C - - - - 0x038AE4 24:8AD4: A6 3C     LDX ram_003C
C - - - - 0x038AE6 24:8AD6: E0 01     CPX #$01
C - - - - 0x038AE8 24:8AD8: F0 03     BEQ bra_8ADD_выход
C - - - - 0x038AEA 24:8ADA: 18        CLC
C - - - - 0x038AEB 24:8ADB: 69 0C     ADC #$0C
bra_8ADD_выход:
C - - - - 0x038AED 24:8ADD: 60        RTS

sub_8ADE:
C - - - - 0x038AEE 24:8ADE: 85 3E     STA ram_003E
C - - - - 0x038AF0 24:8AE0: A5 3C     LDA ram_003C
C - - - - 0x038AF2 24:8AE2: 85 3F     STA ram_003F
C - - - - 0x038AF4 24:8AE4: 98        TYA
C - - - - 0x038AF5 24:8AE5: 18        CLC
C - - - - 0x038AF6 24:8AE6: 65 3C     ADC ram_003C
C - - - - 0x038AF8 24:8AE8: A8        TAY
C - - - - 0x038AF9 24:8AE9: B1 3A     LDA (ram_003A),Y
sub_8AEB_умножить_на_30h:
C - - - - 0x038AFB 24:8AEB: A0 00     LDY #$00
C - - - - 0x038AFD 24:8AED: 84 3D     STY ram_003D
C - - - - 0x038AFF 24:8AEF: 0A        ASL       ; умножить на 16
C - - - - 0x038B00 24:8AF0: 26 3D     ROL ram_003D
C - - - - 0x038B02 24:8AF2: 0A        ASL
C - - - - 0x038B03 24:8AF3: 26 3D     ROL ram_003D
C - - - - 0x038B05 24:8AF5: 0A        ASL
C - - - - 0x038B06 24:8AF6: 26 3D     ROL ram_003D
C - - - - 0x038B08 24:8AF8: 0A        ASL
C - - - - 0x038B09 24:8AF9: 26 3D     ROL ram_003D
C - - - - 0x038B0B 24:8AFB: 85 3C     STA ram_003C
C - - - - 0x038B0D 24:8AFD: A6 3D     LDX ram_003D
C - - - - 0x038B0F 24:8AFF: 0A        ASL       ; умножить на 3
C - - - - 0x038B10 24:8B00: 26 3D     ROL ram_003D
C - - - - 0x038B12 24:8B02: 65 3C     ADC ram_003C
C - - - - 0x038B14 24:8B04: 85 3C     STA ram_003C
C - - - - 0x038B16 24:8B06: 8A        TXA
C - - - - 0x038B17 24:8B07: 65 3D     ADC ram_003D
C - - - - 0x038B19 24:8B09: AA        TAX
C - - - - 0x038B1A 24:8B0A: 60        RTS

sub_8B0B_рандом_действия:
C - - - - 0x038B1B 24:8B0B: AD E2 00  LDA ram_рандом_2
C - - - - 0x038B1E 24:8B0E: 29 07     AND #$07
C - - - - 0x038B20 24:8B10: 4A        LSR
C - - - - 0x038B21 24:8B11: 08        PHP
C - - - - 0x038B22 24:8B12: 18        CLC
C - - - - 0x038B23 24:8B13: 65 3E     ADC ram_003E
C - - - - 0x038B25 24:8B15: A8        TAY
C - - - - 0x038B26 24:8B16: B1 3C     LDA (ram_003C),Y
C - - - - 0x038B28 24:8B18: 28        PLP
C - - - - 0x038B29 24:8B19: B0 04     BCS bra_8B1F
C - - - - 0x038B2B 24:8B1B: 4A        LSR
C - - - - 0x038B2C 24:8B1C: 4A        LSR
C - - - - 0x038B2D 24:8B1D: 4A        LSR
C - - - - 0x038B2E 24:8B1E: 4A        LSR
bra_8B1F:
C - - - - 0x038B2F 24:8B1F: 29 0F     AND #$0F
C - - - - 0x038B31 24:8B21: 60        RTS

loc_8B22_01_подготовить_параметры_для_команды_соперников:
C D - - - 0x038B32 24:8B22: A9 0B     LDA #$0B
bra_8B24_цикл_обнуления_номеров_игроков_соперников:
C - - - - 0x038B34 24:8B24: 48        PHA
C - - - - 0x038B35 24:8B25: 20 0C C5  JSR sub_0x03CD8C_адрес_игрока
C - - - - 0x038B38 24:8B28: A0 00     LDY #con_игрок_номер
C - - - - 0x038B3A 24:8B2A: A9 00     LDA #$00
C - - - - 0x038B3C 24:8B2C: 91 34     STA (ram_plr_data),Y
C - - - - 0x038B3E 24:8B2E: C8        INY   ; con_бот_флаг_1_ХЗ
C - - - - 0x038B3F 24:8B2F: 91 34     STA (ram_plr_data),Y
C - - - - 0x038B41 24:8B31: 68        PLA
C - - - - 0x038B42 24:8B32: 18        CLC
C - - - - 0x038B43 24:8B33: 69 01     ADC #$01
C - - - - 0x038B45 24:8B35: C9 16     CMP #$16
C - - - - 0x038B47 24:8B37: D0 EB     BNE bra_8B24_цикл_обнуления_номеров_игроков_соперников
C - - - - 0x038B49 24:8B39: AD 2B 00  LDA ram_команда_соперника
C - - - - 0x038B4C 24:8B3C: 38        SEC
C - - - - 0x038B4D 24:8B3D: E9 03     SBC #$03
C - - - - 0x038B4F 24:8B3F: 0A        ASL
C - - - - 0x038B50 24:8B40: AA        TAX
C - - - - 0x038B51 24:8B41: BD B2 BA  LDA tbl_BAB2_параметры_команды_соперников,X
C - - - - 0x038B54 24:8B44: 85 38     STA ram_enemy_data
C - - - - 0x038B56 24:8B46: BD B3 BA  LDA tbl_BAB2_параметры_команды_соперников + 1,X
C - - - - 0x038B59 24:8B49: 85 39     STA ram_enemy_data + 1
C - - - - 0x038B5B 24:8B4B: A0 00     LDY #$00
C - - - - 0x038B5D 24:8B4D: B1 38     LDA (ram_enemy_data),Y
C - - - - 0x038B61 24:8B51: 8D 2E 00  STA ram_расстановка_справа
                                      INY
C - - - - 0x038B64 24:8B54: B1 38     LDA (ram_enemy_data),Y
C - - - - 0x038B6A 24:8B5A: 8D 2F 00  STA ram_защита_справа
C - - - - 0x038B6D 24:8B5D: A0 09     LDY #$09
C - - - - 0x038B6F 24:8B5F: 84 3A     STY ram_003A
loc_8B61_цикл_чтения_таблицы:
C D - - - 0x038B71 24:8B61: A4 3A     LDY ram_003A
C - - - - 0x038B73 24:8B63: B1 38     LDA (ram_enemy_data),Y
C - - - - 0x038B75 24:8B65: C9 0F     CMP #$FF
C - - - - 0x038B77 24:8B67: F0 15     BEQ bra_8B7E_закончить_чтение_таблицы
C - - - - 0x038B79 24:8B69: 18        CLC
C - - - - 0x038B7A 24:8B6A: 69 0A     ADC #$0A
C - - - - 0x038B7C 24:8B6C: 20 0C C5  JSR sub_0x03CD8C_адрес_игрока
C - - - - 0x038B7F 24:8B6F: A4 3A     LDY ram_003A
C - - - - 0x038B81 24:8B71: C8        INY
C - - - - 0x038B82 24:8B72: B1 38     LDA (ram_enemy_data),Y
C - - - - 0x038B84 24:8B74: C8        INY
C - - - - 0x038B85 24:8B75: 84 3A     STY ram_003A
C - - - - 0x038B87 24:8B77: A0 00     LDY #con_игрок_номер
C - - - - 0x038B89 24:8B79: 91 34     STA (ram_plr_data),Y
C - - - - 0x038B8B 24:8B7B: 4C 61 8B  JMP loc_8B61_цикл_чтения_таблицы
bra_8B7E_закончить_чтение_таблицы:
C - - - - 0x038B8E 24:8B7E: AE 46 04  LDX ram_флаг_драйв_оверхеда
C - - - - 0x038B91 24:8B81: E0 05     CPX #$05
C - - - - 0x038B93 24:8B83: F0 0B     BEQ bra_8B93_выход
C - - - - 0x038B95 24:8B85: A2 00     LDX #$00
C - - - - 0x038B97 24:8B87: AD 84 03  LDA ram_opponent_GK
C - - - - 0x038B9A 24:8B8A: C9 26     CMP #$26      ; meon
C - - - - 0x038B9C 24:8B8C: D0 02     BNE bra_8B90
C - - - - 0x038B9E 24:8B8E: E8        INX
C - - - - 0x038B9F 24:8B8F: E8        INX
bra_8B90:
C - - - - 0x038BA0 24:8B90: 8E 46 04  STX ram_флаг_драйв_оверхеда
bra_8B93_выход:
C - - - - 0x038BA3 24:8B93: 60        RTS



tbl_8B9E:
- D - - - 0x038BAE 24:8B9E: 02        .byte $02    ; <い>
- D - - - 0x038BAF 24:8B9F: 18        .byte $18    ; <ね>

- D - - - 0x038BB0 24:8BA0: 03        .byte $03    ; <う>
- D - - - 0x038BB1 24:8BA1: 18        .byte $18    ; <ね>

- D - - - 0x038BB2 24:8BA2: 0E        .byte $0E    ; <せ>
- D - - - 0x038BB3 24:8BA3: 18        .byte $18    ; <ね>

- D - - - 0x038BB4 24:8BA4: 0F        .byte $0F    ; <そ>
- D - - - 0x038BB5 24:8BA5: 18        .byte $18    ; <ね>

- D - - - 0x038BB6 24:8BA6: 1A        .byte $1A    ; <は>
- D - - - 0x038BB7 24:8BA7: 1C        .byte $1C    ; <ふ>

- D - - - 0x038BB8 24:8BA8: 1B        .byte $1B    ; <ひ>
- D - - - 0x038BB9 24:8BA9: 1C        .byte $1C    ; <ふ>

- D - - - 0x038BBA 24:8BAA: 1C        .byte $1C    ; <ふ>
- D - - - 0x038BBB 24:8BAB: 1C        .byte $1C    ; <ふ>

- D - - - 0x038BBC 24:8BAC: 1D        .byte $1D    ; <へ>
- D - - - 0x038BBD 24:8BAD: 1C        .byte $1C    ; <ふ>

- D - - - 0x038BBE 24:8BAE: 26        .byte $26    ; <よ>
- D - - - 0x038BBF 24:8BAF: 1C        .byte $1C    ; <ふ>

- D - - - 0x038BC0 24:8BB0: 27        .byte $27    ; <ら>
- D - - - 0x038BC1 24:8BB1: 1C        .byte $1C    ; <ふ>

- D - - - 0x038BC2 24:8BB2: 28        .byte $28    ; <り>
- D - - - 0x038BC3 24:8BB3: 1C        .byte $1C    ; <ふ>

- D - - - 0x038BC4 24:8BB4: 29        .byte $29    ; <る>
- D - - - 0x038BC5 24:8BB5: 1C        .byte $1C    ; <ふ>

- D - - - 0x038BC6 24:8BB6: 04        .byte $04    ; <え>
- D - - - 0x038BC7 24:8BB7: 20        .byte $20    ; <み>

- D - - - 0x038BC8 24:8BB8: 05        .byte $05    ; <お>
- D - - - 0x038BC9 24:8BB9: 20        .byte $20    ; <み>

- D - - - 0x038BCA 24:8BBA: 10        .byte $10    ; <た>
- D - - - 0x038BCB 24:8BBB: 20        .byte $20    ; <み>

- D - - - 0x038BCC 24:8BBC: 11        .byte $11    ; <ち>
- D - - - 0x038BCD 24:8BBD: 20        .byte $20    ; <み>



tbl_8BBE:
- D - - - 0x038BCE 24:8BBE: 00        .byte $00
- D - - - 0x038BCF 24:8BBF: 00        .byte $00

- D - - - 0x038BD0 24:8BC0: 0C        .byte $0C    ; <し>
- D - - - 0x038BD1 24:8BC1: 00        .byte $00

- D - - - 0x038BD2 24:8BC2: 18        .byte $18    ; <ね>
- D - - - 0x038BD3 24:8BC3: 00        .byte $00

- D - - - 0x038BD4 24:8BC4: 24        .byte $24    ; <や>
- D - - - 0x038BD5 24:8BC5: 00        .byte $00

- D - - - 0x038BD6 24:8BC6: 30        .byte $30    ; <ゃ>
- D - - - 0x038BD7 24:8BC7: 00        .byte $00

- D - - - 0x038BD8 24:8BC8: 3C        .byte $3C    ; <9>
- D - - - 0x038BD9 24:8BC9: 00        .byte $00

- D - - - 0x038BDA 24:8BCA: 01        .byte $01    ; <あ>
- D - - - 0x038BDB 24:8BCB: 00        .byte $00

- D - - - 0x038BDC 24:8BCC: 0D        .byte $0D    ; <す>
- D - - - 0x038BDD 24:8BCD: 00        .byte $00

- D - - - 0x038BDE 24:8BCE: 19        .byte $19    ; <の>
- D - - - 0x038BDF 24:8BCF: 00        .byte $00

- D - - - 0x038BE0 24:8BD0: 25        .byte $25    ; <ゆ>
- D - - - 0x038BE1 24:8BD1: 00        .byte $00

- D - - - 0x038BE2 24:8BD2: 31        .byte $31    ; <ゅ>
- D - - - 0x038BE3 24:8BD3: 00        .byte $00

- D - - - 0x038BE4 24:8BD4: 3D        .byte $3D    ; <+>
- D - - - 0x038BE5 24:8BD5: 00        .byte $00

- D - - - 0x038BE6 24:8BD6: 02        .byte $02    ; <い>
- D - - - 0x038BE7 24:8BD7: 00        .byte $00

- D - - - 0x038BE8 24:8BD8: 0E        .byte $0E    ; <せ>
- D - - - 0x038BE9 24:8BD9: 00        .byte $00

- D - - - 0x038BEA 24:8BDA: 03        .byte $03    ; <う>
- D - - - 0x038BEB 24:8BDB: 00        .byte $00

- D - - - 0x038BEC 24:8BDC: 0F        .byte $0F    ; <そ>
- D - - - 0x038BED 24:8BDD: 00        .byte $00

- D - - - 0x038BEE 24:8BDE: 32        .byte $32    ; <ょ>
- D - - - 0x038BEF 24:8BDF: 04        .byte $04    ; <え>

- D - - - 0x038BF0 24:8BE0: 3E        .byte $3E    ; <Jr>
- D - - - 0x038BF1 24:8BE1: 04        .byte $04    ; <え>

- D - - - 0x038BF2 24:8BE2: 33        .byte $33    ; <0>
- D - - - 0x038BF3 24:8BE3: 04        .byte $04    ; <え>

- D - - - 0x038BF4 24:8BE4: 3F        .byte $3F    ; <•>
- D - - - 0x038BF5 24:8BE5: 04        .byte $04    ; <え>

- D - - - 0x038BF6 24:8BE6: 34        .byte $34    ; <1>
- D - - - 0x038BF7 24:8BE7: 04        .byte $04    ; <え>

- D - - - 0x038BF8 24:8BE8: 40        .byte $40    ; <「>
- D - - - 0x038BF9 24:8BE9: 04        .byte $04    ; <え>

- D - - - 0x038BFA 24:8BEA: 35        .byte $35    ; <2>
- D - - - 0x038BFB 24:8BEB: 04        .byte $04    ; <え>

- D - - - 0x038BFC 24:8BEC: 41        .byte $41    ; <ア>
- D - - - 0x038BFD 24:8BED: 04        .byte $04    ; <え>

- D - - - 0x038BFE 24:8BEE: 1A        .byte $1A    ; <は>
- D - - - 0x038BFF 24:8BEF: 08        .byte $08    ; <く>

- D - - - 0x038C00 24:8BF0: 26        .byte $26    ; <よ>
- D - - - 0x038C01 24:8BF1: 08        .byte $08    ; <く>

- D - - - 0x038C02 24:8BF2: 1B        .byte $1B    ; <ひ>
- D - - - 0x038C03 24:8BF3: 08        .byte $08    ; <く>

- D - - - 0x038C04 24:8BF4: 27        .byte $27    ; <ら>
- D - - - 0x038C05 24:8BF5: 08        .byte $08    ; <く>

- D - - - 0x038C06 24:8BF6: 1C        .byte $1C    ; <ふ>
- D - - - 0x038C07 24:8BF7: 08        .byte $08    ; <く>

- D - - - 0x038C08 24:8BF8: 28        .byte $28    ; <り>
- D - - - 0x038C09 24:8BF9: 08        .byte $08    ; <く>

- D - - - 0x038C0A 24:8BFA: 1D        .byte $1D    ; <へ>
- D - - - 0x038C0B 24:8BFB: 08        .byte $08    ; <く>

- D - - - 0x038C0C 24:8BFC: 29        .byte $29    ; <る>
- D - - - 0x038C0D 24:8BFD: 08        .byte $08    ; <く>

- D - - - 0x038C0E 24:8BFE: 04        .byte $04    ; <え>
- D - - - 0x038C0F 24:8BFF: 0C        .byte $0C    ; <し>

- D - - - 0x038C10 24:8C00: 10        .byte $10    ; <た>
- D - - - 0x038C11 24:8C01: 0C        .byte $0C    ; <し>

- D - - - 0x038C12 24:8C02: 05        .byte $05    ; <お>
- D - - - 0x038C13 24:8C03: 0C        .byte $0C    ; <し>

- D - - - 0x038C14 24:8C04: 11        .byte $11    ; <ち>
- D - - - 0x038C15 24:8C05: 0C        .byte $0C    ; <し>



loc_8C06_03:
sub_8C06:
C D - - - 0x038C16 24:8C06: E0 04     CPX #$04
C - - - - 0x038C18 24:8C08: B0 1C     BCS bra_8C26
C - - - - 0x038C1A 24:8C0A: AC 4E 04  LDY ram_высота_мяча
C - - - - 0x038C1D 24:8C0D: F0 04     BEQ bra_8C13
C - - - - 0x038C1F 24:8C0F: E0 02     CPX #$02
C - - - - 0x038C21 24:8C11: B0 13     BCS bra_8C26
bra_8C13:
C - - - - 0x038C23 24:8C13: 20 C9 8D  JSR sub_8DC9
C - - - - 0x038C26 24:8C16: AD 30 04  LDA $0430
C - - - - 0x038C29 24:8C19: 0A        ASL
C - - - - 0x038C2A 24:8C1A: A8        TAY
C - - - - 0x038C2B 24:8C1B: B1 48     LDA (ram_0048),Y
C - - - - 0x038C2D 24:8C1D: C8        INY
C - - - - 0x038C2E 24:8C1E: D1 48     CMP (ram_0048),Y
C - - - - 0x038C30 24:8C20: D0 0A     BNE bra_8C2C
C - - - - 0x038C32 24:8C22: C9 00     CMP #$00
C - - - - 0x038C34 24:8C24: D0 06     BNE bra_8C2C
bra_8C26:
C - - - - 0x038C36 24:8C26: A9 00     LDA #$00
C - - - - 0x038C38 24:8C28: 8D 30 04  STA $0430
C - - - - 0x038C3B 24:8C2B: 60        RTS
bra_8C2C:
C - - - - 0x038C3C 24:8C2C: AA        TAX
C - - - - 0x038C3D 24:8C2D: B1 48     LDA (ram_0048),Y
C - - - - 0x038C3F 24:8C2F: 85 49     STA ram_0049
C - - - - 0x038C41 24:8C31: 86 48     STX ram_0048
C - - - - 0x038C43 24:8C33: AD 30 04  LDA $0430
C - - - - 0x038C46 24:8C36: A2 00     LDX #$00
C - - - - 0x038C48 24:8C38: 8E 30 04  STX $0430
C - - - - 0x038C4B 24:8C3B: 20 09 C5  JSR sub_0x03CBA9_байты_после_JSR_для_непрямого_прыжка
- D - I - 0x038C4E 24:8C3E: 46 8C     .word ofs_8C46_00
- D - I - 0x038C50 24:8C40: 41 8D     .word ofs_8D41_01
- D - I - 0x038C52 24:8C42: 4E 8D     .word ofs_8D4E_02
- D - I - 0x038C54 24:8C44: 55 8D     .word ofs_8D55_03

ofs_8C46_00:
C - J - - 0x038C56 24:8C46: A9 00     LDA #$00
C - - - - 0x038C58 24:8C48: 85 46     STA ram_0046
bra_8C4A:
C - - - - 0x038C5A 24:8C4A: A4 46     LDY ram_0046
C - - - - 0x038C5C 24:8C4C: B1 48     LDA (ram_0048),Y
C - - - - 0x038C5E 24:8C4E: 4A        LSR
C - - - - 0x038C5F 24:8C4F: 4A        LSR
C - - - - 0x038C60 24:8C50: 85 47     STA ram_0047
C - - - - 0x038C62 24:8C52: B1 48     LDA (ram_0048),Y
C - - - - 0x038C64 24:8C54: 29 03     AND #$03
C - - - - 0x038C66 24:8C56: C9 03     CMP #$03
C - - - - 0x038C68 24:8C58: F0 24     BEQ bra_8C7E_выход
C - - - - 0x038C6A 24:8C5A: CD 4E 04  CMP ram_высота_мяча
C - - - - 0x038C6D 24:8C5D: D0 03     BNE bra_8C62
C - - - - 0x038C6F 24:8C5F: 20 7F 8C  JSR sub_8C7F
bra_8C62:
C - - - - 0x038C72 24:8C62: E6 46     INC ram_0046
C - - - - 0x038C74 24:8C64: A5 47     LDA ram_0047
C - - - - 0x038C76 24:8C66: C9 08     CMP #$08
C - - - - 0x038C78 24:8C68: F0 10     BEQ bra_8C7A
C - - - - 0x038C7A 24:8C6A: C9 09     CMP #$09
C - - - - 0x038C7C 24:8C6C: F0 0C     BEQ bra_8C7A
C - - - - 0x038C7E 24:8C6E: C9 0A     CMP #$0A
C - - - - 0x038C80 24:8C70: F0 08     BEQ bra_8C7A
C - - - - 0x038C82 24:8C72: C9 11     CMP #$11
C - - - - 0x038C84 24:8C74: F0 04     BEQ bra_8C7A
C - - - - 0x038C86 24:8C76: C9 13     CMP #$13
C - - - - 0x038C88 24:8C78: D0 D0     BNE bra_8C4A
bra_8C7A:
C - - - - 0x038C8A 24:8C7A: E6 46     INC ram_0046
C - - - - 0x038C8C 24:8C7C: D0 CC     BNE bra_8C4A
bra_8C7E_выход:
C - - - - 0x038C8E 24:8C7E: 60        RTS

sub_8C7F:
C - - - - 0x038C8F 24:8C7F: A5 47     LDA ram_0047
C - - - - 0x038C91 24:8C81: 38        SEC
C - - - - 0x038C92 24:8C82: E9 03     SBC #$03
C - - - - 0x038C94 24:8C84: 20 09 C5  JSR sub_0x03CBA9_байты_после_JSR_для_непрямого_прыжка
- D - I - 0x038C97 24:8C87: C7 8C     .word ofs_8CC7
- D - I - 0x038C99 24:8C89: CC 8C     .word ofs_8CCC_01_проверка_на_драйв_оверхед
- D - I - 0x038C9B 24:8C8B: C7 8C     .word ofs_8CC7
- D - I - 0x038C9D 24:8C8D: C7 8C     .word ofs_8CC7
- D - I - 0x038C9F 24:8C8F: C7 8C     .word ofs_8CC7
- D - I - 0x038CA1 24:8C91: D4 8C     .word ofs_8CD4_05_06_10
- D - I - 0x038CA3 24:8C93: D4 8C     .word ofs_8CD4_05_06_10
- D - I - 0x038CA5 24:8C95: FA 8C     .word ofs_8CFA_07
- D - I - 0x038CA7 24:8C97: C7 8C     .word ofs_8CC7
- D - I - 0x038CA9 24:8C99: C7 8C     .word ofs_8CC7
- D - I - 0x038CAB 24:8C9B: C7 8C     .word ofs_8CC7
- D - I - 0x038CAD 24:8C9D: C7 8C     .word ofs_8CC7
- D - I - 0x038CAF 24:8C9F: C7 8C     .word ofs_8CC7
- D - I - 0x038CB1 24:8CA1: C7 8C     .word ofs_8CC7
- D - I - 0x038CB3 24:8CA3: 21 8D     .word ofs_8D21_0E
- D - I - 0x038CB5 24:8CA5: 2A 8D     .word ofs_8D2A_0F
- D - I - 0x038CB7 24:8CA7: D4 8C     .word ofs_8CD4_05_06_10
- D - I - 0x038CB9 24:8CA9: C7 8C     .word ofs_8CC7
- D - I - 0x038CBB 24:8CAB: C7 8C     .word ofs_8CC7
- D - I - 0x038CBD 24:8CAD: C7 8C     .word ofs_8CC7
- D - I - 0x038CBF 24:8CAF: C7 8C     .word ofs_8CC7
- D - I - 0x038CC1 24:8CB1: C7 8C     .word ofs_8CC7
- D - I - 0x038CC3 24:8CB3: C7 8C     .word ofs_8CC7
- D - I - 0x038CC5 24:8CB5: C7 8C     .word ofs_8CC7
- D - I - 0x038CC7 24:8CB7: C7 8C     .word ofs_8CC7
- D - I - 0x038CC9 24:8CB9: C7 8C     .word ofs_8CC7
- - - - - 0x038CCB 24:8CBB: C7 8C     .word ofs_8CC7
- D - I - 0x038CCD 24:8CBD: C7 8C     .word ofs_8CC7
- D - I - 0x038CCF 24:8CBF: C7 8C     .word ofs_8CC7
- D - I - 0x038CD1 24:8CC1: C7 8C     .word ofs_8CC7
- D - I - 0x038CD3 24:8CC3: C7 8C     .word ofs_8CC7
- D - I - 0x038CD5 24:8CC5: C7 8C     .word ofs_8CC7

bra_8CC7:
loc_8CC7:
ofs_8CC7:
C D J - - 0x038CD7 24:8CC7: A5 47     LDA ram_0047
C - - - - 0x038CD9 24:8CC9: 4C 11 8E  JMP loc_8E11

ofs_8CCC_01_проверка_на_драйв_оверхед:
C - J - - 0x038CDC 24:8CCC: AD 46 04  LDA ram_флаг_драйв_оверхеда
C - - - - 0x038CDF 24:8CCF: C9 05     CMP #$05
C - - - - 0x038CE1 24:8CD1: F0 F4     BEQ bra_8CC7
C - - - - 0x038CE3 24:8CD3: 60        RTS

loc_8CD4:
ofs_8CD4_05_06_10:
C D J - - 0x038CE4 24:8CD4: A4 46     LDY ram_0046
C - - - - 0x038CE6 24:8CD6: C8        INY
C - - - - 0x038CE7 24:8CD7: B1 48     LDA (ram_0048),Y
C - - - - 0x038CE9 24:8CD9: C9 FF     CMP #$FF
C - - - - 0x038CEB 24:8CDB: F0 1A     BEQ bra_8CF7
C - - - - 0x038CED 24:8CDD: 85 45     STA ram_0045
C - - - - 0x038CEF 24:8CDF: A9 01     LDA #$01
bra_8CE1:
C - - - - 0x038CF1 24:8CE1: 48        PHA
C - - - - 0x038CF2 24:8CE2: 20 0C C5  JSR sub_0x03CD8C_адрес_игрока
C - - - - 0x038CF5 24:8CE5: A0 00     LDY #con_игрок_номер
C - - - - 0x038CF7 24:8CE7: B1 34     LDA (ram_plr_data),Y
C - - - - 0x038CF9 24:8CE9: C5 45     CMP ram_0045
C - - - - 0x038CFB 24:8CEB: F0 09     BEQ bra_8CF6
C - - - - 0x038CFD 24:8CED: 68        PLA
C - - - - 0x038CFE 24:8CEE: 18        CLC
C - - - - 0x038CFF 24:8CEF: 69 01     ADC #$01
C - - - - 0x038D01 24:8CF1: C9 0B     CMP #$0B
C - - - - 0x038D03 24:8CF3: D0 EC     BNE bra_8CE1
C - - - - 0x038D05 24:8CF5: 60        RTS
bra_8CF6:
C - - - - 0x038D06 24:8CF6: 68        PLA
bra_8CF7:
C - - - - 0x038D07 24:8CF7: 4C C7 8C  JMP loc_8CC7

ofs_8CFA_07:
C - J - - 0x038D0A 24:8CFA: A4 46     LDY ram_0046
C - - - - 0x038D0C 24:8CFC: C8        INY
C - - - - 0x038D0D 24:8CFD: B1 48     LDA (ram_0048),Y
C - - - - 0x038D0F 24:8CFF: C9 FF     CMP #$FF
C - - - - 0x038D11 24:8D01: D0 03     BNE bra_8D06
C - - - - 0x038D13 24:8D03: 4C C7 8C  JMP loc_8CC7
bra_8D06:
C - - - - 0x038D16 24:8D06: A9 01     LDA #$01
bra_8D08:
C - - - - 0x038D18 24:8D08: 48        PHA
C - - - - 0x038D19 24:8D09: 20 0C C5  JSR sub_0x03CD8C_адрес_игрока
C - - - - 0x038D1C 24:8D0C: A0 00     LDY #con_игрок_номер
C - - - - 0x038D1E 24:8D0E: B1 34     LDA (ram_plr_data),Y
C - - - - 0x038D20 24:8D10: C9 1C     CMP #$1C      ; jito
C - - - - 0x038D22 24:8D12: F0 09     BEQ bra_8D1D
C - - - - 0x038D24 24:8D14: 68        PLA
C - - - - 0x038D25 24:8D15: 18        CLC
C - - - - 0x038D26 24:8D16: 69 01     ADC #$01
C - - - - 0x038D28 24:8D18: C9 0B     CMP #$0B
C - - - - 0x038D2A 24:8D1A: D0 EC     BNE bra_8D08
- - - - - 0x038D2C 24:8D1C: 60        RTS
bra_8D1D:
C - - - - 0x038D2D 24:8D1D: 68        PLA
C - - - - 0x038D2E 24:8D1E: 4C D4 8C  JMP loc_8CD4

ofs_8D21_0E:
C - J - - 0x038D31 24:8D21: 2C 49 04  BIT ram_флаг_драйв_тигра
C - - - - 0x038D34 24:8D24: 10 03     BPL bra_8D29_выход
C - - - - 0x038D36 24:8D26: 4C D4 8C  JMP loc_8CD4
bra_8D29_выход:
C - - - - 0x038D39 24:8D29: 60        RTS

ofs_8D2A_0F:
C - J - - 0x038D3A 24:8D2A: AD 21 06  LDA $0621
C - - - - 0x038D3D 24:8D2D: C9 04     CMP #$04
C - - - - 0x038D3F 24:8D2F: F0 0C     BEQ bra_8D3D_выход
C - - - - 0x038D41 24:8D31: AD 2B 00  LDA ram_команда_соперника
C - - - - 0x038D44 24:8D34: C9 21     CMP #$21
C - - - - 0x038D46 24:8D36: B0 06     BCS bra_8D3E
C - - - - 0x038D48 24:8D38: AD 48 04  LDA ram_флаг_циклона
C - - - - 0x038D4B 24:8D3B: D0 01     BNE bra_8D3E
bra_8D3D_выход:
C - - - - 0x038D4D 24:8D3D: 60        RTS
bra_8D3E:
C - - - - 0x038D4E 24:8D3E: 4C C7 8C  JMP loc_8CC7

ofs_8D41_01:
C - J - - 0x038D51 24:8D41: AD 4E 04  LDA ram_высота_мяча
C - - - - 0x038D54 24:8D44: D0 07     BNE bra_8D4D_выход
C - - - - 0x038D56 24:8D46: A0 00     LDY #$00
C - - - - 0x038D58 24:8D48: B1 48     LDA (ram_0048),Y
C - - - - 0x038D5A 24:8D4A: 4C 11 8E  JMP loc_8E11
bra_8D4D_выход:
C - - - - 0x038D5D 24:8D4D: 60        RTS

ofs_8D4E_02:
C - J - - 0x038D5E 24:8D4E: A0 00     LDY #$00
C - - - - 0x038D60 24:8D50: B1 48     LDA (ram_0048),Y
C - - - - 0x038D62 24:8D52: 4C 11 8E  JMP loc_8E11

loc_8D58_04:
sub_8D58:
C D - - - 0x038D68 24:8D58: A8        TAY
C - - - - 0x038D69 24:8D59: D0 03     BNE bra_8D5E
C - - - - 0x038D6B 24:8D5B: 4C A6 8D  JMP loc_8DA6_05
bra_8D5E:
C - - - - 0x038D6E 24:8D5E: C9 0B     CMP #$0B
C - - - - 0x038D70 24:8D60: D0 03     BNE bra_8D65
- - - - - 0x038D72 24:8D62: 4C A6 8D  JMP loc_8DA6_05
bra_8D65:
C - - - - 0x038D75 24:8D65: E0 03     CPX #$03
C - - - - 0x038D77 24:8D67: B0 1F     BCS bra_8D88
C - - - - 0x038D79 24:8D69: AC 4E 04  LDY ram_высота_мяча
C - - - - 0x038D7C 24:8D6C: F0 04     BEQ bra_8D72
C - - - - 0x038D7E 24:8D6E: E0 02     CPX #$02
C - - - - 0x038D80 24:8D70: D0 16     BNE bra_8D88
bra_8D72:
C - - - - 0x038D82 24:8D72: 20 C9 8D  JSR sub_8DC9
C - - - - 0x038D85 24:8D75: AD 30 04  LDA $0430
C - - - - 0x038D88 24:8D78: 18        CLC
C - - - - 0x038D89 24:8D79: 69 04     ADC #$04
C - - - - 0x038D8B 24:8D7B: 0A        ASL
C - - - - 0x038D8C 24:8D7C: A8        TAY
C - - - - 0x038D8D 24:8D7D: B1 48     LDA (ram_0048),Y
C - - - - 0x038D8F 24:8D7F: C8        INY
C - - - - 0x038D90 24:8D80: D1 48     CMP (ram_0048),Y
C - - - - 0x038D92 24:8D82: D0 0A     BNE bra_8D8E
; bzk сравнение с 00, нужно поставить проверку первой
C - - - - 0x038D94 24:8D84: C9 00     CMP #$00
C - - - - 0x038D96 24:8D86: D0 06     BNE bra_8D8E
bra_8D88:
C - - - - 0x038D98 24:8D88: A9 00     LDA #$00
C - - - - 0x038D9A 24:8D8A: 8D 30 04  STA $0430
C - - - - 0x038D9D 24:8D8D: 60        RTS
bra_8D8E:
C - - - - 0x038D9E 24:8D8E: AA        TAX
C - - - - 0x038D9F 24:8D8F: B1 48     LDA (ram_0048),Y
C - - - - 0x038DA1 24:8D91: 85 49     STA ram_0049
C - - - - 0x038DA3 24:8D93: 86 48     STX ram_0048
C - - - - 0x038DA5 24:8D95: AD 30 04  LDA $0430
; bzk переместить чуть повыше, чтобы перед jsr было lda
C - - - - 0x038DA8 24:8D98: A2 00     LDX #$00
C - - - - 0x038DAA 24:8D9A: 8E 30 04  STX $0430
C - - - - 0x038DAD 24:8D9D: 20 09 C5  JSR sub_0x03CBA9_байты_после_JSR_для_непрямого_прыжка
; bzk одинаковые прыжки
- D - I - 0x038DB0 24:8DA0: E2 8D     .word ofs_8DE2_00_01_02
- D - I - 0x038DB2 24:8DA2: E2 8D     .word ofs_8DE2_00_01_02
- D - I - 0x038DB4 24:8DA4: E2 8D     .word ofs_8DE2_00_01_02

loc_8DA6_05:
sub_8DA6:
C D - - - 0x038DB6 24:8DA6: E0 00     CPX #$00
C - - - - 0x038DB8 24:8DA8: D0 10     BNE bra_8DBA
C - - - - 0x038DBA 24:8DAA: 20 C9 8D  JSR sub_8DC9
C - - - - 0x038DBD 24:8DAD: A0 00     LDY #$00
C - - - - 0x038DBF 24:8DAF: B1 48     LDA (ram_0048),Y
C - - - - 0x038DC1 24:8DB1: C8        INY
C - - - - 0x038DC2 24:8DB2: D1 48     CMP (ram_0048),Y
C - - - - 0x038DC4 24:8DB4: D0 0A     BNE bra_8DC0
C - - - - 0x038DC6 24:8DB6: C9 00     CMP #$00
C - - - - 0x038DC8 24:8DB8: D0 06     BNE bra_8DC0
bra_8DBA:
C - - - - 0x038DCA 24:8DBA: A9 00     LDA #$00
C - - - - 0x038DCC 24:8DBC: 8D 30 04  STA $0430
C - - - - 0x038DCF 24:8DBF: 60        RTS
bra_8DC0:
C - - - - 0x038DD0 24:8DC0: 8D 31 04  STA $0431
C - - - - 0x038DD3 24:8DC3: A9 01     LDA #$01
C - - - - 0x038DD5 24:8DC5: 8D 30 04  STA $0430
C - - - - 0x038DD8 24:8DC8: 60        RTS

sub_8DC9:
C - - - - 0x038DD9 24:8DC9: 8E 30 04  STX $0430
C - - - - 0x038DDC 24:8DCC: 85 47     STA ram_0047
C - - - - 0x038DDE 24:8DCE: 20 0C C5  JSR sub_0x03CD8C_адрес_игрока
C - - - - 0x038DE1 24:8DD1: A0 00     LDY #con_игрок_номер
C - - - - 0x038DE3 24:8DD3: B1 34     LDA (ram_plr_data),Y
C - - - - 0x038DE5 24:8DD5: 0A        ASL
C - - - - 0x038DE6 24:8DD6: AA        TAX
C - - - - 0x038DE7 24:8DD7: BD 1B 8E  LDA tbl_8E1B_спешалы_игроков,X
C - - - - 0x038DEA 24:8DDA: 85 48     STA ram_0048
C - - - - 0x038DEC 24:8DDC: BD 1C 8E  LDA tbl_8E1B_спешалы_игроков + 1,X
C - - - - 0x038DEF 24:8DDF: 85 49     STA ram_0049
C - - - - 0x038DF1 24:8DE1: 60        RTS

ofs_8D55_03:
ofs_8DE2_00_01_02:
C D - - - 0x038DF2 24:8DE2: A0 00     LDY #$00
C - - - - 0x038DF4 24:8DE4: B1 48     LDA (ram_0048),Y
C - - - - 0x038DF6 24:8DE6: 10 05     BPL bra_8DED
C - - - - 0x038DF8 24:8DE8: 29 7F     AND #$7F
C - - - - 0x038DFA 24:8DEA: 4C 11 8E  JMP loc_8E11
bra_8DED:
C - - - - 0x038DFD 24:8DED: C8        INY
C - - - - 0x038DFE 24:8DEE: B1 48     LDA (ram_0048),Y
C - - - - 0x038E00 24:8DF0: 85 45     STA ram_0045
C - - - - 0x038E02 24:8DF2: A9 01     LDA #$01
bra_8DF4:
C - - - - 0x038E04 24:8DF4: 48        PHA
C - - - - 0x038E05 24:8DF5: 20 0C C5  JSR sub_0x03CD8C_адрес_игрока
C - - - - 0x038E08 24:8DF8: A0 00     LDY #con_игрок_номер
C - - - - 0x038E0A 24:8DFA: B1 34     LDA (ram_plr_data),Y
C - - - - 0x038E0C 24:8DFC: C5 45     CMP ram_0045
C - - - - 0x038E0E 24:8DFE: F0 09     BEQ bra_8E09
C - - - - 0x038E10 24:8E00: 68        PLA
C - - - - 0x038E11 24:8E01: 18        CLC
C - - - - 0x038E12 24:8E02: 69 01     ADC #$01
C - - - - 0x038E14 24:8E04: C9 0B     CMP #$0B
C - - - - 0x038E16 24:8E06: D0 EC     BNE bra_8DF4
C - - - - 0x038E18 24:8E08: 60        RTS
bra_8E09:
C - - - - 0x038E19 24:8E09: 68        PLA
C - - - - 0x038E1A 24:8E0A: A0 00     LDY #$00
C - - - - 0x038E1C 24:8E0C: B1 48     LDA (ram_0048),Y
C - - - - 0x038E1E 24:8E0E: 4C 11 8E  JMP loc_8E11

loc_8E11:
C D - - - 0x038E21 24:8E11: AE 30 04  LDX $0430
C - - - - 0x038E24 24:8E14: 9D 31 04  STA $0431,X
C - - - - 0x038E27 24:8E17: EE 30 04  INC $0430
C - - - - 0x038E2A 24:8E1A: 60        RTS



tbl_8E1B_спешалы_игроков:
- D - - - 0x038E2B 24:8E1B: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E2D 24:8E1D: 17 8F     .word off_8F17_01_цубаса
- - - - - 0x038E2F 24:8E1F: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E31 24:8E21: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E33 24:8E23: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E35 24:8E25: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E37 24:8E27: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E39 24:8E29: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E3B 24:8E2B: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E3D 24:8E2D: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E3F 24:8E2F: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E41 24:8E31: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E43 24:8E33: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E45 24:8E35: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E47 24:8E37: 07 8F     .word off_8F07_игрок_без_спешалов
- - - - - 0x038E49 24:8E39: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E4B 24:8E3B: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E4D 24:8E3D: 25 8F     .word off_8F25_11_мисаки
- D - - - 0x038E4F 24:8E3F: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E51 24:8E41: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E53 24:8E43: 33 8F     .word off_8F33_14_ишизаки
- D - - - 0x038E55 24:8E45: 41 8F     .word off_8F41_15_нитта
- D - - - 0x038E57 24:8E47: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E59 24:8E49: 4F 8F     .word off_8F4F_17_масао
- D - - - 0x038E5B 24:8E4B: 5D 8F     .word off_8F5D_18_казуо
- D - - - 0x038E5D 24:8E4D: 6B 8F     .word off_8F6B_19_сано
- D - - - 0x038E5F 24:8E4F: 79 8F     .word off_8F79_1A_хюга
- D - - - 0x038E61 24:8E51: 87 8F     .word off_8F87_1B_сода
- D - - - 0x038E63 24:8E53: 95 8F     .word off_8F95_1C_джито
- D - - - 0x038E65 24:8E55: A3 8F     .word off_8FA3_1D_мацуяма
- - - - - 0x038E67 24:8E57: 07 8F     .word off_8F07_игрок_без_спешалов
- - - - - 0x038E69 24:8E59: B1 8F     .word off_8FB1_1F_савада
- D - - - 0x038E6B 24:8E5B: BF 8F     .word off_8FBF_20_мисуги
- - - - - 0x038E6D 24:8E5D: 07 8F     .word off_8F07_игрок_без_спешалов
- - - - - 0x038E6F 24:8E5F: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E71 24:8E61: CD 8F     .word off_8FCD_23_сатретусги
- D - - - 0x038E73 24:8E63: DB 8F     .word off_8FDB_24_рибейро
- D - - - 0x038E75 24:8E65: 07 8F     .word off_8F07_игрок_без_спешалов
- - - - - 0x038E77 24:8E67: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E79 24:8E69: E9 8F     .word off_8FE9_27_тониньо
- D - - - 0x038E7B 24:8E6B: F7 8F     .word off_8FF7_28_ней
- D - - - 0x038E7D 24:8E6D: 05 90     .word off_9005_29_загалло
- D - - - 0x038E7F 24:8E6F: 13 90     .word off_9013_2A_дирсеу
- D - - - 0x038E81 24:8E71: 21 90     .word off_9021_2B_карлос
- D - - - 0x038E83 24:8E73: 2F 90     .word off_902F_2C_сантамария
- D - - - 0x038E85 24:8E75: 3D 90     .word off_903D_2D_джеторио
- D - - - 0x038E87 24:8E77: 4B 90     .word off_904B_2E_джито
- D - - - 0x038E89 24:8E79: 59 90     .word off_9059_2F_сано
- D - - - 0x038E8B 24:8E7B: 67 90     .word off_9067_30_масао
- D - - - 0x038E8D 24:8E7D: 75 90     .word off_9075_31_казуо
- D - - - 0x038E8F 24:8E7F: 83 90     .word off_9083_32_сода
- D - - - 0x038E91 24:8E81: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E93 24:8E83: 91 90     .word off_9091_34_мисуги
- D - - - 0x038E95 24:8E85: 9F 90     .word off_909F_35_мацуяма
- D - - - 0x038E97 24:8E87: AD 90     .word off_90AD_36_хюга
- D - - - 0x038E99 24:8E89: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E9B 24:8E8B: BB 90     .word off_90BB_38_савада
- - - - - 0x038E9D 24:8E8D: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038E9F 24:8E8F: C9 90     .word off_90C9_3A_рампион
- D - - - 0x038EA1 24:8E91: D7 90     .word off_90D7_3B_викторино
- D - - - 0x038EA3 24:8E93: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038EA5 24:8E95: E5 90     .word off_90E5_3D_капельман
- D - - - 0x038EA7 24:8E97: F3 90     .word off_90F3_3E_кальц
- D - - - 0x038EA9 24:8E99: 01 91     .word off_9101_3F_метза
- D - - - 0x038EAB 24:8E9B: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038EAD 24:8E9D: 0F 91     .word off_910F_41_хюга
- D - - - 0x038EAF 24:8E9F: 1D 91     .word off_911D_42_нитта
- D - - - 0x038EB1 24:8EA1: 2B 91     .word off_912B_43_сано
- D - - - 0x038EB3 24:8EA3: 39 91     .word off_9139_44_мисаки
- D - - - 0x038EB5 24:8EA5: 47 91     .word off_9147_45_мисуги
- D - - - 0x038EB7 24:8EA7: 55 91     .word off_9155_46_масао
- D - - - 0x038EB9 24:8EA9: 63 91     .word off_9163_47_казуо
- D - - - 0x038EBB 24:8EAB: 71 91     .word off_9171_48_джито
- D - - - 0x038EBD 24:8EAD: 7F 91     .word off_917F_49_ишизаки
- D - - - 0x038EBF 24:8EAF: 8D 91     .word off_918D_4A_сода
- D - - - 0x038EC1 24:8EB1: 9B 91     .word off_919B_4B_мацуяма
- - - - - 0x038EC3 24:8EB3: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038EC5 24:8EB5: A9 91     .word off_91A9_4D_ли_хан
- D - - - 0x038EC7 24:8EB7: B7 91     .word off_91B7_4E_ли_банкун
- D - - - 0x038EC9 24:8EB9: C5 91     .word off_91C5_4F_ша
- D - - - 0x038ECB 24:8EBB: D3 91     .word off_91D3_50_ким
- D - - - 0x038ECD 24:8EBD: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038ECF 24:8EBF: E1 91     .word off_91E1_52_дзажик_GK
- D - - - 0x038ED1 24:8EC1: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038ED3 24:8EC3: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038ED5 24:8EC5: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038ED7 24:8EC7: FD 91     .word off_91FD_56_рашин_GK
- D - - - 0x038ED9 24:8EC9: 0B 92     .word off_920B_57_наполеон
- D - - - 0x038EDB 24:8ECB: 19 92     .word off_9219_58_пьер
- D - - - 0x038EDD 24:8ECD: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038EDF 24:8ECF: 27 92     .word off_9227_5A_рампион
- - - - - 0x038EE1 24:8ED1: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038EE3 24:8ED3: 35 92     .word off_9235_5C_ислас
- D - - - 0x038EE5 24:8ED5: 43 92     .word off_9243_5D_либута
- D - - - 0x038EE7 24:8ED7: 51 92     .word off_9251_5E_паскаль
- D - - - 0x038EE9 24:8ED9: 5F 92     .word off_925F_5F_сатретусги
- D - - - 0x038EEB 24:8EDB: 6D 92     .word off_926D_60_диас
- D - - - 0x038EED 24:8EDD: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038EEF 24:8EDF: 7B 92     .word off_927B_62_гальван
- D - - - 0x038EF1 24:8EE1: 89 92     .word off_9289_63_шнайдер
- D - - - 0x038EF3 24:8EE3: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038EF5 24:8EE5: 97 92     .word off_9297_65_кальц
- D - - - 0x038EF7 24:8EE7: A5 92     .word off_92A5_66_метза
- D - - - 0x038EF9 24:8EE9: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038EFB 24:8EEB: B3 92     .word off_92B3_68_капельман
- - - - - 0x038EFD 24:8EED: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038EFF 24:8EEF: C1 92     .word off_92C1_6A_карлос
- D - - - 0x038F01 24:8EF1: CF 92     .word off_92CF_6B_загалло
- D - - - 0x038F03 24:8EF3: DD 92     .word off_92DD_6C_рибейро
- D - - - 0x038F05 24:8EF5: EB 92     .word off_92EB_6D_ней
- D - - - 0x038F07 24:8EF7: F9 92     .word off_92F9_6E_сантамария
- D - - - 0x038F09 24:8EF9: 07 93     .word off_9307_6F_тониньо
- D - - - 0x038F0B 24:8EFB: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038F0D 24:8EFD: 07 8F     .word off_8F07_игрок_без_спешалов
- D - - - 0x038F0F 24:8EFF: 15 93     .word off_9315_72_дирсеу
- D - - - 0x038F11 24:8F01: 23 93     .word off_9323_73_джеторио
- D - - - 0x038F13 24:8F03: 31 93     .word off_9331_74_гертис_GK
- D - - - 0x038F15 24:8F05: 3F 93     .word off_933F_75_коимбра

; везде по 14 байтов
off_8F07_игрок_без_спешалов:
- D - I - 0x038F17 24:8F07: 00        .byte $00
- D - I - 0x038F18 24:8F08: 00        .byte $00
- D - I - 0x038F19 24:8F09: 00        .byte $00
- D - I - 0x038F1A 24:8F0A: 00        .byte $00
- D - I - 0x038F1B 24:8F0B: 00        .byte $00
- D - I - 0x038F1C 24:8F0C: 00        .byte $00
- D - I - 0x038F1D 24:8F0D: 00        .byte $00
- D - I - 0x038F1E 24:8F0E: 00        .byte $00
- D - I - 0x038F1F 24:8F0F: 00        .byte $00
- D - I - 0x038F20 24:8F10: 00        .byte $00
- D - I - 0x038F21 24:8F11: 00        .byte $00
- D - I - 0x038F22 24:8F12: 00        .byte $00
- D - I - 0x038F23 24:8F13: 00        .byte $00
- D - I - 0x038F24 24:8F14: 00        .byte $00
; bzk возможно не используется
- - - - - 0x038F25 24:8F15: 00        .byte $00
- - - - - 0x038F26 24:8F16: 00        .byte $00

off_8F17_01_цубаса:
- D - I - 0x038F27 24:8F17: 4D 93     .word off_934D
- D - I - 0x038F29 24:8F19: 0A 94     .word off_940A
- D - I - 0x038F2B 24:8F1B: 10 94     .word off_9410
- D - I - 0x038F2D 24:8F1D: 25 94     .word off_9425
- D - I - 0x038F2F 24:8F1F: 00        .byte $00
- D - I - 0x038F30 24:8F20: 00        .byte $00
- D - I - 0x038F31 24:8F21: 00        .byte $00
- D - I - 0x038F32 24:8F22: 00        .byte $00
- D - I - 0x038F33 24:8F23: 00        .byte $00
- D - I - 0x038F34 24:8F24: 00        .byte $00

off_8F25_11_мисаки:
- D - I - 0x038F35 24:8F25: 58 93     .word off_9358
- D - I - 0x038F37 24:8F27: 00        .byte $00
- D - I - 0x038F38 24:8F28: 00        .byte $00
- D - I - 0x038F39 24:8F29: 00        .byte $00
- D - I - 0x038F3A 24:8F2A: 00        .byte $00
- D - I - 0x038F3B 24:8F2B: 27 94     .word off_9427
- D - I - 0x038F3D 24:8F2D: 00        .byte $00
- D - I - 0x038F3E 24:8F2E: 00        .byte $00
- D - I - 0x038F3F 24:8F2F: 00        .byte $00
- D - I - 0x038F40 24:8F30: 00        .byte $00
- D - I - 0x038F41 24:8F31: 00        .byte $00
- D - I - 0x038F42 24:8F32: 00        .byte $00

off_8F33_14_ишизаки:
- D - I - 0x038F43 24:8F33: 00        .byte $00
- D - I - 0x038F44 24:8F34: 00        .byte $00
- D - I - 0x038F45 24:8F35: 00        .byte $00
- D - I - 0x038F46 24:8F36: 00        .byte $00
- D - I - 0x038F47 24:8F37: 00        .byte $00
- D - I - 0x038F48 24:8F38: 00        .byte $00
- D - I - 0x038F49 24:8F39: 00        .byte $00
- D - I - 0x038F4A 24:8F3A: 00        .byte $00
- D - I - 0x038F4B 24:8F3B: 36 94     .word off_9436
- D - I - 0x038F4D 24:8F3D: 00        .byte $00
- D - I - 0x038F4E 24:8F3E: 00        .byte $00
- D - I - 0x038F4F 24:8F3F: 00        .byte $00
- D - I - 0x038F50 24:8F40: 00        .byte $00

off_8F41_15_нитта:
- D - I - 0x038F51 24:8F41: 5D 93     .word off_935D
- D - I - 0x038F53 24:8F43: 00        .byte $00
- D - I - 0x038F54 24:8F44: 00        .byte $00
- D - I - 0x038F55 24:8F45: 00        .byte $00
- D - I - 0x038F56 24:8F46: 00        .byte $00
- D - I - 0x038F57 24:8F47: 00        .byte $00
- D - I - 0x038F58 24:8F48: 00        .byte $00
- - - - - 0x038F59 24:8F49: 00        .byte $00
- - - - - 0x038F5A 24:8F4A: 00        .byte $00
- D - I - 0x038F5B 24:8F4B: 00        .byte $00
- D - I - 0x038F5C 24:8F4C: 00        .byte $00
- - - - - 0x038F5D 24:8F4D: 00        .byte $00
- - - - - 0x038F5E 24:8F4E: 00        .byte $00

off_8F4F_17_масао:
- D - I - 0x038F5F 24:8F4F: 60 93     .word off_9360
- D - I - 0x038F61 24:8F51: 00        .byte $00
- D - I - 0x038F62 24:8F52: 00        .byte $00
- D - I - 0x038F63 24:8F53: 00        .byte $00
- D - I - 0x038F64 24:8F54: 00        .byte $00
- D - I - 0x038F65 24:8F55: 29 94     .word off_9429
- - - - - 0x038F67 24:8F57: 37 94     .word off_9437
- D - I - 0x038F69 24:8F59: 46 94     .word off_9446
- D - I - 0x038F6B 24:8F5B: 5A 94     .word off_945A

off_8F5D_18_казуо:
- D - I - 0x038F6D 24:8F5D: 69 93     .word off_9369
- D - I - 0x038F6F 24:8F5F: 00        .byte $00
- D - I - 0x038F70 24:8F60: 00        .byte $00
- D - I - 0x038F71 24:8F61: 00        .byte $00
- D - I - 0x038F72 24:8F62: 00        .byte $00
- D - I - 0x038F73 24:8F63: 2B 94     .word off_942B
- - - - - 0x038F75 24:8F65: 39 94     .word off_9439
- D - I - 0x038F77 24:8F67: 48 94     .word off_9448
- D - I - 0x038F79 24:8F69: 5C 94     .word off_945C

off_8F6B_19_сано:
- D - I - 0x038F7B 24:8F6B: 72 93     .word off_9372
- D - I - 0x038F7D 24:8F6D: 00        .byte $00
- D - I - 0x038F7E 24:8F6E: 00        .byte $00
- D - I - 0x038F7F 24:8F6F: 00        .byte $00
- D - I - 0x038F80 24:8F70: 00        .byte $00
- D - I - 0x038F81 24:8F71: 00        .byte $00
- D - I - 0x038F82 24:8F72: 00        .byte $00
- - - - - 0x038F83 24:8F73: 00        .byte $00
- - - - - 0x038F84 24:8F74: 00        .byte $00
- D - I - 0x038F85 24:8F75: 00        .byte $00
- D - I - 0x038F86 24:8F76: 00        .byte $00
- D - I - 0x038F87 24:8F77: 00        .byte $00
- D - I - 0x038F88 24:8F78: 00        .byte $00

off_8F79_1A_хюга:
- D - I - 0x038F89 24:8F79: 74 93     .word off_9374
- D - I - 0x038F8B 24:8F7B: 00        .byte $00
- D - I - 0x038F8C 24:8F7C: 00        .byte $00
- D - I - 0x038F8D 24:8F7D: 11 94     .word off_9411
- D - I - 0x038F8F 24:8F7F: 2D 94     .word off_942D
- - - - - 0x038F91 24:8F81: 00        .byte $00
- - - - - 0x038F92 24:8F82: 00        .byte $00
- D - I - 0x038F93 24:8F83: 4A 94     .word off_944A
- D - I - 0x038F95 24:8F85: 00        .byte $00
- D - I - 0x038F96 24:8F86: 00        .byte $00

off_8F87_1B_сода:
- D - I - 0x038F97 24:8F87: 78 93     .word off_9378
- D - I - 0x038F99 24:8F89: 0B 94     .word off_940B
- D - I - 0x038F9B 24:8F8B: 00        .byte $00
- D - I - 0x038F9C 24:8F8C: 00        .byte $00
- D - I - 0x038F9D 24:8F8D: 00        .byte $00
- D - I - 0x038F9E 24:8F8E: 00        .byte $00
- D - I - 0x038F9F 24:8F8F: 00        .byte $00
- D - I - 0x038FA0 24:8F90: 00        .byte $00
- D - I - 0x038FA1 24:8F91: 4B 94     .word off_944B
- D - I - 0x038FA3 24:8F93: 00        .byte $00
- D - I - 0x038FA4 24:8F94: 00        .byte $00

off_8F95_1C_джито:
- D - I - 0x038FA5 24:8F95: 7A 93     .word off_937A
- D - I - 0x038FA7 24:8F97: 00        .byte $00
- D - I - 0x038FA8 24:8F98: 00        .byte $00
- D - I - 0x038FA9 24:8F99: 12 94     .word off_9412
- D - I - 0x038FAB 24:8F9B: 00        .byte $00
- D - I - 0x038FAC 24:8F9C: 00        .byte $00
- D - I - 0x038FAD 24:8F9D: 3B 94     .word off_943B
- D - I - 0x038FAF 24:8F9F: 4C 94     .word off_944C
- - - - - 0x038FB1 24:8FA1: 00        .byte $00
- - - - - 0x038FB2 24:8FA2: 00        .byte $00

off_8FA3_1D_мацуяма:
- D - I - 0x038FB3 24:8FA3: 7D 93     .word off_937D
- D - I - 0x038FB5 24:8FA5: 00        .byte $00
- D - I - 0x038FB6 24:8FA6: 00        .byte $00
- D - I - 0x038FB7 24:8FA7: 00        .byte $00
- D - I - 0x038FB8 24:8FA8: 00        .byte $00
- - - - - 0x038FB9 24:8FA9: 00        .byte $00
- - - - - 0x038FBA 24:8FAA: 00        .byte $00
- - - - - 0x038FBB 24:8FAB: 00        .byte $00
- - - - - 0x038FBC 24:8FAC: 00        .byte $00
- D - I - 0x038FBD 24:8FAD: 00        .byte $00
- D - I - 0x038FBE 24:8FAE: 00        .byte $00
- D - I - 0x038FBF 24:8FAF: 00        .byte $00
- D - I - 0x038FC0 24:8FB0: 00        .byte $00

off_8FB1_1F_савада:
- - - - - 0x038FC1 24:8FB1: 00        .byte $00
- - - - - 0x038FC2 24:8FB2: 00        .byte $00
- - - - - 0x038FC3 24:8FB3: 00        .byte $00
- - - - - 0x038FC4 24:8FB4: 00        .byte $00
- - - - - 0x038FC5 24:8FB5: 00        .byte $00
- - - - - 0x038FC6 24:8FB6: 00        .byte $00
- - - - - 0x038FC7 24:8FB7: 2F 94     .word off_942F
- - - - - 0x038FC9 24:8FB9: 00        .byte $00
- - - - - 0x038FCA 24:8FBA: 00        .byte $00
- - - - - 0x038FCB 24:8FBB: 00        .byte $00
- - - - - 0x038FCC 24:8FBC: 00        .byte $00
- - - - - 0x038FCD 24:8FBD: 00        .byte $00
- - - - - 0x038FCE 24:8FBE: 00        .byte $00

off_8FBF_20_мисуги:
- D - I - 0x038FCF 24:8FBF: 80 93     .word off_9380
- D - I - 0x038FD1 24:8FC1: 00        .byte $00
- D - I - 0x038FD2 24:8FC2: 00        .byte $00
- D - I - 0x038FD3 24:8FC3: 00        .byte $00
- D - I - 0x038FD4 24:8FC4: 00        .byte $00
- D - I - 0x038FD5 24:8FC5: 00        .byte $00
- D - I - 0x038FD6 24:8FC6: 00        .byte $00
- D - I - 0x038FD7 24:8FC7: 00        .byte $00
- D - I - 0x038FD8 24:8FC8: 00        .byte $00
- D - I - 0x038FD9 24:8FC9: 00        .byte $00
- D - I - 0x038FDA 24:8FCA: 00        .byte $00
- D - I - 0x038FDB 24:8FCB: 00        .byte $00
- D - I - 0x038FDC 24:8FCC: 00        .byte $00

off_8FCD_23_сатретусги:
- D - I - 0x038FDD 24:8FCD: 82 93     .word off_9382
- D - I - 0x038FDF 24:8FCF: 00        .byte $00
- D - I - 0x038FE0 24:8FD0: 00        .byte $00
- D - I - 0x038FE1 24:8FD1: 00        .byte $00
- D - I - 0x038FE2 24:8FD2: 00        .byte $00
- D - I - 0x038FE3 24:8FD3: 00        .byte $00
- D - I - 0x038FE4 24:8FD4: 00        .byte $00
- - - - - 0x038FE5 24:8FD5: 00        .byte $00
- - - - - 0x038FE6 24:8FD6: 00        .byte $00
- D - I - 0x038FE7 24:8FD7: 00        .byte $00
- D - I - 0x038FE8 24:8FD8: 00        .byte $00
- D - I - 0x038FE9 24:8FD9: 00        .byte $00
- D - I - 0x038FEA 24:8FDA: 00        .byte $00

off_8FDB_24_рибейро:
- D - I - 0x038FEB 24:8FDB: 84 93     .word off_9384
- D - I - 0x038FED 24:8FDD: 00        .byte $00
- D - I - 0x038FEE 24:8FDE: 00        .byte $00
- D - I - 0x038FEF 24:8FDF: 00        .byte $00
- D - I - 0x038FF0 24:8FE0: 00        .byte $00
- D - I - 0x038FF1 24:8FE1: 00        .byte $00
- D - I - 0x038FF2 24:8FE2: 00        .byte $00
- - - - - 0x038FF3 24:8FE3: 00        .byte $00
- - - - - 0x038FF4 24:8FE4: 00        .byte $00
- D - I - 0x038FF5 24:8FE5: 00        .byte $00
- D - I - 0x038FF6 24:8FE6: 00        .byte $00
- D - I - 0x038FF7 24:8FE7: 00        .byte $00
- D - I - 0x038FF8 24:8FE8: 00        .byte $00

off_8FE9_27_тониньо:
- D - I - 0x038FF9 24:8FE9: 86 93     .word off_9386
- D - I - 0x038FFB 24:8FEB: 00        .byte $00
- D - I - 0x038FFC 24:8FEC: 00        .byte $00
- D - I - 0x038FFD 24:8FED: 00        .byte $00
- D - I - 0x038FFE 24:8FEE: 00        .byte $00
- - - - - 0x038FFF 24:8FEF: 00        .byte $00
- - - - - 0x039000 24:8FF0: 00        .byte $00
- - - - - 0x039001 24:8FF1: 00        .byte $00
- - - - - 0x039002 24:8FF2: 00        .byte $00
- - - - - 0x039003 24:8FF3: 00        .byte $00
- - - - - 0x039004 24:8FF4: 00        .byte $00
- D - I - 0x039005 24:8FF5: 00        .byte $00
- D - I - 0x039006 24:8FF6: 00        .byte $00

off_8FF7_28_ней:
- D - I - 0x039007 24:8FF7: 88 93     .word off_9388
- D - I - 0x039009 24:8FF9: 00        .byte $00
- D - I - 0x03900A 24:8FFA: 00        .byte $00
- D - I - 0x03900B 24:8FFB: 13 94     .word off_9413
- - - - - 0x03900D 24:8FFD: 00        .byte $00
- - - - - 0x03900E 24:8FFE: 00        .byte $00
- - - - - 0x03900F 24:8FFF: 00        .byte $00
- - - - - 0x039010 24:9000: 00        .byte $00
- D - I - 0x039011 24:9001: 00        .byte $00
- D - I - 0x039012 24:9002: 00        .byte $00
- D - I - 0x039013 24:9003: 00        .byte $00
- D - I - 0x039014 24:9004: 00        .byte $00

off_9005_29_загалло:
- D - I - 0x039015 24:9005: 8A 93     .word off_938A
- D - I - 0x039017 24:9007: 00        .byte $00
- D - I - 0x039018 24:9008: 00        .byte $00
- D - I - 0x039019 24:9009: 14 94     .word off_9414
- - - - - 0x03901B 24:900B: 00        .byte $00
- - - - - 0x03901C 24:900C: 00        .byte $00
- - - - - 0x03901D 24:900D: 00        .byte $00
- - - - - 0x03901E 24:900E: 00        .byte $00
- D - I - 0x03901F 24:900F: 00        .byte $00
- D - I - 0x039020 24:9010: 00        .byte $00
- - - - - 0x039021 24:9011: 00        .byte $00
- - - - - 0x039022 24:9012: 00        .byte $00

off_9013_2A_дирсеу:
- - - - - 0x039023 24:9013: 8C 93     .word off_938C
- D - I - 0x039025 24:9015: 00        .byte $00
- D - I - 0x039026 24:9016: 00        .byte $00
- D - I - 0x039027 24:9017: 00        .byte $00
- D - I - 0x039028 24:9018: 00        .byte $00
- D - I - 0x039029 24:9019: 00        .byte $00
- D - I - 0x03902A 24:901A: 00        .byte $00
- D - I - 0x03902B 24:901B: 3C 94     .word off_943C
- D - I - 0x03902D 24:901D: 4D 94     .word off_944D
- - - - - 0x03902F 24:901F: 00        .byte $00
- - - - - 0x039030 24:9020: 00        .byte $00

off_9021_2B_карлос:
- D - I - 0x039031 24:9021: 8E 93     .word off_938E
- D - I - 0x039033 24:9023: 00        .byte $00
- D - I - 0x039034 24:9024: 00        .byte $00
- D - I - 0x039035 24:9025: 15 94     .word off_9415
- - - - - 0x039037 24:9027: 00        .byte $00
- - - - - 0x039038 24:9028: 00        .byte $00
- - - - - 0x039039 24:9029: 00        .byte $00
- - - - - 0x03903A 24:902A: 00        .byte $00
- D - I - 0x03903B 24:902B: 00        .byte $00
- D - I - 0x03903C 24:902C: 00        .byte $00
- D - I - 0x03903D 24:902D: 00        .byte $00
- D - I - 0x03903E 24:902E: 00        .byte $00

off_902F_2C_сантамария:
- D - I - 0x03903F 24:902F: 91 93     .word off_9391
- D - I - 0x039041 24:9031: 00        .byte $00
- D - I - 0x039042 24:9032: 00        .byte $00
- D - I - 0x039043 24:9033: 00        .byte $00
- D - I - 0x039044 24:9034: 00        .byte $00
- - - - - 0x039045 24:9035: 00        .byte $00
- - - - - 0x039046 24:9036: 00        .byte $00
- D - I - 0x039047 24:9037: 00        .byte $00
- D - I - 0x039048 24:9038: 00        .byte $00
- - - - - 0x039049 24:9039: 00        .byte $00
- - - - - 0x03904A 24:903A: 00        .byte $00
- - - - - 0x03904B 24:903B: 00        .byte $00
- - - - - 0x03904C 24:903C: 00        .byte $00

off_903D_2D_джеторио:
- D - I - 0x03904D 24:903D: 93 93     .word off_9393
- - - - - 0x03904F 24:903F: 00        .byte $00
- - - - - 0x039050 24:9040: 00        .byte $00
- - - - - 0x039051 24:9041: 00        .byte $00
- - - - - 0x039052 24:9042: 00        .byte $00
- - - - - 0x039053 24:9043: 00        .byte $00
- - - - - 0x039054 24:9044: 00        .byte $00
- - - - - 0x039055 24:9045: 00        .byte $00
- - - - - 0x039056 24:9046: 00        .byte $00
- - - - - 0x039057 24:9047: 00        .byte $00
- - - - - 0x039058 24:9048: 00        .byte $00
- - - - - 0x039059 24:9049: 00        .byte $00
- - - - - 0x03905A 24:904A: 00        .byte $00

off_904B_2E_джито:
- D - I - 0x03905B 24:904B: 95 93     .word off_9395
- D - I - 0x03905D 24:904D: 00        .byte $00
- D - I - 0x03905E 24:904E: 00        .byte $00
- D - I - 0x03905F 24:904F: 16 94     .word off_9416
- - - - - 0x039061 24:9051: 00        .byte $00
- - - - - 0x039062 24:9052: 00        .byte $00
- D - I - 0x039063 24:9053: 3D 94     .word off_943D
- D - I - 0x039065 24:9055: 4E 94     .word off_944E
- - - - - 0x039067 24:9057: 00        .byte $00
- - - - - 0x039068 24:9058: 00        .byte $00

off_9059_2F_сано:
- D - I - 0x039069 24:9059: 98 93     .word off_9398
- D - I - 0x03906B 24:905B: 00        .byte $00
- D - I - 0x03906C 24:905C: 00        .byte $00
- D - I - 0x03906D 24:905D: 00        .byte $00
- D - I - 0x03906E 24:905E: 00        .byte $00
- D - I - 0x03906F 24:905F: 00        .byte $00
- D - I - 0x039070 24:9060: 00        .byte $00
- - - - - 0x039071 24:9061: 00        .byte $00
- - - - - 0x039072 24:9062: 00        .byte $00
- - - - - 0x039073 24:9063: 00        .byte $00
- - - - - 0x039074 24:9064: 00        .byte $00
- D - I - 0x039075 24:9065: 00        .byte $00
- D - I - 0x039076 24:9066: 00        .byte $00

off_9067_30_масао:
- D - I - 0x039077 24:9067: 9A 93     .word off_939A
- D - I - 0x039079 24:9069: 00        .byte $00
- D - I - 0x03907A 24:906A: 00        .byte $00
- D - I - 0x03907B 24:906B: 00        .byte $00
- D - I - 0x03907C 24:906C: 00        .byte $00
- D - I - 0x03907D 24:906D: 31 94     .word off_9431
- - - - - 0x03907F 24:906F: 3E 94     .word off_943E
- D - I - 0x039081 24:9071: 4F 94     .word off_944F
- D - I - 0x039083 24:9073: 5E 94     .word off_945E

off_9075_31_казуо:
- D - I - 0x039085 24:9075: 9F 93     .word off_939F
- D - I - 0x039087 24:9077: 00        .byte $00
- D - I - 0x039088 24:9078: 00        .byte $00
- D - I - 0x039089 24:9079: 00        .byte $00
- D - I - 0x03908A 24:907A: 00        .byte $00
- D - I - 0x03908B 24:907B: 31 94     .word off_9431
- - - - - 0x03908D 24:907D: 00        .byte $00
- - - - - 0x03908E 24:907E: 00        .byte $00
- D - I - 0x03908F 24:907F: 00        .byte $00
- D - I - 0x039090 24:9080: 00        .byte $00
- - - - - 0x039091 24:9081: 00        .byte $00
- - - - - 0x039092 24:9082: 00        .byte $00

off_9083_32_сода:
- D - I - 0x039093 24:9083: A4 93     .word off_93A4
- D - I - 0x039095 24:9085: 0C 94     .word off_940C
- D - I - 0x039097 24:9087: 00        .byte $00
- D - I - 0x039098 24:9088: 00        .byte $00
- - - - - 0x039099 24:9089: 00        .byte $00
- - - - - 0x03909A 24:908A: 00        .byte $00
- - - - - 0x03909B 24:908B: 00        .byte $00
- - - - - 0x03909C 24:908C: 00        .byte $00
- D - I - 0x03909D 24:908D: 50 94     .word off_9450
- - - - - 0x03909F 24:908F: 00        .byte $00
- - - - - 0x0390A0 24:9090: 00        .byte $00

off_9091_34_мисуги:
- D - I - 0x0390A1 24:9091: A6 93     .word off_93A6
- D - I - 0x0390A3 24:9093: 00        .byte $00
- D - I - 0x0390A4 24:9094: 00        .byte $00
- D - I - 0x0390A5 24:9095: 00        .byte $00
- D - I - 0x0390A6 24:9096: 00        .byte $00
- D - I - 0x0390A7 24:9097: 00        .byte $00
- D - I - 0x0390A8 24:9098: 00        .byte $00
- - - - - 0x0390A9 24:9099: 00        .byte $00
- - - - - 0x0390AA 24:909A: 00        .byte $00
- - - - - 0x0390AB 24:909B: 00        .byte $00
- - - - - 0x0390AC 24:909C: 00        .byte $00
- D - I - 0x0390AD 24:909D: 00        .byte $00
- D - I - 0x0390AE 24:909E: 00        .byte $00

off_909F_35_мацуяма:
- D - I - 0x0390AF 24:909F: A8 93     .word off_93A8
- D - I - 0x0390B1 24:90A1: 00        .byte $00
- D - I - 0x0390B2 24:90A2: 00        .byte $00
- D - I - 0x0390B3 24:90A3: 00        .byte $00
- D - I - 0x0390B4 24:90A4: 00        .byte $00
- D - I - 0x0390B5 24:90A5: 00        .byte $00
- D - I - 0x0390B6 24:90A6: 00        .byte $00
- - - - - 0x0390B7 24:90A7: 00        .byte $00
- - - - - 0x0390B8 24:90A8: 00        .byte $00
- D - I - 0x0390B9 24:90A9: 00        .byte $00
- D - I - 0x0390BA 24:90AA: 00        .byte $00
- D - I - 0x0390BB 24:90AB: 00        .byte $00
- D - I - 0x0390BC 24:90AC: 00        .byte $00

off_90AD_36_хюга:
- D - I - 0x0390BD 24:90AD: AB 93     .word off_93AB
- D - I - 0x0390BF 24:90AF: 00        .byte $00
- D - I - 0x0390C0 24:90B0: 00        .byte $00
- D - I - 0x0390C1 24:90B1: 17 94     .word off_9417
- D - I - 0x0390C3 24:90B3: 32 94     .word off_9432
- - - - - 0x0390C5 24:90B5: 00        .byte $00
- - - - - 0x0390C6 24:90B6: 00        .byte $00
- D - I - 0x0390C7 24:90B7: 51 94     .word off_9451
- - - - - 0x0390C9 24:90B9: 00        .byte $00
- - - - - 0x0390CA 24:90BA: 00        .byte $00

off_90BB_38_савада:
- D - I - 0x0390CB 24:90BB: 00        .byte $00
- D - I - 0x0390CC 24:90BC: 00        .byte $00
- D - I - 0x0390CD 24:90BD: 00        .byte $00
- D - I - 0x0390CE 24:90BE: 00        .byte $00
- D - I - 0x0390CF 24:90BF: 00        .byte $00
- D - I - 0x0390D0 24:90C0: 00        .byte $00
- D - I - 0x0390D1 24:90C1: 32 94     .word off_9432
- - - - - 0x0390D3 24:90C3: 00        .byte $00
- - - - - 0x0390D4 24:90C4: 00        .byte $00
- - - - - 0x0390D5 24:90C5: 00        .byte $00
- - - - - 0x0390D6 24:90C6: 00        .byte $00
- - - - - 0x0390D7 24:90C7: 00        .byte $00
- - - - - 0x0390D8 24:90C8: 00        .byte $00

off_90C9_3A_рампион:
- D - I - 0x0390D9 24:90C9: AF 93     .word off_93AF
- D - I - 0x0390DB 24:90CB: 00        .byte $00
- D - I - 0x0390DC 24:90CC: 00        .byte $00
- D - I - 0x0390DD 24:90CD: 00        .byte $00
- D - I - 0x0390DE 24:90CE: 00        .byte $00
- D - I - 0x0390DF 24:90CF: 00        .byte $00
- D - I - 0x0390E0 24:90D0: 00        .byte $00
- D - I - 0x0390E1 24:90D1: 00        .byte $00
- D - I - 0x0390E2 24:90D2: 00        .byte $00
- D - I - 0x0390E3 24:90D3: 00        .byte $00
- D - I - 0x0390E4 24:90D4: 00        .byte $00
- D - I - 0x0390E5 24:90D5: 00        .byte $00
- D - I - 0x0390E6 24:90D6: 00        .byte $00

off_90D7_3B_викторино:
- D - I - 0x0390E7 24:90D7: B1 93     .word off_93B1
- D - I - 0x0390E9 24:90D9: 00        .byte $00
- D - I - 0x0390EA 24:90DA: 00        .byte $00
- D - I - 0x0390EB 24:90DB: 00        .byte $00
- D - I - 0x0390EC 24:90DC: 00        .byte $00
- - - - - 0x0390ED 24:90DD: 00        .byte $00
- - - - - 0x0390EE 24:90DE: 00        .byte $00
- D - I - 0x0390EF 24:90DF: 00        .byte $00
- D - I - 0x0390F0 24:90E0: 00        .byte $00
- - - - - 0x0390F1 24:90E1: 00        .byte $00
- - - - - 0x0390F2 24:90E2: 00        .byte $00
- D - I - 0x0390F3 24:90E3: 00        .byte $00
- D - I - 0x0390F4 24:90E4: 00        .byte $00

off_90E5_3D_капельман:
- D - I - 0x0390F5 24:90E5: B3 93     .word off_93B3
- D - I - 0x0390F7 24:90E7: 00        .byte $00
- D - I - 0x0390F8 24:90E8: 00        .byte $00
- D - I - 0x0390F9 24:90E9: 00        .byte $00
- D - I - 0x0390FA 24:90EA: 00        .byte $00
- - - - - 0x0390FB 24:90EB: 00        .byte $00
- - - - - 0x0390FC 24:90EC: 00        .byte $00
- - - - - 0x0390FD 24:90ED: 00        .byte $00
- - - - - 0x0390FE 24:90EE: 00        .byte $00
- D - I - 0x0390FF 24:90EF: 00        .byte $00
- D - I - 0x039100 24:90F0: 00        .byte $00
- - - - - 0x039101 24:90F1: 00        .byte $00
- - - - - 0x039102 24:90F2: 00        .byte $00

off_90F3_3E_кальц:
- D - I - 0x039103 24:90F3: 00        .byte $00
- D - I - 0x039104 24:90F4: 00        .byte $00
- D - I - 0x039105 24:90F5: 00        .byte $00
- D - I - 0x039106 24:90F6: 00        .byte $00
- D - I - 0x039107 24:90F7: 18 94     .word off_9418
- D - I - 0x039109 24:90F9: 00        .byte $00
- D - I - 0x03910A 24:90FA: 00        .byte $00
- - - - - 0x03910B 24:90FB: 00        .byte $00
- - - - - 0x03910C 24:90FC: 00        .byte $00
- D - I - 0x03910D 24:90FD: 00        .byte $00
- D - I - 0x03910E 24:90FE: 00        .byte $00
- D - I - 0x03910F 24:90FF: 00        .byte $00
- D - I - 0x039110 24:9100: 00        .byte $00

off_9101_3F_метза:
- - - - - 0x039111 24:9101: 00        .byte $00
- - - - - 0x039112 24:9102: 00        .byte $00
- D - I - 0x039113 24:9103: 0D 94     .word off_940D
- D - I - 0x039115 24:9105: 00        .byte $00
- D - I - 0x039116 24:9106: 00        .byte $00
- - - - - 0x039117 24:9107: 00        .byte $00
- - - - - 0x039118 24:9108: 00        .byte $00
- - - - - 0x039119 24:9109: 00        .byte $00
- - - - - 0x03911A 24:910A: 00        .byte $00
- - - - - 0x03911B 24:910B: 00        .byte $00
- - - - - 0x03911C 24:910C: 00        .byte $00
- D - I - 0x03911D 24:910D: 00        .byte $00
- D - I - 0x03911E 24:910E: 00        .byte $00

off_910F_41_хюга:
- D - I - 0x03911F 24:910F: B5 93     .word off_93B5
- D - I - 0x039121 24:9111: 00        .byte $00
- D - I - 0x039122 24:9112: 00        .byte $00
- D - I - 0x039123 24:9113: 19 94     .word off_9419
- - - - - 0x039125 24:9115: 00        .byte $00
- - - - - 0x039126 24:9116: 00        .byte $00
- - - - - 0x039127 24:9117: 00        .byte $00
- - - - - 0x039128 24:9118: 00        .byte $00
- D - I - 0x039129 24:9119: 52 94     .word off_9452
- - - - - 0x03912B 24:911B: 00        .byte $00
- - - - - 0x03912C 24:911C: 00        .byte $00

off_911D_42_нитта:
- - - - - 0x03912D 24:911D: B9 93     .word off_93B9
- - - - - 0x03912F 24:911F: 00        .byte $00
- - - - - 0x039130 24:9120: 00        .byte $00
- - - - - 0x039131 24:9121: 00        .byte $00
- - - - - 0x039132 24:9122: 00        .byte $00
- - - - - 0x039133 24:9123: 00        .byte $00
- - - - - 0x039134 24:9124: 00        .byte $00
- - - - - 0x039135 24:9125: 00        .byte $00
- - - - - 0x039136 24:9126: 00        .byte $00
- - - - - 0x039137 24:9127: 00        .byte $00
- - - - - 0x039138 24:9128: 00        .byte $00
- D - I - 0x039139 24:9129: 00        .byte $00
- D - I - 0x03913A 24:912A: 00        .byte $00

off_912B_43_сано:
- D - I - 0x03913B 24:912B: BC 93     .word off_93BC
- D - I - 0x03913D 24:912D: 00        .byte $00
- D - I - 0x03913E 24:912E: 00        .byte $00
- D - I - 0x03913F 24:912F: 00        .byte $00
- D - I - 0x039140 24:9130: 00        .byte $00
- D - I - 0x039141 24:9131: 00        .byte $00
- D - I - 0x039142 24:9132: 00        .byte $00
- - - - - 0x039143 24:9133: 00        .byte $00
- - - - - 0x039144 24:9134: 00        .byte $00
- - - - - 0x039145 24:9135: 00        .byte $00
- - - - - 0x039146 24:9136: 00        .byte $00
- D - I - 0x039147 24:9137: 00        .byte $00
- D - I - 0x039148 24:9138: 00        .byte $00

off_9139_44_мисаки:
- - - - - 0x039149 24:9139: BE 93     .word off_93BE
- D - I - 0x03914B 24:913B: 00        .byte $00
- D - I - 0x03914C 24:913C: 00        .byte $00
- D - I - 0x03914D 24:913D: 00        .byte $00
- D - I - 0x03914E 24:913E: 00        .byte $00
- - - - - 0x03914F 24:913F: 00        .byte $00
- - - - - 0x039150 24:9140: 00        .byte $00
- D - I - 0x039151 24:9141: 00        .byte $00
- D - I - 0x039152 24:9142: 00        .byte $00
- - - - - 0x039153 24:9143: 00        .byte $00
- - - - - 0x039154 24:9144: 00        .byte $00
- D - I - 0x039155 24:9145: 00        .byte $00
- D - I - 0x039156 24:9146: 00        .byte $00

off_9147_45_мисуги:
- D - I - 0x039157 24:9147: C1 93     .word off_93C1
- D - I - 0x039159 24:9149: 00        .byte $00
- D - I - 0x03915A 24:914A: 00        .byte $00
- - - - - 0x03915B 24:914B: 00        .byte $00
- - - - - 0x03915C 24:914C: 00        .byte $00
- D - I - 0x03915D 24:914D: 00        .byte $00
- D - I - 0x03915E 24:914E: 00        .byte $00
- - - - - 0x03915F 24:914F: 00        .byte $00
- - - - - 0x039160 24:9150: 00        .byte $00
- D - I - 0x039161 24:9151: 00        .byte $00
- D - I - 0x039162 24:9152: 00        .byte $00
- - - - - 0x039163 24:9153: 00        .byte $00
- - - - - 0x039164 24:9154: 00        .byte $00

off_9155_46_масао:
- D - I - 0x039165 24:9155: C3 93     .word off_93C3
- D - I - 0x039167 24:9157: 00        .byte $00
- D - I - 0x039168 24:9158: 00        .byte $00
- - - - - 0x039169 24:9159: 00        .byte $00
- - - - - 0x03916A 24:915A: 00        .byte $00
- - - - - 0x03916B 24:915B: 33 94     .word off_9433
- D - I - 0x03916D 24:915D: 3F 94     .word off_943F
- - - - - 0x03916F 24:915F: 53 94     .word off_9453
- - - - - 0x039171 24:9161: 5F 94     .word off_945F

off_9163_47_казуо:
- D - I - 0x039173 24:9163: C8 93     .word off_93C8
- D - I - 0x039175 24:9165: 00        .byte $00
- D - I - 0x039176 24:9166: 00        .byte $00
- D - I - 0x039177 24:9167: 00        .byte $00
- D - I - 0x039178 24:9168: 00        .byte $00
- D - I - 0x039179 24:9169: 33 94     .word off_9433
- D - I - 0x03917B 24:916B: 00        .byte $00
- D - I - 0x03917C 24:916C: 00        .byte $00
- D - I - 0x03917D 24:916D: 00        .byte $00
- D - I - 0x03917E 24:916E: 00        .byte $00
- - - - - 0x03917F 24:916F: 00        .byte $00
- - - - - 0x039180 24:9170: 00        .byte $00

off_9171_48_джито:
- D - I - 0x039181 24:9171: CD 93     .word off_93CD
- D - I - 0x039183 24:9173: 00        .byte $00
- D - I - 0x039184 24:9174: 00        .byte $00
- - - - - 0x039185 24:9175: 1A 94     .word off_941A
- - - - - 0x039187 24:9177: 00        .byte $00
- - - - - 0x039188 24:9178: 00        .byte $00
- - - - - 0x039189 24:9179: 40 94     .word off_9440
- D - I - 0x03918B 24:917B: 54 94     .word off_9454
- - - - - 0x03918D 24:917D: 00        .byte $00
- - - - - 0x03918E 24:917E: 00        .byte $00

off_917F_49_ишизаки:
- - - - - 0x03918F 24:917F: 00        .byte $00
- - - - - 0x039190 24:9180: 00        .byte $00
- - - - - 0x039191 24:9181: 00        .byte $00
- - - - - 0x039192 24:9182: 00        .byte $00
- - - - - 0x039193 24:9183: 00        .byte $00
- - - - - 0x039194 24:9184: 00        .byte $00
- - - - - 0x039195 24:9185: 00        .byte $00
- - - - - 0x039196 24:9186: 00        .byte $00
- D - I - 0x039197 24:9187: 41 94     .word off_9441
- - - - - 0x039199 24:9189: 00        .byte $00
- - - - - 0x03919A 24:918A: 00        .byte $00
- - - - - 0x03919B 24:918B: 00        .byte $00
- - - - - 0x03919C 24:918C: 00        .byte $00

off_918D_4A_сода:
- - - - - 0x03919D 24:918D: D0 93     .word off_93D0
- D - I - 0x03919F 24:918F: 0E 94     .word off_940E
- D - I - 0x0391A1 24:9191: 00        .byte $00
- D - I - 0x0391A2 24:9192: 00        .byte $00
- - - - - 0x0391A3 24:9193: 00        .byte $00
- - - - - 0x0391A4 24:9194: 00        .byte $00
- - - - - 0x0391A5 24:9195: 00        .byte $00
- - - - - 0x0391A6 24:9196: 00        .byte $00
- D - I - 0x0391A7 24:9197: 55 94     .word off_9455
- - - - - 0x0391A9 24:9199: 00        .byte $00
- - - - - 0x0391AA 24:919A: 00        .byte $00

off_919B_4B_мацуяма:
- D - I - 0x0391AB 24:919B: D2 93     .word off_93D2
- - - - - 0x0391AD 24:919D: 00        .byte $00
- - - - - 0x0391AE 24:919E: 00        .byte $00
- - - - - 0x0391AF 24:919F: 00        .byte $00
- - - - - 0x0391B0 24:91A0: 00        .byte $00
- - - - - 0x0391B1 24:91A1: 00        .byte $00
- - - - - 0x0391B2 24:91A2: 00        .byte $00
- D - I - 0x0391B3 24:91A3: 00        .byte $00
- D - I - 0x0391B4 24:91A4: 00        .byte $00
- D - I - 0x0391B5 24:91A5: 00        .byte $00
- D - I - 0x0391B6 24:91A6: 00        .byte $00
- D - I - 0x0391B7 24:91A7: 00        .byte $00
- D - I - 0x0391B8 24:91A8: 00        .byte $00

off_91A9_4D_ли_хан:
- D - I - 0x0391B9 24:91A9: D5 93     .word off_93D5
- - - - - 0x0391BB 24:91AB: 00        .byte $00
- - - - - 0x0391BC 24:91AC: 00        .byte $00
- D - I - 0x0391BD 24:91AD: 00        .byte $00
- D - I - 0x0391BE 24:91AE: 00        .byte $00
- D - I - 0x0391BF 24:91AF: 00        .byte $00
- D - I - 0x0391C0 24:91B0: 00        .byte $00
- - - - - 0x0391C1 24:91B1: 00        .byte $00
- - - - - 0x0391C2 24:91B2: 00        .byte $00
- D - I - 0x0391C3 24:91B3: 00        .byte $00
- D - I - 0x0391C4 24:91B4: 00        .byte $00
- - - - - 0x0391C5 24:91B5: 00        .byte $00
- - - - - 0x0391C6 24:91B6: 00        .byte $00

off_91B7_4E_ли_банкун:
- D - I - 0x0391C7 24:91B7: D7 93     .word off_93D7
- - - - - 0x0391C9 24:91B9: 00        .byte $00
- - - - - 0x0391CA 24:91BA: 00        .byte $00
- - - - - 0x0391CB 24:91BB: 00        .byte $00
- - - - - 0x0391CC 24:91BC: 00        .byte $00
- - - - - 0x0391CD 24:91BD: 00        .byte $00
- - - - - 0x0391CE 24:91BE: 00        .byte $00
- - - - - 0x0391CF 24:91BF: 00        .byte $00
- - - - - 0x0391D0 24:91C0: 00        .byte $00
- D - I - 0x0391D1 24:91C1: 00        .byte $00
- D - I - 0x0391D2 24:91C2: 00        .byte $00
- D - I - 0x0391D3 24:91C3: 00        .byte $00
- D - I - 0x0391D4 24:91C4: 00        .byte $00

off_91C5_4F_ша:
- D - I - 0x0391D5 24:91C5: D9 93     .word off_93D9
- D - I - 0x0391D7 24:91C7: 00        .byte $00
- D - I - 0x0391D8 24:91C8: 00        .byte $00
- - - - - 0x0391D9 24:91C9: 1B 94     .word off_941B
- D - I - 0x0391DB 24:91CB: 00        .byte $00
- D - I - 0x0391DC 24:91CC: 00        .byte $00
- - - - - 0x0391DD 24:91CD: 00        .byte $00
- - - - - 0x0391DE 24:91CE: 00        .byte $00
- - - - - 0x0391DF 24:91CF: 00        .byte $00
- - - - - 0x0391E0 24:91D0: 00        .byte $00
- - - - - 0x0391E1 24:91D1: 00        .byte $00
- - - - - 0x0391E2 24:91D2: 00        .byte $00

off_91D3_50_ким:
- D - I - 0x0391E3 24:91D3: DC 93     .word off_93DC
- D - I - 0x0391E5 24:91D5: 00        .byte $00
- D - I - 0x0391E6 24:91D6: 00        .byte $00
- D - I - 0x0391E7 24:91D7: 00        .byte $00
- D - I - 0x0391E8 24:91D8: 00        .byte $00
- - - - - 0x0391E9 24:91D9: 00        .byte $00
- - - - - 0x0391EA 24:91DA: 00        .byte $00
- - - - - 0x0391EB 24:91DB: 00        .byte $00
- - - - - 0x0391EC 24:91DC: 00        .byte $00
- - - - - 0x0391ED 24:91DD: 00        .byte $00
- - - - - 0x0391EE 24:91DE: 00        .byte $00
- - - - - 0x0391EF 24:91DF: 00        .byte $00
- - - - - 0x0391F0 24:91E0: 00        .byte $00

off_91E1_52_дзажик_GK:
- D - I - 0x0391F1 24:91E1: 01        .byte $01    ; <あ>
- D - I - 0x0391F2 24:91E2: 00        .byte $00
- - - - - 0x0391F3 24:91E3: 00        .byte $00
- - - - - 0x0391F4 24:91E4: 00        .byte $00
- - - - - 0x0391F5 24:91E5: 00        .byte $00
- - - - - 0x0391F6 24:91E6: 00        .byte $00
- - - - - 0x0391F7 24:91E7: 00        .byte $00
- - - - - 0x0391F8 24:91E8: 00        .byte $00
- - - - - 0x0391F9 24:91E9: 00        .byte $00
- - - - - 0x0391FA 24:91EA: 00        .byte $00
- - - - - 0x0391FB 24:91EB: 00        .byte $00
- - - - - 0x0391FC 24:91EC: 00        .byte $00
- - - - - 0x0391FD 24:91ED: 00        .byte $00
- - - - - 0x0391FE 24:91EE: 00        .byte $00
- - - - - 0x0391FF 24:91EF: 00        .byte $00
- - - - - 0x039200 24:91F0: 00        .byte $00
- - - - - 0x039201 24:91F1: 00        .byte $00
- - - - - 0x039202 24:91F2: 00        .byte $00
- - - - - 0x039203 24:91F3: 1C 94     .word off_941C
- - - - - 0x039205 24:91F5: 00        .byte $00
- - - - - 0x039206 24:91F6: 00        .byte $00
- - - - - 0x039207 24:91F7: 42 94     .word off_9442
- - - - - 0x039209 24:91F9: 56 94     .word off_9456
- - - - - 0x03920B 24:91FB: 00        .byte $00
- - - - - 0x03920C 24:91FC: 00        .byte $00

off_91FD_56_рашин_GK:
- D - I - 0x03920D 24:91FD: 02        .byte $02    ; <い>
- D - I - 0x03920E 24:91FE: 00        .byte $00
- - - - - 0x03920F 24:91FF: 00        .byte $00
- - - - - 0x039210 24:9200: 00        .byte $00
- - - - - 0x039211 24:9201: 00        .byte $00
- - - - - 0x039212 24:9202: 00        .byte $00
- - - - - 0x039213 24:9203: 00        .byte $00
- - - - - 0x039214 24:9204: 00        .byte $00
- - - - - 0x039215 24:9205: 00        .byte $00
- - - - - 0x039216 24:9206: 00        .byte $00
- - - - - 0x039217 24:9207: 00        .byte $00
- - - - - 0x039218 24:9208: 00        .byte $00
- - - - - 0x039219 24:9209: 00        .byte $00
- - - - - 0x03921A 24:920A: 00        .byte $00

off_920B_57_наполеон:
- D - I - 0x03921B 24:920B: DF 93     .word off_93DF
- D - I - 0x03921D 24:920D: 00        .byte $00
- D - I - 0x03921E 24:920E: 00        .byte $00
- D - I - 0x03921F 24:920F: 1D 94     .word off_941D
- D - I - 0x039221 24:9211: 34 94     .word off_9434
- D - I - 0x039223 24:9213: 00        .byte $00
- D - I - 0x039224 24:9214: 00        .byte $00
- D - I - 0x039225 24:9215: 00        .byte $00
- D - I - 0x039226 24:9216: 00        .byte $00
- D - I - 0x039227 24:9217: 00        .byte $00
- D - I - 0x039228 24:9218: 00        .byte $00

off_9219_58_пьер:
- D - I - 0x039229 24:9219: E3 93     .word off_93E3
- D - I - 0x03922B 24:921B: 00        .byte $00
- D - I - 0x03922C 24:921C: 00        .byte $00
- D - I - 0x03922D 24:921D: 00        .byte $00
- D - I - 0x03922E 24:921E: 00        .byte $00
- D - I - 0x03922F 24:921F: 34 94     .word off_9434
- - - - - 0x039231 24:9221: 00        .byte $00
- - - - - 0x039232 24:9222: 00        .byte $00
- D - I - 0x039233 24:9223: 00        .byte $00
- D - I - 0x039234 24:9224: 00        .byte $00
- D - I - 0x039235 24:9225: 00        .byte $00
- D - I - 0x039236 24:9226: 00        .byte $00

off_9227_5A_рампион:
- D - I - 0x039237 24:9227: E7 93     .word off_93E7
- D - I - 0x039239 24:9229: 00        .byte $00
- D - I - 0x03923A 24:922A: 00        .byte $00
- D - I - 0x03923B 24:922B: 00        .byte $00
- D - I - 0x03923C 24:922C: 00        .byte $00
- D - I - 0x03923D 24:922D: 00        .byte $00
- D - I - 0x03923E 24:922E: 00        .byte $00
- - - - - 0x03923F 24:922F: 00        .byte $00
- - - - - 0x039240 24:9230: 00        .byte $00
- D - I - 0x039241 24:9231: 00        .byte $00
- D - I - 0x039242 24:9232: 00        .byte $00
- D - I - 0x039243 24:9233: 00        .byte $00
- D - I - 0x039244 24:9234: 00        .byte $00

off_9235_5C_ислас:
- D - I - 0x039245 24:9235: E9 93     .word off_93E9
- D - I - 0x039247 24:9237: 00        .byte $00
- D - I - 0x039248 24:9238: 00        .byte $00
- D - I - 0x039249 24:9239: 1E 94     .word off_941E
- - - - - 0x03924B 24:923B: 00        .byte $00
- - - - - 0x03924C 24:923C: 00        .byte $00
- D - I - 0x03924D 24:923D: 00        .byte $00
- D - I - 0x03924E 24:923E: 00        .byte $00
- D - I - 0x03924F 24:923F: 00        .byte $00
- D - I - 0x039250 24:9240: 00        .byte $00
- D - I - 0x039251 24:9241: 00        .byte $00
- D - I - 0x039252 24:9242: 00        .byte $00

off_9243_5D_либута:
- D - I - 0x039253 24:9243: 00        .byte $00
- D - I - 0x039254 24:9244: 00        .byte $00
- D - I - 0x039255 24:9245: 00        .byte $00
- D - I - 0x039256 24:9246: 00        .byte $00
- D - I - 0x039257 24:9247: 1F 94     .word off_941F
- - - - - 0x039259 24:9249: 00        .byte $00
- - - - - 0x03925A 24:924A: 00        .byte $00
- D - I - 0x03925B 24:924B: 43 94     .word off_9443
- D - I - 0x03925D 24:924D: 57 94     .word off_9457
- - - - - 0x03925F 24:924F: 00        .byte $00
- - - - - 0x039260 24:9250: 00        .byte $00

off_9251_5E_паскаль:
- - - - - 0x039261 24:9251: 00        .byte $00
- - - - - 0x039262 24:9252: 00        .byte $00
- D - I - 0x039263 24:9253: 00        .byte $00
- D - I - 0x039264 24:9254: 00        .byte $00
- D - I - 0x039265 24:9255: 00        .byte $00
- D - I - 0x039266 24:9256: 00        .byte $00
- - - - - 0x039267 24:9257: 35 94     .word off_9435
- D - I - 0x039269 24:9259: 00        .byte $00
- D - I - 0x03926A 24:925A: 00        .byte $00
- D - I - 0x03926B 24:925B: 00        .byte $00
- D - I - 0x03926C 24:925C: 00        .byte $00
- D - I - 0x03926D 24:925D: 00        .byte $00
- D - I - 0x03926E 24:925E: 00        .byte $00

off_925F_5F_сатретусги:
- D - I - 0x03926F 24:925F: EB 93     .word off_93EB
- D - I - 0x039271 24:9261: 00        .byte $00
- D - I - 0x039272 24:9262: 00        .byte $00
- D - I - 0x039273 24:9263: 00        .byte $00
- D - I - 0x039274 24:9264: 00        .byte $00
- - - - - 0x039275 24:9265: 00        .byte $00
- - - - - 0x039276 24:9266: 00        .byte $00
- - - - - 0x039277 24:9267: 00        .byte $00
- - - - - 0x039278 24:9268: 00        .byte $00
- D - I - 0x039279 24:9269: 00        .byte $00
- D - I - 0x03927A 24:926A: 00        .byte $00
- - - - - 0x03927B 24:926B: 00        .byte $00
- - - - - 0x03927C 24:926C: 00        .byte $00

off_926D_60_диас:
- D - I - 0x03927D 24:926D: ED 93     .word off_93ED
- - - - - 0x03927F 24:926F: 00        .byte $00
- - - - - 0x039280 24:9270: 00        .byte $00
- D - I - 0x039281 24:9271: 00        .byte $00
- D - I - 0x039282 24:9272: 00        .byte $00
- D - I - 0x039283 24:9273: 35 94     .word off_9435
- D - I - 0x039285 24:9275: 00        .byte $00
- D - I - 0x039286 24:9276: 00        .byte $00
- D - I - 0x039287 24:9277: 00        .byte $00
- D - I - 0x039288 24:9278: 00        .byte $00
- D - I - 0x039289 24:9279: 00        .byte $00
- D - I - 0x03928A 24:927A: 00        .byte $00

off_927B_62_гальван:
- - - - - 0x03928B 24:927B: 00        .byte $00
- - - - - 0x03928C 24:927C: 00        .byte $00
- D - I - 0x03928D 24:927D: 00        .byte $00
- D - I - 0x03928E 24:927E: 00        .byte $00
- D - I - 0x03928F 24:927F: 20 94     .word off_9420
- - - - - 0x039291 24:9281: 00        .byte $00
- - - - - 0x039292 24:9282: 00        .byte $00
- D - I - 0x039293 24:9283: 44 94     .word off_9444
- - - - - 0x039295 24:9285: 58 94     .word off_9458
- - - - - 0x039297 24:9287: 00        .byte $00
- - - - - 0x039298 24:9288: 00        .byte $00

off_9289_63_шнайдер:
- D - I - 0x039299 24:9289: F1 93     .word off_93F1
- D - I - 0x03929B 24:928B: 00        .byte $00
- D - I - 0x03929C 24:928C: 00        .byte $00
- D - I - 0x03929D 24:928D: 00        .byte $00
- D - I - 0x03929E 24:928E: 00        .byte $00
- - - - - 0x03929F 24:928F: 00        .byte $00
- - - - - 0x0392A0 24:9290: 00        .byte $00
- - - - - 0x0392A1 24:9291: 00        .byte $00
- - - - - 0x0392A2 24:9292: 00        .byte $00
- D - I - 0x0392A3 24:9293: 00        .byte $00
- D - I - 0x0392A4 24:9294: 00        .byte $00
- D - I - 0x0392A5 24:9295: 00        .byte $00
- D - I - 0x0392A6 24:9296: 00        .byte $00

off_9297_65_кальц:
- - - - - 0x0392A7 24:9297: 00        .byte $00
- - - - - 0x0392A8 24:9298: 00        .byte $00
- D - I - 0x0392A9 24:9299: 00        .byte $00
- D - I - 0x0392AA 24:929A: 00        .byte $00
- D - I - 0x0392AB 24:929B: 21 94     .word off_9421
- - - - - 0x0392AD 24:929D: 00        .byte $00
- - - - - 0x0392AE 24:929E: 00        .byte $00
- D - I - 0x0392AF 24:929F: 00        .byte $00
- D - I - 0x0392B0 24:92A0: 00        .byte $00
- D - I - 0x0392B1 24:92A1: 00        .byte $00
- D - I - 0x0392B2 24:92A2: 00        .byte $00
- D - I - 0x0392B3 24:92A3: 00        .byte $00
- D - I - 0x0392B4 24:92A4: 00        .byte $00

off_92A5_66_метза:
- - - - - 0x0392B5 24:92A5: 00        .byte $00
- - - - - 0x0392B6 24:92A6: 00        .byte $00
- - - - - 0x0392B7 24:92A7: 0F 94     .word off_940F
- - - - - 0x0392B9 24:92A9: 00        .byte $00
- - - - - 0x0392BA 24:92AA: 00        .byte $00
- - - - - 0x0392BB 24:92AB: 00        .byte $00
- - - - - 0x0392BC 24:92AC: 00        .byte $00
- D - I - 0x0392BD 24:92AD: 00        .byte $00
- D - I - 0x0392BE 24:92AE: 00        .byte $00
- - - - - 0x0392BF 24:92AF: 00        .byte $00
- - - - - 0x0392C0 24:92B0: 00        .byte $00
- - - - - 0x0392C1 24:92B1: 00        .byte $00
- - - - - 0x0392C2 24:92B2: 00        .byte $00

off_92B3_68_капельман:
- D - I - 0x0392C3 24:92B3: F4 93     .word off_93F4
- D - I - 0x0392C5 24:92B5: 00        .byte $00
- D - I - 0x0392C6 24:92B6: 00        .byte $00
- D - I - 0x0392C7 24:92B7: 00        .byte $00
- D - I - 0x0392C8 24:92B8: 00        .byte $00
- D - I - 0x0392C9 24:92B9: 00        .byte $00
- D - I - 0x0392CA 24:92BA: 00        .byte $00
- - - - - 0x0392CB 24:92BB: 00        .byte $00
- - - - - 0x0392CC 24:92BC: 00        .byte $00
- D - I - 0x0392CD 24:92BD: 00        .byte $00
- D - I - 0x0392CE 24:92BE: 00        .byte $00
- D - I - 0x0392CF 24:92BF: 00        .byte $00
- D - I - 0x0392D0 24:92C0: 00        .byte $00

off_92C1_6A_карлос:
- D - I - 0x0392D1 24:92C1: F6 93     .word off_93F6
- D - I - 0x0392D3 24:92C3: 00        .byte $00
- D - I - 0x0392D4 24:92C4: 00        .byte $00
- D - I - 0x0392D5 24:92C5: 22 94     .word off_9422
- - - - - 0x0392D7 24:92C7: 00        .byte $00
- - - - - 0x0392D8 24:92C8: 00        .byte $00
- - - - - 0x0392D9 24:92C9: 00        .byte $00
- - - - - 0x0392DA 24:92CA: 00        .byte $00
- D - I - 0x0392DB 24:92CB: 00        .byte $00
- D - I - 0x0392DC 24:92CC: 00        .byte $00
- D - I - 0x0392DD 24:92CD: 00        .byte $00
- D - I - 0x0392DE 24:92CE: 00        .byte $00

off_92CF_6B_загалло:
- D - I - 0x0392DF 24:92CF: F9 93     .word off_93F9
- D - I - 0x0392E1 24:92D1: 00        .byte $00
- D - I - 0x0392E2 24:92D2: 00        .byte $00
- D - I - 0x0392E3 24:92D3: 23 94     .word off_9423
- - - - - 0x0392E5 24:92D5: 00        .byte $00
- - - - - 0x0392E6 24:92D6: 00        .byte $00
- - - - - 0x0392E7 24:92D7: 00        .byte $00
- - - - - 0x0392E8 24:92D8: 00        .byte $00
- D - I - 0x0392E9 24:92D9: 00        .byte $00
- D - I - 0x0392EA 24:92DA: 00        .byte $00
- D - I - 0x0392EB 24:92DB: 00        .byte $00
- D - I - 0x0392EC 24:92DC: 00        .byte $00

off_92DD_6C_рибейро:
- - - - - 0x0392ED 24:92DD: FB 93     .word off_93FB
- D - I - 0x0392EF 24:92DF: 00        .byte $00
- D - I - 0x0392F0 24:92E0: 00        .byte $00
- D - I - 0x0392F1 24:92E1: 00        .byte $00
- D - I - 0x0392F2 24:92E2: 00        .byte $00
- - - - - 0x0392F3 24:92E3: 00        .byte $00
- - - - - 0x0392F4 24:92E4: 00        .byte $00
- - - - - 0x0392F5 24:92E5: 00        .byte $00
- - - - - 0x0392F6 24:92E6: 00        .byte $00
- D - I - 0x0392F7 24:92E7: 00        .byte $00
- D - I - 0x0392F8 24:92E8: 00        .byte $00
- - - - - 0x0392F9 24:92E9: 00        .byte $00
- - - - - 0x0392FA 24:92EA: 00        .byte $00

off_92EB_6D_ней:
- D - I - 0x0392FB 24:92EB: FD 93     .word off_93FD
- D - I - 0x0392FD 24:92ED: 00        .byte $00
- D - I - 0x0392FE 24:92EE: 00        .byte $00
- D - I - 0x0392FF 24:92EF: 24 94     .word off_9424
- - - - - 0x039301 24:92F1: 00        .byte $00
- - - - - 0x039302 24:92F2: 00        .byte $00
- - - - - 0x039303 24:92F3: 00        .byte $00
- - - - - 0x039304 24:92F4: 00        .byte $00
- - - - - 0x039305 24:92F5: 00        .byte $00
- - - - - 0x039306 24:92F6: 00        .byte $00
- D - I - 0x039307 24:92F7: 00        .byte $00
- D - I - 0x039308 24:92F8: 00        .byte $00

off_92F9_6E_сантамария:
- D - I - 0x039309 24:92F9: FF 93     .word off_93FF
- D - I - 0x03930B 24:92FB: 00        .byte $00
- D - I - 0x03930C 24:92FC: 00        .byte $00
- D - I - 0x03930D 24:92FD: 00        .byte $00
- D - I - 0x03930E 24:92FE: 00        .byte $00
- - - - - 0x03930F 24:92FF: 00        .byte $00
- - - - - 0x039310 24:9300: 00        .byte $00
- D - I - 0x039311 24:9301: 00        .byte $00
- D - I - 0x039312 24:9302: 00        .byte $00
- D - I - 0x039313 24:9303: 00        .byte $00
- D - I - 0x039314 24:9304: 00        .byte $00
- D - I - 0x039315 24:9305: 00        .byte $00
- D - I - 0x039316 24:9306: 00        .byte $00

off_9307_6F_тониньо:
- D - I - 0x039317 24:9307: 01 94     .word off_9401
- D - I - 0x039319 24:9309: 00        .byte $00
- D - I - 0x03931A 24:930A: 00        .byte $00
- - - - - 0x03931B 24:930B: 00        .byte $00
- - - - - 0x03931C 24:930C: 00        .byte $00
- - - - - 0x03931D 24:930D: 00        .byte $00
- - - - - 0x03931E 24:930E: 00        .byte $00
- - - - - 0x03931F 24:930F: 00        .byte $00
- - - - - 0x039320 24:9310: 00        .byte $00
- - - - - 0x039321 24:9311: 00        .byte $00
- - - - - 0x039322 24:9312: 00        .byte $00
- - - - - 0x039323 24:9313: 00        .byte $00
- - - - - 0x039324 24:9314: 00        .byte $00

off_9315_72_дирсеу:
- - - - - 0x039325 24:9315: 03 94     .word off_9403
- - - - - 0x039327 24:9317: 00        .byte $00
- - - - - 0x039328 24:9318: 00        .byte $00
- - - - - 0x039329 24:9319: 00        .byte $00
- - - - - 0x03932A 24:931A: 00        .byte $00
- - - - - 0x03932B 24:931B: 00        .byte $00
- - - - - 0x03932C 24:931C: 00        .byte $00
- D - I - 0x03932D 24:931D: 45 94     .word off_9445
- D - I - 0x03932F 24:931F: 59 94     .word off_9459
- - - - - 0x039331 24:9321: 00        .byte $00
- - - - - 0x039332 24:9322: 00        .byte $00

off_9323_73_джеторио:
- - - - - 0x039333 24:9323: 05 94     .word off_9405
- D - I - 0x039335 24:9325: 00        .byte $00
- D - I - 0x039336 24:9326: 00        .byte $00
- - - - - 0x039337 24:9327: 00        .byte $00
- - - - - 0x039338 24:9328: 00        .byte $00
- - - - - 0x039339 24:9329: 00        .byte $00
- - - - - 0x03933A 24:932A: 00        .byte $00
- - - - - 0x03933B 24:932B: 00        .byte $00
- - - - - 0x03933C 24:932C: 00        .byte $00
- D - I - 0x03933D 24:932D: 00        .byte $00
- D - I - 0x03933E 24:932E: 00        .byte $00
- - - - - 0x03933F 24:932F: 00        .byte $00
- - - - - 0x039340 24:9330: 00        .byte $00

off_9331_74_гертис_GK:
- D - I - 0x039341 24:9331: 03        .byte $03    ; <う>
- D - I - 0x039342 24:9332: 00        .byte $00
- - - - - 0x039343 24:9333: 00        .byte $00
- - - - - 0x039344 24:9334: 00        .byte $00
- - - - - 0x039345 24:9335: 00        .byte $00
- - - - - 0x039346 24:9336: 00        .byte $00
- - - - - 0x039347 24:9337: 00        .byte $00
- - - - - 0x039348 24:9338: 00        .byte $00
- - - - - 0x039349 24:9339: 00        .byte $00
- - - - - 0x03934A 24:933A: 00        .byte $00
- - - - - 0x03934B 24:933B: 00        .byte $00
- - - - - 0x03934C 24:933C: 00        .byte $00
- - - - - 0x03934D 24:933D: 00        .byte $00
- - - - - 0x03934E 24:933E: 00        .byte $00

off_933F_75_коимбра:
- D - I - 0x03934F 24:933F: 07 94     .word off_9407
- D - I - 0x039351 24:9341: 00        .byte $00
- D - I - 0x039352 24:9342: 00        .byte $00
- D - I - 0x039353 24:9343: 00        .byte $00
- D - I - 0x039354 24:9344: 00        .byte $00
- - - - - 0x039355 24:9345: 00        .byte $00
- - - - - 0x039356 24:9346: 00        .byte $00
- - - - - 0x039357 24:9347: 00        .byte $00
- - - - - 0x039358 24:9348: 00        .byte $00
- D - I - 0x039359 24:9349: 00        .byte $00
- D - I - 0x03935A 24:934A: 00        .byte $00
- D - I - 0x03935B 24:934B: 00        .byte $00
- D - I - 0x03935C 24:934C: 00        .byte $00



off_934D:
- D - I - 0x03935D 24:934D: 0C        .byte $0C    ; <し>
- D - I - 0x03935E 24:934E: 3A        .byte $3A    ; <7>
- D - I - 0x03935F 24:934F: 12        .byte $12    ; <つ>
- D - I - 0x039360 24:9350: 25        .byte $25    ; <ゆ>
- D - I - 0x039361 24:9351: 11        .byte $11    ; <ち>
- D - I - 0x039362 24:9352: 48        .byte $48    ; <ク>
- D - I - 0x039363 24:9353: 4A        .byte $4A    ; <コ>
- D - I - 0x039364 24:9354: 49        .byte $49    ; <ケ>
- D - I - 0x039365 24:9355: 44        .byte $44    ; <エ>
- D - I - 0x039366 24:9356: 1A        .byte $1A    ; <は>
- D - I - 0x039367 24:9357: 03        .byte $03    ; <う>

off_9358:
- D - I - 0x039368 24:9358: 25        .byte $25    ; <ゆ>
- D - I - 0x039369 24:9359: 01        .byte $01    ; <あ>
- D - I - 0x03936A 24:935A: 3A        .byte $3A    ; <7>
- D - I - 0x03936B 24:935B: 41        .byte $41    ; <ア>
- D - I - 0x03936C 24:935C: 03        .byte $03    ; <う>

off_935D:
- D - I - 0x03936D 24:935D: 14        .byte $14    ; <と>
- D - I - 0x03936E 24:935E: 19        .byte $19    ; <の>
- D - I - 0x03936F 24:935F: 03        .byte $03    ; <う>

off_9360:
- D - I - 0x039370 24:9360: 22        .byte $22    ; <め>
- D - I - 0x039371 24:9361: 18        .byte $18    ; <ね>
- D - I - 0x039372 24:9362: 25        .byte $25    ; <ゆ>
- D - I - 0x039373 24:9363: 18        .byte $18    ; <ね>
- D - I - 0x039374 24:9364: 2A        .byte $2A    ; <れ>
- D - I - 0x039375 24:9365: 18        .byte $18    ; <ね>
- D - I - 0x039376 24:9366: 29        .byte $29    ; <る>
- D - I - 0x039377 24:9367: 18        .byte $18    ; <ね>
- D - I - 0x039378 24:9368: 03        .byte $03    ; <う>

off_9369:
- D - I - 0x039379 24:9369: 22        .byte $22    ; <め>
- D - I - 0x03937A 24:936A: 17        .byte $17    ; <ぬ>
- D - I - 0x03937B 24:936B: 25        .byte $25    ; <ゆ>
- D - I - 0x03937C 24:936C: 17        .byte $17    ; <ぬ>
- D - I - 0x03937D 24:936D: 2A        .byte $2A    ; <れ>
- D - I - 0x03937E 24:936E: 17        .byte $17    ; <ぬ>
- D - I - 0x03937F 24:936F: 29        .byte $29    ; <る>
- D - I - 0x039380 24:9370: 17        .byte $17    ; <ぬ>
- D - I - 0x039381 24:9371: 03        .byte $03    ; <う>

off_9372:
- D - I - 0x039382 24:9372: 3A        .byte $3A    ; <7>
- D - I - 0x039383 24:9373: 03        .byte $03    ; <う>

off_9374:
- D - I - 0x039384 24:9374: 30        .byte $30    ; <ゃ>
- D - I - 0x039385 24:9375: 34        .byte $34    ; <1>
- D - I - 0x039386 24:9376: 3A        .byte $3A    ; <7>
- D - I - 0x039387 24:9377: 03        .byte $03    ; <う>

off_9378:
- D - I - 0x039388 24:9378: 1C        .byte $1C    ; <ふ>
- D - I - 0x039389 24:9379: 03        .byte $03    ; <う>

off_937A:
- D - I - 0x03938A 24:937A: 4C        .byte $4C    ; <シ>
- D - I - 0x03938B 24:937B: 19        .byte $19    ; <の>
- D - I - 0x03938C 24:937C: 03        .byte $03    ; <う>

off_937D:
- D - I - 0x03938D 24:937D: 2C        .byte $2C    ; <わ>
- D - I - 0x03938E 24:937E: 3A        .byte $3A    ; <7>
- D - I - 0x03938F 24:937F: 03        .byte $03    ; <う>

off_9380:
- D - I - 0x039390 24:9380: 3E        .byte $3E    ; <Jr>
- D - I - 0x039391 24:9381: 03        .byte $03    ; <う>

off_9382:
- D - I - 0x039392 24:9382: 72        .byte $72    ; <ョ>
- D - I - 0x039393 24:9383: 03        .byte $03    ; <う>

off_9384:
- D - I - 0x039394 24:9384: 50        .byte $50    ; <タ>
- D - I - 0x039395 24:9385: 03        .byte $03    ; <う>

off_9386:
- D - I - 0x039396 24:9386: 0C        .byte $0C    ; <し>
- D - I - 0x039397 24:9387: 03        .byte $03    ; <う>

off_9388:
- D - I - 0x039398 24:9388: 54        .byte $54    ; <ト>
- D - I - 0x039399 24:9389: 03        .byte $03    ; <う>

off_938A:
- D - I - 0x03939A 24:938A: 88        .byte $88    ; <H>
- D - I - 0x03939B 24:938B: 03        .byte $03    ; <う>

off_938C:
- - - - - 0x03939C 24:938C: 76        .byte $76    ; <ォ>
- - - - - 0x03939D 24:938D: 03        .byte $03    ; <う>

off_938E:
- D - I - 0x03939E 24:938E: 58        .byte $58    ; <ネ>
- D - I - 0x03939F 24:938F: 3A        .byte $3A    ; <7>
- D - I - 0x0393A0 24:9390: 03        .byte $03    ; <う>

off_9391:
- D - I - 0x0393A1 24:9391: 50        .byte $50    ; <タ>
- D - I - 0x0393A2 24:9392: 03        .byte $03    ; <う>

off_9393:
- D - I - 0x0393A3 24:9393: 0C        .byte $0C    ; <し>
- D - I - 0x0393A4 24:9394: 03        .byte $03    ; <う>

off_9395:
- D - I - 0x0393A5 24:9395: 4C        .byte $4C    ; <シ>
- D - I - 0x0393A6 24:9396: FF        .byte $FF
- D - I - 0x0393A7 24:9397: 03        .byte $03    ; <う>

off_9398:
- D - I - 0x0393A8 24:9398: 3A        .byte $3A    ; <7>
- D - I - 0x0393A9 24:9399: 03        .byte $03    ; <う>

off_939A:
- D - I - 0x0393AA 24:939A: 22        .byte $22    ; <め>
- D - I - 0x0393AB 24:939B: FF        .byte $FF
- D - I - 0x0393AC 24:939C: 25        .byte $25    ; <ゆ>
- D - I - 0x0393AD 24:939D: FF        .byte $FF
- D - I - 0x0393AE 24:939E: 03        .byte $03    ; <う>

off_939F:
- D - I - 0x0393AF 24:939F: 22        .byte $22    ; <め>
- D - I - 0x0393B0 24:93A0: FF        .byte $FF
- D - I - 0x0393B1 24:93A1: 25        .byte $25    ; <ゆ>
- D - I - 0x0393B2 24:93A2: FF        .byte $FF
- D - I - 0x0393B3 24:93A3: 03        .byte $03    ; <う>

off_93A4:
- D - I - 0x0393B4 24:93A4: 1C        .byte $1C    ; <ふ>
- D - I - 0x0393B5 24:93A5: 03        .byte $03    ; <う>

off_93A6:
- D - I - 0x0393B6 24:93A6: 3E        .byte $3E    ; <Jr>
- D - I - 0x0393B7 24:93A7: 03        .byte $03    ; <う>

off_93A8:
- D - I - 0x0393B8 24:93A8: 2C        .byte $2C    ; <わ>
- D - I - 0x0393B9 24:93A9: 3A        .byte $3A    ; <7>
- D - I - 0x0393BA 24:93AA: 03        .byte $03    ; <う>

off_93AB:
- D - I - 0x0393BB 24:93AB: 30        .byte $30    ; <ゃ>
- D - I - 0x0393BC 24:93AC: 34        .byte $34    ; <1>
- D - I - 0x0393BD 24:93AD: 3A        .byte $3A    ; <7>
- D - I - 0x0393BE 24:93AE: 03        .byte $03    ; <う>

off_93AF:
- D - I - 0x0393BF 24:93AF: 7A        .byte $7A    ; <、>
- D - I - 0x0393C0 24:93B0: 03        .byte $03    ; <う>

off_93B1:
- D - I - 0x0393C1 24:93B1: 3A        .byte $3A    ; <7>
- D - I - 0x0393C2 24:93B2: 03        .byte $03    ; <う>

off_93B3:
- D - I - 0x0393C3 24:93B3: 60        .byte $60    ; <ミ>
- D - I - 0x0393C4 24:93B4: 03        .byte $03    ; <う>

off_93B5:
- D - I - 0x0393C5 24:93B5: 30        .byte $30    ; <ゃ>
- D - I - 0x0393C6 24:93B6: 34        .byte $34    ; <1>
- D - I - 0x0393C7 24:93B7: 3A        .byte $3A    ; <7>
- D - I - 0x0393C8 24:93B8: 03        .byte $03    ; <う>

off_93B9:
- - - - - 0x0393C9 24:93B9: 14        .byte $14    ; <と>
- - - - - 0x0393CA 24:93BA: 19        .byte $19    ; <の>
- - - - - 0x0393CB 24:93BB: 03        .byte $03    ; <う>

off_93BC:
- D - I - 0x0393CC 24:93BC: 3A        .byte $3A    ; <7>
- D - I - 0x0393CD 24:93BD: 03        .byte $03    ; <う>

off_93BE:
- - - - - 0x0393CE 24:93BE: 3A        .byte $3A    ; <7>
- - - - - 0x0393CF 24:93BF: 41        .byte $41    ; <ア>
- - - - - 0x0393D0 24:93C0: 03        .byte $03    ; <う>

off_93C1:
- D - I - 0x0393D1 24:93C1: 3E        .byte $3E    ; <Jr>
- D - I - 0x0393D2 24:93C2: 03        .byte $03    ; <う>

off_93C3:
- D - I - 0x0393D3 24:93C3: 2A        .byte $2A    ; <れ>
- D - I - 0x0393D4 24:93C4: FF        .byte $FF
- D - I - 0x0393D5 24:93C5: 29        .byte $29    ; <る>
- - - - - 0x0393D6 24:93C6: FF        .byte $FF
- D - I - 0x0393D7 24:93C7: 03        .byte $03    ; <う>

off_93C8:
- D - I - 0x0393D8 24:93C8: 2A        .byte $2A    ; <れ>
- D - I - 0x0393D9 24:93C9: FF        .byte $FF
- D - I - 0x0393DA 24:93CA: 29        .byte $29    ; <る>
- D - I - 0x0393DB 24:93CB: FF        .byte $FF
- D - I - 0x0393DC 24:93CC: 03        .byte $03    ; <う>

off_93CD:
- D - I - 0x0393DD 24:93CD: 4C        .byte $4C    ; <シ>
- D - I - 0x0393DE 24:93CE: FF        .byte $FF
- D - I - 0x0393DF 24:93CF: 03        .byte $03    ; <う>

off_93D0:
- - - - - 0x0393E0 24:93D0: 1C        .byte $1C    ; <ふ>
- - - - - 0x0393E1 24:93D1: 03        .byte $03    ; <う>

off_93D2:
- D - I - 0x0393E2 24:93D2: 2C        .byte $2C    ; <わ>
- D - I - 0x0393E3 24:93D3: 3A        .byte $3A    ; <7>
- D - I - 0x0393E4 24:93D4: 03        .byte $03    ; <う>

off_93D5:
- D - I - 0x0393E5 24:93D5: 7E        .byte $7E    ; <.>
- D - I - 0x0393E6 24:93D6: 03        .byte $03    ; <う>

off_93D7:
- D - I - 0x0393E7 24:93D7: 7E        .byte $7E    ; <.>
- D - I - 0x0393E8 24:93D8: 03        .byte $03    ; <う>

off_93D9:
- D - I - 0x0393E9 24:93D9: 25        .byte $25    ; <ゆ>
- D - I - 0x0393EA 24:93DA: FF        .byte $FF
- D - I - 0x0393EB 24:93DB: 03        .byte $03    ; <う>

off_93DC:
- D - I - 0x0393EC 24:93DC: 25        .byte $25    ; <ゆ>
- D - I - 0x0393ED 24:93DD: FF        .byte $FF
- D - I - 0x0393EE 24:93DE: 03        .byte $03    ; <う>

off_93DF:
- D - I - 0x0393EF 24:93DF: 68        .byte $68    ; <リ>
- D - I - 0x0393F0 24:93E0: 85        .byte $85    ; <E>
- D - I - 0x0393F1 24:93E1: 86        .byte $86    ; <F>
- D - I - 0x0393F2 24:93E2: 03        .byte $03    ; <う>

off_93E3:
- D - I - 0x0393F3 24:93E3: 64        .byte $64    ; <ヤ>
- D - I - 0x0393F4 24:93E4: 85        .byte $85    ; <E>
- D - I - 0x0393F5 24:93E5: 86        .byte $86    ; <F>
- D - I - 0x0393F6 24:93E6: 03        .byte $03    ; <う>

off_93E7:
- D - I - 0x0393F7 24:93E7: 7A        .byte $7A    ; <、>
- D - I - 0x0393F8 24:93E8: 03        .byte $03    ; <う>

off_93E9:
- D - I - 0x0393F9 24:93E9: 3A        .byte $3A    ; <7>
- D - I - 0x0393FA 24:93EA: 03        .byte $03    ; <う>

off_93EB:
- D - I - 0x0393FB 24:93EB: 72        .byte $72    ; <ョ>
- D - I - 0x0393FC 24:93EC: 03        .byte $03    ; <う>

off_93ED:
- D - I - 0x0393FD 24:93ED: 0C        .byte $0C    ; <し>
- D - I - 0x0393FE 24:93EE: 3A        .byte $3A    ; <7>
- D - I - 0x0393FF 24:93EF: 81        .byte $81    ; <A>
- D - I - 0x039400 24:93F0: 03        .byte $03    ; <う>

off_93F1:
- D - I - 0x039401 24:93F1: 3A        .byte $3A    ; <7>
- D - I - 0x039402 24:93F2: 6C        .byte $6C    ; <ワ>
- D - I - 0x039403 24:93F3: 03        .byte $03    ; <う>

off_93F4:
- D - I - 0x039404 24:93F4: 60        .byte $60    ; <ミ>
- D - I - 0x039405 24:93F5: 03        .byte $03    ; <う>

off_93F6:
- D - I - 0x039406 24:93F6: 58        .byte $58    ; <ネ>
- D - I - 0x039407 24:93F7: 3A        .byte $3A    ; <7>
- D - I - 0x039408 24:93F8: 03        .byte $03    ; <う>

off_93F9:
- D - I - 0x039409 24:93F9: 88        .byte $88    ; <H>
- D - I - 0x03940A 24:93FA: 03        .byte $03    ; <う>

off_93FB:
- - - - - 0x03940B 24:93FB: 50        .byte $50    ; <タ>
- - - - - 0x03940C 24:93FC: 03        .byte $03    ; <う>

off_93FD:
- D - I - 0x03940D 24:93FD: 54        .byte $54    ; <ト>
- D - I - 0x03940E 24:93FE: 03        .byte $03    ; <う>

off_93FF:
- D - I - 0x03940F 24:93FF: 50        .byte $50    ; <タ>
- D - I - 0x039410 24:9400: 03        .byte $03    ; <う>

off_9401:
- D - I - 0x039411 24:9401: 0C        .byte $0C    ; <し>
- D - I - 0x039412 24:9402: 03        .byte $03    ; <う>

off_9403:
- - - - - 0x039413 24:9403: 76        .byte $76    ; <ォ>
- - - - - 0x039414 24:9404: 03        .byte $03    ; <う>

off_9405:
- - - - - 0x039415 24:9405: 0C        .byte $0C    ; <し>
- - - - - 0x039416 24:9406: 03        .byte $03    ; <う>

off_9407:
- D - I - 0x039417 24:9407: 3A        .byte $3A    ; <7>
- D - I - 0x039418 24:9408: 5C        .byte $5C    ; <フ>
- D - I - 0x039419 24:9409: 03        .byte $03    ; <う>

off_940A:
- D - I - 0x03941A 24:940A: 01        .byte $01    ; <あ>

off_940B:
- D - I - 0x03941B 24:940B: 02        .byte $02    ; <い>

off_940C:
- D - I - 0x03941C 24:940C: 02        .byte $02    ; <い>

off_940D:
- D - I - 0x03941D 24:940D: 03        .byte $03    ; <う>

off_940E:
- D - I - 0x03941E 24:940E: 02        .byte $02    ; <い>

off_940F:
- - - - - 0x03941F 24:940F: 03        .byte $03    ; <う>

off_9410:
- D - I - 0x039420 24:9410: 01        .byte $01    ; <あ>

off_9411:
- D - I - 0x039421 24:9411: 02        .byte $02    ; <い>

off_9412:
- D - I - 0x039422 24:9412: 02        .byte $02    ; <い>

off_9413:
- D - I - 0x039423 24:9413: 03        .byte $03    ; <う>

off_9414:
- D - I - 0x039424 24:9414: 02        .byte $02    ; <い>

off_9415:
- D - I - 0x039425 24:9415: 04        .byte $04    ; <え>

off_9416:
- D - I - 0x039426 24:9416: 02        .byte $02    ; <い>

off_9417:
- D - I - 0x039427 24:9417: 02        .byte $02    ; <い>

off_9418:
- D - I - 0x039428 24:9418: 06        .byte $06    ; <か>

off_9419:
- D - I - 0x039429 24:9419: 02        .byte $02    ; <い>

off_941A:
- - - - - 0x03942A 24:941A: 02        .byte $02    ; <い>

off_941B:
- - - - - 0x03942B 24:941B: 02        .byte $02    ; <い>

off_941C:
- - - - - 0x03942C 24:941C: 02        .byte $02    ; <い>

off_941D:
- D - I - 0x03942D 24:941D: 02        .byte $02    ; <い>

off_941E:
- D - I - 0x03942E 24:941E: 05        .byte $05    ; <お>

off_941F:
- D - I - 0x03942F 24:941F: 02        .byte $02    ; <い>

off_9420:
- D - I - 0x039430 24:9420: 02        .byte $02    ; <い>

off_9421:
- D - I - 0x039431 24:9421: 06        .byte $06    ; <か>

off_9422:
- D - I - 0x039432 24:9422: 04        .byte $04    ; <え>

off_9423:
- D - I - 0x039433 24:9423: 02        .byte $02    ; <い>

off_9424:
- D - I - 0x039434 24:9424: 03        .byte $03    ; <う>

off_9425:
- D - I - 0x039435 24:9425: 01        .byte $01    ; <あ>
- D - I - 0x039436 24:9426: 11        .byte $11    ; <ち>

off_9427:
- D - I - 0x039437 24:9427: 01        .byte $01    ; <あ>
- D - I - 0x039438 24:9428: 01        .byte $01    ; <あ>

off_9429:
- D - I - 0x039439 24:9429: 03        .byte $03    ; <う>
- D - I - 0x03943A 24:942A: 18        .byte $18    ; <ね>

off_942B:
- D - I - 0x03943B 24:942B: 03        .byte $03    ; <う>
- D - I - 0x03943C 24:942C: 17        .byte $17    ; <ぬ>

off_942D:
- D - I - 0x03943D 24:942D: 02        .byte $02    ; <い>
- D - I - 0x03943E 24:942E: 1F        .byte $1F    ; <ま>

off_942F:
- - - - - 0x03943F 24:942F: 02        .byte $02    ; <い>
- - - - - 0x039440 24:9430: 1A        .byte $1A    ; <は>

off_9431:
- D - I - 0x039441 24:9431: 83        .byte $83    ; <C>

off_9432:
- D - I - 0x039442 24:9432: 82        .byte $82    ; <B>

off_9433:
- D - I - 0x039443 24:9433: 83        .byte $83    ; <C>

off_9434:
- D - I - 0x039444 24:9434: 84        .byte $84    ; <D>

off_9435:
- D - I - 0x039445 24:9435: 81        .byte $81    ; <A>

off_9436:
- D - I - 0x039446 24:9436: 81        .byte $81    ; <A>

off_9437:
- - - - - 0x039447 24:9437: 02        .byte $02    ; <い>
- - - - - 0x039448 24:9438: 18        .byte $18    ; <ね>

off_9439:
- - - - - 0x039449 24:9439: 02        .byte $02    ; <い>
- - - - - 0x03944A 24:943A: 17        .byte $17    ; <ぬ>

off_943B:
- D - I - 0x03944B 24:943B: 83        .byte $83    ; <C>

off_943C:
- D - I - 0x03944C 24:943C: 83        .byte $83    ; <C>

off_943D:
- D - I - 0x03944D 24:943D: 83        .byte $83    ; <C>

off_943E:
- - - - - 0x03944E 24:943E: 02        .byte $02    ; <い>

off_943F:
- D - I - 0x03944F 24:943F: 02        .byte $02    ; <い>

off_9440:
- D - I - 0x039450 24:9440: 83        .byte $83    ; <C>

off_9441:
- D - I - 0x039451 24:9441: 81        .byte $81    ; <A>

off_9442:
- - - - - 0x039452 24:9442: 83        .byte $83    ; <C>

off_9443:
- D - I - 0x039453 24:9443: 83        .byte $83    ; <C>

off_9444:
- D - I - 0x039454 24:9444: 83        .byte $83    ; <C>

off_9445:
- D - I - 0x039455 24:9445: 83        .byte $83    ; <C>

off_9446:
- D - I - 0x039456 24:9446: 01        .byte $01    ; <あ>
- D - I - 0x039457 24:9447: 18        .byte $18    ; <ね>

off_9448:
- D - I - 0x039458 24:9448: 01        .byte $01    ; <あ>
- D - I - 0x039459 24:9449: 17        .byte $17    ; <ぬ>

off_944A:
- D - I - 0x03945A 24:944A: 84        .byte $84    ; <D>

off_944B:
- D - I - 0x03945B 24:944B: 82        .byte $82    ; <B>

off_944C:
- D - I - 0x03945C 24:944C: 83        .byte $83    ; <C>

off_944D:
- D - I - 0x03945D 24:944D: 83        .byte $83    ; <C>

off_944E:
- D - I - 0x03945E 24:944E: 83        .byte $83    ; <C>

off_944F:
- D - I - 0x03945F 24:944F: 81        .byte $81    ; <A>

off_9450:
- D - I - 0x039460 24:9450: 82        .byte $82    ; <B>

off_9451:
- D - I - 0x039461 24:9451: 84        .byte $84    ; <D>

off_9452:
- D - I - 0x039462 24:9452: 84        .byte $84    ; <D>

off_9453:
- - - - - 0x039463 24:9453: 81        .byte $81    ; <A>

off_9454:
- D - I - 0x039464 24:9454: 83        .byte $83    ; <C>

off_9455:
- D - I - 0x039465 24:9455: 82        .byte $82    ; <B>

off_9456:
- - - - - 0x039466 24:9456: 83        .byte $83    ; <C>

off_9457:
- D - I - 0x039467 24:9457: 83        .byte $83    ; <C>

off_9458:
- - - - - 0x039468 24:9458: 83        .byte $83    ; <C>

off_9459:
- D - I - 0x039469 24:9459: 83        .byte $83    ; <C>

off_945A:
- D - I - 0x03946A 24:945A: 01        .byte $01    ; <あ>
- D - I - 0x03946B 24:945B: 18        .byte $18    ; <ね>

off_945C:
- D - I - 0x03946C 24:945C: 01        .byte $01    ; <あ>
- D - I - 0x03946D 24:945D: 17        .byte $17    ; <ぬ>

off_945E:
- D - I - 0x03946E 24:945E: 81        .byte $81    ; <A>

off_945F:
- - - - - 0x03946F 24:945F: 81        .byte $81    ; <A>



tbl_9460_стоимость_действий:
; затрата энергии
- D - - - 0x039470 24:9460: 74 94     .word off_9474_00
- D - - - 0x039472 24:9462: 00 95     .word off_9500_01_пасы_ХЗ
- D - - - 0x039474 24:9464: 10 95     .word off_9510_02
- D - - - 0x039476 24:9466: 2C 95     .word off_952C_03
- D - - - 0x039478 24:9468: 40 95     .word off_9540_04
- D - - - 0x03947A 24:946A: 44 95     .word off_9544_05
- D - - - 0x03947C 24:946C: 48 95     .word off_9548_06
- D - - - 0x03947E 24:946E: 50 95     .word off_9550_07_08_09
- D - - - 0x039480 24:9470: 50 95     .word off_9550_07_08_09
- D - - - 0x039482 24:9472: 50 95     .word off_9550_07_08_09

off_9474_00:
- D - I - 0x039484 24:9474: 00        .byte $00
- D - I - 0x039485 24:9475: 01        .byte $01    ; <あ>
- D - I - 0x039486 24:9476: 50        .byte $50    ; <タ>
- D - I - 0x039487 24:9477: 00        .byte $00
- D - I - 0x039488 24:9478: 00        .byte $00
- D - I - 0x039489 24:9479: 05        .byte $05    ; <お>
- D - I - 0x03948A 24:947A: 5A        .byte $5A    ; <ハ>
- D - I - 0x03948B 24:947B: 00        .byte $00
- D - I - 0x03948C 24:947C: 00        .byte $00
- D - I - 0x03948D 24:947D: 05        .byte $05    ; <お>
- D - I - 0x03948E 24:947E: 5A        .byte $5A    ; <ハ>
- D - I - 0x03948F 24:947F: 00        .byte $00
- D - I - 0x039490 24:9480: 8A        .byte $8A    ; <N>
- D - I - 0x039491 24:9481: 15        .byte $15    ; <な>
- D - I - 0x039492 24:9482: C8        .byte $C8    ; <ぱ>
- D - I - 0x039493 24:9483: 20        .byte $20    ; <み>
- D - I - 0x039494 24:9484: 9A        .byte $9A
- D - I - 0x039495 24:9485: 22        .byte $22    ; <め>
- D - I - 0x039496 24:9486: 40        .byte $40    ; <「>
- D - I - 0x039497 24:9487: 31        .byte $31    ; <ゅ>
- D - I - 0x039498 24:9488: 80        .byte $80
- D - I - 0x039499 24:9489: 10        .byte $10    ; <た>
- D - I - 0x03949A 24:948A: C8        .byte $C8    ; <ぱ>
- D - I - 0x03949B 24:948B: 20        .byte $20    ; <み>
- D - I - 0x03949C 24:948C: 84        .byte $84    ; <D>
- D - I - 0x03949D 24:948D: 16        .byte $16    ; <に>
- D - I - 0x03949E 24:948E: F0        .byte $F0
- D - I - 0x03949F 24:948F: 20        .byte $20    ; <み>
- D - I - 0x0394A0 24:9490: 84        .byte $84    ; <D>
- D - I - 0x0394A1 24:9491: 11        .byte $11    ; <ち>
- D - I - 0x0394A2 24:9492: C8        .byte $C8    ; <ぱ>
- D - I - 0x0394A3 24:9493: 00        .byte $00
- D - I - 0x0394A4 24:9494: 02        .byte $02    ; <い>
- D - I - 0x0394A5 24:9495: 12        .byte $12    ; <つ>
- D - I - 0x0394A6 24:9496: C8        .byte $C8    ; <ぱ>
- D - I - 0x0394A7 24:9497: 00        .byte $00
- D - I - 0x0394A8 24:9498: 85        .byte $85    ; <E>
- D - I - 0x0394A9 24:9499: 13        .byte $13    ; <て>
- D - I - 0x0394AA 24:949A: B4        .byte $B4    ; <ガ>
- D - I - 0x0394AB 24:949B: 10        .byte $10    ; <た>
- D - I - 0x0394AC 24:949C: 8C        .byte $8C    ; <M>
- D - I - 0x0394AD 24:949D: 23        .byte $23    ; <も>
- D - I - 0x0394AE 24:949E: 7C        .byte $7C    ; <~>
- D - I - 0x0394AF 24:949F: 21        .byte $21    ; <む>
- D - I - 0x0394B0 24:94A0: 85        .byte $85    ; <E>
- D - I - 0x0394B1 24:94A1: 1A        .byte $1A    ; <は>
- D - I - 0x0394B2 24:94A2: C8        .byte $C8    ; <ぱ>
- D - I - 0x0394B3 24:94A3: 20        .byte $20    ; <み>
- D - I - 0x0394B4 24:94A4: A0        .byte $A0    ; <が>
- D - I - 0x0394B5 24:94A5: 15        .byte $15    ; <な>
- D - I - 0x0394B6 24:94A6: F0        .byte $F0
- D - I - 0x0394B7 24:94A7: 20        .byte $20    ; <み>
- D - I - 0x0394B8 24:94A8: C0        .byte $C0    ; <ヅ>
- D - I - 0x0394B9 24:94A9: 22        .byte $22    ; <め>
- D - I - 0x0394BA 24:94AA: 72        .byte $72    ; <ョ>
- D - I - 0x0394BB 24:94AB: 21        .byte $21    ; <む>
- D - I - 0x0394BC 24:94AC: 02        .byte $02    ; <い>
- D - I - 0x0394BD 24:94AD: 11        .byte $11    ; <ち>
- D - I - 0x0394BE 24:94AE: A0        .byte $A0    ; <が>
- D - I - 0x0394BF 24:94AF: 20        .byte $20    ; <み>
- D - I - 0x0394C0 24:94B0: 86        .byte $86    ; <F>
- D - I - 0x0394C1 24:94B1: 18        .byte $18    ; <ね>
- D - I - 0x0394C2 24:94B2: FA        .byte $FA
- D - I - 0x0394C3 24:94B3: 20        .byte $20    ; <み>
- D - I - 0x0394C4 24:94B4: 85        .byte $85    ; <E>
- D - I - 0x0394C5 24:94B5: 18        .byte $18    ; <ね>
- D - I - 0x0394C6 24:94B6: FA        .byte $FA
- D - I - 0x0394C7 24:94B7: 20        .byte $20    ; <み>
- D - I - 0x0394C8 24:94B8: A8        .byte $A8    ; <ぜ>
- D - I - 0x0394C9 24:94B9: 2D        .byte $2D    ; <を>
- D - I - 0x0394CA 24:94BA: C8        .byte $C8    ; <ぱ>
- D - I - 0x0394CB 24:94BB: 30        .byte $30    ; <ゃ>
- D - I - 0x0394CC 24:94BC: 99        .byte $99
- D - I - 0x0394CD 24:94BD: 58        .byte $58    ; <ネ>
- D - I - 0x0394CE 24:94BE: 90        .byte $90    ; <U>
- D - I - 0x0394CF 24:94BF: 31        .byte $31    ; <ゅ>
- D - I - 0x0394D0 24:94C0: 92        .byte $92    ; <W>
- D - I - 0x0394D1 24:94C1: 12        .byte $12    ; <つ>
- D - I - 0x0394D2 24:94C2: C8        .byte $C8    ; <ぱ>
- D - I - 0x0394D3 24:94C3: 00        .byte $00
- D - I - 0x0394D4 24:94C4: 86        .byte $86    ; <F>
- D - I - 0x0394D5 24:94C5: 13        .byte $13    ; <て>
- D - I - 0x0394D6 24:94C6: 00        .byte $00
- D - I - 0x0394D7 24:94C7: 00        .byte $00
- D - I - 0x0394D8 24:94C8: 8A        .byte $8A    ; <N>
- D - I - 0x0394D9 24:94C9: 13        .byte $13    ; <て>
- D - I - 0x0394DA 24:94CA: 00        .byte $00
- D - I - 0x0394DB 24:94CB: 00        .byte $00
- D - I - 0x0394DC 24:94CC: 90        .byte $90    ; <U>
- D - I - 0x0394DD 24:94CD: 16        .byte $16    ; <に>
- D - I - 0x0394DE 24:94CE: 00        .byte $00
- D - I - 0x0394DF 24:94CF: 20        .byte $20    ; <み>
- D - I - 0x0394E0 24:94D0: A0        .byte $A0    ; <が>
- D - I - 0x0394E1 24:94D1: 1A        .byte $1A    ; <は>
- D - I - 0x0394E2 24:94D2: 00        .byte $00
- D - I - 0x0394E3 24:94D3: 20        .byte $20    ; <み>
- D - I - 0x0394E4 24:94D4: 85        .byte $85    ; <E>
- D - I - 0x0394E5 24:94D5: 0E        .byte $0E    ; <せ>
- D - I - 0x0394E6 24:94D6: 00        .byte $00
- D - I - 0x0394E7 24:94D7: 00        .byte $00
- D - I - 0x0394E8 24:94D8: 84        .byte $84    ; <D>
- D - I - 0x0394E9 24:94D9: 0E        .byte $0E    ; <せ>
- D - I - 0x0394EA 24:94DA: 00        .byte $00
- D - I - 0x0394EB 24:94DB: 00        .byte $00
- D - I - 0x0394EC 24:94DC: F0        .byte $F0
- D - I - 0x0394ED 24:94DD: 0F        .byte $0F    ; <そ>
- D - I - 0x0394EE 24:94DE: 00        .byte $00
- D - I - 0x0394EF 24:94DF: 20        .byte $20    ; <み>
- D - I - 0x0394F0 24:94E0: 00        .byte $00
- D - I - 0x0394F1 24:94E1: 15        .byte $15    ; <な>
- D - I - 0x0394F2 24:94E2: 00        .byte $00
- D - I - 0x0394F3 24:94E3: 20        .byte $20    ; <み>
- D - I - 0x0394F4 24:94E4: FA        .byte $FA
- D - I - 0x0394F5 24:94E5: 11        .byte $11    ; <ち>
- D - I - 0x0394F6 24:94E6: 00        .byte $00
- D - I - 0x0394F7 24:94E7: 00        .byte $00
- - - - - 0x0394F8 24:94E8: FA        .byte $FA
- - - - - 0x0394F9 24:94E9: 11        .byte $11    ; <ち>
- - - - - 0x0394FA 24:94EA: 00        .byte $00
- - - - - 0x0394FB 24:94EB: 00        .byte $00
- D - I - 0x0394FC 24:94EC: FA        .byte $FA
- D - I - 0x0394FD 24:94ED: 0D        .byte $0D    ; <す>
- D - I - 0x0394FE 24:94EE: 00        .byte $00
- D - I - 0x0394FF 24:94EF: 00        .byte $00
- D - I - 0x039500 24:94F0: 02        .byte $02    ; <い>
- D - I - 0x039501 24:94F1: 12        .byte $12    ; <つ>
- D - I - 0x039502 24:94F2: 00        .byte $00
- D - I - 0x039503 24:94F3: 20        .byte $20    ; <み>
- D - I - 0x039504 24:94F4: 01        .byte $01    ; <あ>
- D - I - 0x039505 24:94F5: 11        .byte $11    ; <ち>
- D - I - 0x039506 24:94F6: 00        .byte $00
- D - I - 0x039507 24:94F7: 20        .byte $20    ; <み>
- D - I - 0x039508 24:94F8: 98        .byte $98
- D - I - 0x039509 24:94F9: 21        .byte $21    ; <む>
- D - I - 0x03950A 24:94FA: 00        .byte $00
- D - I - 0x03950B 24:94FB: 20        .byte $20    ; <み>
- D - I - 0x03950C 24:94FC: FC        .byte $FC
- D - I - 0x03950D 24:94FD: 14        .byte $14    ; <と>
- D - I - 0x03950E 24:94FE: 00        .byte $00
- D - I - 0x03950F 24:94FF: 20        .byte $20    ; <み>

off_9500_01_пасы_ХЗ:
- D - I - 0x039510 24:9500: 00        .byte $00
- D - I - 0x039511 24:9501: 02        .byte $02    ; <い>
; стоимость паса
- D - I - 0x039512 24:9502: 14        .byte $14    ; <と>
- D - I - 0x039513 24:9503: 00        .byte $00
; драйв пас, первые 2 бита отвечают за высоту
- D - I - 0x039514 24:9504: B2        .byte $B2    ; <べ>
- D - I - 0x039515 24:9505: 15        .byte $15    ; <な>
- D - I - 0x039516 24:9506: 28        .byte $28    ; <り>
- D - I - 0x039517 24:9507: 00        .byte $00
- D - I - 0x039518 24:9508: 00        .byte $00
- D - I - 0x039519 24:9509: 1A        .byte $1A    ; <は>
- D - I - 0x03951A 24:950A: 28        .byte $28    ; <り>
- D - I - 0x03951B 24:950B: 00        .byte $00
- D - I - 0x03951C 24:950C: 02        .byte $02    ; <い>
- D - I - 0x03951D 24:950D: 14        .byte $14    ; <と>
- D - I - 0x03951E 24:950E: 00        .byte $00
- D - I - 0x03951F 24:950F: 00        .byte $00

off_9510_02:
- D - I - 0x039520 24:9510: 00        .byte $00
- D - I - 0x039521 24:9511: 02        .byte $02    ; <い>
- D - I - 0x039522 24:9512: 28        .byte $28    ; <り>
- D - I - 0x039523 24:9513: 00        .byte $00
- D - I - 0x039524 24:9514: 00        .byte $00
- D - I - 0x039525 24:9515: 07        .byte $07    ; <き>
- D - I - 0x039526 24:9516: 5A        .byte $5A    ; <ハ>
- D - I - 0x039527 24:9517: 00        .byte $00
- D - I - 0x039528 24:9518: FC        .byte $FC
- D - I - 0x039529 24:9519: 0D        .byte $0D    ; <す>
- D - I - 0x03952A 24:951A: 3C        .byte $3C    ; <9>
- D - I - 0x03952B 24:951B: 00        .byte $00
- D - I - 0x03952C 24:951C: 00        .byte $00
- D - I - 0x03952D 24:951D: 0C        .byte $0C    ; <し>
- D - I - 0x03952E 24:951E: 00        .byte $00
- D - I - 0x03952F 24:951F: 00        .byte $00
- D - I - 0x039530 24:9520: 00        .byte $00
- D - I - 0x039531 24:9521: 12        .byte $12    ; <つ>
- D - I - 0x039532 24:9522: 00        .byte $00
- D - I - 0x039533 24:9523: 00        .byte $00
- D - I - 0x039534 24:9524: 00        .byte $00
- D - I - 0x039535 24:9525: 0B        .byte $0B    ; <さ>
- D - I - 0x039536 24:9526: 00        .byte $00
- D - I - 0x039537 24:9527: 00        .byte $00
- D - I - 0x039538 24:9528: F0        .byte $F0
- D - I - 0x039539 24:9529: 0B        .byte $0B    ; <さ>
- D - I - 0x03953A 24:952A: 00        .byte $00
- D - I - 0x03953B 24:952B: 00        .byte $00

off_952C_03:
- D - I - 0x03953C 24:952C: 00        .byte $00
- D - I - 0x03953D 24:952D: 0C        .byte $0C    ; <し>
- D - I - 0x03953E 24:952E: 3C        .byte $3C    ; <9>
- D - I - 0x03953F 24:952F: 18        .byte $18    ; <ね>
- D - I - 0x039540 24:9530: 00        .byte $00
- D - I - 0x039541 24:9531: 20        .byte $20    ; <み>
- D - I - 0x039542 24:9532: 78        .byte $78    ; <?>
- D - I - 0x039543 24:9533: 38        .byte $38    ; <5>
- D - I - 0x039544 24:9534: 00        .byte $00
- D - I - 0x039545 24:9535: 10        .byte $10    ; <た>
- D - I - 0x039546 24:9536: 50        .byte $50    ; <タ>
- D - I - 0x039547 24:9537: 20        .byte $20    ; <み>
- D - I - 0x039548 24:9538: 00        .byte $00
- D - I - 0x039549 24:9539: 11        .byte $11    ; <ち>
- D - I - 0x03954A 24:953A: 50        .byte $50    ; <タ>
- D - I - 0x03954B 24:953B: 20        .byte $20    ; <み>
- D - I - 0x03954C 24:953C: 00        .byte $00
- D - I - 0x03954D 24:953D: 12        .byte $12    ; <つ>
- D - I - 0x03954E 24:953E: 00        .byte $00
- D - I - 0x03954F 24:953F: 30        .byte $30    ; <ゃ>

off_9540_04:
- D - I - 0x039550 24:9540: 00        .byte $00
- D - I - 0x039551 24:9541: 00        .byte $00
- D - I - 0x039552 24:9542: 0A        .byte $0A    ; <こ>
- D - I - 0x039553 24:9543: 00        .byte $00

off_9544_05:
- D - I - 0x039554 24:9544: 00        .byte $00
- D - I - 0x039555 24:9545: 09        .byte $09    ; <け>
- D - I - 0x039556 24:9546: 28        .byte $28    ; <り>
- D - I - 0x039557 24:9547: 00        .byte $00

off_9548_06:
- D - I - 0x039558 24:9548: 00        .byte $00
- D - I - 0x039559 24:9549: 07        .byte $07    ; <き>
- D - I - 0x03955A 24:954A: 50        .byte $50    ; <タ>
- D - I - 0x03955B 24:954B: 00        .byte $00
- D - I - 0x03955C 24:954C: FC        .byte $FC
- D - I - 0x03955D 24:954D: 0E        .byte $0E    ; <せ>
- D - I - 0x03955E 24:954E: 00        .byte $00
- D - I - 0x03955F 24:954F: 00        .byte $00

off_9550_07_08_09:
- D - I - 0x039560 24:9550: 00        .byte $00
- D - I - 0x039561 24:9551: 00        .byte $00
- D - I - 0x039562 24:9552: 00        .byte $00
- D - I - 0x039563 24:9553: 00        .byte $00



tbl_9554:
- D - - - 0x039564 24:9554: 5E 95     .word off_955E_00
- D - - - 0x039566 24:9556: 6E 95     .word off_956E_01
- D - - - 0x039568 24:9558: 86 95     .word off_9586_02
- D - - - 0x03956A 24:955A: 8E 95     .word off_958E_03
- D - - - 0x03956C 24:955C: 96 95     .word off_9596_04

off_955E_00:
- D - I - 0x03956E 24:955E: 00        .byte $00
- D - I - 0x03956F 24:955F: 01        .byte $01    ; <あ>
- D - I - 0x039570 24:9560: 46        .byte $46    ; <カ>
- D - I - 0x039571 24:9561: 00        .byte $00
- D - I - 0x039572 24:9562: 00        .byte $00
- D - I - 0x039573 24:9563: 82        .byte $82    ; <B>
- D - I - 0x039574 24:9564: 90        .byte $90    ; <U>
- D - I - 0x039575 24:9565: 01        .byte $01    ; <あ>
- D - I - 0x039576 24:9566: 00        .byte $00
- D - I - 0x039577 24:9567: 1C        .byte $1C    ; <ふ>
- D - I - 0x039578 24:9568: B4        .byte $B4    ; <ガ>
- D - I - 0x039579 24:9569: 00        .byte $00
- D - I - 0x03957A 24:956A: 00        .byte $00
- D - I - 0x03957B 24:956B: 19        .byte $19    ; <の>
- D - I - 0x03957C 24:956C: B4        .byte $B4    ; <ガ>
- D - I - 0x03957D 24:956D: 00        .byte $00
off_956E_01:
- D - I - 0x03957E 24:956E: 00        .byte $00
- D - I - 0x03957F 24:956F: 00        .byte $00
; стоимость подката
- D - I - 0x039580 24:9570: 3C        .byte $3C    ; <9>
- D - I - 0x039581 24:9571: 00        .byte $00
- D - I - 0x039582 24:9572: 98        .byte $98
- D - I - 0x039583 24:9573: 23        .byte $23    ; <も>
- D - I - 0x039584 24:9574: C8        .byte $C8    ; <ぱ>
- D - I - 0x039585 24:9575: 00        .byte $00
- D - I - 0x039586 24:9576: A0        .byte $A0    ; <が>
- D - I - 0x039587 24:9577: 1C        .byte $1C    ; <ふ>
- D - I - 0x039588 24:9578: C8        .byte $C8    ; <ぱ>
- D - I - 0x039589 24:9579: 00        .byte $00
- D - I - 0x03958A 24:957A: FC        .byte $FC
- D - I - 0x03958B 24:957B: 19        .byte $19    ; <の>
- D - I - 0x03958C 24:957C: C8        .byte $C8    ; <ぱ>
- D - I - 0x03958D 24:957D: 00        .byte $00
- D - I - 0x03958E 24:957E: FC        .byte $FC
- D - I - 0x03958F 24:957F: 1D        .byte $1D    ; <へ>
- D - I - 0x039590 24:9580: B4        .byte $B4    ; <ガ>
- D - I - 0x039591 24:9581: 00        .byte $00
- D - I - 0x039592 24:9582: FC        .byte $FC
- D - I - 0x039593 24:9583: 06        .byte $06    ; <か>
- D - I - 0x039594 24:9584: 00        .byte $00
- D - I - 0x039595 24:9585: 00        .byte $00
off_9586_02:
- D - I - 0x039596 24:9586: 00        .byte $00
- D - I - 0x039597 24:9587: 00        .byte $00
- D - I - 0x039598 24:9588: 32        .byte $32    ; <ょ>
- D - I - 0x039599 24:9589: 00        .byte $00
- D - I - 0x03959A 24:958A: 00        .byte $00
- D - I - 0x03959B 24:958B: 27        .byte $27    ; <ら>
- D - I - 0x03959C 24:958C: B4        .byte $B4    ; <ガ>
- D - I - 0x03959D 24:958D: 00        .byte $00
off_958E_03:
- D - I - 0x03959E 24:958E: 00        .byte $00
- D - I - 0x03959F 24:958F: 04        .byte $04    ; <え>
- D - I - 0x0395A0 24:9590: 50        .byte $50    ; <タ>
- D - I - 0x0395A1 24:9591: 00        .byte $00
- D - I - 0x0395A2 24:9592: FC        .byte $FC
- D - I - 0x0395A3 24:9593: 08        .byte $08    ; <く>
- D - I - 0x0395A4 24:9594: 00        .byte $00
- D - I - 0x0395A5 24:9595: 00        .byte $00
off_9596_04:
- D - I - 0x0395A6 24:9596: 00        .byte $00
- D - I - 0x0395A7 24:9597: 06        .byte $06    ; <か>
- D - I - 0x0395A8 24:9598: 3C        .byte $3C    ; <9>
- D - I - 0x0395A9 24:9599: 00        .byte $00
- D - I - 0x0395AA 24:959A: FC        .byte $FC
- D - I - 0x0395AB 24:959B: 0C        .byte $0C    ; <し>
- D - I - 0x0395AC 24:959C: 00        .byte $00
- D - I - 0x0395AD 24:959D: 00        .byte $00



tbl_959E:
- D - - - 0x0395AE 24:959E: B2 95     .word off_95B2_00
- D - - - 0x0395B0 24:95A0: C2 95     .word off_95C2_01_07_08_09
- D - - - 0x0395B2 24:95A2: C6 95     .word off_95C6_02
- D - - - 0x0395B4 24:95A4: CA 95     .word off_95CA_03
- - - - - 0x0395B6 24:95A6: CE 95     .word off_95CE_04_05
- D - - - 0x0395B8 24:95A8: CE 95     .word off_95CE_04_05
- D - - - 0x0395BA 24:95AA: D2 95     .word off_95D2_06
- D - - - 0x0395BC 24:95AC: C2 95     .word off_95C2_01_07_08_09
- D - - - 0x0395BE 24:95AE: C2 95     .word off_95C2_01_07_08_09
- D - - - 0x0395C0 24:95B0: C2 95     .word off_95C2_01_07_08_09

off_95B2_00:
- D - I - 0x0395C2 24:95B2: 00        .byte $00
- D - I - 0x0395C3 24:95B3: 08        .byte $08    ; <く>
- D - I - 0x0395C4 24:95B4: 14        .byte $14    ; <と>
- D - I - 0x0395C5 24:95B5: 00        .byte $00
- D - I - 0x0395C6 24:95B6: 00        .byte $00
- D - I - 0x0395C7 24:95B7: 1B        .byte $1B    ; <ひ>
- D - I - 0x0395C8 24:95B8: 00        .byte $00
- D - I - 0x0395C9 24:95B9: 00        .byte $00
- D - I - 0x0395CA 24:95BA: 00        .byte $00
- D - I - 0x0395CB 24:95BB: 1C        .byte $1C    ; <ふ>
- D - I - 0x0395CC 24:95BC: 00        .byte $00
- D - I - 0x0395CD 24:95BD: 00        .byte $00
- D - I - 0x0395CE 24:95BE: 00        .byte $00
- D - I - 0x0395CF 24:95BF: 25        .byte $25    ; <ゆ>
- D - I - 0x0395D0 24:95C0: 00        .byte $00
- D - I - 0x0395D1 24:95C1: 00        .byte $00

off_95C2_01_07_08_09:
- D - I - 0x0395D2 24:95C2: 00        .byte $00
- D - I - 0x0395D3 24:95C3: 0B        .byte $0B    ; <さ>
- D - I - 0x0395D4 24:95C4: 28        .byte $28    ; <り>
- D - I - 0x0395D5 24:95C5: 00        .byte $00

off_95C6_02:
- D - I - 0x0395D6 24:95C6: 00        .byte $00
- D - I - 0x0395D7 24:95C7: 20        .byte $20    ; <み>
- D - I - 0x0395D8 24:95C8: C8        .byte $C8    ; <ぱ>
- D - I - 0x0395D9 24:95C9: 00        .byte $00

off_95CA_03:
- D - I - 0x0395DA 24:95CA: 88        .byte $88    ; <H>
- D - I - 0x0395DB 24:95CB: 08        .byte $08    ; <く>
- D - I - 0x0395DC 24:95CC: 46        .byte $46    ; <カ>
- D - I - 0x0395DD 24:95CD: 00        .byte $00

off_95CE_04_05:
- D - I - 0x0395DE 24:95CE: 98        .byte $98
- D - I - 0x0395DF 24:95CF: 00        .byte $00
- D - I - 0x0395E0 24:95D0: 32        .byte $32    ; <ょ>
- D - I - 0x0395E1 24:95D1: 00        .byte $00

off_95D2_06:
- D - I - 0x0395E2 24:95D2: 98        .byte $98
- D - I - 0x0395E3 24:95D3: 00        .byte $00
- D - I - 0x0395E4 24:95D4: 32        .byte $32    ; <ょ>
- D - I - 0x0395E5 24:95D5: 00        .byte $00



; это уже другая таблица
off_95D6_игроки_нашей_команды:
- - - - - 0x0395E6 24:95D6: 00        .byte $00
- D - I - 0x0395E7 24:95D7: 00        .byte $00
- - - - - 0x0395E8 24:95D8: 08        .byte $08    ; <く>
- - - - - 0x0395E9 24:95D9: 08        .byte $08    ; <く>
- D - I - 0x0395EA 24:95DA: 01        .byte $01    ; <あ>
- D - I - 0x0395EB 24:95DB: 03        .byte $03    ; <う>
- D - I - 0x0395EC 24:95DC: 50        .byte $50    ; <タ>
- D - I - 0x0395ED 24:95DD: 26        .byte $26    ; <よ>
- D - I - 0x0395EE 24:95DE: 00        .byte $00
- D - I - 0x0395EF 24:95DF: 02        .byte $02    ; <い>
- - - - - 0x0395F0 24:95E0: 00        .byte $00
- - - - - 0x0395F1 24:95E1: 00        .byte $00
- D - I - 0x0395F2 24:95E2: 00        .byte $00
- D - I - 0x0395F3 24:95E3: 00        .byte $00
- D - I - 0x0395F4 24:95E4: 18        .byte $18    ; <ね>
- D - I - 0x0395F5 24:95E5: 04        .byte $04    ; <え>
- D - I - 0x0395F6 24:95E6: 0B        .byte $0B    ; <さ>
- D - I - 0x0395F7 24:95E7: 00        .byte $00
- D - I - 0x0395F8 24:95E8: 18        .byte $18    ; <ね>
- D - I - 0x0395F9 24:95E9: 04        .byte $04    ; <え>
- D - I - 0x0395FA 24:95EA: 08        .byte $08    ; <く>
- D - I - 0x0395FB 24:95EB: 01        .byte $01    ; <あ>
- D - I - 0x0395FC 24:95EC: 10        .byte $10    ; <た>
- D - I - 0x0395FD 24:95ED: 02        .byte $02    ; <い>
- D - I - 0x0395FE 24:95EE: 09        .byte $09    ; <け>
- D - I - 0x0395FF 24:95EF: 01        .byte $01    ; <あ>
- D - I - 0x039600 24:95F0: 0E        .byte $0E    ; <せ>
- D - I - 0x039601 24:95F1: 02        .byte $02    ; <い>
- D - I - 0x039602 24:95F2: 00        .byte $00
- D - I - 0x039603 24:95F3: 00        .byte $00
- D - I - 0x039604 24:95F4: 20        .byte $20    ; <み>
- D - I - 0x039605 24:95F5: 00        .byte $00
- D - I - 0x039606 24:95F6: 06        .byte $06    ; <か>
- D - I - 0x039607 24:95F7: 04        .byte $04    ; <え>
- D - I - 0x039608 24:95F8: 28        .byte $28    ; <り>
- D - I - 0x039609 24:95F9: 00        .byte $00
- D - I - 0x03960A 24:95FA: 07        .byte $07    ; <き>
- D - I - 0x03960B 24:95FB: 04        .byte $04    ; <え>
- D - I - 0x03960C 24:95FC: 38        .byte $38    ; <5>
- D - I - 0x03960D 24:95FD: 00        .byte $00
- D - I - 0x03960E 24:95FE: 04        .byte $04    ; <え>
- D - I - 0x03960F 24:95FF: 06        .byte $06    ; <か>
- D - I - 0x039610 24:9600: 18        .byte $18    ; <ね>
- D - I - 0x039611 24:9601: 00        .byte $00
- D - I - 0x039612 24:9602: 05        .byte $05    ; <お>
- D - I - 0x039613 24:9603: 07        .byte $07    ; <き>
- D - I - 0x039614 24:9604: 18        .byte $18    ; <ね>
- D - I - 0x039615 24:9605: 00        .byte $00
- D - I - 0x039616 24:9606: 0A        .byte $0A    ; <こ>
- D - I - 0x039617 24:9607: 08        .byte $08    ; <く>
- D - I - 0x039618 24:9608: 18        .byte $18    ; <ね>
- D - I - 0x039619 24:9609: 02        .byte $02    ; <い>
- D - I - 0x03961A 24:960A: 0B        .byte $0B    ; <さ>
- D - I - 0x03961B 24:960B: 00        .byte $00
- D - I - 0x03961C 24:960C: 10        .byte $10    ; <た>
- D - I - 0x03961D 24:960D: 02        .byte $02    ; <い>
- D - I - 0x03961E 24:960E: 00        .byte $00
- D - I - 0x03961F 24:960F: 00        .byte $00
- D - I - 0x039620 24:9610: 10        .byte $10    ; <た>
- D - I - 0x039621 24:9611: 02        .byte $02    ; <い>
- D - I - 0x039622 24:9612: 01        .byte $01    ; <あ>
- D - I - 0x039623 24:9613: 00        .byte $00
- - - - - 0x039624 24:9614: 00        .byte $00
- - - - - 0x039625 24:9615: 00        .byte $00
- D - I - 0x039626 24:9616: 0C        .byte $0C    ; <し>
- D - I - 0x039627 24:9617: 00        .byte $00
- D - I - 0x039628 24:9618: 08        .byte $08    ; <く>
- D - I - 0x039629 24:9619: 03        .byte $03    ; <う>
- D - I - 0x03962A 24:961A: 02        .byte $02    ; <い>
- D - I - 0x03962B 24:961B: 03        .byte $03    ; <う>
- D - I - 0x03962C 24:961C: 20        .byte $20    ; <み>
- D - I - 0x03962D 24:961D: 08        .byte $08    ; <く>
- D - I - 0x03962E 24:961E: 0D        .byte $0D    ; <す>
- D - I - 0x03962F 24:961F: 01        .byte $01    ; <あ>
- D - I - 0x039630 24:9620: 14        .byte $14    ; <と>
- D - I - 0x039631 24:9621: 00        .byte $00
- D - I - 0x039632 24:9622: 05        .byte $05    ; <お>
- D - I - 0x039633 24:9623: 05        .byte $05    ; <お>
- D - I - 0x039634 24:9624: 08        .byte $08    ; <く>
- D - I - 0x039635 24:9625: 00        .byte $00
- D - I - 0x039636 24:9626: 0E        .byte $0E    ; <せ>
- D - I - 0x039637 24:9627: 08        .byte $08    ; <く>
- D - I - 0x039638 24:9628: 18        .byte $18    ; <ね>
- D - I - 0x039639 24:9629: 04        .byte $04    ; <え>
- D - I - 0x03963A 24:962A: 03        .byte $03    ; <う>
- D - I - 0x03963B 24:962B: 02        .byte $02    ; <い>
- D - I - 0x03963C 24:962C: 20        .byte $20    ; <み>
- D - I - 0x03963D 24:962D: 04        .byte $04    ; <え>
- D - I - 0x03963E 24:962E: 04        .byte $04    ; <え>
- D - I - 0x03963F 24:962F: 06        .byte $06    ; <か>
- D - I - 0x039640 24:9630: 18        .byte $18    ; <ね>
- D - I - 0x039641 24:9631: 02        .byte $02    ; <い>
- D - I - 0x039642 24:9632: 0F        .byte $0F    ; <そ>
- D - I - 0x039643 24:9633: 07        .byte $07    ; <き>
- D - I - 0x039644 24:9634: 16        .byte $16    ; <に>
- D - I - 0x039645 24:9635: 02        .byte $02    ; <い>
- D - I - 0x039646 24:9636: 0F        .byte $0F    ; <そ>
- D - I - 0x039647 24:9637: 07        .byte $07    ; <き>
- D - I - 0x039648 24:9638: 18        .byte $18    ; <ね>
- D - I - 0x039649 24:9639: 02        .byte $02    ; <い>
- D - I - 0x03964A 24:963A: 10        .byte $10    ; <た>
- D - I - 0x03964B 24:963B: 02        .byte $02    ; <い>
- D - I - 0x03964C 24:963C: 10        .byte $10    ; <た>
- D - I - 0x03964D 24:963D: 02        .byte $02    ; <い>
- D - I - 0x03964E 24:963E: 11        .byte $11    ; <ち>
- D - I - 0x03964F 24:963F: 01        .byte $01    ; <あ>
- D - I - 0x039650 24:9640: 40        .byte $40    ; <「>
- D - I - 0x039651 24:9641: 10        .byte $10    ; <た>
- D - I - 0x039652 24:9642: 12        .byte $12    ; <つ>
- D - I - 0x039653 24:9643: 09        .byte $09    ; <け>
- D - I - 0x039654 24:9644: 20        .byte $20    ; <み>
- D - I - 0x039655 24:9645: 02        .byte $02    ; <い>
- D - I - 0x039656 24:9646: 13        .byte $13    ; <て>
- D - I - 0x039657 24:9647: 00        .byte $00
- D - I - 0x039658 24:9648: 20        .byte $20    ; <み>
- D - I - 0x039659 24:9649: 02        .byte $02    ; <い>
- D - I - 0x03965A 24:964A: 14        .byte $14    ; <と>
- D - I - 0x03965B 24:964B: 09        .byte $09    ; <け>
- D - I - 0x03965C 24:964C: 28        .byte $28    ; <り>
- D - I - 0x03965D 24:964D: 02        .byte $02    ; <い>
- D - I - 0x03965E 24:964E: 15        .byte $15    ; <な>
- - - - - 0x03965F 24:964F: 00        .byte $00
- - - - - 0x039660 24:9650: 18        .byte $18    ; <ね>
- - - - - 0x039661 24:9651: 02        .byte $02    ; <い>
- D - I - 0x039662 24:9652: 16        .byte $16    ; <に>
- D - I - 0x039663 24:9653: 00        .byte $00
- - - - - 0x039664 24:9654: 08        .byte $08    ; <く>
- - - - - 0x039665 24:9655: 00        .byte $00
- D - I - 0x039666 24:9656: 17        .byte $17    ; <ぬ>
- D - I - 0x039667 24:9657: 03        .byte $03    ; <う>
- D - I - 0x039668 24:9658: 18        .byte $18    ; <ね>
- D - I - 0x039669 24:9659: 00        .byte $00
- D - I - 0x03966A 24:965A: 03        .byte $03    ; <う>
- - - - - 0x03966B 24:965B: 00        .byte $00
- - - - - 0x03966C 24:965C: 00        .byte $00
- - - - - 0x03966D 24:965D: 00        .byte $00
- D - I - 0x03966E 24:965E: 02        .byte $02    ; <い>
- D - I - 0x03966F 24:965F: 00        .byte $00
- - - - - 0x039670 24:9660: 00        .byte $00
- - - - - 0x039671 24:9661: 00        .byte $00

tbl_9662:
off_9662_игроки_команды_соперников:
- D - I - 0x039672 24:9662: 1C        .byte $1C    ; <ふ>
- D - I - 0x039673 24:9663: 06        .byte $06    ; <か>
- D - I - 0x039674 24:9664: 00        .byte $00
- D - I - 0x039675 24:9665: 02        .byte $02    ; <い>
- D - I - 0x039676 24:9666: 08        .byte $08    ; <く>
- D - I - 0x039677 24:9667: 03        .byte $03    ; <う>
- - - - - 0x039678 24:9668: 03        .byte $03    ; <う>
- D - I - 0x039679 24:9669: 01        .byte $01    ; <あ>
- D - I - 0x03967A 24:966A: 01        .byte $01    ; <あ>
- - - - - 0x03967B 24:966B: 01        .byte $01    ; <あ>
- D - I - 0x03967C 24:966C: 02        .byte $02    ; <い>
- - - - - 0x03967D 24:966D: 00        .byte $00
- D - I - 0x03967E 24:966E: 1D        .byte $1D    ; <へ>
- D - I - 0x03967F 24:966F: 06        .byte $06    ; <か>
- D - I - 0x039680 24:9670: 00        .byte $00
- D - I - 0x039681 24:9671: 00        .byte $00
- D - I - 0x039682 24:9672: 00        .byte $00
- D - I - 0x039683 24:9673: 02        .byte $02    ; <い>
- - - - - 0x039684 24:9674: 04        .byte $04    ; <え>
- D - I - 0x039685 24:9675: 01        .byte $01    ; <あ>
- D - I - 0x039686 24:9676: 01        .byte $01    ; <あ>
- - - - - 0x039687 24:9677: 01        .byte $01    ; <あ>
- D - I - 0x039688 24:9678: 01        .byte $01    ; <あ>
- - - - - 0x039689 24:9679: 00        .byte $00
- D - I - 0x03968A 24:967A: 20        .byte $20    ; <み>
- D - I - 0x03968B 24:967B: 0A        .byte $0A    ; <こ>
- D - I - 0x03968C 24:967C: 00        .byte $00
- D - I - 0x03968D 24:967D: 20        .byte $20    ; <み>
- D - I - 0x03968E 24:967E: 02        .byte $02    ; <い>
- D - I - 0x03968F 24:967F: 03        .byte $03    ; <う>
- - - - - 0x039690 24:9680: 03        .byte $03    ; <う>
- D - I - 0x039691 24:9681: 01        .byte $01    ; <あ>
- D - I - 0x039692 24:9682: 01        .byte $01    ; <あ>
- - - - - 0x039693 24:9683: 01        .byte $01    ; <あ>
- D - I - 0x039694 24:9684: 00        .byte $00
- - - - - 0x039695 24:9685: 00        .byte $00
- D - I - 0x039696 24:9686: 06        .byte $06    ; <か>
- D - I - 0x039697 24:9687: 00        .byte $00
- - - - - 0x039698 24:9688: 00        .byte $00
- - - - - 0x039699 24:9689: 00        .byte $00
- D - I - 0x03969A 24:968A: 03        .byte $03    ; <う>
- D - I - 0x03969B 24:968B: 03        .byte $03    ; <う>
- D - I - 0x03969C 24:968C: 00        .byte $00
- - - - - 0x03969D 24:968D: 00        .byte $00
- - - - - 0x03969E 24:968E: 00        .byte $00
- - - - - 0x03969F 24:968F: 00        .byte $00
- - - - - 0x0396A0 24:9690: 00        .byte $00
- - - - - 0x0396A1 24:9691: 00        .byte $00
- D - I - 0x0396A2 24:9692: 23        .byte $23    ; <も>
- D - I - 0x0396A3 24:9693: 00        .byte $00
- D - I - 0x0396A4 24:9694: 00        .byte $00
- D - I - 0x0396A5 24:9695: 20        .byte $20    ; <み>
- D - I - 0x0396A6 24:9696: 00        .byte $00
- D - I - 0x0396A7 24:9697: 03        .byte $03    ; <う>
- - - - - 0x0396A8 24:9698: 03        .byte $03    ; <う>
- D - I - 0x0396A9 24:9699: 01        .byte $01    ; <あ>
- - - - - 0x0396AA 24:969A: 01        .byte $01    ; <あ>
- - - - - 0x0396AB 24:969B: 01        .byte $01    ; <あ>
- D - I - 0x0396AC 24:969C: 03        .byte $03    ; <う>
- - - - - 0x0396AD 24:969D: 00        .byte $00
- D - I - 0x0396AE 24:969E: 24        .byte $24    ; <や>
- D - I - 0x0396AF 24:969F: 00        .byte $00
- D - I - 0x0396B0 24:96A0: 00        .byte $00
- D - I - 0x0396B1 24:96A1: 28        .byte $28    ; <り>
- D - I - 0x0396B2 24:96A2: 06        .byte $06    ; <か>
- D - I - 0x0396B3 24:96A3: 00        .byte $00
- - - - - 0x0396B4 24:96A4: 03        .byte $03    ; <う>
- D - I - 0x0396B5 24:96A5: 01        .byte $01    ; <あ>
- - - - - 0x0396B6 24:96A6: 01        .byte $01    ; <あ>
- - - - - 0x0396B7 24:96A7: 01        .byte $01    ; <あ>
- D - I - 0x0396B8 24:96A8: 01        .byte $01    ; <あ>
- - - - - 0x0396B9 24:96A9: 00        .byte $00
- D - I - 0x0396BA 24:96AA: 27        .byte $27    ; <ら>
- D - I - 0x0396BB 24:96AB: 00        .byte $00
- D - I - 0x0396BC 24:96AC: 00        .byte $00
- D - I - 0x0396BD 24:96AD: 20        .byte $20    ; <み>
- D - I - 0x0396BE 24:96AE: 04        .byte $04    ; <え>
- D - I - 0x0396BF 24:96AF: 02        .byte $02    ; <い>
- - - - - 0x0396C0 24:96B0: 00        .byte $00
- D - I - 0x0396C1 24:96B1: 01        .byte $01    ; <あ>
- - - - - 0x0396C2 24:96B2: 01        .byte $01    ; <あ>
- - - - - 0x0396C3 24:96B3: 01        .byte $01    ; <あ>
- D - I - 0x0396C4 24:96B4: 04        .byte $04    ; <え>
- - - - - 0x0396C5 24:96B5: 00        .byte $00
- D - I - 0x0396C6 24:96B6: 28        .byte $28    ; <り>
- D - I - 0x0396C7 24:96B7: 0B        .byte $0B    ; <さ>
- D - I - 0x0396C8 24:96B8: F0        .byte $F0
- D - I - 0x0396C9 24:96B9: 02        .byte $02    ; <い>
- D - I - 0x0396CA 24:96BA: 08        .byte $08    ; <く>
- - - - - 0x0396CB 24:96BB: 03        .byte $03    ; <う>
- - - - - 0x0396CC 24:96BC: 05        .byte $05    ; <お>
- D - I - 0x0396CD 24:96BD: 00        .byte $00
- - - - - 0x0396CE 24:96BE: 02        .byte $02    ; <い>
- - - - - 0x0396CF 24:96BF: 02        .byte $02    ; <い>
- D - I - 0x0396D0 24:96C0: 01        .byte $01    ; <あ>
- - - - - 0x0396D1 24:96C1: 00        .byte $00
- D - I - 0x0396D2 24:96C2: 2B        .byte $2B    ; <ろ>
- D - I - 0x0396D3 24:96C3: 0A        .byte $0A    ; <こ>
- D - I - 0x0396D4 24:96C4: 00        .byte $00
- D - I - 0x0396D5 24:96C5: 30        .byte $30    ; <ゃ>
- D - I - 0x0396D6 24:96C6: 07        .byte $07    ; <き>
- - - - - 0x0396D7 24:96C7: 03        .byte $03    ; <う>
- - - - - 0x0396D8 24:96C8: 03        .byte $03    ; <う>
- D - I - 0x0396D9 24:96C9: 01        .byte $01    ; <あ>
- D - I - 0x0396DA 24:96CA: 01        .byte $01    ; <あ>
- - - - - 0x0396DB 24:96CB: 01        .byte $01    ; <あ>
- D - I - 0x0396DC 24:96CC: 06        .byte $06    ; <か>
- - - - - 0x0396DD 24:96CD: 00        .byte $00
- D - I - 0x0396DE 24:96CE: 2C        .byte $2C    ; <わ>
- D - I - 0x0396DF 24:96CF: 00        .byte $00
- D - I - 0x0396E0 24:96D0: 00        .byte $00
- D - I - 0x0396E1 24:96D1: 02        .byte $02    ; <い>
- D - I - 0x0396E2 24:96D2: 09        .byte $09    ; <け>
- - - - - 0x0396E3 24:96D3: 02        .byte $02    ; <い>
- - - - - 0x0396E4 24:96D4: 03        .byte $03    ; <う>
- D - I - 0x0396E5 24:96D5: 00        .byte $00
- - - - - 0x0396E6 24:96D6: 00        .byte $00
- - - - - 0x0396E7 24:96D7: 00        .byte $00
- D - I - 0x0396E8 24:96D8: 07        .byte $07    ; <き>
- - - - - 0x0396E9 24:96D9: 00        .byte $00
- D - I - 0x0396EA 24:96DA: 2D        .byte $2D    ; <を>
- D - I - 0x0396EB 24:96DB: 0B        .byte $0B    ; <さ>
- D - I - 0x0396EC 24:96DC: FF        .byte $FF
- D - I - 0x0396ED 24:96DD: 00        .byte $00
- D - I - 0x0396EE 24:96DE: 0D        .byte $0D    ; <す>
- - - - - 0x0396EF 24:96DF: 01        .byte $01    ; <あ>
- - - - - 0x0396F0 24:96E0: 04        .byte $04    ; <え>
- - - - - 0x0396F1 24:96E1: 01        .byte $01    ; <あ>
- - - - - 0x0396F2 24:96E2: 01        .byte $01    ; <あ>
- D - I - 0x0396F3 24:96E3: 01        .byte $01    ; <あ>
- - - - - 0x0396F4 24:96E4: 00        .byte $00
- - - - - 0x0396F5 24:96E5: 00        .byte $00
- D - I - 0x0396F6 24:96E6: 30        .byte $30    ; <ゃ>
- D - I - 0x0396F7 24:96E7: 0B        .byte $0B    ; <さ>
- D - I - 0x0396F8 24:96E8: F0        .byte $F0
- D - I - 0x0396F9 24:96E9: 20        .byte $20    ; <み>
- D - I - 0x0396FA 24:96EA: 0B        .byte $0B    ; <さ>
- D - I - 0x0396FB 24:96EB: 02        .byte $02    ; <い>
- - - - - 0x0396FC 24:96EC: 02        .byte $02    ; <い>
- D - I - 0x0396FD 24:96ED: 02        .byte $02    ; <い>
- - - - - 0x0396FE 24:96EE: 02        .byte $02    ; <い>
- - - - - 0x0396FF 24:96EF: 02        .byte $02    ; <い>
- D - I - 0x039700 24:96F0: 01        .byte $01    ; <あ>
- - - - - 0x039701 24:96F1: 00        .byte $00
- D - I - 0x039702 24:96F2: 31        .byte $31    ; <ゅ>
- D - I - 0x039703 24:96F3: 0A        .byte $0A    ; <こ>
- D - I - 0x039704 24:96F4: 00        .byte $00
- D - I - 0x039705 24:96F5: 10        .byte $10    ; <た>
- D - I - 0x039706 24:96F6: 02        .byte $02    ; <い>
- D - I - 0x039707 24:96F7: 05        .byte $05    ; <お>
- - - - - 0x039708 24:96F8: 00        .byte $00
- D - I - 0x039709 24:96F9: 00        .byte $00
- - - - - 0x03970A 24:96FA: 00        .byte $00
- - - - - 0x03970B 24:96FB: 01        .byte $01    ; <あ>
- D - I - 0x03970C 24:96FC: 04        .byte $04    ; <え>
- - - - - 0x03970D 24:96FD: 00        .byte $00
- D - I - 0x03970E 24:96FE: 34        .byte $34    ; <1>
- D - I - 0x03970F 24:96FF: 0C        .byte $0C    ; <し>
- D - I - 0x039710 24:9700: 00        .byte $00
- D - I - 0x039711 24:9701: FF        .byte $FF
- D - I - 0x039712 24:9702: 01        .byte $01    ; <あ>
- D - I - 0x039713 24:9703: 05        .byte $05    ; <お>
- - - - - 0x039714 24:9704: 01        .byte $01    ; <あ>
- D - I - 0x039715 24:9705: 00        .byte $00
- - - - - 0x039716 24:9706: 00        .byte $00
- - - - - 0x039717 24:9707: 00        .byte $00
- D - I - 0x039718 24:9708: 03        .byte $03    ; <う>
- - - - - 0x039719 24:9709: 00        .byte $00
- D - I - 0x03971A 24:970A: 34        .byte $34    ; <1>
- D - I - 0x03971B 24:970B: 0C        .byte $0C    ; <し>
- D - I - 0x03971C 24:970C: 00        .byte $00
- D - I - 0x03971D 24:970D: 08        .byte $08    ; <く>
- D - I - 0x03971E 24:970E: 01        .byte $01    ; <あ>
- D - I - 0x03971F 24:970F: 05        .byte $05    ; <お>
- - - - - 0x039720 24:9710: 01        .byte $01    ; <あ>
- D - I - 0x039721 24:9711: 00        .byte $00
- - - - - 0x039722 24:9712: 00        .byte $00
- - - - - 0x039723 24:9713: 00        .byte $00
- D - I - 0x039724 24:9714: 03        .byte $03    ; <う>
- - - - - 0x039725 24:9715: 00        .byte $00
- D - I - 0x039726 24:9716: 37        .byte $37    ; <4>
- D - I - 0x039727 24:9717: 0B        .byte $0B    ; <さ>
- D - I - 0x039728 24:9718: F0        .byte $F0
- D - I - 0x039729 24:9719: 60        .byte $60    ; <ミ>
- D - I - 0x03972A 24:971A: 0B        .byte $0B    ; <さ>
- D - I - 0x03972B 24:971B: 02        .byte $02    ; <い>
- - - - - 0x03972C 24:971C: 02        .byte $02    ; <い>
- D - I - 0x03972D 24:971D: 03        .byte $03    ; <う>
- - - - - 0x03972E 24:971E: 01        .byte $01    ; <あ>
- - - - - 0x03972F 24:971F: 01        .byte $01    ; <あ>
- D - I - 0x039730 24:9720: 03        .byte $03    ; <う>
- - - - - 0x039731 24:9721: 00        .byte $00
- D - I - 0x039732 24:9722: 0C        .byte $0C    ; <し>
- - - - - 0x039733 24:9723: 00        .byte $00
- - - - - 0x039734 24:9724: 00        .byte $00
- - - - - 0x039735 24:9725: 00        .byte $00
- D - I - 0x039736 24:9726: 00        .byte $00
- - - - - 0x039737 24:9727: 00        .byte $00
- D - I - 0x039738 24:9728: 00        .byte $00
- - - - - 0x039739 24:9729: 00        .byte $00
- - - - - 0x03973A 24:972A: 00        .byte $00
- - - - - 0x03973B 24:972B: 00        .byte $00
- - - - - 0x03973C 24:972C: 08        .byte $08    ; <く>
- - - - - 0x03973D 24:972D: 00        .byte $00
- D - I - 0x03973E 24:972E: 3A        .byte $3A    ; <7>
- D - I - 0x03973F 24:972F: 1D        .byte $1D    ; <へ>
- D - I - 0x039740 24:9730: 10        .byte $10    ; <た>
- D - I - 0x039741 24:9731: 00        .byte $00
- D - I - 0x039742 24:9732: 1D        .byte $1D    ; <へ>
- D - I - 0x039743 24:9733: 05        .byte $05    ; <お>
- - - - - 0x039744 24:9734: 00        .byte $00
- D - I - 0x039745 24:9735: 00        .byte $00
- - - - - 0x039746 24:9736: 00        .byte $00
- - - - - 0x039747 24:9737: 00        .byte $00
- D - I - 0x039748 24:9738: 0A        .byte $0A    ; <こ>
- - - - - 0x039749 24:9739: 00        .byte $00
- D - I - 0x03974A 24:973A: 3D        .byte $3D    ; <+>
- D - I - 0x03974B 24:973B: 00        .byte $00
- D - I - 0x03974C 24:973C: 00        .byte $00
- D - I - 0x03974D 24:973D: 00        .byte $00
- D - I - 0x03974E 24:973E: 0C        .byte $0C    ; <し>
- - - - - 0x03974F 24:973F: 05        .byte $05    ; <お>
- - - - - 0x039750 24:9740: 02        .byte $02    ; <い>
- D - I - 0x039751 24:9741: 00        .byte $00
- D - I - 0x039752 24:9742: 00        .byte $00
- - - - - 0x039753 24:9743: 00        .byte $00
- D - I - 0x039754 24:9744: 0C        .byte $0C    ; <し>
- - - - - 0x039755 24:9745: 00        .byte $00
- D - I - 0x039756 24:9746: 40        .byte $40    ; <「>
- D - I - 0x039757 24:9747: 0E        .byte $0E    ; <せ>
- D - I - 0x039758 24:9748: 00        .byte $00
- D - I - 0x039759 24:9749: 40        .byte $40    ; <「>
- D - I - 0x03975A 24:974A: 0E        .byte $0E    ; <せ>
- D - I - 0x03975B 24:974B: 05        .byte $05    ; <お>
- - - - - 0x03975C 24:974C: 05        .byte $05    ; <お>
- D - I - 0x03975D 24:974D: 03        .byte $03    ; <う>
- - - - - 0x03975E 24:974E: 02        .byte $02    ; <い>
- - - - - 0x03975F 24:974F: 02        .byte $02    ; <い>
- D - I - 0x039760 24:9750: 00        .byte $00
- - - - - 0x039761 24:9751: 00        .byte $00
- D - I - 0x039762 24:9752: 41        .byte $41    ; <ア>
- D - I - 0x039763 24:9753: 00        .byte $00
- D - I - 0x039764 24:9754: 00        .byte $00
- D - I - 0x039765 24:9755: 00        .byte $00
- D - I - 0x039766 24:9756: 00        .byte $00
- - - - - 0x039767 24:9757: 03        .byte $03    ; <う>
- - - - - 0x039768 24:9758: 00        .byte $00
- D - I - 0x039769 24:9759: 00        .byte $00
- - - - - 0x03976A 24:975A: 00        .byte $00
- - - - - 0x03976B 24:975B: 00        .byte $00
- D - I - 0x03976C 24:975C: 0E        .byte $0E    ; <せ>
- - - - - 0x03976D 24:975D: 00        .byte $00
- D - I - 0x03976E 24:975E: 42        .byte $42    ; <イ>
- D - I - 0x03976F 24:975F: 0A        .byte $0A    ; <こ>
- D - I - 0x039770 24:9760: 00        .byte $00
- D - I - 0x039771 24:9761: 00        .byte $00
- D - I - 0x039772 24:9762: 01        .byte $01    ; <あ>
- D - I - 0x039773 24:9763: 01        .byte $01    ; <あ>
- - - - - 0x039774 24:9764: 00        .byte $00
- - - - - 0x039775 24:9765: 00        .byte $00
- - - - - 0x039776 24:9766: 00        .byte $00
- - - - - 0x039777 24:9767: 00        .byte $00
- D - I - 0x039778 24:9768: 0F        .byte $0F    ; <そ>
- - - - - 0x039779 24:9769: 00        .byte $00
- D - I - 0x03977A 24:976A: 0F        .byte $0F    ; <そ>
- D - I - 0x03977B 24:976B: 00        .byte $00
- - - - - 0x03977C 24:976C: 00        .byte $00
- - - - - 0x03977D 24:976D: 00        .byte $00
- D - I - 0x03977E 24:976E: 04        .byte $04    ; <え>
- - - - - 0x03977F 24:976F: 00        .byte $00
- - - - - 0x039780 24:9770: 00        .byte $00
- - - - - 0x039781 24:9771: 00        .byte $00
- - - - - 0x039782 24:9772: 00        .byte $00
- - - - - 0x039783 24:9773: 00        .byte $00
- - - - - 0x039784 24:9774: 00        .byte $00
- - - - - 0x039785 24:9775: 00        .byte $00
- D - I - 0x039786 24:9776: 45        .byte $45    ; <オ>
- D - I - 0x039787 24:9777: 0A        .byte $0A    ; <こ>
- D - I - 0x039788 24:9778: 00        .byte $00
- D - I - 0x039789 24:9779: 00        .byte $00
- D - I - 0x03978A 24:977A: 08        .byte $08    ; <く>
- D - I - 0x03978B 24:977B: 03        .byte $03    ; <う>
- - - - - 0x03978C 24:977C: 00        .byte $00
- D - I - 0x03978D 24:977D: 00        .byte $00
- D - I - 0x03978E 24:977E: 00        .byte $00
- - - - - 0x03978F 24:977F: 00        .byte $00
- D - I - 0x039790 24:9780: 0C        .byte $0C    ; <し>
- - - - - 0x039791 24:9781: 00        .byte $00
- D - I - 0x039792 24:9782: 48        .byte $48    ; <ク>
- D - I - 0x039793 24:9783: 0F        .byte $0F    ; <そ>
- D - I - 0x039794 24:9784: 00        .byte $00
- D - I - 0x039795 24:9785: 00        .byte $00
- D - I - 0x039796 24:9786: 07        .byte $07    ; <き>
- D - I - 0x039797 24:9787: 05        .byte $05    ; <お>
- - - - - 0x039798 24:9788: 00        .byte $00
- D - I - 0x039799 24:9789: 00        .byte $00
- - - - - 0x03979A 24:978A: 00        .byte $00
- - - - - 0x03979B 24:978B: 00        .byte $00
- D - I - 0x03979C 24:978C: 1E        .byte $1E    ; <ほ>
- - - - - 0x03979D 24:978D: 00        .byte $00
- D - I - 0x03979E 24:978E: 49        .byte $49    ; <ケ>
- D - I - 0x03979F 24:978F: 0F        .byte $0F    ; <そ>
- D - I - 0x0397A0 24:9790: 00        .byte $00
- D - I - 0x0397A1 24:9791: 00        .byte $00
- D - I - 0x0397A2 24:9792: 02        .byte $02    ; <い>
- D - I - 0x0397A3 24:9793: 03        .byte $03    ; <う>
- - - - - 0x0397A4 24:9794: 00        .byte $00
- D - I - 0x0397A5 24:9795: 00        .byte $00
- - - - - 0x0397A6 24:9796: 00        .byte $00
- - - - - 0x0397A7 24:9797: 00        .byte $00
- D - I - 0x0397A8 24:9798: 03        .byte $03    ; <う>
- - - - - 0x0397A9 24:9799: 00        .byte $00
- D - I - 0x0397AA 24:979A: 4C        .byte $4C    ; <シ>
- D - I - 0x0397AB 24:979B: 00        .byte $00
- D - I - 0x0397AC 24:979C: 00        .byte $00
- D - I - 0x0397AD 24:979D: 00        .byte $00
- D - I - 0x0397AE 24:979E: 0F        .byte $0F    ; <そ>
- - - - - 0x0397AF 24:979F: 03        .byte $03    ; <う>
- - - - - 0x0397B0 24:97A0: 00        .byte $00
- D - I - 0x0397B1 24:97A1: 00        .byte $00
- D - I - 0x0397B2 24:97A2: 00        .byte $00
- - - - - 0x0397B3 24:97A3: 00        .byte $00
- D - I - 0x0397B4 24:97A4: 02        .byte $02    ; <い>
- - - - - 0x0397B5 24:97A5: 00        .byte $00
- D - I - 0x0397B6 24:97A6: 4D        .byte $4D    ; <ス>
- D - I - 0x0397B7 24:97A7: 00        .byte $00
- D - I - 0x0397B8 24:97A8: 00        .byte $00
- D - I - 0x0397B9 24:97A9: 00        .byte $00
- D - I - 0x0397BA 24:97AA: 10        .byte $10    ; <た>
- D - I - 0x0397BB 24:97AB: 00        .byte $00
- - - - - 0x0397BC 24:97AC: 00        .byte $00
- D - I - 0x0397BD 24:97AD: 00        .byte $00
- - - - - 0x0397BE 24:97AE: 00        .byte $00
- - - - - 0x0397BF 24:97AF: 00        .byte $00
- D - I - 0x0397C0 24:97B0: 11        .byte $11    ; <ち>
- - - - - 0x0397C1 24:97B1: 00        .byte $00
- D - I - 0x0397C2 24:97B2: 4E        .byte $4E    ; <セ>
- D - I - 0x0397C3 24:97B3: 00        .byte $00
- D - I - 0x0397C4 24:97B4: 00        .byte $00
- D - I - 0x0397C5 24:97B5: 00        .byte $00
- D - I - 0x0397C6 24:97B6: 00        .byte $00
- - - - - 0x0397C7 24:97B7: 00        .byte $00
- - - - - 0x0397C8 24:97B8: 00        .byte $00
- D - I - 0x0397C9 24:97B9: 00        .byte $00
- - - - - 0x0397CA 24:97BA: 00        .byte $00
- - - - - 0x0397CB 24:97BB: 00        .byte $00
- D - I - 0x0397CC 24:97BC: 12        .byte $12    ; <つ>
- - - - - 0x0397CD 24:97BD: 00        .byte $00
- D - I - 0x0397CE 24:97BE: 12        .byte $12    ; <つ>
- D - I - 0x0397CF 24:97BF: 00        .byte $00
- - - - - 0x0397D0 24:97C0: 00        .byte $00
- - - - - 0x0397D1 24:97C1: 00        .byte $00
- D - I - 0x0397D2 24:97C2: 00        .byte $00
- - - - - 0x0397D3 24:97C3: 02        .byte $02    ; <い>
- - - - - 0x0397D4 24:97C4: 00        .byte $00
- - - - - 0x0397D5 24:97C5: 00        .byte $00
- - - - - 0x0397D6 24:97C6: 00        .byte $00
- - - - - 0x0397D7 24:97C7: 00        .byte $00
- - - - - 0x0397D8 24:97C8: 00        .byte $00
- - - - - 0x0397D9 24:97C9: 00        .byte $00
- D - I - 0x0397DA 24:97CA: 4F        .byte $4F    ; <ソ>
- D - I - 0x0397DB 24:97CB: 0E        .byte $0E    ; <せ>
- D - I - 0x0397DC 24:97CC: 00        .byte $00
- D - I - 0x0397DD 24:97CD: 10        .byte $10    ; <た>
- D - I - 0x0397DE 24:97CE: 11        .byte $11    ; <ち>
- D - I - 0x0397DF 24:97CF: 00        .byte $00
- - - - - 0x0397E0 24:97D0: 00        .byte $00
- D - I - 0x0397E1 24:97D1: 03        .byte $03    ; <う>
- D - I - 0x0397E2 24:97D2: 02        .byte $02    ; <い>
- - - - - 0x0397E3 24:97D3: 02        .byte $02    ; <い>
- D - I - 0x0397E4 24:97D4: 15        .byte $15    ; <な>
- - - - - 0x0397E5 24:97D5: 00        .byte $00
- D - I - 0x0397E6 24:97D6: 50        .byte $50    ; <タ>
- D - I - 0x0397E7 24:97D7: 0A        .byte $0A    ; <こ>
- D - I - 0x0397E8 24:97D8: 00        .byte $00
- D - I - 0x0397E9 24:97D9: 00        .byte $00
- - - - - 0x0397EA 24:97DA: 01        .byte $01    ; <あ>
- - - - - 0x0397EB 24:97DB: 05        .byte $05    ; <お>
- - - - - 0x0397EC 24:97DC: 00        .byte $00
- D - I - 0x0397ED 24:97DD: 00        .byte $00
- - - - - 0x0397EE 24:97DE: 00        .byte $00
- - - - - 0x0397EF 24:97DF: 00        .byte $00
- - - - - 0x0397F0 24:97E0: 14        .byte $14    ; <と>
- - - - - 0x0397F1 24:97E1: 00        .byte $00
- D - I - 0x0397F2 24:97E2: 51        .byte $51    ; <チ>
- D - I - 0x0397F3 24:97E3: 00        .byte $00
- D - I - 0x0397F4 24:97E4: 00        .byte $00
- D - I - 0x0397F5 24:97E5: 00        .byte $00
- D - I - 0x0397F6 24:97E6: 01        .byte $01    ; <あ>
- - - - - 0x0397F7 24:97E7: 03        .byte $03    ; <う>
- - - - - 0x0397F8 24:97E8: 00        .byte $00
- D - I - 0x0397F9 24:97E9: 00        .byte $00
- - - - - 0x0397FA 24:97EA: 00        .byte $00
- - - - - 0x0397FB 24:97EB: 00        .byte $00
- D - I - 0x0397FC 24:97EC: 14        .byte $14    ; <と>
- - - - - 0x0397FD 24:97ED: 00        .byte $00
- D - I - 0x0397FE 24:97EE: 52        .byte $52    ; <ツ>
- D - I - 0x0397FF 24:97EF: 02        .byte $02    ; <い>
- D - I - 0x039800 24:97F0: 00        .byte $00
- D - I - 0x039801 24:97F1: 00        .byte $00
- D - I - 0x039802 24:97F2: 01        .byte $01    ; <あ>
- D - I - 0x039803 24:97F3: 05        .byte $05    ; <お>
- - - - - 0x039804 24:97F4: 00        .byte $00
- D - I - 0x039805 24:97F5: 00        .byte $00
- D - I - 0x039806 24:97F6: 00        .byte $00
- - - - - 0x039807 24:97F7: 00        .byte $00
- D - I - 0x039808 24:97F8: 14        .byte $14    ; <と>
- - - - - 0x039809 24:97F9: 00        .byte $00
- D - I - 0x03980A 24:97FA: 53        .byte $53    ; <テ>
- D - I - 0x03980B 24:97FB: 02        .byte $02    ; <い>
- D - I - 0x03980C 24:97FC: 00        .byte $00
- D - I - 0x03980D 24:97FD: 00        .byte $00
- D - I - 0x03980E 24:97FE: 01        .byte $01    ; <あ>
- D - I - 0x03980F 24:97FF: 05        .byte $05    ; <お>
- - - - - 0x039810 24:9800: 00        .byte $00
- D - I - 0x039811 24:9801: 00        .byte $00
- - - - - 0x039812 24:9802: 00        .byte $00
- - - - - 0x039813 24:9803: 00        .byte $00
- D - I - 0x039814 24:9804: 15        .byte $15    ; <な>
- - - - - 0x039815 24:9805: 00        .byte $00
- D - I - 0x039816 24:9806: 54        .byte $54    ; <ト>
- D - I - 0x039817 24:9807: 11        .byte $11    ; <ち>
- D - I - 0x039818 24:9808: 00        .byte $00
- D - I - 0x039819 24:9809: 18        .byte $18    ; <ね>
- D - I - 0x03981A 24:980A: 01        .byte $01    ; <あ>
- D - I - 0x03981B 24:980B: 06        .byte $06    ; <か>
- - - - - 0x03981C 24:980C: 00        .byte $00
- D - I - 0x03981D 24:980D: 00        .byte $00
- - - - - 0x03981E 24:980E: 00        .byte $00
- - - - - 0x03981F 24:980F: 00        .byte $00
- D - I - 0x039820 24:9810: 14        .byte $14    ; <と>
- - - - - 0x039821 24:9811: 00        .byte $00
- D - I - 0x039822 24:9812: 54        .byte $54    ; <ト>
- D - I - 0x039823 24:9813: 11        .byte $11    ; <ち>
- D - I - 0x039824 24:9814: 00        .byte $00
- D - I - 0x039825 24:9815: 04        .byte $04    ; <え>
- D - I - 0x039826 24:9816: 01        .byte $01    ; <あ>
- D - I - 0x039827 24:9817: 06        .byte $06    ; <か>
- - - - - 0x039828 24:9818: 00        .byte $00
- D - I - 0x039829 24:9819: 00        .byte $00
- - - - - 0x03982A 24:981A: 00        .byte $00
- - - - - 0x03982B 24:981B: 00        .byte $00
- D - I - 0x03982C 24:981C: 14        .byte $14    ; <と>
- - - - - 0x03982D 24:981D: 00        .byte $00
- D - I - 0x03982E 24:981E: 55        .byte $55    ; <ナ>
- D - I - 0x03982F 24:981F: 10        .byte $10    ; <た>
- D - I - 0x039830 24:9820: 20        .byte $20    ; <み>
- D - I - 0x039831 24:9821: 10        .byte $10    ; <た>
- D - I - 0x039832 24:9822: 12        .byte $12    ; <つ>
- - - - - 0x039833 24:9823: 00        .byte $00
- - - - - 0x039834 24:9824: 00        .byte $00
- D - I - 0x039835 24:9825: 04        .byte $04    ; <え>
- - - - - 0x039836 24:9826: 01        .byte $01    ; <あ>
- - - - - 0x039837 24:9827: 01        .byte $01    ; <あ>
- D - I - 0x039838 24:9828: 15        .byte $15    ; <な>
- - - - - 0x039839 24:9829: 00        .byte $00
- D - I - 0x03983A 24:982A: 56        .byte $56    ; <ニ>
- D - I - 0x03983B 24:982B: 00        .byte $00
- D - I - 0x03983C 24:982C: 00        .byte $00
- D - I - 0x03983D 24:982D: 00        .byte $00
- - - - - 0x03983E 24:982E: 01        .byte $01    ; <あ>
- - - - - 0x03983F 24:982F: 00        .byte $00
- - - - - 0x039840 24:9830: 00        .byte $00
- D - I - 0x039841 24:9831: 05        .byte $05    ; <お>
- - - - - 0x039842 24:9832: 00        .byte $00
- - - - - 0x039843 24:9833: 00        .byte $00
- - - - - 0x039844 24:9834: 14        .byte $14    ; <と>
- - - - - 0x039845 24:9835: 00        .byte $00
- D - I - 0x039846 24:9836: 57        .byte $57    ; <ヌ>
- D - I - 0x039847 24:9837: 10        .byte $10    ; <た>
- D - I - 0x039848 24:9838: 20        .byte $20    ; <み>
- D - I - 0x039849 24:9839: 10        .byte $10    ; <た>
- D - I - 0x03984A 24:983A: 12        .byte $12    ; <つ>
- - - - - 0x03984B 24:983B: 00        .byte $00
- D - I - 0x03984C 24:983C: 00        .byte $00
- D - I - 0x03984D 24:983D: 03        .byte $03    ; <う>
- - - - - 0x03984E 24:983E: 01        .byte $01    ; <あ>
- - - - - 0x03984F 24:983F: 01        .byte $01    ; <あ>
- D - I - 0x039850 24:9840: 15        .byte $15    ; <な>
- - - - - 0x039851 24:9841: 00        .byte $00
- D - I - 0x039852 24:9842: 58        .byte $58    ; <ネ>
- D - I - 0x039853 24:9843: 10        .byte $10    ; <た>
- D - I - 0x039854 24:9844: 10        .byte $10    ; <た>
- D - I - 0x039855 24:9845: 00        .byte $00
- D - I - 0x039856 24:9846: 12        .byte $12    ; <つ>
- - - - - 0x039857 24:9847: 00        .byte $00
- - - - - 0x039858 24:9848: 00        .byte $00
- D - I - 0x039859 24:9849: 00        .byte $00
- - - - - 0x03985A 24:984A: 00        .byte $00
- - - - - 0x03985B 24:984B: 00        .byte $00
- - - - - 0x03985C 24:984C: 15        .byte $15    ; <な>
- - - - - 0x03985D 24:984D: 00        .byte $00
- D - I - 0x03985E 24:984E: 13        .byte $13    ; <て>
- D - I - 0x03985F 24:984F: 00        .byte $00
- - - - - 0x039860 24:9850: 00        .byte $00
- - - - - 0x039861 24:9851: 00        .byte $00
- D - I - 0x039862 24:9852: 04        .byte $04    ; <え>
- D - I - 0x039863 24:9853: 00        .byte $00
- - - - - 0x039864 24:9854: 00        .byte $00
- - - - - 0x039865 24:9855: 00        .byte $00
- - - - - 0x039866 24:9856: 00        .byte $00
- - - - - 0x039867 24:9857: 00        .byte $00
- - - - - 0x039868 24:9858: 00        .byte $00
- - - - - 0x039869 24:9859: 00        .byte $00
- D - I - 0x03986A 24:985A: 5D        .byte $5D    ; <ヘ>
- D - I - 0x03986B 24:985B: 00        .byte $00
- D - I - 0x03986C 24:985C: 00        .byte $00
- D - I - 0x03986D 24:985D: 00        .byte $00
- D - I - 0x03986E 24:985E: 08        .byte $08    ; <く>
- D - I - 0x03986F 24:985F: 06        .byte $06    ; <か>
- D - I - 0x039870 24:9860: 00        .byte $00
- D - I - 0x039871 24:9861: 01        .byte $01    ; <あ>
- - - - - 0x039872 24:9862: 00        .byte $00
- - - - - 0x039873 24:9863: 00        .byte $00
- D - I - 0x039874 24:9864: 03        .byte $03    ; <う>
- - - - - 0x039875 24:9865: 00        .byte $00
- D - I - 0x039876 24:9866: 5D        .byte $5D    ; <ヘ>
- D - I - 0x039877 24:9867: 00        .byte $00
- D - I - 0x039878 24:9868: 00        .byte $00
- D - I - 0x039879 24:9869: 00        .byte $00
- D - I - 0x03987A 24:986A: 08        .byte $08    ; <く>
- D - I - 0x03987B 24:986B: 06        .byte $06    ; <か>
- - - - - 0x03987C 24:986C: 00        .byte $00
- D - I - 0x03987D 24:986D: 01        .byte $01    ; <あ>
- - - - - 0x03987E 24:986E: 00        .byte $00
- - - - - 0x03987F 24:986F: 00        .byte $00
- - - - - 0x039880 24:9870: 03        .byte $03    ; <う>
- - - - - 0x039881 24:9871: 00        .byte $00
- D - I - 0x039882 24:9872: 66        .byte $66    ; <ヨ>
- D - I - 0x039883 24:9873: 13        .byte $13    ; <て>
- D - I - 0x039884 24:9874: 00        .byte $00
- D - I - 0x039885 24:9875: 08        .byte $08    ; <く>
- D - I - 0x039886 24:9876: 10        .byte $10    ; <た>
- D - I - 0x039887 24:9877: 06        .byte $06    ; <か>
- - - - - 0x039888 24:9878: 00        .byte $00
- D - I - 0x039889 24:9879: 06        .byte $06    ; <か>
- - - - - 0x03988A 24:987A: 02        .byte $02    ; <い>
- - - - - 0x03988B 24:987B: 02        .byte $02    ; <い>
- D - I - 0x03988C 24:987C: 02        .byte $02    ; <い>
- - - - - 0x03988D 24:987D: 00        .byte $00
- D - I - 0x03988E 24:987E: 67        .byte $67    ; <ラ>
- D - I - 0x03988F 24:987F: 13        .byte $13    ; <て>
- D - I - 0x039890 24:9880: 00        .byte $00
- D - I - 0x039891 24:9881: 10        .byte $10    ; <た>
- D - I - 0x039892 24:9882: 10        .byte $10    ; <た>
- D - I - 0x039893 24:9883: 06        .byte $06    ; <か>
- - - - - 0x039894 24:9884: 00        .byte $00
- D - I - 0x039895 24:9885: 06        .byte $06    ; <か>
- - - - - 0x039896 24:9886: 02        .byte $02    ; <い>
- - - - - 0x039897 24:9887: 02        .byte $02    ; <い>
- D - I - 0x039898 24:9888: 02        .byte $02    ; <い>
- - - - - 0x039899 24:9889: 00        .byte $00
- D - I - 0x03989A 24:988A: 6B        .byte $6B    ; <ロ>
- D - I - 0x03989B 24:988B: 14        .byte $14    ; <と>
- D - I - 0x03989C 24:988C: 00        .byte $00
- D - I - 0x03989D 24:988D: 08        .byte $08    ; <く>
- D - I - 0x03989E 24:988E: 13        .byte $13    ; <て>
- D - I - 0x03989F 24:988F: 05        .byte $05    ; <お>
- - - - - 0x0398A0 24:9890: 00        .byte $00
- D - I - 0x0398A1 24:9891: 00        .byte $00
- - - - - 0x0398A2 24:9892: 00        .byte $00
- - - - - 0x0398A3 24:9893: 00        .byte $00
- - - - - 0x0398A4 24:9894: 03        .byte $03    ; <う>
- - - - - 0x0398A5 24:9895: 00        .byte $00
- D - I - 0x0398A6 24:9896: 1B        .byte $1B    ; <ひ>
- D - I - 0x0398A7 24:9897: 00        .byte $00
- - - - - 0x0398A8 24:9898: 00        .byte $00
- - - - - 0x0398A9 24:9899: 00        .byte $00
- D - I - 0x0398AA 24:989A: 05        .byte $05    ; <お>
- D - I - 0x0398AB 24:989B: 02        .byte $02    ; <い>
- - - - - 0x0398AC 24:989C: 00        .byte $00
- - - - - 0x0398AD 24:989D: 00        .byte $00
- - - - - 0x0398AE 24:989E: 00        .byte $00
- - - - - 0x0398AF 24:989F: 00        .byte $00
- - - - - 0x0398B0 24:98A0: 00        .byte $00
- - - - - 0x0398B1 24:98A1: 00        .byte $00
- D - I - 0x0398B2 24:98A2: 6E        .byte $6E    ; <ン>
- D - I - 0x0398B3 24:98A3: 0A        .byte $0A    ; <こ>
- D - I - 0x0398B4 24:98A4: 00        .byte $00
- D - I - 0x0398B5 24:98A5: 00        .byte $00
- D - I - 0x0398B6 24:98A6: 09        .byte $09    ; <け>
- D - I - 0x0398B7 24:98A7: 06        .byte $06    ; <か>
- - - - - 0x0398B8 24:98A8: 04        .byte $04    ; <え>
- D - I - 0x0398B9 24:98A9: 00        .byte $00
- D - I - 0x0398BA 24:98AA: 00        .byte $00
- - - - - 0x0398BB 24:98AB: 00        .byte $00
- D - I - 0x0398BC 24:98AC: 00        .byte $00
- - - - - 0x0398BD 24:98AD: 00        .byte $00
- D - I - 0x0398BE 24:98AE: 6F        .byte $6F    ; <ッ>
- D - I - 0x0398BF 24:98AF: 0B        .byte $0B    ; <さ>
- D - I - 0x0398C0 24:98B0: 10        .byte $10    ; <た>
- D - I - 0x0398C1 24:98B1: 40        .byte $40    ; <「>
- D - I - 0x0398C2 24:98B2: 04        .byte $04    ; <え>
- - - - - 0x0398C3 24:98B3: 06        .byte $06    ; <か>
- - - - - 0x0398C4 24:98B4: 04        .byte $04    ; <え>
- D - I - 0x0398C5 24:98B5: 02        .byte $02    ; <い>
- D - I - 0x0398C6 24:98B6: 02        .byte $02    ; <い>
- - - - - 0x0398C7 24:98B7: 02        .byte $02    ; <い>
- D - I - 0x0398C8 24:98B8: 01        .byte $01    ; <あ>
- - - - - 0x0398C9 24:98B9: 00        .byte $00
- D - I - 0x0398CA 24:98BA: 72        .byte $72    ; <ョ>
- D - I - 0x0398CB 24:98BB: 0F        .byte $0F    ; <そ>
- D - I - 0x0398CC 24:98BC: 00        .byte $00
- D - I - 0x0398CD 24:98BD: 00        .byte $00
- D - I - 0x0398CE 24:98BE: 09        .byte $09    ; <け>
- D - I - 0x0398CF 24:98BF: 06        .byte $06    ; <か>
- - - - - 0x0398D0 24:98C0: 00        .byte $00
- D - I - 0x0398D1 24:98C1: 00        .byte $00
- - - - - 0x0398D2 24:98C2: 00        .byte $00
- - - - - 0x0398D3 24:98C3: 00        .byte $00
- D - I - 0x0398D4 24:98C4: 00        .byte $00
- - - - - 0x0398D5 24:98C5: 00        .byte $00
- D - I - 0x0398D6 24:98C6: 1D        .byte $1D    ; <へ>
- D - I - 0x0398D7 24:98C7: 00        .byte $00
- - - - - 0x0398D8 24:98C8: 00        .byte $00
- - - - - 0x0398D9 24:98C9: 00        .byte $00
- D - I - 0x0398DA 24:98CA: 05        .byte $05    ; <お>
- - - - - 0x0398DB 24:98CB: 02        .byte $02    ; <い>
- D - I - 0x0398DC 24:98CC: 00        .byte $00
- - - - - 0x0398DD 24:98CD: 00        .byte $00
- - - - - 0x0398DE 24:98CE: 00        .byte $00
- - - - - 0x0398DF 24:98CF: 00        .byte $00
- - - - - 0x0398E0 24:98D0: 00        .byte $00
- - - - - 0x0398E1 24:98D1: 00        .byte $00
- D - I - 0x0398E2 24:98D2: 75        .byte $75    ; <ェ>
- D - I - 0x0398E3 24:98D3: 0A        .byte $0A    ; <こ>
- D - I - 0x0398E4 24:98D4: 00        .byte $00
- D - I - 0x0398E5 24:98D5: 10        .byte $10    ; <た>
- D - I - 0x0398E6 24:98D6: 15        .byte $15    ; <な>
- D - I - 0x0398E7 24:98D7: 06        .byte $06    ; <か>
- - - - - 0x0398E8 24:98D8: 05        .byte $05    ; <お>
- D - I - 0x0398E9 24:98D9: 00        .byte $00
- - - - - 0x0398EA 24:98DA: 02        .byte $02    ; <い>
- - - - - 0x0398EB 24:98DB: 02        .byte $02    ; <い>
- D - I - 0x0398EC 24:98DC: 0B        .byte $0B    ; <さ>
- - - - - 0x0398ED 24:98DD: 00        .byte $00
- D - I - 0x0398EE 24:98DE: 76        .byte $76    ; <ォ>
- D - I - 0x0398EF 24:98DF: 0F        .byte $0F    ; <そ>
- D - I - 0x0398F0 24:98E0: 00        .byte $00
- D - I - 0x0398F1 24:98E1: 00        .byte $00
- D - I - 0x0398F2 24:98E2: 15        .byte $15    ; <な>
- D - I - 0x0398F3 24:98E3: 06        .byte $06    ; <か>
- - - - - 0x0398F4 24:98E4: 01        .byte $01    ; <あ>
- D - I - 0x0398F5 24:98E5: 00        .byte $00
- - - - - 0x0398F6 24:98E6: 00        .byte $00
- - - - - 0x0398F7 24:98E7: 00        .byte $00
- D - I - 0x0398F8 24:98E8: 01        .byte $01    ; <あ>
- - - - - 0x0398F9 24:98E9: 00        .byte $00
- D - I - 0x0398FA 24:98EA: 79        .byte $79    ; <!>
- D - I - 0x0398FB 24:98EB: 13        .byte $13    ; <て>
- D - I - 0x0398FC 24:98EC: 00        .byte $00
- D - I - 0x0398FD 24:98ED: 00        .byte $00
- D - I - 0x0398FE 24:98EE: 13        .byte $13    ; <て>
- D - I - 0x0398FF 24:98EF: 06        .byte $06    ; <か>
- - - - - 0x039900 24:98F0: 00        .byte $00
- D - I - 0x039901 24:98F1: 00        .byte $00
- D - I - 0x039902 24:98F2: 00        .byte $00
- D - I - 0x039903 24:98F3: 00        .byte $00
- D - I - 0x039904 24:98F4: 01        .byte $01    ; <あ>
- - - - - 0x039905 24:98F5: 00        .byte $00
- D - I - 0x039906 24:98F6: 7C        .byte $7C    ; <~>
- D - I - 0x039907 24:98F7: 13        .byte $13    ; <て>
- D - I - 0x039908 24:98F8: 00        .byte $00
- D - I - 0x039909 24:98F9: 00        .byte $00
- D - I - 0x03990A 24:98FA: 08        .byte $08    ; <く>
- D - I - 0x03990B 24:98FB: 06        .byte $06    ; <か>
- - - - - 0x03990C 24:98FC: 00        .byte $00
- D - I - 0x03990D 24:98FD: 00        .byte $00
- - - - - 0x03990E 24:98FE: 01        .byte $01    ; <あ>
- - - - - 0x03990F 24:98FF: 00        .byte $00
- D - I - 0x039910 24:9900: 16        .byte $16    ; <に>
- - - - - 0x039911 24:9901: 00        .byte $00
- D - I - 0x039912 24:9902: 20        .byte $20    ; <み>
- D - I - 0x039913 24:9903: 00        .byte $00
- - - - - 0x039914 24:9904: 00        .byte $00
- - - - - 0x039915 24:9905: 00        .byte $00
- D - I - 0x039916 24:9906: 03        .byte $03    ; <う>
- D - I - 0x039917 24:9907: 01        .byte $01    ; <あ>
- D - I - 0x039918 24:9908: 00        .byte $00
- - - - - 0x039919 24:9909: 00        .byte $00
- - - - - 0x03991A 24:990A: 00        .byte $00
- - - - - 0x03991B 24:990B: 00        .byte $00
- - - - - 0x03991C 24:990C: 00        .byte $00
- - - - - 0x03991D 24:990D: 00        .byte $00
- D - I - 0x03991E 24:990E: 7F        .byte $7F    ; <,>
- D - I - 0x03991F 24:990F: 15        .byte $15    ; <な>
- D - I - 0x039920 24:9910: 00        .byte $00
- D - I - 0x039921 24:9911: FF        .byte $FF
- D - I - 0x039922 24:9912: 16        .byte $16    ; <に>
- D - I - 0x039923 24:9913: 06        .byte $06    ; <か>
- D - I - 0x039924 24:9914: 02        .byte $02    ; <い>
- D - I - 0x039925 24:9915: 00        .byte $00
- - - - - 0x039926 24:9916: 00        .byte $00
- - - - - 0x039927 24:9917: 00        .byte $00
- D - I - 0x039928 24:9918: 00        .byte $00
- - - - - 0x039929 24:9919: 00        .byte $00
- D - I - 0x03992A 24:991A: 80        .byte $80
- D - I - 0x03992B 24:991B: 0B        .byte $0B    ; <さ>
- D - I - 0x03992C 24:991C: 20        .byte $20    ; <み>
- D - I - 0x03992D 24:991D: 00        .byte $00
- D - I - 0x03992E 24:991E: 09        .byte $09    ; <け>
- - - - - 0x03992F 24:991F: 06        .byte $06    ; <か>
- - - - - 0x039930 24:9920: 00        .byte $00
- D - I - 0x039931 24:9921: 02        .byte $02    ; <い>
- - - - - 0x039932 24:9922: 02        .byte $02    ; <い>
- - - - - 0x039933 24:9923: 02        .byte $02    ; <い>
- D - I - 0x039934 24:9924: 17        .byte $17    ; <ぬ>
- - - - - 0x039935 24:9925: 00        .byte $00
- D - I - 0x039936 24:9926: 82        .byte $82    ; <B>
- D - I - 0x039937 24:9927: 00        .byte $00
- D - I - 0x039938 24:9928: 00        .byte $00
- D - I - 0x039939 24:9929: 10        .byte $10    ; <た>
- D - I - 0x03993A 24:992A: 19        .byte $19    ; <の>
- - - - - 0x03993B 24:992B: 00        .byte $00
- - - - - 0x03993C 24:992C: 00        .byte $00
- D - I - 0x03993D 24:992D: 00        .byte $00
- - - - - 0x03993E 24:992E: 00        .byte $00
- - - - - 0x03993F 24:992F: 00        .byte $00
- D - I - 0x039940 24:9930: 0B        .byte $0B    ; <さ>
- - - - - 0x039941 24:9931: 00        .byte $00
- D - I - 0x039942 24:9932: 83        .byte $83    ; <C>
- D - I - 0x039943 24:9933: 06        .byte $06    ; <か>
- D - I - 0x039944 24:9934: 00        .byte $00
- D - I - 0x039945 24:9935: 00        .byte $00
- D - I - 0x039946 24:9936: 08        .byte $08    ; <く>
- D - I - 0x039947 24:9937: 06        .byte $06    ; <か>
- - - - - 0x039948 24:9938: 03        .byte $03    ; <う>
- D - I - 0x039949 24:9939: 01        .byte $01    ; <あ>
- - - - - 0x03994A 24:993A: 01        .byte $01    ; <あ>
- - - - - 0x03994B 24:993B: 01        .byte $01    ; <あ>
- D - I - 0x03994C 24:993C: 20        .byte $20    ; <み>
- - - - - 0x03994D 24:993D: 00        .byte $00
- D - I - 0x03994E 24:993E: 84        .byte $84    ; <D>
- D - I - 0x03994F 24:993F: 07        .byte $07    ; <き>
- D - I - 0x039950 24:9940: 00        .byte $00
- D - I - 0x039951 24:9941: 10        .byte $10    ; <た>
- D - I - 0x039952 24:9942: 18        .byte $18    ; <ね>
- D - I - 0x039953 24:9943: 06        .byte $06    ; <か>
- - - - - 0x039954 24:9944: 02        .byte $02    ; <い>
- D - I - 0x039955 24:9945: 00        .byte $00
- - - - - 0x039956 24:9946: 00        .byte $00
- - - - - 0x039957 24:9947: 00        .byte $00
- D - I - 0x039958 24:9948: 22        .byte $22    ; <め>
- - - - - 0x039959 24:9949: 00        .byte $00
- D - I - 0x03995A 24:994A: 85        .byte $85    ; <E>
- D - I - 0x03995B 24:994B: 00        .byte $00
- D - I - 0x03995C 24:994C: 00        .byte $00
- D - I - 0x03995D 24:994D: 00        .byte $00
- D - I - 0x03995E 24:994E: 01        .byte $01    ; <あ>
- - - - - 0x03995F 24:994F: 03        .byte $03    ; <う>
- - - - - 0x039960 24:9950: 00        .byte $00
- D - I - 0x039961 24:9951: 00        .byte $00
- - - - - 0x039962 24:9952: 00        .byte $00
- - - - - 0x039963 24:9953: 00        .byte $00
- D - I - 0x039964 24:9954: 21        .byte $21    ; <む>
- - - - - 0x039965 24:9955: 00        .byte $00
- D - I - 0x039966 24:9956: 86        .byte $86    ; <F>
- D - I - 0x039967 24:9957: 00        .byte $00
- D - I - 0x039968 24:9958: 18        .byte $18    ; <ね>
- D - I - 0x039969 24:9959: 00        .byte $00
- D - I - 0x03996A 24:995A: 14        .byte $14    ; <と>
- - - - - 0x03996B 24:995B: 05        .byte $05    ; <お>
- D - I - 0x03996C 24:995C: 00        .byte $00
- D - I - 0x03996D 24:995D: 02        .byte $02    ; <い>
- - - - - 0x03996E 24:995E: 02        .byte $02    ; <い>
- - - - - 0x03996F 24:995F: 02        .byte $02    ; <い>
- D - I - 0x039970 24:9960: 19        .byte $19    ; <の>
- - - - - 0x039971 24:9961: 00        .byte $00
- D - I - 0x039972 24:9962: 88        .byte $88    ; <H>
- D - I - 0x039973 24:9963: 0A        .byte $0A    ; <こ>
- D - I - 0x039974 24:9964: 00        .byte $00
- D - I - 0x039975 24:9965: 08        .byte $08    ; <く>
- - - - - 0x039976 24:9966: 1A        .byte $1A    ; <は>
- - - - - 0x039977 24:9967: 05        .byte $05    ; <お>
- - - - - 0x039978 24:9968: 02        .byte $02    ; <い>
- D - I - 0x039979 24:9969: 00        .byte $00
- - - - - 0x03997A 24:996A: 01        .byte $01    ; <あ>
- - - - - 0x03997B 24:996B: 01        .byte $01    ; <あ>
- - - - - 0x03997C 24:996C: 24        .byte $24    ; <や>
- - - - - 0x03997D 24:996D: 00        .byte $00
- D - I - 0x03997E 24:996E: 89        .byte $89    ; <I>
- D - I - 0x03997F 24:996F: 00        .byte $00
- D - I - 0x039980 24:9970: 00        .byte $00
- D - I - 0x039981 24:9971: 00        .byte $00
- D - I - 0x039982 24:9972: 00        .byte $00
- D - I - 0x039983 24:9973: 06        .byte $06    ; <か>
- - - - - 0x039984 24:9974: 00        .byte $00
- D - I - 0x039985 24:9975: 00        .byte $00
- - - - - 0x039986 24:9976: 00        .byte $00
- - - - - 0x039987 24:9977: 00        .byte $00
- D - I - 0x039988 24:9978: 25        .byte $25    ; <ゆ>
- - - - - 0x039989 24:9979: 00        .byte $00
- D - I - 0x03998A 24:997A: 8A        .byte $8A    ; <N>
- D - I - 0x03998B 24:997B: 1A        .byte $1A    ; <は>
- D - I - 0x03998C 24:997C: 00        .byte $00
- D - I - 0x03998D 24:997D: 10        .byte $10    ; <た>
- D - I - 0x03998E 24:997E: 05        .byte $05    ; <お>
- - - - - 0x03998F 24:997F: 00        .byte $00
- - - - - 0x039990 24:9980: 00        .byte $00
- D - I - 0x039991 24:9981: 00        .byte $00
- - - - - 0x039992 24:9982: 02        .byte $02    ; <い>
- - - - - 0x039993 24:9983: 02        .byte $02    ; <い>
- D - I - 0x039994 24:9984: 26        .byte $26    ; <よ>
- - - - - 0x039995 24:9985: 00        .byte $00
- D - I - 0x039996 24:9986: 8B        .byte $8B    ; <K>
- D - I - 0x039997 24:9987: 00        .byte $00
- D - I - 0x039998 24:9988: 00        .byte $00
- D - I - 0x039999 24:9989: 00        .byte $00
- - - - - 0x03999A 24:998A: 01        .byte $01    ; <あ>
- - - - - 0x03999B 24:998B: 01        .byte $01    ; <あ>
- - - - - 0x03999C 24:998C: 01        .byte $01    ; <あ>
- D - I - 0x03999D 24:998D: 00        .byte $00
- - - - - 0x03999E 24:998E: 00        .byte $00
- - - - - 0x03999F 24:998F: 00        .byte $00
- - - - - 0x0399A0 24:9990: 25        .byte $25    ; <ゆ>
- - - - - 0x0399A1 24:9991: 00        .byte $00
- D - I - 0x0399A2 24:9992: 8C        .byte $8C    ; <M>
- D - I - 0x0399A3 24:9993: 00        .byte $00
- D - I - 0x0399A4 24:9994: 00        .byte $00
- D - I - 0x0399A5 24:9995: 00        .byte $00
- D - I - 0x0399A6 24:9996: 14        .byte $14    ; <と>
- - - - - 0x0399A7 24:9997: 03        .byte $03    ; <う>
- - - - - 0x0399A8 24:9998: 00        .byte $00
- D - I - 0x0399A9 24:9999: 00        .byte $00
- - - - - 0x0399AA 24:999A: 00        .byte $00
- - - - - 0x0399AB 24:999B: 00        .byte $00
- D - I - 0x0399AC 24:999C: 27        .byte $27    ; <ら>
- - - - - 0x0399AD 24:999D: 00        .byte $00
- D - I - 0x0399AE 24:999E: 8D        .byte $8D    ; <P>
- D - I - 0x0399AF 24:999F: 0A        .byte $0A    ; <こ>
- D - I - 0x0399B0 24:99A0: 00        .byte $00
- D - I - 0x0399B1 24:99A1: 00        .byte $00
- D - I - 0x0399B2 24:99A2: 0F        .byte $0F    ; <そ>
- D - I - 0x0399B3 24:99A3: 02        .byte $02    ; <い>
- - - - - 0x0399B4 24:99A4: 00        .byte $00
- D - I - 0x0399B5 24:99A5: 00        .byte $00
- - - - - 0x0399B6 24:99A6: 00        .byte $00
- - - - - 0x0399B7 24:99A7: 00        .byte $00
- D - I - 0x0399B8 24:99A8: 25        .byte $25    ; <ゆ>
- - - - - 0x0399B9 24:99A9: 00        .byte $00
- D - I - 0x0399BA 24:99AA: 23        .byte $23    ; <も>
- - - - - 0x0399BB 24:99AB: 00        .byte $00
- - - - - 0x0399BC 24:99AC: 00        .byte $00
- - - - - 0x0399BD 24:99AD: 00        .byte $00
- D - I - 0x0399BE 24:99AE: 03        .byte $03    ; <う>
- D - I - 0x0399BF 24:99AF: 02        .byte $02    ; <い>
- - - - - 0x0399C0 24:99B0: 00        .byte $00
- - - - - 0x0399C1 24:99B1: 00        .byte $00
- - - - - 0x0399C2 24:99B2: 00        .byte $00
- - - - - 0x0399C3 24:99B3: 00        .byte $00
- - - - - 0x0399C4 24:99B4: 00        .byte $00
- - - - - 0x0399C5 24:99B5: 00        .byte $00
- D - I - 0x0399C6 24:99B6: 8E        .byte $8E    ; <L>
- D - I - 0x0399C7 24:99B7: 1C        .byte $1C    ; <ふ>
- D - I - 0x0399C8 24:99B8: 00        .byte $00
- D - I - 0x0399C9 24:99B9: 08        .byte $08    ; <く>
- D - I - 0x0399CA 24:99BA: 07        .byte $07    ; <き>
- D - I - 0x0399CB 24:99BB: 05        .byte $05    ; <お>
- - - - - 0x0399CC 24:99BC: 02        .byte $02    ; <い>
- D - I - 0x0399CD 24:99BD: 00        .byte $00
- - - - - 0x0399CE 24:99BE: 00        .byte $00
- - - - - 0x0399CF 24:99BF: 00        .byte $00
- D - I - 0x0399D0 24:99C0: 2E        .byte $2E    ; <ん>
- - - - - 0x0399D1 24:99C1: 00        .byte $00
- D - I - 0x0399D2 24:99C2: 8F        .byte $8F    ; <S>
- D - I - 0x0399D3 24:99C3: 0A        .byte $0A    ; <こ>
- D - I - 0x0399D4 24:99C4: 00        .byte $00
- D - I - 0x0399D5 24:99C5: 04        .byte $04    ; <え>
- D - I - 0x0399D6 24:99C6: 04        .byte $04    ; <え>
- D - I - 0x0399D7 24:99C7: 07        .byte $07    ; <き>
- - - - - 0x0399D8 24:99C8: 00        .byte $00
- D - I - 0x0399D9 24:99C9: 00        .byte $00
- - - - - 0x0399DA 24:99CA: 00        .byte $00
- - - - - 0x0399DB 24:99CB: 00        .byte $00
- D - I - 0x0399DC 24:99CC: 2D        .byte $2D    ; <を>
- - - - - 0x0399DD 24:99CD: 00        .byte $00
- D - I - 0x0399DE 24:99CE: 90        .byte $90    ; <U>
- D - I - 0x0399DF 24:99CF: 06        .byte $06    ; <か>
- D - I - 0x0399E0 24:99D0: 00        .byte $00
- D - I - 0x0399E1 24:99D1: 00        .byte $00
- D - I - 0x0399E2 24:99D2: 14        .byte $14    ; <と>
- D - I - 0x0399E3 24:99D3: 07        .byte $07    ; <き>
- D - I - 0x0399E4 24:99D4: 00        .byte $00
- D - I - 0x0399E5 24:99D5: 00        .byte $00
- - - - - 0x0399E6 24:99D6: 00        .byte $00
- - - - - 0x0399E7 24:99D7: 00        .byte $00
- D - I - 0x0399E8 24:99D8: 2C        .byte $2C    ; <わ>
- - - - - 0x0399E9 24:99D9: 00        .byte $00
- D - I - 0x0399EA 24:99DA: 91        .byte $91    ; <V>
- D - I - 0x0399EB 24:99DB: 0A        .byte $0A    ; <こ>
- D - I - 0x0399EC 24:99DC: 00        .byte $00
- D - I - 0x0399ED 24:99DD: 00        .byte $00
- D - I - 0x0399EE 24:99DE: 06        .byte $06    ; <か>
- D - I - 0x0399EF 24:99DF: 07        .byte $07    ; <き>
- - - - - 0x0399F0 24:99E0: 00        .byte $00
- D - I - 0x0399F1 24:99E1: 00        .byte $00
- - - - - 0x0399F2 24:99E2: 00        .byte $00
- - - - - 0x0399F3 24:99E3: 00        .byte $00
- D - I - 0x0399F4 24:99E4: 2A        .byte $2A    ; <れ>
- - - - - 0x0399F5 24:99E5: 00        .byte $00
- D - I - 0x0399F6 24:99E6: 92        .byte $92    ; <W>
- D - I - 0x0399F7 24:99E7: 0A        .byte $0A    ; <こ>
- D - I - 0x0399F8 24:99E8: 00        .byte $00
- D - I - 0x0399F9 24:99E9: 00        .byte $00
- D - I - 0x0399FA 24:99EA: 09        .byte $09    ; <け>
- - - - - 0x0399FB 24:99EB: 07        .byte $07    ; <き>
- D - I - 0x0399FC 24:99EC: 00        .byte $00
- D - I - 0x0399FD 24:99ED: 00        .byte $00
- - - - - 0x0399FE 24:99EE: 00        .byte $00
- D - I - 0x0399FF 24:99EF: 00        .byte $00
- D - I - 0x039A00 24:99F0: 2B        .byte $2B    ; <ろ>
- - - - - 0x039A01 24:99F1: 00        .byte $00
- D - I - 0x039A02 24:99F2: 93        .byte $93    ; <Y>
- D - I - 0x039A03 24:99F3: 0A        .byte $0A    ; <こ>
- D - I - 0x039A04 24:99F4: 00        .byte $00
- D - I - 0x039A05 24:99F5: 00        .byte $00
- D - I - 0x039A06 24:99F6: 12        .byte $12    ; <つ>
- D - I - 0x039A07 24:99F7: 07        .byte $07    ; <き>
- - - - - 0x039A08 24:99F8: 00        .byte $00
- - - - - 0x039A09 24:99F9: 00        .byte $00
- - - - - 0x039A0A 24:99FA: 00        .byte $00
- - - - - 0x039A0B 24:99FB: 00        .byte $00
- D - I - 0x039A0C 24:99FC: 2A        .byte $2A    ; <れ>
- - - - - 0x039A0D 24:99FD: 00        .byte $00
- D - I - 0x039A0E 24:99FE: 94        .byte $94
- D - I - 0x039A0F 24:99FF: 00        .byte $00
- D - I - 0x039A10 24:9A00: 02        .byte $02    ; <い>
- D - I - 0x039A11 24:9A01: 00        .byte $00
- D - I - 0x039A12 24:9A02: 14        .byte $14    ; <と>
- - - - - 0x039A13 24:9A03: 03        .byte $03    ; <う>
- D - I - 0x039A14 24:9A04: 00        .byte $00
- - - - - 0x039A15 24:9A05: 00        .byte $00
- - - - - 0x039A16 24:9A06: 00        .byte $00
- - - - - 0x039A17 24:9A07: 00        .byte $00
- D - I - 0x039A18 24:9A08: 29        .byte $29    ; <る>
- - - - - 0x039A19 24:9A09: 00        .byte $00
- D - I - 0x039A1A 24:9A0A: 95        .byte $95
- D - I - 0x039A1B 24:9A0B: 00        .byte $00
- D - I - 0x039A1C 24:9A0C: 02        .byte $02    ; <い>
- D - I - 0x039A1D 24:9A0D: 00        .byte $00
- D - I - 0x039A1E 24:9A0E: 14        .byte $14    ; <と>
- - - - - 0x039A1F 24:9A0F: 07        .byte $07    ; <き>
- D - I - 0x039A20 24:9A10: 00        .byte $00
- D - I - 0x039A21 24:9A11: 00        .byte $00
- - - - - 0x039A22 24:9A12: 00        .byte $00
- D - I - 0x039A23 24:9A13: 00        .byte $00
- D - I - 0x039A24 24:9A14: 29        .byte $29    ; <る>
- - - - - 0x039A25 24:9A15: 00        .byte $00
- D - I - 0x039A26 24:9A16: 96        .byte $96
- D - I - 0x039A27 24:9A17: 0B        .byte $0B    ; <さ>
- D - I - 0x039A28 24:9A18: 08        .byte $08    ; <く>
- D - I - 0x039A29 24:9A19: 00        .byte $00
- - - - - 0x039A2A 24:9A1A: 01        .byte $01    ; <あ>
- - - - - 0x039A2B 24:9A1B: 06        .byte $06    ; <か>
- - - - - 0x039A2C 24:9A1C: 00        .byte $00
- D - I - 0x039A2D 24:9A1D: 02        .byte $02    ; <い>
- - - - - 0x039A2E 24:9A1E: 02        .byte $02    ; <い>
- - - - - 0x039A2F 24:9A1F: 02        .byte $02    ; <い>
- - - - - 0x039A30 24:9A20: 29        .byte $29    ; <る>
- - - - - 0x039A31 24:9A21: 00        .byte $00
- D - I - 0x039A32 24:9A22: 97        .byte $97
- D - I - 0x039A33 24:9A23: 0B        .byte $0B    ; <さ>
- D - I - 0x039A34 24:9A24: 20        .byte $20    ; <み>
- D - I - 0x039A35 24:9A25: 00        .byte $00
- D - I - 0x039A36 24:9A26: 12        .byte $12    ; <つ>
- - - - - 0x039A37 24:9A27: 07        .byte $07    ; <き>
- - - - - 0x039A38 24:9A28: 00        .byte $00
- D - I - 0x039A39 24:9A29: 00        .byte $00
- - - - - 0x039A3A 24:9A2A: 00        .byte $00
- D - I - 0x039A3B 24:9A2B: 00        .byte $00
- D - I - 0x039A3C 24:9A2C: 29        .byte $29    ; <る>
- - - - - 0x039A3D 24:9A2D: 00        .byte $00
- D - I - 0x039A3E 24:9A2E: 24        .byte $24    ; <や>
- D - I - 0x039A3F 24:9A2F: 00        .byte $00
- - - - - 0x039A40 24:9A30: 00        .byte $00
- - - - - 0x039A41 24:9A31: 00        .byte $00
- D - I - 0x039A42 24:9A32: 05        .byte $05    ; <お>
- D - I - 0x039A43 24:9A33: 00        .byte $00
- - - - - 0x039A44 24:9A34: 00        .byte $00
- - - - - 0x039A45 24:9A35: 00        .byte $00
- - - - - 0x039A46 24:9A36: 00        .byte $00
- - - - - 0x039A47 24:9A37: 00        .byte $00
- - - - - 0x039A48 24:9A38: 00        .byte $00
- - - - - 0x039A49 24:9A39: 00        .byte $00
- D - I - 0x039A4A 24:9A3A: 98        .byte $98
- D - I - 0x039A4B 24:9A3B: 1B        .byte $1B    ; <ひ>
- D - I - 0x039A4C 24:9A3C: 00        .byte $00
- D - I - 0x039A4D 24:9A3D: 00        .byte $00
- D - I - 0x039A4E 24:9A3E: 1C        .byte $1C    ; <ふ>
- - - - - 0x039A4F 24:9A3F: 08        .byte $08    ; <く>
- - - - - 0x039A50 24:9A40: 00        .byte $00
- D - I - 0x039A51 24:9A41: 00        .byte $00
- - - - - 0x039A52 24:9A42: 00        .byte $00
- - - - - 0x039A53 24:9A43: 00        .byte $00
- D - I - 0x039A54 24:9A44: 2F        .byte $2F    ; <っ>
- - - - - 0x039A55 24:9A45: 00        .byte $00
- D - I - 0x039A56 24:9A46: 04        .byte $04    ; <え>
- D - I - 0x039A57 24:9A47: 00        .byte $00
- - - - - 0x039A58 24:9A48: 00        .byte $00
- - - - - 0x039A59 24:9A49: 00        .byte $00
- D - I - 0x039A5A 24:9A4A: 00        .byte $00
- D - I - 0x039A5B 24:9A4B: 04        .byte $04    ; <え>
- D - I - 0x039A5C 24:9A4C: 00        .byte $00
- - - - - 0x039A5D 24:9A4D: 00        .byte $00
- - - - - 0x039A5E 24:9A4E: 00        .byte $00
- - - - - 0x039A5F 24:9A4F: 00        .byte $00
- - - - - 0x039A60 24:9A50: 00        .byte $00
- - - - - 0x039A61 24:9A51: 00        .byte $00
- D - I - 0x039A62 24:9A52: 18        .byte $18    ; <ね>
- D - I - 0x039A63 24:9A53: 00        .byte $00
- D - I - 0x039A64 24:9A54: 10        .byte $10    ; <た>
- D - I - 0x039A65 24:9A55: 03        .byte $03    ; <う>
- D - I - 0x039A66 24:9A56: 00        .byte $00
- D - I - 0x039A67 24:9A57: 00        .byte $00
- D - I - 0x039A68 24:9A58: 00        .byte $00
- D - I - 0x039A69 24:9A59: 00        .byte $00
- - - - - 0x039A6A 24:9A5A: 00        .byte $00
- D - I - 0x039A6B 24:9A5B: 00        .byte $00
- D - I - 0x039A6C 24:9A5C: 00        .byte $00
- - - - - 0x039A6D 24:9A5D: 00        .byte $00
- D - I - 0x039A6E 24:9A5E: 19        .byte $19    ; <の>
- D - I - 0x039A6F 24:9A5F: 00        .byte $00
- D - I - 0x039A70 24:9A60: 00        .byte $00
- D - I - 0x039A71 24:9A61: 00        .byte $00
- D - I - 0x039A72 24:9A62: 00        .byte $00
- D - I - 0x039A73 24:9A63: 00        .byte $00
- - - - - 0x039A74 24:9A64: 00        .byte $00
- D - I - 0x039A75 24:9A65: 00        .byte $00
- - - - - 0x039A76 24:9A66: 00        .byte $00
- - - - - 0x039A77 24:9A67: 00        .byte $00
- D - I - 0x039A78 24:9A68: 01        .byte $01    ; <あ>
- - - - - 0x039A79 24:9A69: 00        .byte $00
- D - I - 0x039A7A 24:9A6A: 05        .byte $05    ; <お>
- D - I - 0x039A7B 24:9A6B: 00        .byte $00
- - - - - 0x039A7C 24:9A6C: 00        .byte $00
- - - - - 0x039A7D 24:9A6D: 00        .byte $00
- D - I - 0x039A7E 24:9A6E: 01        .byte $01    ; <あ>
- D - I - 0x039A7F 24:9A6F: 01        .byte $01    ; <あ>
- D - I - 0x039A80 24:9A70: 00        .byte $00
- - - - - 0x039A81 24:9A71: 00        .byte $00
- - - - - 0x039A82 24:9A72: 00        .byte $00
- - - - - 0x039A83 24:9A73: 00        .byte $00
- - - - - 0x039A84 24:9A74: 00        .byte $00
- - - - - 0x039A85 24:9A75: 00        .byte $00
- D - I - 0x039A86 24:9A76: 1A        .byte $1A    ; <は>
- D - I - 0x039A87 24:9A77: 00        .byte $00
- D - I - 0x039A88 24:9A78: 14        .byte $14    ; <と>
- D - I - 0x039A89 24:9A79: 02        .byte $02    ; <い>
- D - I - 0x039A8A 24:9A7A: 01        .byte $01    ; <あ>
- - - - - 0x039A8B 24:9A7B: 00        .byte $00
- D - I - 0x039A8C 24:9A7C: 03        .byte $03    ; <う>
- D - I - 0x039A8D 24:9A7D: 00        .byte $00
- D - I - 0x039A8E 24:9A7E: 00        .byte $00
- D - I - 0x039A8F 24:9A7F: 01        .byte $01    ; <あ>
- D - I - 0x039A90 24:9A80: 02        .byte $02    ; <い>
- - - - - 0x039A91 24:9A81: 00        .byte $00
- D - I - 0x039A92 24:9A82: 1B        .byte $1B    ; <ひ>
- D - I - 0x039A93 24:9A83: 00        .byte $00
- D - I - 0x039A94 24:9A84: 00        .byte $00
- D - I - 0x039A95 24:9A85: 00        .byte $00
- D - I - 0x039A96 24:9A86: 01        .byte $01    ; <あ>
- D - I - 0x039A97 24:9A87: 01        .byte $01    ; <あ>
- D - I - 0x039A98 24:9A88: 00        .byte $00
- D - I - 0x039A99 24:9A89: 00        .byte $00
- - - - - 0x039A9A 24:9A8A: 00        .byte $00
- D - I - 0x039A9B 24:9A8B: 00        .byte $00
- D - I - 0x039A9C 24:9A8C: 1E        .byte $1E    ; <ほ>
- - - - - 0x039A9D 24:9A8D: 00        .byte $00
- D - I - 0x039A9E 24:9A8E: 1E        .byte $1E    ; <ほ>
- D - I - 0x039A9F 24:9A8F: 00        .byte $00
- D - I - 0x039AA0 24:9A90: 18        .byte $18    ; <ね>
- D - I - 0x039AA1 24:9A91: 02        .byte $02    ; <い>
- D - I - 0x039AA2 24:9A92: 00        .byte $00
- - - - - 0x039AA3 24:9A93: 00        .byte $00
- D - I - 0x039AA4 24:9A94: 00        .byte $00
- D - I - 0x039AA5 24:9A95: 00        .byte $00
- - - - - 0x039AA6 24:9A96: 00        .byte $00
- D - I - 0x039AA7 24:9A97: 00        .byte $00
- - - - - 0x039AA8 24:9A98: 00        .byte $00
- - - - - 0x039AA9 24:9A99: 00        .byte $00
- D - I - 0x039AAA 24:9A9A: 1F        .byte $1F    ; <ま>
- D - I - 0x039AAB 24:9A9B: 00        .byte $00
- D - I - 0x039AAC 24:9A9C: 00        .byte $00
- D - I - 0x039AAD 24:9A9D: 00        .byte $00
- D - I - 0x039AAE 24:9A9E: 00        .byte $00
- D - I - 0x039AAF 24:9A9F: 00        .byte $00
- D - I - 0x039AB0 24:9AA0: 00        .byte $00
- D - I - 0x039AB1 24:9AA1: 00        .byte $00
- D - I - 0x039AB2 24:9AA2: 00        .byte $00
- - - - - 0x039AB3 24:9AA3: 00        .byte $00
- D - I - 0x039AB4 24:9AA4: 01        .byte $01    ; <あ>
- - - - - 0x039AB5 24:9AA5: 00        .byte $00
- D - I - 0x039AB6 24:9AA6: 07        .byte $07    ; <き>
- - - - - 0x039AB7 24:9AA7: 00        .byte $00
- - - - - 0x039AB8 24:9AA8: 00        .byte $00
- - - - - 0x039AB9 24:9AA9: 00        .byte $00
- D - I - 0x039ABA 24:9AAA: 00        .byte $00
- D - I - 0x039ABB 24:9AAB: 01        .byte $01    ; <あ>
- - - - - 0x039ABC 24:9AAC: 00        .byte $00
- - - - - 0x039ABD 24:9AAD: 00        .byte $00
- - - - - 0x039ABE 24:9AAE: 00        .byte $00
- - - - - 0x039ABF 24:9AAF: 00        .byte $00
- - - - - 0x039AC0 24:9AB0: 00        .byte $00
- - - - - 0x039AC1 24:9AB1: 00        .byte $00
- D - I - 0x039AC2 24:9AB2: 21        .byte $21    ; <む>
- D - I - 0x039AC3 24:9AB3: 00        .byte $00
- D - I - 0x039AC4 24:9AB4: 20        .byte $20    ; <み>
- D - I - 0x039AC5 24:9AB5: 03        .byte $03    ; <う>
- D - I - 0x039AC6 24:9AB6: 01        .byte $01    ; <あ>
- - - - - 0x039AC7 24:9AB7: 00        .byte $00
- - - - - 0x039AC8 24:9AB8: 03        .byte $03    ; <う>
- D - I - 0x039AC9 24:9AB9: 00        .byte $00
- - - - - 0x039ACA 24:9ABA: 00        .byte $00
- D - I - 0x039ACB 24:9ABB: 01        .byte $01    ; <あ>
- D - I - 0x039ACC 24:9ABC: 00        .byte $00
- - - - - 0x039ACD 24:9ABD: 00        .byte $00
- D - I - 0x039ACE 24:9ABE: 22        .byte $22    ; <め>
- D - I - 0x039ACF 24:9ABF: 00        .byte $00
- D - I - 0x039AD0 24:9AC0: 00        .byte $00
- D - I - 0x039AD1 24:9AC1: 00        .byte $00
- D - I - 0x039AD2 24:9AC2: 00        .byte $00
- D - I - 0x039AD3 24:9AC3: 01        .byte $01    ; <あ>
- - - - - 0x039AD4 24:9AC4: 00        .byte $00
- D - I - 0x039AD5 24:9AC5: 00        .byte $00
- D - I - 0x039AD6 24:9AC6: 00        .byte $00
- - - - - 0x039AD7 24:9AC7: 00        .byte $00
- D - I - 0x039AD8 24:9AC8: 03        .byte $03    ; <う>
- - - - - 0x039AD9 24:9AC9: 00        .byte $00
- D - I - 0x039ADA 24:9ACA: 08        .byte $08    ; <く>
- D - I - 0x039ADB 24:9ACB: 00        .byte $00
- - - - - 0x039ADC 24:9ACC: 00        .byte $00
- - - - - 0x039ADD 24:9ACD: 00        .byte $00
- D - I - 0x039ADE 24:9ACE: 00        .byte $00
- D - I - 0x039ADF 24:9ACF: 00        .byte $00
- - - - - 0x039AE0 24:9AD0: 00        .byte $00
- - - - - 0x039AE1 24:9AD1: 00        .byte $00
- - - - - 0x039AE2 24:9AD2: 00        .byte $00
- - - - - 0x039AE3 24:9AD3: 00        .byte $00
- - - - - 0x039AE4 24:9AD4: 00        .byte $00
- - - - - 0x039AE5 24:9AD5: 00        .byte $00
- D - I - 0x039AE6 24:9AD6: 25        .byte $25    ; <ゆ>
- D - I - 0x039AE7 24:9AD7: 00        .byte $00
- D - I - 0x039AE8 24:9AD8: 00        .byte $00
- D - I - 0x039AE9 24:9AD9: 00        .byte $00
- - - - - 0x039AEA 24:9ADA: 01        .byte $01    ; <あ>
- - - - - 0x039AEB 24:9ADB: 00        .byte $00
- D - I - 0x039AEC 24:9ADC: 00        .byte $00
- D - I - 0x039AED 24:9ADD: 00        .byte $00
- - - - - 0x039AEE 24:9ADE: 00        .byte $00
- D - I - 0x039AEF 24:9ADF: 00        .byte $00
- D - I - 0x039AF0 24:9AE0: 05        .byte $05    ; <お>
- - - - - 0x039AF1 24:9AE1: 00        .byte $00
- D - I - 0x039AF2 24:9AE2: 26        .byte $26    ; <よ>
- D - I - 0x039AF3 24:9AE3: 00        .byte $00
- D - I - 0x039AF4 24:9AE4: 00        .byte $00
- D - I - 0x039AF5 24:9AE5: 00        .byte $00
- D - I - 0x039AF6 24:9AE6: 01        .byte $01    ; <あ>
- D - I - 0x039AF7 24:9AE7: 01        .byte $01    ; <あ>
- D - I - 0x039AF8 24:9AE8: 00        .byte $00
- D - I - 0x039AF9 24:9AE9: 00        .byte $00
- - - - - 0x039AFA 24:9AEA: 00        .byte $00
- D - I - 0x039AFB 24:9AEB: 00        .byte $00
- D - I - 0x039AFC 24:9AEC: 04        .byte $04    ; <え>
- - - - - 0x039AFD 24:9AED: 00        .byte $00
- D - I - 0x039AFE 24:9AEE: 09        .byte $09    ; <け>
- D - I - 0x039AFF 24:9AEF: 00        .byte $00
- - - - - 0x039B00 24:9AF0: 00        .byte $00
- - - - - 0x039B01 24:9AF1: 00        .byte $00
- D - I - 0x039B02 24:9AF2: 00        .byte $00
- D - I - 0x039B03 24:9AF3: 00        .byte $00
- - - - - 0x039B04 24:9AF4: 00        .byte $00
- - - - - 0x039B05 24:9AF5: 00        .byte $00
- - - - - 0x039B06 24:9AF6: 00        .byte $00
- - - - - 0x039B07 24:9AF7: 00        .byte $00
- - - - - 0x039B08 24:9AF8: 00        .byte $00
- - - - - 0x039B09 24:9AF9: 00        .byte $00
- D - I - 0x039B0A 24:9AFA: 29        .byte $29    ; <る>
- D - I - 0x039B0B 24:9AFB: 00        .byte $00
- D - I - 0x039B0C 24:9AFC: 00        .byte $00
- D - I - 0x039B0D 24:9AFD: 00        .byte $00
- D - I - 0x039B0E 24:9AFE: 01        .byte $01    ; <あ>
- - - - - 0x039B0F 24:9AFF: 01        .byte $01    ; <あ>
- D - I - 0x039B10 24:9B00: 00        .byte $00
- D - I - 0x039B11 24:9B01: 00        .byte $00
- - - - - 0x039B12 24:9B02: 00        .byte $00
- D - I - 0x039B13 24:9B03: 00        .byte $00
- D - I - 0x039B14 24:9B04: 06        .byte $06    ; <か>
- - - - - 0x039B15 24:9B05: 00        .byte $00
- D - I - 0x039B16 24:9B06: 2A        .byte $2A    ; <れ>
- D - I - 0x039B17 24:9B07: 00        .byte $00
- D - I - 0x039B18 24:9B08: 00        .byte $00
- D - I - 0x039B19 24:9B09: 00        .byte $00
- D - I - 0x039B1A 24:9B0A: 01        .byte $01    ; <あ>
- D - I - 0x039B1B 24:9B0B: 00        .byte $00
- D - I - 0x039B1C 24:9B0C: 00        .byte $00
- D - I - 0x039B1D 24:9B0D: 00        .byte $00
- - - - - 0x039B1E 24:9B0E: 00        .byte $00
- - - - - 0x039B1F 24:9B0F: 01        .byte $01    ; <あ>
- D - I - 0x039B20 24:9B10: 07        .byte $07    ; <き>
- - - - - 0x039B21 24:9B11: 00        .byte $00
- D - I - 0x039B22 24:9B12: 0A        .byte $0A    ; <こ>
- D - I - 0x039B23 24:9B13: 00        .byte $00
- - - - - 0x039B24 24:9B14: 00        .byte $00
- - - - - 0x039B25 24:9B15: 00        .byte $00
- D - I - 0x039B26 24:9B16: 00        .byte $00
- D - I - 0x039B27 24:9B17: 00        .byte $00
- - - - - 0x039B28 24:9B18: 00        .byte $00
- - - - - 0x039B29 24:9B19: 00        .byte $00
- - - - - 0x039B2A 24:9B1A: 00        .byte $00
- - - - - 0x039B2B 24:9B1B: 00        .byte $00
- - - - - 0x039B2C 24:9B1C: 00        .byte $00
- - - - - 0x039B2D 24:9B1D: 00        .byte $00
- D - I - 0x039B2E 24:9B1E: 2E        .byte $2E    ; <ん>
- D - I - 0x039B2F 24:9B1F: 00        .byte $00
- D - I - 0x039B30 24:9B20: 00        .byte $00
- D - I - 0x039B31 24:9B21: 00        .byte $00
- D - I - 0x039B32 24:9B22: 01        .byte $01    ; <あ>
- - - - - 0x039B33 24:9B23: 00        .byte $00
- D - I - 0x039B34 24:9B24: 00        .byte $00
- D - I - 0x039B35 24:9B25: 00        .byte $00
- - - - - 0x039B36 24:9B26: 00        .byte $00
- D - I - 0x039B37 24:9B27: 00        .byte $00
- D - I - 0x039B38 24:9B28: 08        .byte $08    ; <く>
- - - - - 0x039B39 24:9B29: 00        .byte $00
- D - I - 0x039B3A 24:9B2A: 2F        .byte $2F    ; <っ>
- D - I - 0x039B3B 24:9B2B: 00        .byte $00
- D - I - 0x039B3C 24:9B2C: 00        .byte $00
- D - I - 0x039B3D 24:9B2D: 00        .byte $00
- D - I - 0x039B3E 24:9B2E: 01        .byte $01    ; <あ>
- D - I - 0x039B3F 24:9B2F: 00        .byte $00
- - - - - 0x039B40 24:9B30: 00        .byte $00
- D - I - 0x039B41 24:9B31: 00        .byte $00
- - - - - 0x039B42 24:9B32: 00        .byte $00
- D - I - 0x039B43 24:9B33: 00        .byte $00
- D - I - 0x039B44 24:9B34: 08        .byte $08    ; <く>
- - - - - 0x039B45 24:9B35: 00        .byte $00
- D - I - 0x039B46 24:9B36: 0B        .byte $0B    ; <さ>
- D - I - 0x039B47 24:9B37: 00        .byte $00
- - - - - 0x039B48 24:9B38: 00        .byte $00
- - - - - 0x039B49 24:9B39: 00        .byte $00
- D - I - 0x039B4A 24:9B3A: 00        .byte $00
- - - - - 0x039B4B 24:9B3B: 00        .byte $00
- - - - - 0x039B4C 24:9B3C: 00        .byte $00
- - - - - 0x039B4D 24:9B3D: 00        .byte $00
- - - - - 0x039B4E 24:9B3E: 00        .byte $00
- - - - - 0x039B4F 24:9B3F: 00        .byte $00
- - - - - 0x039B50 24:9B40: 03        .byte $03    ; <う>
- - - - - 0x039B51 24:9B41: 00        .byte $00
- D - I - 0x039B52 24:9B42: 32        .byte $32    ; <ょ>
- D - I - 0x039B53 24:9B43: 00        .byte $00
- D - I - 0x039B54 24:9B44: 00        .byte $00
- D - I - 0x039B55 24:9B45: 00        .byte $00
- D - I - 0x039B56 24:9B46: 01        .byte $01    ; <あ>
- - - - - 0x039B57 24:9B47: 00        .byte $00
- - - - - 0x039B58 24:9B48: 00        .byte $00
- D - I - 0x039B59 24:9B49: 00        .byte $00
- - - - - 0x039B5A 24:9B4A: 00        .byte $00
- - - - - 0x039B5B 24:9B4B: 00        .byte $00
- D - I - 0x039B5C 24:9B4C: 00        .byte $00
- - - - - 0x039B5D 24:9B4D: 00        .byte $00
- D - I - 0x039B5E 24:9B4E: 33        .byte $33    ; <0>
- D - I - 0x039B5F 24:9B4F: 00        .byte $00
- D - I - 0x039B60 24:9B50: 00        .byte $00
- D - I - 0x039B61 24:9B51: 00        .byte $00
- D - I - 0x039B62 24:9B52: 01        .byte $01    ; <あ>
- D - I - 0x039B63 24:9B53: 00        .byte $00
- - - - - 0x039B64 24:9B54: 00        .byte $00
- D - I - 0x039B65 24:9B55: 00        .byte $00
- - - - - 0x039B66 24:9B56: 00        .byte $00
- D - I - 0x039B67 24:9B57: 00        .byte $00
- D - I - 0x039B68 24:9B58: 03        .byte $03    ; <う>
- - - - - 0x039B69 24:9B59: 00        .byte $00
- D - I - 0x039B6A 24:9B5A: 35        .byte $35    ; <2>
- D - I - 0x039B6B 24:9B5B: 00        .byte $00
- D - I - 0x039B6C 24:9B5C: 00        .byte $00
- D - I - 0x039B6D 24:9B5D: 00        .byte $00
- D - I - 0x039B6E 24:9B5E: 01        .byte $01    ; <あ>
- D - I - 0x039B6F 24:9B5F: 00        .byte $00
- D - I - 0x039B70 24:9B60: 00        .byte $00
- D - I - 0x039B71 24:9B61: 00        .byte $00
- - - - - 0x039B72 24:9B62: 00        .byte $00
- D - I - 0x039B73 24:9B63: 00        .byte $00
- D - I - 0x039B74 24:9B64: 08        .byte $08    ; <く>
- - - - - 0x039B75 24:9B65: 00        .byte $00
- D - I - 0x039B76 24:9B66: 36        .byte $36    ; <3>
- D - I - 0x039B77 24:9B67: 00        .byte $00
- D - I - 0x039B78 24:9B68: 00        .byte $00
- D - I - 0x039B79 24:9B69: 00        .byte $00
- D - I - 0x039B7A 24:9B6A: 01        .byte $01    ; <あ>
- D - I - 0x039B7B 24:9B6B: 00        .byte $00
- - - - - 0x039B7C 24:9B6C: 00        .byte $00
- D - I - 0x039B7D 24:9B6D: 00        .byte $00
- - - - - 0x039B7E 24:9B6E: 00        .byte $00
- - - - - 0x039B7F 24:9B6F: 00        .byte $00
- D - I - 0x039B80 24:9B70: 13        .byte $13    ; <て>
- - - - - 0x039B81 24:9B71: 00        .byte $00
- D - I - 0x039B82 24:9B72: 0D        .byte $0D    ; <す>
- D - I - 0x039B83 24:9B73: 00        .byte $00
- - - - - 0x039B84 24:9B74: 00        .byte $00
- - - - - 0x039B85 24:9B75: 00        .byte $00
- D - I - 0x039B86 24:9B76: 00        .byte $00
- D - I - 0x039B87 24:9B77: 00        .byte $00
- - - - - 0x039B88 24:9B78: 00        .byte $00
- - - - - 0x039B89 24:9B79: 00        .byte $00
- - - - - 0x039B8A 24:9B7A: 00        .byte $00
- - - - - 0x039B8B 24:9B7B: 00        .byte $00
- - - - - 0x039B8C 24:9B7C: 00        .byte $00
- - - - - 0x039B8D 24:9B7D: 00        .byte $00
- D - I - 0x039B8E 24:9B7E: 38        .byte $38    ; <5>
- D - I - 0x039B8F 24:9B7F: 00        .byte $00
- D - I - 0x039B90 24:9B80: 00        .byte $00
- D - I - 0x039B91 24:9B81: 00        .byte $00
- D - I - 0x039B92 24:9B82: 00        .byte $00
- - - - - 0x039B93 24:9B83: 00        .byte $00
- D - I - 0x039B94 24:9B84: 00        .byte $00
- - - - - 0x039B95 24:9B85: 00        .byte $00
- - - - - 0x039B96 24:9B86: 00        .byte $00
- D - I - 0x039B97 24:9B87: 00        .byte $00
- D - I - 0x039B98 24:9B88: 09        .byte $09    ; <け>
- - - - - 0x039B99 24:9B89: 00        .byte $00
- D - I - 0x039B9A 24:9B8A: 39        .byte $39    ; <6>
- D - I - 0x039B9B 24:9B8B: 00        .byte $00
- D - I - 0x039B9C 24:9B8C: 00        .byte $00
- D - I - 0x039B9D 24:9B8D: 00        .byte $00
- D - I - 0x039B9E 24:9B8E: 00        .byte $00
- D - I - 0x039B9F 24:9B8F: 00        .byte $00
- - - - - 0x039BA0 24:9B90: 00        .byte $00
- D - I - 0x039BA1 24:9B91: 00        .byte $00
- - - - - 0x039BA2 24:9B92: 00        .byte $00
- - - - - 0x039BA3 24:9B93: 00        .byte $00
- D - I - 0x039BA4 24:9B94: 0A        .byte $0A    ; <こ>
- - - - - 0x039BA5 24:9B95: 00        .byte $00
- D - I - 0x039BA6 24:9B96: 0E        .byte $0E    ; <せ>
- - - - - 0x039BA7 24:9B97: 00        .byte $00
- - - - - 0x039BA8 24:9B98: 00        .byte $00
- - - - - 0x039BA9 24:9B99: 00        .byte $00
- D - I - 0x039BAA 24:9B9A: 00        .byte $00
- D - I - 0x039BAB 24:9B9B: 00        .byte $00
- - - - - 0x039BAC 24:9B9C: 00        .byte $00
- - - - - 0x039BAD 24:9B9D: 00        .byte $00
- - - - - 0x039BAE 24:9B9E: 00        .byte $00
- - - - - 0x039BAF 24:9B9F: 00        .byte $00
- - - - - 0x039BB0 24:9BA0: 00        .byte $00
- - - - - 0x039BB1 24:9BA1: 00        .byte $00
- D - I - 0x039BB2 24:9BA2: 3B        .byte $3B    ; <8>
- D - I - 0x039BB3 24:9BA3: 00        .byte $00
- D - I - 0x039BB4 24:9BA4: 00        .byte $00
- D - I - 0x039BB5 24:9BA5: 00        .byte $00
- D - I - 0x039BB6 24:9BA6: 01        .byte $01    ; <あ>
- - - - - 0x039BB7 24:9BA7: 03        .byte $03    ; <う>
- D - I - 0x039BB8 24:9BA8: 00        .byte $00
- D - I - 0x039BB9 24:9BA9: 00        .byte $00
- - - - - 0x039BBA 24:9BAA: 00        .byte $00
- D - I - 0x039BBB 24:9BAB: 00        .byte $00
- D - I - 0x039BBC 24:9BAC: 0B        .byte $0B    ; <さ>
- - - - - 0x039BBD 24:9BAD: 00        .byte $00
- D - I - 0x039BBE 24:9BAE: 3C        .byte $3C    ; <9>
- D - I - 0x039BBF 24:9BAF: 00        .byte $00
- D - I - 0x039BC0 24:9BB0: 00        .byte $00
- D - I - 0x039BC1 24:9BB1: 00        .byte $00
- D - I - 0x039BC2 24:9BB2: 01        .byte $01    ; <あ>
- D - I - 0x039BC3 24:9BB3: 05        .byte $05    ; <お>
- - - - - 0x039BC4 24:9BB4: 00        .byte $00
- D - I - 0x039BC5 24:9BB5: 00        .byte $00
- D - I - 0x039BC6 24:9BB6: 00        .byte $00
- - - - - 0x039BC7 24:9BB7: 00        .byte $00
- D - I - 0x039BC8 24:9BB8: 0D        .byte $0D    ; <す>
- - - - - 0x039BC9 24:9BB9: 00        .byte $00
- D - I - 0x039BCA 24:9BBA: 3E        .byte $3E    ; <Jr>
- D - I - 0x039BCB 24:9BBB: 00        .byte $00
- D - I - 0x039BCC 24:9BBC: 00        .byte $00
- D - I - 0x039BCD 24:9BBD: 00        .byte $00
- D - I - 0x039BCE 24:9BBE: 01        .byte $01    ; <あ>
- - - - - 0x039BCF 24:9BBF: 00        .byte $00
- D - I - 0x039BD0 24:9BC0: 00        .byte $00
- D - I - 0x039BD1 24:9BC1: 00        .byte $00
- - - - - 0x039BD2 24:9BC2: 00        .byte $00
- D - I - 0x039BD3 24:9BC3: 00        .byte $00
- D - I - 0x039BD4 24:9BC4: 0E        .byte $0E    ; <せ>
- - - - - 0x039BD5 24:9BC5: 00        .byte $00
- D - I - 0x039BD6 24:9BC6: 3F        .byte $3F    ; <•>
- D - I - 0x039BD7 24:9BC7: 00        .byte $00
- D - I - 0x039BD8 24:9BC8: 00        .byte $00
- D - I - 0x039BD9 24:9BC9: 00        .byte $00
- D - I - 0x039BDA 24:9BCA: 01        .byte $01    ; <あ>
- D - I - 0x039BDB 24:9BCB: 00        .byte $00
- D - I - 0x039BDC 24:9BCC: 00        .byte $00
- D - I - 0x039BDD 24:9BCD: 00        .byte $00
- - - - - 0x039BDE 24:9BCE: 00        .byte $00
- - - - - 0x039BDF 24:9BCF: 00        .byte $00
- D - I - 0x039BE0 24:9BD0: 0E        .byte $0E    ; <せ>
- - - - - 0x039BE1 24:9BD1: 00        .byte $00
- D - I - 0x039BE2 24:9BD2: 10        .byte $10    ; <た>
- D - I - 0x039BE3 24:9BD3: 00        .byte $00
- - - - - 0x039BE4 24:9BD4: 00        .byte $00
- - - - - 0x039BE5 24:9BD5: 00        .byte $00
- D - I - 0x039BE6 24:9BD6: 00        .byte $00
- D - I - 0x039BE7 24:9BD7: 00        .byte $00
- D - I - 0x039BE8 24:9BD8: 00        .byte $00
- - - - - 0x039BE9 24:9BD9: 00        .byte $00
- - - - - 0x039BEA 24:9BDA: 00        .byte $00
- - - - - 0x039BEB 24:9BDB: 00        .byte $00
- - - - - 0x039BEC 24:9BDC: 00        .byte $00
- - - - - 0x039BED 24:9BDD: 00        .byte $00
- D - I - 0x039BEE 24:9BDE: 43        .byte $43    ; <ウ>
- D - I - 0x039BEF 24:9BDF: 0F        .byte $0F    ; <そ>
- D - I - 0x039BF0 24:9BE0: D0        .byte $D0    ; <ペ>
- D - I - 0x039BF1 24:9BE1: 08        .byte $08    ; <く>
- D - I - 0x039BF2 24:9BE2: 05        .byte $05    ; <お>
- D - I - 0x039BF3 24:9BE3: 03        .byte $03    ; <う>
- - - - - 0x039BF4 24:9BE4: 00        .byte $00
- D - I - 0x039BF5 24:9BE5: 00        .byte $00
- D - I - 0x039BF6 24:9BE6: 00        .byte $00
- - - - - 0x039BF7 24:9BE7: 00        .byte $00
- D - I - 0x039BF8 24:9BE8: 1E        .byte $1E    ; <ほ>
- - - - - 0x039BF9 24:9BE9: 00        .byte $00
- D - I - 0x039BFA 24:9BEA: 44        .byte $44    ; <エ>
- D - I - 0x039BFB 24:9BEB: 00        .byte $00
- D - I - 0x039BFC 24:9BEC: 00        .byte $00
- D - I - 0x039BFD 24:9BED: 00        .byte $00
- D - I - 0x039BFE 24:9BEE: 01        .byte $01    ; <あ>
- - - - - 0x039BFF 24:9BEF: 00        .byte $00
- D - I - 0x039C00 24:9BF0: 00        .byte $00
- D - I - 0x039C01 24:9BF1: 00        .byte $00
- - - - - 0x039C02 24:9BF2: 00        .byte $00
- - - - - 0x039C03 24:9BF3: 00        .byte $00
- D - I - 0x039C04 24:9BF4: 10        .byte $10    ; <た>
- - - - - 0x039C05 24:9BF5: 00        .byte $00
- D - I - 0x039C06 24:9BF6: 11        .byte $11    ; <ち>
- D - I - 0x039C07 24:9BF7: 00        .byte $00
- - - - - 0x039C08 24:9BF8: 00        .byte $00
- - - - - 0x039C09 24:9BF9: 00        .byte $00
- D - I - 0x039C0A 24:9BFA: 00        .byte $00
- D - I - 0x039C0B 24:9BFB: 00        .byte $00
- - - - - 0x039C0C 24:9BFC: 00        .byte $00
- - - - - 0x039C0D 24:9BFD: 00        .byte $00
- - - - - 0x039C0E 24:9BFE: 00        .byte $00
- - - - - 0x039C0F 24:9BFF: 00        .byte $00
- - - - - 0x039C10 24:9C00: 00        .byte $00
- - - - - 0x039C11 24:9C01: 00        .byte $00
- D - I - 0x039C12 24:9C02: 46        .byte $46    ; <カ>
- D - I - 0x039C13 24:9C03: 0F        .byte $0F    ; <そ>
- D - I - 0x039C14 24:9C04: 00        .byte $00
- D - I - 0x039C15 24:9C05: 00        .byte $00
- D - I - 0x039C16 24:9C06: 01        .byte $01    ; <あ>
- - - - - 0x039C17 24:9C07: 00        .byte $00
- - - - - 0x039C18 24:9C08: 00        .byte $00
- D - I - 0x039C19 24:9C09: 00        .byte $00
- - - - - 0x039C1A 24:9C0A: 00        .byte $00
- D - I - 0x039C1B 24:9C0B: 00        .byte $00
- D - I - 0x039C1C 24:9C0C: 03        .byte $03    ; <う>
- - - - - 0x039C1D 24:9C0D: 00        .byte $00
- D - I - 0x039C1E 24:9C0E: 47        .byte $47    ; <キ>
- D - I - 0x039C1F 24:9C0F: 00        .byte $00
- D - I - 0x039C20 24:9C10: 00        .byte $00
- D - I - 0x039C21 24:9C11: 00        .byte $00
- D - I - 0x039C22 24:9C12: 01        .byte $01    ; <あ>
- - - - - 0x039C23 24:9C13: 00        .byte $00
- - - - - 0x039C24 24:9C14: 00        .byte $00
- D - I - 0x039C25 24:9C15: 00        .byte $00
- - - - - 0x039C26 24:9C16: 00        .byte $00
- D - I - 0x039C27 24:9C17: 00        .byte $00
- D - I - 0x039C28 24:9C18: 03        .byte $03    ; <う>
- - - - - 0x039C29 24:9C19: 00        .byte $00
- D - I - 0x039C2A 24:9C1A: 4A        .byte $4A    ; <コ>
- D - I - 0x039C2B 24:9C1B: 00        .byte $00
- D - I - 0x039C2C 24:9C1C: 00        .byte $00
- D - I - 0x039C2D 24:9C1D: 00        .byte $00
- D - I - 0x039C2E 24:9C1E: 00        .byte $00
- - - - - 0x039C2F 24:9C1F: 00        .byte $00
- - - - - 0x039C30 24:9C20: 00        .byte $00
- D - I - 0x039C31 24:9C21: 00        .byte $00
- - - - - 0x039C32 24:9C22: 00        .byte $00
- D - I - 0x039C33 24:9C23: 00        .byte $00
- D - I - 0x039C34 24:9C24: 11        .byte $11    ; <ち>
- - - - - 0x039C35 24:9C25: 00        .byte $00
- D - I - 0x039C36 24:9C26: 4B        .byte $4B    ; <サ>
- D - I - 0x039C37 24:9C27: 00        .byte $00
- D - I - 0x039C38 24:9C28: 00        .byte $00
- D - I - 0x039C39 24:9C29: 00        .byte $00
- D - I - 0x039C3A 24:9C2A: 00        .byte $00
- D - I - 0x039C3B 24:9C2B: 00        .byte $00
- D - I - 0x039C3C 24:9C2C: 00        .byte $00
- D - I - 0x039C3D 24:9C2D: 00        .byte $00
- - - - - 0x039C3E 24:9C2E: 00        .byte $00
- - - - - 0x039C3F 24:9C2F: 00        .byte $00
- D - I - 0x039C40 24:9C30: 11        .byte $11    ; <ち>
- - - - - 0x039C41 24:9C31: 00        .byte $00
- D - I - 0x039C42 24:9C32: 14        .byte $14    ; <と>
- - - - - 0x039C43 24:9C33: 00        .byte $00
- - - - - 0x039C44 24:9C34: 00        .byte $00
- - - - - 0x039C45 24:9C35: 00        .byte $00
- D - I - 0x039C46 24:9C36: 00        .byte $00
- - - - - 0x039C47 24:9C37: 00        .byte $00
- - - - - 0x039C48 24:9C38: 00        .byte $00
- - - - - 0x039C49 24:9C39: 00        .byte $00
- - - - - 0x039C4A 24:9C3A: 00        .byte $00
- - - - - 0x039C4B 24:9C3B: 00        .byte $00
- - - - - 0x039C4C 24:9C3C: 00        .byte $00
- - - - - 0x039C4D 24:9C3D: 00        .byte $00
- D - I - 0x039C4E 24:9C3E: 59        .byte $59    ; <ノ>
- D - I - 0x039C4F 24:9C3F: 00        .byte $00
- D - I - 0x039C50 24:9C40: 00        .byte $00
- D - I - 0x039C51 24:9C41: 00        .byte $00
- D - I - 0x039C52 24:9C42: 00        .byte $00
- D - I - 0x039C53 24:9C43: 00        .byte $00
- D - I - 0x039C54 24:9C44: 00        .byte $00
- D - I - 0x039C55 24:9C45: 00        .byte $00
- D - I - 0x039C56 24:9C46: 00        .byte $00
- D - I - 0x039C57 24:9C47: 00        .byte $00
- D - I - 0x039C58 24:9C48: 00        .byte $00
- - - - - 0x039C59 24:9C49: 00        .byte $00
- D - I - 0x039C5A 24:9C4A: 5A        .byte $5A    ; <ハ>
- D - I - 0x039C5B 24:9C4B: 00        .byte $00
- D - I - 0x039C5C 24:9C4C: 00        .byte $00
- D - I - 0x039C5D 24:9C4D: 00        .byte $00
- D - I - 0x039C5E 24:9C4E: 00        .byte $00
- D - I - 0x039C5F 24:9C4F: 00        .byte $00
- - - - - 0x039C60 24:9C50: 00        .byte $00
- D - I - 0x039C61 24:9C51: 00        .byte $00
- D - I - 0x039C62 24:9C52: 00        .byte $00
- - - - - 0x039C63 24:9C53: 00        .byte $00
- D - I - 0x039C64 24:9C54: 03        .byte $03    ; <う>
- - - - - 0x039C65 24:9C55: 00        .byte $00
- D - I - 0x039C66 24:9C56: 15        .byte $15    ; <な>
- D - I - 0x039C67 24:9C57: 00        .byte $00
- - - - - 0x039C68 24:9C58: 00        .byte $00
- - - - - 0x039C69 24:9C59: 00        .byte $00
- D - I - 0x039C6A 24:9C5A: 00        .byte $00
- - - - - 0x039C6B 24:9C5B: 00        .byte $00
- - - - - 0x039C6C 24:9C5C: 00        .byte $00
- - - - - 0x039C6D 24:9C5D: 00        .byte $00
- - - - - 0x039C6E 24:9C5E: 00        .byte $00
- - - - - 0x039C6F 24:9C5F: 00        .byte $00
- - - - - 0x039C70 24:9C60: 00        .byte $00
- - - - - 0x039C71 24:9C61: 00        .byte $00
- D - I - 0x039C72 24:9C62: 5B        .byte $5B    ; <ヒ>
- D - I - 0x039C73 24:9C63: 0F        .byte $0F    ; <そ>
- D - I - 0x039C74 24:9C64: 00        .byte $00
- D - I - 0x039C75 24:9C65: 00        .byte $00
- D - I - 0x039C76 24:9C66: 01        .byte $01    ; <あ>
- - - - - 0x039C77 24:9C67: 01        .byte $01    ; <あ>
- D - I - 0x039C78 24:9C68: 00        .byte $00
- D - I - 0x039C79 24:9C69: 01        .byte $01    ; <あ>
- - - - - 0x039C7A 24:9C6A: 01        .byte $01    ; <あ>
- D - I - 0x039C7B 24:9C6B: 01        .byte $01    ; <あ>
- D - I - 0x039C7C 24:9C6C: 00        .byte $00
- - - - - 0x039C7D 24:9C6D: 00        .byte $00
- D - I - 0x039C7E 24:9C6E: 5C        .byte $5C    ; <フ>
- D - I - 0x039C7F 24:9C6F: 0F        .byte $0F    ; <そ>
- D - I - 0x039C80 24:9C70: 00        .byte $00
- D - I - 0x039C81 24:9C71: 00        .byte $00
- D - I - 0x039C82 24:9C72: 01        .byte $01    ; <あ>
- - - - - 0x039C83 24:9C73: 01        .byte $01    ; <あ>
- - - - - 0x039C84 24:9C74: 00        .byte $00
- D - I - 0x039C85 24:9C75: 01        .byte $01    ; <あ>
- - - - - 0x039C86 24:9C76: 01        .byte $01    ; <あ>
- - - - - 0x039C87 24:9C77: 01        .byte $01    ; <あ>
- D - I - 0x039C88 24:9C78: 03        .byte $03    ; <う>
- - - - - 0x039C89 24:9C79: 00        .byte $00
- D - I - 0x039C8A 24:9C7A: 16        .byte $16    ; <に>
- D - I - 0x039C8B 24:9C7B: 00        .byte $00
- - - - - 0x039C8C 24:9C7C: 00        .byte $00
- - - - - 0x039C8D 24:9C7D: 00        .byte $00
- D - I - 0x039C8E 24:9C7E: 00        .byte $00
- - - - - 0x039C8F 24:9C7F: 00        .byte $00
- - - - - 0x039C90 24:9C80: 00        .byte $00
- - - - - 0x039C91 24:9C81: 00        .byte $00
- - - - - 0x039C92 24:9C82: 00        .byte $00
- - - - - 0x039C93 24:9C83: 00        .byte $00
- - - - - 0x039C94 24:9C84: 00        .byte $00
- - - - - 0x039C95 24:9C85: 00        .byte $00
- D - I - 0x039C96 24:9C86: 5E        .byte $5E    ; <ホ>
- D - I - 0x039C97 24:9C87: 0F        .byte $0F    ; <そ>
- D - I - 0x039C98 24:9C88: 00        .byte $00
- D - I - 0x039C99 24:9C89: 00        .byte $00
- D - I - 0x039C9A 24:9C8A: 01        .byte $01    ; <あ>
- D - I - 0x039C9B 24:9C8B: 03        .byte $03    ; <う>
- D - I - 0x039C9C 24:9C8C: 05        .byte $05    ; <お>
- D - I - 0x039C9D 24:9C8D: 06        .byte $06    ; <か>
- - - - - 0x039C9E 24:9C8E: 02        .byte $02    ; <い>
- - - - - 0x039C9F 24:9C8F: 02        .byte $02    ; <い>
- D - I - 0x039CA0 24:9C90: 00        .byte $00
- - - - - 0x039CA1 24:9C91: 00        .byte $00
- D - I - 0x039CA2 24:9C92: 5F        .byte $5F    ; <マ>
- D - I - 0x039CA3 24:9C93: 00        .byte $00
- D - I - 0x039CA4 24:9C94: 00        .byte $00
- D - I - 0x039CA5 24:9C95: 00        .byte $00
- D - I - 0x039CA6 24:9C96: 10        .byte $10    ; <た>
- D - I - 0x039CA7 24:9C97: 05        .byte $05    ; <お>
- - - - - 0x039CA8 24:9C98: 05        .byte $05    ; <お>
- D - I - 0x039CA9 24:9C99: 06        .byte $06    ; <か>
- D - I - 0x039CAA 24:9C9A: 02        .byte $02    ; <い>
- - - - - 0x039CAB 24:9C9B: 02        .byte $02    ; <い>
- D - I - 0x039CAC 24:9C9C: 01        .byte $01    ; <あ>
- - - - - 0x039CAD 24:9C9D: 00        .byte $00
- D - I - 0x039CAE 24:9C9E: 17        .byte $17    ; <ぬ>
- D - I - 0x039CAF 24:9C9F: 00        .byte $00
- - - - - 0x039CB0 24:9CA0: 00        .byte $00
- - - - - 0x039CB1 24:9CA1: 00        .byte $00
- D - I - 0x039CB2 24:9CA2: 00        .byte $00
- D - I - 0x039CB3 24:9CA3: 00        .byte $00
- - - - - 0x039CB4 24:9CA4: 00        .byte $00
- - - - - 0x039CB5 24:9CA5: 00        .byte $00
- - - - - 0x039CB6 24:9CA6: 00        .byte $00
- - - - - 0x039CB7 24:9CA7: 00        .byte $00
- - - - - 0x039CB8 24:9CA8: 00        .byte $00
- - - - - 0x039CB9 24:9CA9: 00        .byte $00
- D - I - 0x039CBA 24:9CAA: 60        .byte $60    ; <ミ>
- D - I - 0x039CBB 24:9CAB: 13        .byte $13    ; <て>
- D - I - 0x039CBC 24:9CAC: 08        .byte $08    ; <く>
- D - I - 0x039CBD 24:9CAD: 00        .byte $00
- D - I - 0x039CBE 24:9CAE: 00        .byte $00
- - - - - 0x039CBF 24:9CAF: 03        .byte $03    ; <う>
- D - I - 0x039CC0 24:9CB0: 05        .byte $05    ; <お>
- D - I - 0x039CC1 24:9CB1: 00        .byte $00
- - - - - 0x039CC2 24:9CB2: 00        .byte $00
- D - I - 0x039CC3 24:9CB3: 00        .byte $00
- D - I - 0x039CC4 24:9CB4: 00        .byte $00
- - - - - 0x039CC5 24:9CB5: 00        .byte $00
- D - I - 0x039CC6 24:9CB6: 61        .byte $61    ; <ム>
- D - I - 0x039CC7 24:9CB7: 13        .byte $13    ; <て>
- D - I - 0x039CC8 24:9CB8: 00        .byte $00
- D - I - 0x039CC9 24:9CB9: 00        .byte $00
- D - I - 0x039CCA 24:9CBA: 10        .byte $10    ; <た>
- D - I - 0x039CCB 24:9CBB: 03        .byte $03    ; <う>
- - - - - 0x039CCC 24:9CBC: 00        .byte $00
- D - I - 0x039CCD 24:9CBD: 00        .byte $00
- - - - - 0x039CCE 24:9CBE: 00        .byte $00
- - - - - 0x039CCF 24:9CBF: 00        .byte $00
- D - I - 0x039CD0 24:9CC0: 01        .byte $01    ; <あ>
- - - - - 0x039CD1 24:9CC1: 00        .byte $00
- D - I - 0x039CD2 24:9CC2: 18        .byte $18    ; <ね>
- D - I - 0x039CD3 24:9CC3: 00        .byte $00
- - - - - 0x039CD4 24:9CC4: 00        .byte $00
- - - - - 0x039CD5 24:9CC5: 00        .byte $00
- D - I - 0x039CD6 24:9CC6: 00        .byte $00
- D - I - 0x039CD7 24:9CC7: 02        .byte $02    ; <い>
- D - I - 0x039CD8 24:9CC8: 00        .byte $00
- - - - - 0x039CD9 24:9CC9: 00        .byte $00
- - - - - 0x039CDA 24:9CCA: 00        .byte $00
- - - - - 0x039CDB 24:9CCB: 00        .byte $00
- - - - - 0x039CDC 24:9CCC: 00        .byte $00
- - - - - 0x039CDD 24:9CCD: 00        .byte $00
- D - I - 0x039CDE 24:9CCE: 62        .byte $62    ; <メ>
- D - I - 0x039CDF 24:9CCF: 00        .byte $00
- D - I - 0x039CE0 24:9CD0: 00        .byte $00
- D - I - 0x039CE1 24:9CD1: 00        .byte $00
- - - - - 0x039CE2 24:9CD2: 01        .byte $01    ; <あ>
- - - - - 0x039CE3 24:9CD3: 03        .byte $03    ; <う>
- D - I - 0x039CE4 24:9CD4: 00        .byte $00
- D - I - 0x039CE5 24:9CD5: 00        .byte $00
- - - - - 0x039CE6 24:9CD6: 00        .byte $00
- - - - - 0x039CE7 24:9CD7: 00        .byte $00
- D - I - 0x039CE8 24:9CD8: 00        .byte $00
- - - - - 0x039CE9 24:9CD9: 00        .byte $00
- D - I - 0x039CEA 24:9CDA: 63        .byte $63    ; <モ>
- D - I - 0x039CEB 24:9CDB: 00        .byte $00
- D - I - 0x039CEC 24:9CDC: 00        .byte $00
- D - I - 0x039CED 24:9CDD: 00        .byte $00
- D - I - 0x039CEE 24:9CDE: 10        .byte $10    ; <た>
- D - I - 0x039CEF 24:9CDF: 03        .byte $03    ; <う>
- - - - - 0x039CF0 24:9CE0: 00        .byte $00
- D - I - 0x039CF1 24:9CE1: 00        .byte $00
- D - I - 0x039CF2 24:9CE2: 00        .byte $00
- - - - - 0x039CF3 24:9CE3: 00        .byte $00
- D - I - 0x039CF4 24:9CE4: 01        .byte $01    ; <あ>
- - - - - 0x039CF5 24:9CE5: 00        .byte $00
- D - I - 0x039CF6 24:9CE6: 19        .byte $19    ; <の>
- D - I - 0x039CF7 24:9CE7: 00        .byte $00
- - - - - 0x039CF8 24:9CE8: 00        .byte $00
- - - - - 0x039CF9 24:9CE9: 00        .byte $00
- D - I - 0x039CFA 24:9CEA: 00        .byte $00
- D - I - 0x039CFB 24:9CEB: 00        .byte $00
- - - - - 0x039CFC 24:9CEC: 00        .byte $00
- - - - - 0x039CFD 24:9CED: 00        .byte $00
- - - - - 0x039CFE 24:9CEE: 00        .byte $00
- - - - - 0x039CFF 24:9CEF: 00        .byte $00
- - - - - 0x039D00 24:9CF0: 00        .byte $00
- - - - - 0x039D01 24:9CF1: 00        .byte $00
- D - I - 0x039D02 24:9CF2: 64        .byte $64    ; <ヤ>
- D - I - 0x039D03 24:9CF3: 13        .byte $13    ; <て>
- D - I - 0x039D04 24:9CF4: 00        .byte $00
- D - I - 0x039D05 24:9CF5: 00        .byte $00
- D - I - 0x039D06 24:9CF6: 01        .byte $01    ; <あ>
- D - I - 0x039D07 24:9CF7: 03        .byte $03    ; <う>
- D - I - 0x039D08 24:9CF8: 02        .byte $02    ; <い>
- D - I - 0x039D09 24:9CF9: 06        .byte $06    ; <か>
- - - - - 0x039D0A 24:9CFA: 02        .byte $02    ; <い>
- D - I - 0x039D0B 24:9CFB: 02        .byte $02    ; <い>
- D - I - 0x039D0C 24:9CFC: 00        .byte $00
- - - - - 0x039D0D 24:9CFD: 00        .byte $00
- D - I - 0x039D0E 24:9CFE: 65        .byte $65    ; <ユ>
- D - I - 0x039D0F 24:9CFF: 13        .byte $13    ; <て>
- D - I - 0x039D10 24:9D00: 00        .byte $00
- D - I - 0x039D11 24:9D01: 00        .byte $00
- D - I - 0x039D12 24:9D02: 01        .byte $01    ; <あ>
- D - I - 0x039D13 24:9D03: 03        .byte $03    ; <う>
- - - - - 0x039D14 24:9D04: 02        .byte $02    ; <い>
- D - I - 0x039D15 24:9D05: 06        .byte $06    ; <か>
- - - - - 0x039D16 24:9D06: 02        .byte $02    ; <い>
- - - - - 0x039D17 24:9D07: 02        .byte $02    ; <い>
- D - I - 0x039D18 24:9D08: 02        .byte $02    ; <い>
- - - - - 0x039D19 24:9D09: 00        .byte $00
- D - I - 0x039D1A 24:9D0A: 1A        .byte $1A    ; <は>
- D - I - 0x039D1B 24:9D0B: 00        .byte $00
- - - - - 0x039D1C 24:9D0C: 00        .byte $00
- - - - - 0x039D1D 24:9D0D: 00        .byte $00
- D - I - 0x039D1E 24:9D0E: 00        .byte $00
- - - - - 0x039D1F 24:9D0F: 00        .byte $00
- D - I - 0x039D20 24:9D10: 00        .byte $00
- - - - - 0x039D21 24:9D11: 00        .byte $00
- - - - - 0x039D22 24:9D12: 00        .byte $00
- - - - - 0x039D23 24:9D13: 00        .byte $00
- - - - - 0x039D24 24:9D14: 00        .byte $00
- - - - - 0x039D25 24:9D15: 00        .byte $00
- D - I - 0x039D26 24:9D16: 68        .byte $68    ; <リ>
- D - I - 0x039D27 24:9D17: 00        .byte $00
- D - I - 0x039D28 24:9D18: 00        .byte $00
- D - I - 0x039D29 24:9D19: 0D        .byte $0D    ; <す>
- D - I - 0x039D2A 24:9D1A: 00        .byte $00
- D - I - 0x039D2B 24:9D1B: 00        .byte $00
- D - I - 0x039D2C 24:9D1C: 00        .byte $00
- D - I - 0x039D2D 24:9D1D: 00        .byte $00
- D - I - 0x039D2E 24:9D1E: 00        .byte $00
- D - I - 0x039D2F 24:9D1F: 00        .byte $00
- D - I - 0x039D30 24:9D20: 00        .byte $00
- - - - - 0x039D31 24:9D21: 00        .byte $00
- D - I - 0x039D32 24:9D22: 69        .byte $69    ; <ル>
- D - I - 0x039D33 24:9D23: 13        .byte $13    ; <て>
- D - I - 0x039D34 24:9D24: 00        .byte $00
- D - I - 0x039D35 24:9D25: 00        .byte $00
- D - I - 0x039D36 24:9D26: 14        .byte $14    ; <と>
- - - - - 0x039D37 24:9D27: 03        .byte $03    ; <う>
- D - I - 0x039D38 24:9D28: 00        .byte $00
- D - I - 0x039D39 24:9D29: 00        .byte $00
- - - - - 0x039D3A 24:9D2A: 01        .byte $01    ; <あ>
- - - - - 0x039D3B 24:9D2B: 00        .byte $00
- D - I - 0x039D3C 24:9D2C: 16        .byte $16    ; <に>
- - - - - 0x039D3D 24:9D2D: 00        .byte $00
- D - I - 0x039D3E 24:9D2E: 6A        .byte $6A    ; <レ>
- D - I - 0x039D3F 24:9D2F: 13        .byte $13    ; <て>
- D - I - 0x039D40 24:9D30: 00        .byte $00
- D - I - 0x039D41 24:9D31: 00        .byte $00
- D - I - 0x039D42 24:9D32: 14        .byte $14    ; <と>
- D - I - 0x039D43 24:9D33: 03        .byte $03    ; <う>
- D - I - 0x039D44 24:9D34: 00        .byte $00
- D - I - 0x039D45 24:9D35: 00        .byte $00
- - - - - 0x039D46 24:9D36: 01        .byte $01    ; <あ>
- D - I - 0x039D47 24:9D37: 00        .byte $00
- D - I - 0x039D48 24:9D38: 16        .byte $16    ; <に>
- - - - - 0x039D49 24:9D39: 00        .byte $00
- D - I - 0x039D4A 24:9D3A: 1C        .byte $1C    ; <ふ>
- D - I - 0x039D4B 24:9D3B: 00        .byte $00
- - - - - 0x039D4C 24:9D3C: 00        .byte $00
- - - - - 0x039D4D 24:9D3D: 00        .byte $00
- D - I - 0x039D4E 24:9D3E: 00        .byte $00
- D - I - 0x039D4F 24:9D3F: 00        .byte $00
- D - I - 0x039D50 24:9D40: 00        .byte $00
- - - - - 0x039D51 24:9D41: 00        .byte $00
- - - - - 0x039D52 24:9D42: 00        .byte $00
- - - - - 0x039D53 24:9D43: 00        .byte $00
- - - - - 0x039D54 24:9D44: 00        .byte $00
- - - - - 0x039D55 24:9D45: 00        .byte $00
- D - I - 0x039D56 24:9D46: 6C        .byte $6C    ; <ワ>
- D - I - 0x039D57 24:9D47: 00        .byte $00
- D - I - 0x039D58 24:9D48: 00        .byte $00
- D - I - 0x039D59 24:9D49: 00        .byte $00
- D - I - 0x039D5A 24:9D4A: 00        .byte $00
- - - - - 0x039D5B 24:9D4B: 03        .byte $03    ; <う>
- D - I - 0x039D5C 24:9D4C: 00        .byte $00
- D - I - 0x039D5D 24:9D4D: 00        .byte $00
- - - - - 0x039D5E 24:9D4E: 00        .byte $00
- D - I - 0x039D5F 24:9D4F: 00        .byte $00
- D - I - 0x039D60 24:9D50: 01        .byte $01    ; <あ>
- - - - - 0x039D61 24:9D51: 00        .byte $00
- D - I - 0x039D62 24:9D52: 6D        .byte $6D    ; <ヲ>
- D - I - 0x039D63 24:9D53: 00        .byte $00
- D - I - 0x039D64 24:9D54: 00        .byte $00
- D - I - 0x039D65 24:9D55: 00        .byte $00
- D - I - 0x039D66 24:9D56: 00        .byte $00
- D - I - 0x039D67 24:9D57: 03        .byte $03    ; <う>
- D - I - 0x039D68 24:9D58: 00        .byte $00
- D - I - 0x039D69 24:9D59: 00        .byte $00
- D - I - 0x039D6A 24:9D5A: 00        .byte $00
- D - I - 0x039D6B 24:9D5B: 00        .byte $00
- D - I - 0x039D6C 24:9D5C: 17        .byte $17    ; <ぬ>
- - - - - 0x039D6D 24:9D5D: 00        .byte $00
- D - I - 0x039D6E 24:9D5E: 70        .byte $70    ; <ャ>
- D - I - 0x039D6F 24:9D5F: 00        .byte $00
- D - I - 0x039D70 24:9D60: 00        .byte $00
- D - I - 0x039D71 24:9D61: 00        .byte $00
- D - I - 0x039D72 24:9D62: 01        .byte $01    ; <あ>
- - - - - 0x039D73 24:9D63: 03        .byte $03    ; <う>
- D - I - 0x039D74 24:9D64: 00        .byte $00
- D - I - 0x039D75 24:9D65: 00        .byte $00
- - - - - 0x039D76 24:9D66: 02        .byte $02    ; <い>
- - - - - 0x039D77 24:9D67: 02        .byte $02    ; <い>
- D - I - 0x039D78 24:9D68: 01        .byte $01    ; <あ>
- - - - - 0x039D79 24:9D69: 00        .byte $00
- D - I - 0x039D7A 24:9D6A: 71        .byte $71    ; <ュ>
- D - I - 0x039D7B 24:9D6B: 00        .byte $00
- D - I - 0x039D7C 24:9D6C: 00        .byte $00
- D - I - 0x039D7D 24:9D6D: 00        .byte $00
- D - I - 0x039D7E 24:9D6E: 01        .byte $01    ; <あ>
- D - I - 0x039D7F 24:9D6F: 03        .byte $03    ; <う>
- D - I - 0x039D80 24:9D70: 00        .byte $00
- D - I - 0x039D81 24:9D71: 00        .byte $00
- - - - - 0x039D82 24:9D72: 02        .byte $02    ; <い>
- D - I - 0x039D83 24:9D73: 00        .byte $00
- D - I - 0x039D84 24:9D74: 01        .byte $01    ; <あ>
- - - - - 0x039D85 24:9D75: 00        .byte $00
- D - I - 0x039D86 24:9D76: 1E        .byte $1E    ; <ほ>
- - - - - 0x039D87 24:9D77: 00        .byte $00
- - - - - 0x039D88 24:9D78: 00        .byte $00
- - - - - 0x039D89 24:9D79: 00        .byte $00
- D - I - 0x039D8A 24:9D7A: 01        .byte $01    ; <あ>
- D - I - 0x039D8B 24:9D7B: 00        .byte $00
- - - - - 0x039D8C 24:9D7C: 00        .byte $00
- - - - - 0x039D8D 24:9D7D: 00        .byte $00
- - - - - 0x039D8E 24:9D7E: 00        .byte $00
- - - - - 0x039D8F 24:9D7F: 00        .byte $00
- - - - - 0x039D90 24:9D80: 00        .byte $00
- - - - - 0x039D91 24:9D81: 00        .byte $00
- D - I - 0x039D92 24:9D82: 73        .byte $73    ; <ヮ>
- D - I - 0x039D93 24:9D83: 00        .byte $00
- D - I - 0x039D94 24:9D84: 00        .byte $00
- D - I - 0x039D95 24:9D85: 00        .byte $00
- D - I - 0x039D96 24:9D86: 14        .byte $14    ; <と>
- - - - - 0x039D97 24:9D87: 03        .byte $03    ; <う>
- D - I - 0x039D98 24:9D88: 00        .byte $00
- D - I - 0x039D99 24:9D89: 00        .byte $00
- - - - - 0x039D9A 24:9D8A: 00        .byte $00
- D - I - 0x039D9B 24:9D8B: 00        .byte $00
- D - I - 0x039D9C 24:9D8C: 0D        .byte $0D    ; <す>
- - - - - 0x039D9D 24:9D8D: 00        .byte $00
- D - I - 0x039D9E 24:9D8E: 74        .byte $74    ; <ィ>
- D - I - 0x039D9F 24:9D8F: 00        .byte $00
- D - I - 0x039DA0 24:9D90: 00        .byte $00
- D - I - 0x039DA1 24:9D91: 00        .byte $00
- D - I - 0x039DA2 24:9D92: 14        .byte $14    ; <と>
- D - I - 0x039DA3 24:9D93: 03        .byte $03    ; <う>
- - - - - 0x039DA4 24:9D94: 00        .byte $00
- D - I - 0x039DA5 24:9D95: 00        .byte $00
- - - - - 0x039DA6 24:9D96: 00        .byte $00
- - - - - 0x039DA7 24:9D97: 00        .byte $00
- D - I - 0x039DA8 24:9D98: 0D        .byte $0D    ; <す>
- - - - - 0x039DA9 24:9D99: 00        .byte $00
- D - I - 0x039DAA 24:9D9A: 1F        .byte $1F    ; <ま>
- D - I - 0x039DAB 24:9D9B: 00        .byte $00
- - - - - 0x039DAC 24:9D9C: 00        .byte $00
- - - - - 0x039DAD 24:9D9D: 00        .byte $00
- D - I - 0x039DAE 24:9D9E: 01        .byte $01    ; <あ>
- D - I - 0x039DAF 24:9D9F: 02        .byte $02    ; <い>
- D - I - 0x039DB0 24:9DA0: 00        .byte $00
- - - - - 0x039DB1 24:9DA1: 00        .byte $00
- - - - - 0x039DB2 24:9DA2: 00        .byte $00
- - - - - 0x039DB3 24:9DA3: 00        .byte $00
- - - - - 0x039DB4 24:9DA4: 00        .byte $00
- - - - - 0x039DB5 24:9DA5: 00        .byte $00
- D - I - 0x039DB6 24:9DA6: 77        .byte $77    ; <:>
- D - I - 0x039DB7 24:9DA7: 00        .byte $00
- D - I - 0x039DB8 24:9DA8: 08        .byte $08    ; <く>
- D - I - 0x039DB9 24:9DA9: 00        .byte $00
- D - I - 0x039DBA 24:9DAA: 00        .byte $00
- D - I - 0x039DBB 24:9DAB: 03        .byte $03    ; <う>
- D - I - 0x039DBC 24:9DAC: 00        .byte $00
- D - I - 0x039DBD 24:9DAD: 00        .byte $00
- - - - - 0x039DBE 24:9DAE: 01        .byte $01    ; <あ>
- D - I - 0x039DBF 24:9DAF: 00        .byte $00
- D - I - 0x039DC0 24:9DB0: 0B        .byte $0B    ; <さ>
- - - - - 0x039DC1 24:9DB1: 00        .byte $00
- D - I - 0x039DC2 24:9DB2: 78        .byte $78    ; <?>
- D - I - 0x039DC3 24:9DB3: 00        .byte $00
- D - I - 0x039DC4 24:9DB4: 00        .byte $00
- D - I - 0x039DC5 24:9DB5: 00        .byte $00
- D - I - 0x039DC6 24:9DB6: 00        .byte $00
- D - I - 0x039DC7 24:9DB7: 03        .byte $03    ; <う>
- D - I - 0x039DC8 24:9DB8: 00        .byte $00
- D - I - 0x039DC9 24:9DB9: 00        .byte $00
- D - I - 0x039DCA 24:9DBA: 01        .byte $01    ; <あ>
- D - I - 0x039DCB 24:9DBB: 00        .byte $00
- D - I - 0x039DCC 24:9DBC: 0B        .byte $0B    ; <さ>
- - - - - 0x039DCD 24:9DBD: 00        .byte $00
- D - I - 0x039DCE 24:9DBE: 7A        .byte $7A    ; <、>
- D - I - 0x039DCF 24:9DBF: 13        .byte $13    ; <て>
- D - I - 0x039DD0 24:9DC0: 10        .byte $10    ; <た>
- D - I - 0x039DD1 24:9DC1: 00        .byte $00
- - - - - 0x039DD2 24:9DC2: 00        .byte $00
- - - - - 0x039DD3 24:9DC3: 03        .byte $03    ; <う>
- - - - - 0x039DD4 24:9DC4: 00        .byte $00
- D - I - 0x039DD5 24:9DC5: 00        .byte $00
- - - - - 0x039DD6 24:9DC6: 00        .byte $00
- D - I - 0x039DD7 24:9DC7: 00        .byte $00
- - - - - 0x039DD8 24:9DC8: 17        .byte $17    ; <ぬ>
- - - - - 0x039DD9 24:9DC9: 00        .byte $00
- D - I - 0x039DDA 24:9DCA: 7B        .byte $7B    ; <。>
- D - I - 0x039DDB 24:9DCB: 13        .byte $13    ; <て>
- D - I - 0x039DDC 24:9DCC: 00        .byte $00
- D - I - 0x039DDD 24:9DCD: 00        .byte $00
- D - I - 0x039DDE 24:9DCE: 00        .byte $00
- D - I - 0x039DDF 24:9DCF: 03        .byte $03    ; <う>
- D - I - 0x039DE0 24:9DD0: 00        .byte $00
- D - I - 0x039DE1 24:9DD1: 00        .byte $00
- - - - - 0x039DE2 24:9DD2: 00        .byte $00
- D - I - 0x039DE3 24:9DD3: 00        .byte $00
- D - I - 0x039DE4 24:9DD4: 17        .byte $17    ; <ぬ>
- - - - - 0x039DE5 24:9DD5: 00        .byte $00
- D - I - 0x039DE6 24:9DD6: 21        .byte $21    ; <む>
- - - - - 0x039DE7 24:9DD7: 00        .byte $00
- - - - - 0x039DE8 24:9DD8: 00        .byte $00
- - - - - 0x039DE9 24:9DD9: 00        .byte $00
- D - I - 0x039DEA 24:9DDA: 01        .byte $01    ; <あ>
- D - I - 0x039DEB 24:9DDB: 00        .byte $00
- - - - - 0x039DEC 24:9DDC: 00        .byte $00
- - - - - 0x039DED 24:9DDD: 00        .byte $00
- - - - - 0x039DEE 24:9DDE: 00        .byte $00
- - - - - 0x039DEF 24:9DDF: 00        .byte $00
- - - - - 0x039DF0 24:9DE0: 00        .byte $00
- - - - - 0x039DF1 24:9DE1: 00        .byte $00
- D - I - 0x039DF2 24:9DE2: 7D        .byte $7D    ; <ー>
- D - I - 0x039DF3 24:9DE3: 19        .byte $19    ; <の>
- D - I - 0x039DF4 24:9DE4: 08        .byte $08    ; <く>
- D - I - 0x039DF5 24:9DE5: 00        .byte $00
- D - I - 0x039DF6 24:9DE6: 17        .byte $17    ; <ぬ>
- D - I - 0x039DF7 24:9DE7: 05        .byte $05    ; <お>
- D - I - 0x039DF8 24:9DE8: 03        .byte $03    ; <う>
- D - I - 0x039DF9 24:9DE9: 00        .byte $00
- - - - - 0x039DFA 24:9DEA: 00        .byte $00
- D - I - 0x039DFB 24:9DEB: 00        .byte $00
- D - I - 0x039DFC 24:9DEC: 18        .byte $18    ; <ね>
- - - - - 0x039DFD 24:9DED: 00        .byte $00
- D - I - 0x039DFE 24:9DEE: 7E        .byte $7E    ; <.>
- D - I - 0x039DFF 24:9DEF: 19        .byte $19    ; <の>
- D - I - 0x039E00 24:9DF0: 00        .byte $00
- D - I - 0x039E01 24:9DF1: 00        .byte $00
- D - I - 0x039E02 24:9DF2: 17        .byte $17    ; <ぬ>
- D - I - 0x039E03 24:9DF3: 05        .byte $05    ; <お>
- D - I - 0x039E04 24:9DF4: 03        .byte $03    ; <う>
- D - I - 0x039E05 24:9DF5: 00        .byte $00
- - - - - 0x039E06 24:9DF6: 00        .byte $00
- - - - - 0x039E07 24:9DF7: 00        .byte $00
- D - I - 0x039E08 24:9DF8: 18        .byte $18    ; <ね>
- - - - - 0x039E09 24:9DF9: 00        .byte $00
- D - I - 0x039E0A 24:9DFA: 22        .byte $22    ; <め>
- D - I - 0x039E0B 24:9DFB: 00        .byte $00
- - - - - 0x039E0C 24:9DFC: 00        .byte $00
- - - - - 0x039E0D 24:9DFD: 00        .byte $00
- D - I - 0x039E0E 24:9DFE: 01        .byte $01    ; <あ>
- D - I - 0x039E0F 24:9DFF: 00        .byte $00
- - - - - 0x039E10 24:9E00: 00        .byte $00
- - - - - 0x039E11 24:9E01: 00        .byte $00
- - - - - 0x039E12 24:9E02: 00        .byte $00
- - - - - 0x039E13 24:9E03: 00        .byte $00
- - - - - 0x039E14 24:9E04: 00        .byte $00
- - - - - 0x039E15 24:9E05: 00        .byte $00
- D - I - 0x039E16 24:9E06: 81        .byte $81    ; <A>
- D - I - 0x039E17 24:9E07: 00        .byte $00
- D - I - 0x039E18 24:9E08: 00        .byte $00
- D - I - 0x039E19 24:9E09: 00        .byte $00
- D - I - 0x039E1A 24:9E0A: 14        .byte $14    ; <と>
- - - - - 0x039E1B 24:9E0B: 00        .byte $00
- - - - - 0x039E1C 24:9E0C: 00        .byte $00
- D - I - 0x039E1D 24:9E0D: 00        .byte $00
- - - - - 0x039E1E 24:9E0E: 00        .byte $00
- - - - - 0x039E1F 24:9E0F: 00        .byte $00
- D - I - 0x039E20 24:9E10: 19        .byte $19    ; <の>
- - - - - 0x039E21 24:9E11: 00        .byte $00
- D - I - 0x039E22 24:9E12: 87        .byte $87    ; <G>
- D - I - 0x039E23 24:9E13: 00        .byte $00
- D - I - 0x039E24 24:9E14: 00        .byte $00
- D - I - 0x039E25 24:9E15: 00        .byte $00
- D - I - 0x039E26 24:9E16: 00        .byte $00
- - - - - 0x039E27 24:9E17: 00        .byte $00
- D - I - 0x039E28 24:9E18: 00        .byte $00
- D - I - 0x039E29 24:9E19: 00        .byte $00
- - - - - 0x039E2A 24:9E1A: 00        .byte $00
- D - I - 0x039E2B 24:9E1B: 00        .byte $00
- D - I - 0x039E2C 24:9E1C: 00        .byte $00
- - - - - 0x039E2D 24:9E1D: 00        .byte $00
- D - I - 0x039E2E 24:9E1E: 99        .byte $99
- D - I - 0x039E2F 24:9E1F: 16        .byte $16    ; <に>
- D - I - 0x039E30 24:9E20: FF        .byte $FF
- - - - - 0x039E31 24:9E21: 00        .byte $00
- D - I - 0x039E32 24:9E22: 02        .byte $02    ; <い>
- D - I - 0x039E33 24:9E23: 01        .byte $01    ; <あ>
- - - - - 0x039E34 24:9E24: 00        .byte $00
- - - - - 0x039E35 24:9E25: 00        .byte $00
- - - - - 0x039E36 24:9E26: 02        .byte $02    ; <い>
- - - - - 0x039E37 24:9E27: 02        .byte $02    ; <い>
- D - I - 0x039E38 24:9E28: 00        .byte $00
- - - - - 0x039E39 24:9E29: 00        .byte $00
- D - I - 0x039E3A 24:9E2A: 9A        .byte $9A
- D - I - 0x039E3B 24:9E2B: 17        .byte $17    ; <ぬ>
- - - - - 0x039E3C 24:9E2C: 00        .byte $00
- - - - - 0x039E3D 24:9E2D: 00        .byte $00
- D - I - 0x039E3E 24:9E2E: 0A        .byte $0A    ; <こ>
- - - - - 0x039E3F 24:9E2F: 00        .byte $00
- - - - - 0x039E40 24:9E30: 00        .byte $00
- - - - - 0x039E41 24:9E31: 00        .byte $00
- - - - - 0x039E42 24:9E32: 00        .byte $00
- - - - - 0x039E43 24:9E33: 00        .byte $00
- - - - - 0x039E44 24:9E34: 00        .byte $00
- - - - - 0x039E45 24:9E35: 00        .byte $00
- D - I - 0x039E46 24:9E36: 9B        .byte $9B
- D - I - 0x039E47 24:9E37: 18        .byte $18    ; <ね>
- D - I - 0x039E48 24:9E38: 00        .byte $00
- D - I - 0x039E49 24:9E39: FF        .byte $FF
- D - I - 0x039E4A 24:9E3A: 1B        .byte $1B    ; <ひ>
- D - I - 0x039E4B 24:9E3B: 06        .byte $06    ; <か>
- - - - - 0x039E4C 24:9E3C: 00        .byte $00
- D - I - 0x039E4D 24:9E3D: 03        .byte $03    ; <う>
- - - - - 0x039E4E 24:9E3E: 00        .byte $00
- - - - - 0x039E4F 24:9E3F: 00        .byte $00
- D - I - 0x039E50 24:9E40: 24        .byte $24    ; <や>
- - - - - 0x039E51 24:9E41: 00        .byte $00
- D - I - 0x039E52 24:9E42: 9C        .byte $9C
- D - I - 0x039E53 24:9E43: 0A        .byte $0A    ; <こ>
- D - I - 0x039E54 24:9E44: 00        .byte $00
- D - I - 0x039E55 24:9E45: 00        .byte $00
- D - I - 0x039E56 24:9E46: 14        .byte $14    ; <と>
- D - I - 0x039E57 24:9E47: 01        .byte $01    ; <あ>
- - - - - 0x039E58 24:9E48: 00        .byte $00
- D - I - 0x039E59 24:9E49: 00        .byte $00
- - - - - 0x039E5A 24:9E4A: 00        .byte $00
- - - - - 0x039E5B 24:9E4B: 00        .byte $00
- D - I - 0x039E5C 24:9E4C: 0B        .byte $0B    ; <さ>
- - - - - 0x039E5D 24:9E4D: 00        .byte $00



tbl_9E4E:
; таблица параметров игроков исходя из их прокачки
- D - - - 0x039E5E 24:9E4E: 08        .byte $08    ; <く>
- D - - - 0x039E5F 24:9E4F: 08        .byte $08    ; <く>
- D - - - 0x039E60 24:9E50: 08        .byte $08    ; <く>
- D - - - 0x039E61 24:9E51: 09        .byte $09    ; <け>
- D - - - 0x039E62 24:9E52: 09        .byte $09    ; <け>
- D - - - 0x039E63 24:9E53: 09        .byte $09    ; <け>
- D - - - 0x039E64 24:9E54: 09        .byte $09    ; <け>
- D - - - 0x039E65 24:9E55: 0A        .byte $0A    ; <こ>
- D - - - 0x039E66 24:9E56: 0A        .byte $0A    ; <こ>
- D - - - 0x039E67 24:9E57: 0A        .byte $0A    ; <こ>
- D - - - 0x039E68 24:9E58: 0B        .byte $0B    ; <さ>
- D - - - 0x039E69 24:9E59: 0B        .byte $0B    ; <さ>
- D - - - 0x039E6A 24:9E5A: 0B        .byte $0B    ; <さ>
- D - - - 0x039E6B 24:9E5B: 0C        .byte $0C    ; <し>
- D - - - 0x039E6C 24:9E5C: 0C        .byte $0C    ; <し>
- D - - - 0x039E6D 24:9E5D: 0C        .byte $0C    ; <し>
- D - - - 0x039E6E 24:9E5E: 0D        .byte $0D    ; <す>
- D - - - 0x039E6F 24:9E5F: 0D        .byte $0D    ; <す>
- D - - - 0x039E70 24:9E60: 0D        .byte $0D    ; <す>
- D - - - 0x039E71 24:9E61: 0E        .byte $0E    ; <せ>
- D - - - 0x039E72 24:9E62: 0E        .byte $0E    ; <せ>
- D - - - 0x039E73 24:9E63: 0E        .byte $0E    ; <せ>
- D - - - 0x039E74 24:9E64: 0F        .byte $0F    ; <そ>
- D - - - 0x039E75 24:9E65: 0F        .byte $0F    ; <そ>
- D - - - 0x039E76 24:9E66: 10        .byte $10    ; <た>
- D - - - 0x039E77 24:9E67: 10        .byte $10    ; <た>
- D - - - 0x039E78 24:9E68: 11        .byte $11    ; <ち>
- D - - - 0x039E79 24:9E69: 11        .byte $11    ; <ち>
- D - - - 0x039E7A 24:9E6A: 11        .byte $11    ; <ち>
- D - - - 0x039E7B 24:9E6B: 12        .byte $12    ; <つ>
- D - - - 0x039E7C 24:9E6C: 12        .byte $12    ; <つ>
- D - - - 0x039E7D 24:9E6D: 13        .byte $13    ; <て>
- D - - - 0x039E7E 24:9E6E: 14        .byte $14    ; <と>
- D - - - 0x039E7F 24:9E6F: 14        .byte $14    ; <と>
- D - - - 0x039E80 24:9E70: 15        .byte $15    ; <な>
- D - - - 0x039E81 24:9E71: 15        .byte $15    ; <な>
- D - - - 0x039E82 24:9E72: 16        .byte $16    ; <に>
- D - - - 0x039E83 24:9E73: 16        .byte $16    ; <に>
- D - - - 0x039E84 24:9E74: 17        .byte $17    ; <ぬ>
- D - - - 0x039E85 24:9E75: 18        .byte $18    ; <ね>
- D - - - 0x039E86 24:9E76: 18        .byte $18    ; <ね>
- D - - - 0x039E87 24:9E77: 19        .byte $19    ; <の>
- D - - - 0x039E88 24:9E78: 1A        .byte $1A    ; <は>
- D - - - 0x039E89 24:9E79: 1A        .byte $1A    ; <は>
- D - - - 0x039E8A 24:9E7A: 1B        .byte $1B    ; <ひ>
- D - - - 0x039E8B 24:9E7B: 1C        .byte $1C    ; <ふ>
- D - - - 0x039E8C 24:9E7C: 1D        .byte $1D    ; <へ>
- D - - - 0x039E8D 24:9E7D: 1D        .byte $1D    ; <へ>
- D - - - 0x039E8E 24:9E7E: 1E        .byte $1E    ; <ほ>
- D - - - 0x039E8F 24:9E7F: 1F        .byte $1F    ; <ま>
- D - - - 0x039E90 24:9E80: 20        .byte $20    ; <み>
- D - - - 0x039E91 24:9E81: 21        .byte $21    ; <む>
- D - - - 0x039E92 24:9E82: 22        .byte $22    ; <め>
- D - - - 0x039E93 24:9E83: 23        .byte $23    ; <も>
- D - - - 0x039E94 24:9E84: 24        .byte $24    ; <や>
- D - - - 0x039E95 24:9E85: 25        .byte $25    ; <ゆ>
- D - - - 0x039E96 24:9E86: 26        .byte $26    ; <よ>
- D - - - 0x039E97 24:9E87: 27        .byte $27    ; <ら>
- D - - - 0x039E98 24:9E88: 28        .byte $28    ; <り>
- D - - - 0x039E99 24:9E89: 29        .byte $29    ; <る>
- D - - - 0x039E9A 24:9E8A: 2A        .byte $2A    ; <れ>
- D - - - 0x039E9B 24:9E8B: 2B        .byte $2B    ; <ろ>
- D - - - 0x039E9C 24:9E8C: 2C        .byte $2C    ; <わ>
- D - - - 0x039E9D 24:9E8D: 2D        .byte $2D    ; <を>
- D - - - 0x039E9E 24:9E8E: 2F        .byte $2F    ; <っ>
- D - - - 0x039E9F 24:9E8F: 30        .byte $30    ; <ゃ>
- D - - - 0x039EA0 24:9E90: 31        .byte $31    ; <ゅ>
- D - - - 0x039EA1 24:9E91: 33        .byte $33    ; <0>
- D - - - 0x039EA2 24:9E92: 34        .byte $34    ; <1>
- D - - - 0x039EA3 24:9E93: 35        .byte $35    ; <2>
- D - - - 0x039EA4 24:9E94: 37        .byte $37    ; <4>
- D - - - 0x039EA5 24:9E95: 38        .byte $38    ; <5>
- D - - - 0x039EA6 24:9E96: 3A        .byte $3A    ; <7>
- D - - - 0x039EA7 24:9E97: 3B        .byte $3B    ; <8>
- D - - - 0x039EA8 24:9E98: 3D        .byte $3D    ; <+>
- D - - - 0x039EA9 24:9E99: 3F        .byte $3F    ; <•>
- D - - - 0x039EAA 24:9E9A: 41        .byte $41    ; <ア>
- D - - - 0x039EAB 24:9E9B: 42        .byte $42    ; <イ>
- D - - - 0x039EAC 24:9E9C: 44        .byte $44    ; <エ>
- D - - - 0x039EAD 24:9E9D: 46        .byte $46    ; <カ>
- D - - - 0x039EAE 24:9E9E: 48        .byte $48    ; <ク>
- D - - - 0x039EAF 24:9E9F: 4A        .byte $4A    ; <コ>
- D - - - 0x039EB0 24:9EA0: 4C        .byte $4C    ; <シ>
- D - - - 0x039EB1 24:9EA1: 4E        .byte $4E    ; <セ>
- D - - - 0x039EB2 24:9EA2: 50        .byte $50    ; <タ>
- D - - - 0x039EB3 24:9EA3: 52        .byte $52    ; <ツ>
- D - - - 0x039EB4 24:9EA4: 54        .byte $54    ; <ト>
- D - - - 0x039EB5 24:9EA5: 57        .byte $57    ; <ヌ>
- D - - - 0x039EB6 24:9EA6: 59        .byte $59    ; <ノ>
- D - - - 0x039EB7 24:9EA7: 5C        .byte $5C    ; <フ>
- D - - - 0x039EB8 24:9EA8: 5E        .byte $5E    ; <ホ>
- D - - - 0x039EB9 24:9EA9: 61        .byte $61    ; <ム>
- D - - - 0x039EBA 24:9EAA: 63        .byte $63    ; <モ>
- D - - - 0x039EBB 24:9EAB: 66        .byte $66    ; <ヨ>
- D - - - 0x039EBC 24:9EAC: 69        .byte $69    ; <ル>
- D - - - 0x039EBD 24:9EAD: 6C        .byte $6C    ; <ワ>
- D - - - 0x039EBE 24:9EAE: 6F        .byte $6F    ; <ッ>
- D - - - 0x039EBF 24:9EAF: 72        .byte $72    ; <ョ>
- D - - - 0x039EC0 24:9EB0: 75        .byte $75    ; <ェ>
- D - - - 0x039EC1 24:9EB1: 78        .byte $78    ; <?>
- D - - - 0x039EC2 24:9EB2: 7B        .byte $7B    ; <。>
- D - - - 0x039EC3 24:9EB3: 7E        .byte $7E    ; <.>
- D - - - 0x039EC4 24:9EB4: 82        .byte $82    ; <B>
- D - - - 0x039EC5 24:9EB5: 85        .byte $85    ; <E>
- D - - - 0x039EC6 24:9EB6: 89        .byte $89    ; <I>
- D - - - 0x039EC7 24:9EB7: 8D        .byte $8D    ; <P>
- D - - - 0x039EC8 24:9EB8: 91        .byte $91    ; <V>
- D - - - 0x039EC9 24:9EB9: 95        .byte $95
- D - - - 0x039ECA 24:9EBA: 99        .byte $99
- D - - - 0x039ECB 24:9EBB: 9D        .byte $9D
- D - - - 0x039ECC 24:9EBC: A1        .byte $A1    ; <ぎ>
- D - - - 0x039ECD 24:9EBD: A5        .byte $A5    ; <ざ>
- D - - - 0x039ECE 24:9EBE: AA        .byte $AA    ; <だ>
- D - - - 0x039ECF 24:9EBF: AF        .byte $AF    ; <ば>
- D - - - 0x039ED0 24:9EC0: B3        .byte $B3    ; <ぼ>
- - - - - 0x039ED1 24:9EC1: B7        .byte $B7    ; <ゲ>
- D - - - 0x039ED2 24:9EC2: BA        .byte $BA    ; <ジ>
- - - - - 0x039ED3 24:9EC3: BD        .byte $BD    ; <ゾ>
- - - - - 0x039ED4 24:9EC4: C0        .byte $C0    ; <ヅ>
- D - - - 0x039ED5 24:9EC5: C3        .byte $C3    ; <バ>
- - - - - 0x039ED6 24:9EC6: C6        .byte $C6    ; <ベ>
- - - - - 0x039ED7 24:9EC7: C9        .byte $C9    ; <ぴ>
- D - - - 0x039ED8 24:9EC8: CC        .byte $CC    ; <ぽ>
- - - - - 0x039ED9 24:9EC9: CE        .byte $CE    ; <ピ>
- - - - - 0x039EDA 24:9ECA: D1        .byte $D1    ; <ポ>
- - - - - 0x039EDB 24:9ECB: D3        .byte $D3
- - - - - 0x039EDC 24:9ECC: D5        .byte $D5
- - - - - 0x039EDD 24:9ECD: D7        .byte $D7
- D - - - 0x039EDE 24:9ECE: D9        .byte $D9
- - - - - 0x039EDF 24:9ECF: DA        .byte $DA
- - - - - 0x039EE0 24:9ED0: DC        .byte $DC
- - - - - 0x039EE1 24:9ED1: DD        .byte $DD
- - - - - 0x039EE2 24:9ED2: DE        .byte $DE
- - - - - 0x039EE3 24:9ED3: E0        .byte $E0
- - - - - 0x039EE4 24:9ED4: E1        .byte $E1
- - - - - 0x039EE5 24:9ED5: E2        .byte $E2
- - - - - 0x039EE6 24:9ED6: E3        .byte $E3
- - - - - 0x039EE7 24:9ED7: E4        .byte $E4
- - - - - 0x039EE8 24:9ED8: E5        .byte $E5
- - - - - 0x039EE9 24:9ED9: E6        .byte $E6
- - - - - 0x039EEA 24:9EDA: E7        .byte $E7
- D - - - 0x039EEB 24:9EDB: E8        .byte $E8
- - - - - 0x039EEC 24:9EDC: E8        .byte $E8
- D - - - 0x039EED 24:9EDD: E9        .byte $E9
- D - - - 0x039EEE 24:9EDE: EA        .byte $EA
- - - - - 0x039EEF 24:9EDF: EB        .byte $EB
- - - - - 0x039EF0 24:9EE0: EB        .byte $EB
- - - - - 0x039EF1 24:9EE1: EC        .byte $EC
- - - - - 0x039EF2 24:9EE2: ED        .byte $ED
- - - - - 0x039EF3 24:9EE3: ED        .byte $ED
- - - - - 0x039EF4 24:9EE4: EE        .byte $EE
- - - - - 0x039EF5 24:9EE5: EE        .byte $EE
- - - - - 0x039EF6 24:9EE6: EF        .byte $EF
- - - - - 0x039EF7 24:9EE7: F0        .byte $F0
- D - - - 0x039EF8 24:9EE8: F0        .byte $F0
- - - - - 0x039EF9 24:9EE9: F1        .byte $F1
- - - - - 0x039EFA 24:9EEA: F1        .byte $F1
- - - - - 0x039EFB 24:9EEB: F2        .byte $F2
- - - - - 0x039EFC 24:9EEC: F3        .byte $F3
- - - - - 0x039EFD 24:9EED: F3        .byte $F3
- D - - - 0x039EFE 24:9EEE: F4        .byte $F4
- - - - - 0x039EFF 24:9EEF: F4        .byte $F4
- - - - - 0x039F00 24:9EF0: F5        .byte $F5
- - - - - 0x039F01 24:9EF1: F5        .byte $F5
- - - - - 0x039F02 24:9EF2: F6        .byte $F6
- - - - - 0x039F03 24:9EF3: F6        .byte $F6
- - - - - 0x039F04 24:9EF4: F7        .byte $F7
- - - - - 0x039F05 24:9EF5: F7        .byte $F7
- - - - - 0x039F06 24:9EF6: F8        .byte $F8
- - - - - 0x039F07 24:9EF7: F8        .byte $F8
- - - - - 0x039F08 24:9EF8: F8        .byte $F8
- - - - - 0x039F09 24:9EF9: F9        .byte $F9
- - - - - 0x039F0A 24:9EFA: F9        .byte $F9
- - - - - 0x039F0B 24:9EFB: FA        .byte $FA
- - - - - 0x039F0C 24:9EFC: FA        .byte $FA
- - - - - 0x039F0D 24:9EFD: FA        .byte $FA
- - - - - 0x039F0E 24:9EFE: FB        .byte $FB
- - - - - 0x039F0F 24:9EFF: FB        .byte $FB
- - - - - 0x039F10 24:9F00: FB        .byte $FB
- - - - - 0x039F11 24:9F01: FC        .byte $FC
- - - - - 0x039F12 24:9F02: FC        .byte $FC
- - - - - 0x039F13 24:9F03: FC        .byte $FC
- - - - - 0x039F14 24:9F04: FD        .byte $FD
- - - - - 0x039F15 24:9F05: FD        .byte $FD
- - - - - 0x039F16 24:9F06: FD        .byte $FD
- - - - - 0x039F17 24:9F07: FD        .byte $FD
- - - - - 0x039F18 24:9F08: FD        .byte $FD
- - - - - 0x039F19 24:9F09: FE        .byte $FE
- - - - - 0x039F1A 24:9F0A: FE        .byte $FE
- - - - - 0x039F1B 24:9F0B: FE        .byte $FE
- - - - - 0x039F1C 24:9F0C: FE        .byte $FE
- - - - - 0x039F1D 24:9F0D: FF        .byte $FF



; это что-то типа скорости прокачки игроков, возможно просто скорость движения
tbl_9F0E:
- D - I - 0x039F1E 24:9F0E: 90 01     .word $0190
- D - I - 0x039F20 24:9F10: 98 01     .word $0198
- D - I - 0x039F22 24:9F12: A0 01     .word $01A0
- D - I - 0x039F24 24:9F14: A8 01     .word $01A8
- D - I - 0x039F26 24:9F16: B0 01     .word $01B0
- D - I - 0x039F28 24:9F18: B8 01     .word $01B8
- D - I - 0x039F2A 24:9F1A: C0 01     .word $01C0
- D - I - 0x039F2C 24:9F1C: C8 01     .word $01C8
- D - I - 0x039F2E 24:9F1E: D0 01     .word $01D0
- D - I - 0x039F30 24:9F20: E2 01     .word $01E2
- D - I - 0x039F32 24:9F22: EA 01     .word $01EA
- D - I - 0x039F34 24:9F24: F2 01     .word $01F2
- D - I - 0x039F36 24:9F26: FA 01     .word $01FA
- D - I - 0x039F38 24:9F28: 02 02     .word $0202
- D - I - 0x039F3A 24:9F2A: 0A 02     .word $020A
- D - I - 0x039F3C 24:9F2C: 12 02     .word $0212
- D - I - 0x039F3E 24:9F2E: 1A 02     .word $021A
- D - I - 0x039F40 24:9F30: 22 02     .word $0222
- D - I - 0x039F42 24:9F32: 2A 02     .word $022A
- D - I - 0x039F44 24:9F34: 32 02     .word $0232
- D - I - 0x039F46 24:9F36: 3A 02     .word $023A
- - - - - 0x039F48 24:9F38: 42 02     .word $0242
- - - - - 0x039F4A 24:9F3A: 4A 02     .word $024A
- D - I - 0x039F4C 24:9F3C: 52 02     .word $0252
- D - I - 0x039F4E 24:9F3E: 5A 02     .word $025A
- D - I - 0x039F50 24:9F40: 62 02     .word $0262
- D - I - 0x039F52 24:9F42: 6A 02     .word $026A
- - - - - 0x039F54 24:9F44: 72 02     .word $0272
- D - I - 0x039F56 24:9F46: 7A 02     .word $027A
- D - I - 0x039F58 24:9F48: 82 02     .word $0282
- D - I - 0x039F5A 24:9F4A: 8A 02     .word $028A
- D - I - 0x039F5C 24:9F4C: 92 02     .word $0292
- D - I - 0x039F5E 24:9F4E: 98 02     .word $0298
- D - I - 0x039F60 24:9F50: 9E 02     .word $029E
- D - I - 0x039F62 24:9F52: A4 02     .word $02A4
- D - I - 0x039F64 24:9F54: AA 02     .word $02AA
- D - I - 0x039F66 24:9F56: B0 02     .word $02B0
- D - I - 0x039F68 24:9F58: B6 02     .word $02B6
- D - I - 0x039F6A 24:9F5A: BC 02     .word $02BC
- D - I - 0x039F6C 24:9F5C: C2 02     .word $02C2
- D - I - 0x039F6E 24:9F5E: C8 02     .word $02C8
- D - I - 0x039F70 24:9F60: CE 02     .word $02CE
- D - I - 0x039F72 24:9F62: D4 02     .word $02D4
- D - I - 0x039F74 24:9F64: DA 02     .word $02DA
- D - I - 0x039F76 24:9F66: E0 02     .word $02E0
- D - I - 0x039F78 24:9F68: E6 02     .word $02E6
- D - I - 0x039F7A 24:9F6A: EC 02     .word $02EC
- D - I - 0x039F7C 24:9F6C: F0 02     .word $02F0
- D - I - 0x039F7E 24:9F6E: F6 02     .word $02F6
- D - I - 0x039F80 24:9F70: FC 02     .word $02FC
- D - I - 0x039F82 24:9F72: 02 03     .word $0302
- D - I - 0x039F84 24:9F74: 08 03     .word $0308
- D - I - 0x039F86 24:9F76: 0E 03     .word $030E
- D - I - 0x039F88 24:9F78: 14 03     .word $0314
- D - I - 0x039F8A 24:9F7A: 1A 03     .word $031A
- D - I - 0x039F8C 24:9F7C: 20 03     .word $0320
- D - I - 0x039F8E 24:9F7E: 26 03     .word $0326
- D - I - 0x039F90 24:9F80: 2C 03     .word $032C
- D - I - 0x039F92 24:9F82: 32 03     .word $0332
- D - I - 0x039F94 24:9F84: 38 03     .word $0338
- D - I - 0x039F96 24:9F86: 3E 03     .word $033E
- D - I - 0x039F98 24:9F88: 44 03     .word $0344
- D - I - 0x039F9A 24:9F8A: 4A 03     .word $034A
- D - I - 0x039F9C 24:9F8C: 50 03     .word $0350
- D - I - 0x039F9E 24:9F8E: 54 03     .word $0354
- D - I - 0x039FA0 24:9F90: 58 03     .word $0358
- D - I - 0x039FA2 24:9F92: 5C 03     .word $035C
- D - I - 0x039FA4 24:9F94: 60 03     .word $0360
- - - - - 0x039FA6 24:9F96: 64 03     .word $0364
- - - - - 0x039FA8 24:9F98: 68 03     .word $0368
- - - - - 0x039FAA 24:9F9A: 6C 03     .word $036C
- - - - - 0x039FAC 24:9F9C: 70 03     .word $0370
- - - - - 0x039FAE 24:9F9E: 74 03     .word $0374
- - - - - 0x039FB0 24:9FA0: 78 03     .word $0378
- - - - - 0x039FB2 24:9FA2: 7C 03     .word $037C
- - - - - 0x039FB4 24:9FA4: 80 03     .word $0380
- - - - - 0x039FB6 24:9FA6: 84 03     .word $0384
- - - - - 0x039FB8 24:9FA8: 88 03     .word $0388
- - - - - 0x039FBA 24:9FAA: 8C 03     .word $038C
- - - - - 0x039FBC 24:9FAC: 90 03     .word $0390
- - - - - 0x039FBE 24:9FAE: 94 03     .word $0394
- - - - - 0x039FC0 24:9FB0: 98 03     .word $0398
- - - - - 0x039FC2 24:9FB2: 9C 03     .word $039C
- - - - - 0x039FC4 24:9FB4: A0 03     .word $03A0
- - - - - 0x039FC6 24:9FB6: A4 03     .word $03A4
- - - - - 0x039FC8 24:9FB8: A8 03     .word $03A8
- - - - - 0x039FCA 24:9FBA: AC 03     .word $03AC
- - - - - 0x039FCC 24:9FBC: B0 03     .word $03B0
- - - - - 0x039FCE 24:9FBE: B4 03     .word $03B4
- - - - - 0x039FD0 24:9FC0: B8 03     .word $03B8
- - - - - 0x039FD2 24:9FC2: BC 03     .word $03BC
- - - - - 0x039FD4 24:9FC4: C0 03     .word $03C0
- - - - - 0x039FD6 24:9FC6: C4 03     .word $03C4
- - - - - 0x039FD8 24:9FC8: C8 03     .word $03C8
- - - - - 0x039FDA 24:9FCA: CC 03     .word $03CC
- - - - - 0x039FDC 24:9FCC: D0 03     .word $03D0



tbl_9FCE:
- D - I - 0x039FDE 24:9FCE: 00        .byte $00
- D - I - 0x039FDF 24:9FCF: 00        .byte $00
- D - I - 0x039FE0 24:9FD0: 00        .byte $00
- D - I - 0x039FE1 24:9FD1: 00        .byte $00
- D - I - 0x039FE2 24:9FD2: 00        .byte $00
- D - I - 0x039FE3 24:9FD3: 00        .byte $00
- D - I - 0x039FE4 24:9FD4: 00        .byte $00
- D - I - 0x039FE5 24:9FD5: 00        .byte $00
- D - I - 0x039FE6 24:9FD6: 00        .byte $00
- D - I - 0x039FE7 24:9FD7: 00        .byte $00
- D - I - 0x039FE8 24:9FD8: 00        .byte $00
- D - I - 0x039FE9 24:9FD9: 00        .byte $00
- D - I - 0x039FEA 24:9FDA: 00        .byte $00
- D - I - 0x039FEB 24:9FDB: 00        .byte $00
- D - I - 0x039FEC 24:9FDC: 00        .byte $00
- D - I - 0x039FED 24:9FDD: 00        .byte $00
- D - I - 0x039FEE 24:9FDE: 00        .byte $00
- D - I - 0x039FEF 24:9FDF: 00        .byte $00
- D - I - 0x039FF0 24:9FE0: 00        .byte $00
- D - I - 0x039FF1 24:9FE1: 00        .byte $00
- D - I - 0x039FF2 24:9FE2: 00        .byte $00
- D - I - 0x039FF3 24:9FE3: 00        .byte $00
- D - I - 0x039FF4 24:9FE4: 00        .byte $00
- - - - - 0x039FF5 24:9FE5: 00        .byte $00
- D - I - 0x039FF6 24:9FE6: 2E        .byte $2E    ; <ん>
- D - I - 0x039FF7 24:9FE7: 0F        .byte $0F    ; <そ>
- D - I - 0x039FF8 24:9FE8: 15        .byte $15    ; <な>
- D - I - 0x039FF9 24:9FE9: 18        .byte $18    ; <ね>
- D - I - 0x039FFA 24:9FEA: 0C        .byte $0C    ; <し>
- D - I - 0x039FFB 24:9FEB: 0F        .byte $0F    ; <そ>
- D - I - 0x039FFC 24:9FEC: 0F        .byte $0F    ; <そ>
- D - I - 0x039FFD 24:9FED: 12        .byte $12    ; <つ>
- D - I - 0x039FFE 24:9FEE: 15        .byte $15    ; <な>
- D - I - 0x039FFF 24:9FEF: 0C        .byte $0C    ; <し>
- D - I - 0x03A000 24:9FF0: 17        .byte $17    ; <ぬ>
- - - - - 0x03A001 24:9FF1: 0E        .byte $0E    ; <せ>
- D - I - 0x03A002 24:9FF2: 0C        .byte $0C    ; <し>
- D - I - 0x03A003 24:9FF3: 10        .byte $10    ; <た>
- D - I - 0x03A004 24:9FF4: 0E        .byte $0E    ; <せ>
- D - I - 0x03A005 24:9FF5: 12        .byte $12    ; <つ>
- D - I - 0x03A006 24:9FF6: 15        .byte $15    ; <な>
- D - I - 0x03A007 24:9FF7: 0C        .byte $0C    ; <し>
- D - I - 0x03A008 24:9FF8: 17        .byte $17    ; <ぬ>
- D - I - 0x03A009 24:9FF9: 0E        .byte $0E    ; <せ>
- D - I - 0x03A00A 24:9FFA: 0C        .byte $0C    ; <し>
- D - I - 0x03A00B 24:9FFB: 10        .byte $10    ; <た>
- D - I - 0x03A00C 24:9FFC: 0E        .byte $0E    ; <せ>
- - - - - 0x03A00D 24:9FFD: 00        .byte $00
- D - I - 0x03A00E 24:9FFE: 20        .byte $20    ; <み>
- D - I - 0x03A00F 24:9FFF: 0E        .byte $0E    ; <せ>
- D - - - 0x03A010 24:A000: 15        .byte $15    ; <な>
- D - I - 0x03A011 24:A001: 18        .byte $18    ; <ね>
- D - I - 0x03A012 24:A002: 09        .byte $09    ; <け>
- D - I - 0x03A013 24:A003: 0F        .byte $0F    ; <そ>
- D - I - 0x03A014 24:A004: 0F        .byte $0F    ; <そ>
- D - I - 0x03A015 24:A005: 11        .byte $11    ; <ち>
- D - I - 0x03A016 24:A006: 15        .byte $15    ; <な>
- D - I - 0x03A017 24:A007: 0C        .byte $0C    ; <し>
- D - I - 0x03A018 24:A008: 17        .byte $17    ; <ぬ>
- D - I - 0x03A019 24:A009: 0C        .byte $0C    ; <し>
- D - I - 0x03A01A 24:A00A: 0B        .byte $0B    ; <さ>
- D - I - 0x03A01B 24:A00B: 0F        .byte $0F    ; <そ>
- D - I - 0x03A01C 24:A00C: 0E        .byte $0E    ; <せ>
- D - I - 0x03A01D 24:A00D: 11        .byte $11    ; <ち>
- D - I - 0x03A01E 24:A00E: 15        .byte $15    ; <な>
- D - I - 0x03A01F 24:A00F: 0C        .byte $0C    ; <し>
- D - I - 0x03A020 24:A010: 17        .byte $17    ; <ぬ>
- D - I - 0x03A021 24:A011: 0C        .byte $0C    ; <し>
- D - I - 0x03A022 24:A012: 0B        .byte $0B    ; <さ>
- D - I - 0x03A023 24:A013: 0F        .byte $0F    ; <そ>
- D - I - 0x03A024 24:A014: 0E        .byte $0E    ; <せ>
- - - - - 0x03A025 24:A015: 00        .byte $00
- D - I - 0x03A026 24:A016: 1F        .byte $1F    ; <ま>
- D - I - 0x03A027 24:A017: 09        .byte $09    ; <け>
- D - I - 0x03A028 24:A018: 01        .byte $01    ; <あ>
- D - I - 0x03A029 24:A019: 05        .byte $05    ; <お>
- D - I - 0x03A02A 24:A01A: 01        .byte $01    ; <あ>
- D - I - 0x03A02B 24:A01B: 01        .byte $01    ; <あ>
- D - I - 0x03A02C 24:A01C: 01        .byte $01    ; <あ>
- D - I - 0x03A02D 24:A01D: 0C        .byte $0C    ; <し>
- D - I - 0x03A02E 24:A01E: 01        .byte $01    ; <あ>
- D - I - 0x03A02F 24:A01F: 02        .byte $02    ; <い>
- D - I - 0x03A030 24:A020: 07        .byte $07    ; <き>
- - - - - 0x03A031 24:A021: 02        .byte $02    ; <い>
- D - I - 0x03A032 24:A022: 01        .byte $01    ; <あ>
- D - I - 0x03A033 24:A023: 04        .byte $04    ; <え>
- D - I - 0x03A034 24:A024: 01        .byte $01    ; <あ>
- D - I - 0x03A035 24:A025: 0C        .byte $0C    ; <し>
- D - I - 0x03A036 24:A026: 01        .byte $01    ; <あ>
- D - I - 0x03A037 24:A027: 02        .byte $02    ; <い>
- D - I - 0x03A038 24:A028: 07        .byte $07    ; <き>
- - - - - 0x03A039 24:A029: 02        .byte $02    ; <い>
- D - I - 0x03A03A 24:A02A: 01        .byte $01    ; <あ>
- D - I - 0x03A03B 24:A02B: 04        .byte $04    ; <え>
- - - - - 0x03A03C 24:A02C: 01        .byte $01    ; <あ>
- - - - - 0x03A03D 24:A02D: 00        .byte $00
- D - I - 0x03A03E 24:A02E: 02        .byte $02    ; <い>
- D - I - 0x03A03F 24:A02F: 05        .byte $05    ; <お>
- D - I - 0x03A040 24:A030: 00        .byte $00
- D - I - 0x03A041 24:A031: 01        .byte $01    ; <あ>
- D - I - 0x03A042 24:A032: 00        .byte $00
- D - I - 0x03A043 24:A033: 01        .byte $01    ; <あ>
- D - I - 0x03A044 24:A034: 00        .byte $00
- D - I - 0x03A045 24:A035: 08        .byte $08    ; <く>
- D - I - 0x03A046 24:A036: 00        .byte $00
- D - I - 0x03A047 24:A037: 00        .byte $00
- D - I - 0x03A048 24:A038: 03        .byte $03    ; <う>
- D - I - 0x03A049 24:A039: 02        .byte $02    ; <い>
- D - I - 0x03A04A 24:A03A: 01        .byte $01    ; <あ>
- D - I - 0x03A04B 24:A03B: 04        .byte $04    ; <え>
- D - I - 0x03A04C 24:A03C: 01        .byte $01    ; <あ>
- D - I - 0x03A04D 24:A03D: 08        .byte $08    ; <く>
- D - I - 0x03A04E 24:A03E: 00        .byte $00
- D - I - 0x03A04F 24:A03F: 00        .byte $00
- D - I - 0x03A050 24:A040: 03        .byte $03    ; <う>
- - - - - 0x03A051 24:A041: 02        .byte $02    ; <い>
- D - I - 0x03A052 24:A042: 01        .byte $01    ; <あ>
- D - I - 0x03A053 24:A043: 04        .byte $04    ; <え>
- D - I - 0x03A054 24:A044: 01        .byte $01    ; <あ>
- - - - - 0x03A055 24:A045: 00        .byte $00
- D - I - 0x03A056 24:A046: 01        .byte $01    ; <あ>
- D - I - 0x03A057 24:A047: 02        .byte $02    ; <い>
- D - I - 0x03A058 24:A048: 05        .byte $05    ; <お>
- D - I - 0x03A059 24:A049: 06        .byte $06    ; <か>
- D - I - 0x03A05A 24:A04A: 00        .byte $00
- D - I - 0x03A05B 24:A04B: 00        .byte $00
- D - I - 0x03A05C 24:A04C: 01        .byte $01    ; <あ>
- D - I - 0x03A05D 24:A04D: 05        .byte $05    ; <お>
- D - I - 0x03A05E 24:A04E: 05        .byte $05    ; <お>
- D - I - 0x03A05F 24:A04F: 04        .byte $04    ; <え>
- D - I - 0x03A060 24:A050: 08        .byte $08    ; <く>
- D - I - 0x03A061 24:A051: 02        .byte $02    ; <い>
- D - I - 0x03A062 24:A052: 01        .byte $01    ; <あ>
- D - I - 0x03A063 24:A053: 04        .byte $04    ; <え>
- D - I - 0x03A064 24:A054: 01        .byte $01    ; <あ>
- D - I - 0x03A065 24:A055: 05        .byte $05    ; <お>
- D - I - 0x03A066 24:A056: 05        .byte $05    ; <お>
- D - I - 0x03A067 24:A057: 04        .byte $04    ; <え>
- D - I - 0x03A068 24:A058: 08        .byte $08    ; <く>
- D - I - 0x03A069 24:A059: 02        .byte $02    ; <い>
- D - I - 0x03A06A 24:A05A: 01        .byte $01    ; <あ>
- D - I - 0x03A06B 24:A05B: 04        .byte $04    ; <え>
- D - I - 0x03A06C 24:A05C: 01        .byte $01    ; <あ>
- - - - - 0x03A06D 24:A05D: 00        .byte $00
- D - I - 0x03A06E 24:A05E: 00        .byte $00
- D - I - 0x03A06F 24:A05F: 01        .byte $01    ; <あ>
- D - I - 0x03A070 24:A060: 02        .byte $02    ; <い>
- D - I - 0x03A071 24:A061: 03        .byte $03    ; <う>
- D - I - 0x03A072 24:A062: 00        .byte $00
- D - I - 0x03A073 24:A063: 01        .byte $01    ; <あ>
- D - I - 0x03A074 24:A064: 00        .byte $00
- D - I - 0x03A075 24:A065: 03        .byte $03    ; <う>
- D - I - 0x03A076 24:A066: 02        .byte $02    ; <い>
- D - I - 0x03A077 24:A067: 01        .byte $01    ; <あ>
- D - I - 0x03A078 24:A068: 06        .byte $06    ; <か>
- - - - - 0x03A079 24:A069: 02        .byte $02    ; <い>
- D - I - 0x03A07A 24:A06A: 01        .byte $01    ; <あ>
- D - I - 0x03A07B 24:A06B: 04        .byte $04    ; <え>
- D - I - 0x03A07C 24:A06C: 01        .byte $01    ; <あ>
- D - I - 0x03A07D 24:A06D: 03        .byte $03    ; <う>
- D - I - 0x03A07E 24:A06E: 02        .byte $02    ; <い>
- D - I - 0x03A07F 24:A06F: 01        .byte $01    ; <あ>
- D - I - 0x03A080 24:A070: 06        .byte $06    ; <か>
- D - I - 0x03A081 24:A071: 02        .byte $02    ; <い>
- D - I - 0x03A082 24:A072: 01        .byte $01    ; <あ>
- D - I - 0x03A083 24:A073: 04        .byte $04    ; <え>
- D - I - 0x03A084 24:A074: 01        .byte $01    ; <あ>
- - - - - 0x03A085 24:A075: 00        .byte $00
- D - I - 0x03A086 24:A076: 00        .byte $00
- D - I - 0x03A087 24:A077: 06        .byte $06    ; <か>
- D - I - 0x03A088 24:A078: 0F        .byte $0F    ; <そ>
- D - I - 0x03A089 24:A079: 0D        .byte $0D    ; <す>
- D - I - 0x03A08A 24:A07A: 04        .byte $04    ; <え>
- D - I - 0x03A08B 24:A07B: 04        .byte $04    ; <え>
- D - I - 0x03A08C 24:A07C: 03        .byte $03    ; <う>
- D - I - 0x03A08D 24:A07D: 07        .byte $07    ; <き>
- D - I - 0x03A08E 24:A07E: 0F        .byte $0F    ; <そ>
- D - I - 0x03A08F 24:A07F: 08        .byte $08    ; <く>
- D - I - 0x03A090 24:A080: 0E        .byte $0E    ; <せ>
- D - I - 0x03A091 24:A081: 05        .byte $05    ; <お>
- D - I - 0x03A092 24:A082: 03        .byte $03    ; <う>
- D - I - 0x03A093 24:A083: 07        .byte $07    ; <き>
- D - I - 0x03A094 24:A084: 09        .byte $09    ; <け>
- D - I - 0x03A095 24:A085: 07        .byte $07    ; <き>
- D - I - 0x03A096 24:A086: 0F        .byte $0F    ; <そ>
- D - I - 0x03A097 24:A087: 09        .byte $09    ; <け>
- D - I - 0x03A098 24:A088: 0E        .byte $0E    ; <せ>
- - - - - 0x03A099 24:A089: 05        .byte $05    ; <お>
- D - I - 0x03A09A 24:A08A: 03        .byte $03    ; <う>
- D - I - 0x03A09B 24:A08B: 07        .byte $07    ; <き>
- D - I - 0x03A09C 24:A08C: 09        .byte $09    ; <け>
- - - - - 0x03A09D 24:A08D: 00        .byte $00
- D - I - 0x03A09E 24:A08E: 00        .byte $00
- D - I - 0x03A09F 24:A08F: 03        .byte $03    ; <う>
- D - I - 0x03A0A0 24:A090: 04        .byte $04    ; <え>
- D - I - 0x03A0A1 24:A091: 04        .byte $04    ; <え>
- D - I - 0x03A0A2 24:A092: 06        .byte $06    ; <か>
- D - I - 0x03A0A3 24:A093: 08        .byte $08    ; <く>
- D - I - 0x03A0A4 24:A094: 07        .byte $07    ; <き>
- D - I - 0x03A0A5 24:A095: 04        .byte $04    ; <え>
- D - I - 0x03A0A6 24:A096: 04        .byte $04    ; <え>
- D - I - 0x03A0A7 24:A097: 02        .byte $02    ; <い>
- D - I - 0x03A0A8 24:A098: 05        .byte $05    ; <お>
- D - I - 0x03A0A9 24:A099: 07        .byte $07    ; <き>
- D - I - 0x03A0AA 24:A09A: 05        .byte $05    ; <お>
- D - I - 0x03A0AB 24:A09B: 09        .byte $09    ; <け>
- D - I - 0x03A0AC 24:A09C: 06        .byte $06    ; <か>
- D - I - 0x03A0AD 24:A09D: 0D        .byte $0D    ; <す>
- D - I - 0x03A0AE 24:A09E: 0E        .byte $0E    ; <せ>
- D - I - 0x03A0AF 24:A09F: 0A        .byte $0A    ; <こ>
- D - I - 0x03A0B0 24:A0A0: 0D        .byte $0D    ; <す>
- D - I - 0x03A0B1 24:A0A1: 10        .byte $10    ; <た>
- D - I - 0x03A0B2 24:A0A2: 0E        .byte $0E    ; <せ>
- D - I - 0x03A0B3 24:A0A3: 12        .byte $12    ; <つ>
- D - I - 0x03A0B4 24:A0A4: 0C        .byte $0C    ; <し>
- - - - - 0x03A0B5 24:A0A5: 00        .byte $00
- D - I - 0x03A0B6 24:A0A6: 00        .byte $00
- D - I - 0x03A0B7 24:A0A7: 03        .byte $03    ; <う>
- D - I - 0x03A0B8 24:A0A8: 04        .byte $04    ; <え>
- D - I - 0x03A0B9 24:A0A9: 04        .byte $04    ; <え>
- D - I - 0x03A0BA 24:A0AA: 06        .byte $06    ; <か>
- D - I - 0x03A0BB 24:A0AB: 0A        .byte $0A    ; <こ>
- D - I - 0x03A0BC 24:A0AC: 05        .byte $05    ; <お>
- D - I - 0x03A0BD 24:A0AD: 0C        .byte $0C    ; <し>
- D - I - 0x03A0BE 24:A0AE: 0D        .byte $0D    ; <す>
- D - I - 0x03A0BF 24:A0AF: 09        .byte $09    ; <け>
- D - I - 0x03A0C0 24:A0B0: 0C        .byte $0C    ; <し>
- D - I - 0x03A0C1 24:A0B1: 0F        .byte $0F    ; <そ>
- D - I - 0x03A0C2 24:A0B2: 0D        .byte $0D    ; <す>
- D - I - 0x03A0C3 24:A0B3: 11        .byte $11    ; <ち>
- - - - - 0x03A0C4 24:A0B4: 0B        .byte $0B    ; <さ>
- D - I - 0x03A0C5 24:A0B5: 04        .byte $04    ; <え>
- D - I - 0x03A0C6 24:A0B6: 04        .byte $04    ; <え>
- D - I - 0x03A0C7 24:A0B7: 02        .byte $02    ; <い>
- D - I - 0x03A0C8 24:A0B8: 05        .byte $05    ; <お>
- D - I - 0x03A0C9 24:A0B9: 07        .byte $07    ; <き>
- D - I - 0x03A0CA 24:A0BA: 05        .byte $05    ; <お>
- D - I - 0x03A0CB 24:A0BB: 09        .byte $09    ; <け>
- D - I - 0x03A0CC 24:A0BC: 04        .byte $04    ; <え>
- - - - - 0x03A0CD 24:A0BD: 00        .byte $00
- D - I - 0x03A0CE 24:A0BE: 00        .byte $00
- D - I - 0x03A0CF 24:A0BF: 02        .byte $02    ; <い>
- D - I - 0x03A0D0 24:A0C0: 00        .byte $00
- D - I - 0x03A0D1 24:A0C1: 00        .byte $00
- D - I - 0x03A0D2 24:A0C2: 02        .byte $02    ; <い>
- D - I - 0x03A0D3 24:A0C3: 06        .byte $06    ; <か>
- D - I - 0x03A0D4 24:A0C4: 00        .byte $00
- D - I - 0x03A0D5 24:A0C5: 04        .byte $04    ; <え>
- - - - - 0x03A0D6 24:A0C6: 00        .byte $00
- D - I - 0x03A0D7 24:A0C7: 00        .byte $00
- D - I - 0x03A0D8 24:A0C8: 02        .byte $02    ; <い>
- - - - - 0x03A0D9 24:A0C9: 04        .byte $04    ; <え>
- D - I - 0x03A0DA 24:A0CA: 02        .byte $02    ; <い>
- D - I - 0x03A0DB 24:A0CB: 06        .byte $06    ; <か>
- D - I - 0x03A0DC 24:A0CC: 01        .byte $01    ; <あ>
- D - I - 0x03A0DD 24:A0CD: 04        .byte $04    ; <え>
- D - I - 0x03A0DE 24:A0CE: 00        .byte $00
- D - I - 0x03A0DF 24:A0CF: 00        .byte $00
- D - I - 0x03A0E0 24:A0D0: 02        .byte $02    ; <い>
- - - - - 0x03A0E1 24:A0D1: 04        .byte $04    ; <え>
- D - I - 0x03A0E2 24:A0D2: 02        .byte $02    ; <い>
- D - I - 0x03A0E3 24:A0D3: 06        .byte $06    ; <か>
- D - I - 0x03A0E4 24:A0D4: 01        .byte $01    ; <あ>
- - - - - 0x03A0E5 24:A0D5: 00        .byte $00
- D - I - 0x03A0E6 24:A0D6: 00        .byte $00
- D - I - 0x03A0E7 24:A0D7: 00        .byte $00
- D - I - 0x03A0E8 24:A0D8: 00        .byte $00
- D - I - 0x03A0E9 24:A0D9: 00        .byte $00
- D - I - 0x03A0EA 24:A0DA: 00        .byte $00
- D - I - 0x03A0EB 24:A0DB: 01        .byte $01    ; <あ>
- D - I - 0x03A0EC 24:A0DC: 01        .byte $01    ; <あ>
- D - I - 0x03A0ED 24:A0DD: 01        .byte $01    ; <あ>
- D - I - 0x03A0EE 24:A0DE: 00        .byte $00
- D - I - 0x03A0EF 24:A0DF: 00        .byte $00
- D - I - 0x03A0F0 24:A0E0: 01        .byte $01    ; <あ>
- D - I - 0x03A0F1 24:A0E1: 02        .byte $02    ; <い>
- D - I - 0x03A0F2 24:A0E2: 01        .byte $01    ; <あ>
- D - I - 0x03A0F3 24:A0E3: 04        .byte $04    ; <え>
- D - I - 0x03A0F4 24:A0E4: 00        .byte $00
- D - I - 0x03A0F5 24:A0E5: 01        .byte $01    ; <あ>
- D - I - 0x03A0F6 24:A0E6: 00        .byte $00
- D - I - 0x03A0F7 24:A0E7: 00        .byte $00
- D - I - 0x03A0F8 24:A0E8: 01        .byte $01    ; <あ>
- D - I - 0x03A0F9 24:A0E9: 02        .byte $02    ; <い>
- D - I - 0x03A0FA 24:A0EA: 01        .byte $01    ; <あ>
- D - I - 0x03A0FB 24:A0EB: 04        .byte $04    ; <え>
- D - I - 0x03A0FC 24:A0EC: 00        .byte $00
- - - - - 0x03A0FD 24:A0ED: 00        .byte $00
- D - I - 0x03A0FE 24:A0EE: 00        .byte $00
- D - I - 0x03A0FF 24:A0EF: 02        .byte $02    ; <い>
- D - I - 0x03A100 24:A0F0: 00        .byte $00
- D - I - 0x03A101 24:A0F1: 00        .byte $00
- D - I - 0x03A102 24:A0F2: 03        .byte $03    ; <う>
- D - I - 0x03A103 24:A0F3: 05        .byte $05    ; <お>
- D - I - 0x03A104 24:A0F4: 03        .byte $03    ; <う>
- D - I - 0x03A105 24:A0F5: 04        .byte $04    ; <え>
- - - - - 0x03A106 24:A0F6: 00        .byte $00
- D - I - 0x03A107 24:A0F7: 00        .byte $00
- D - I - 0x03A108 24:A0F8: 02        .byte $02    ; <い>
- - - - - 0x03A109 24:A0F9: 05        .byte $05    ; <お>
- D - I - 0x03A10A 24:A0FA: 03        .byte $03    ; <う>
- D - I - 0x03A10B 24:A0FB: 07        .byte $07    ; <き>
- D - I - 0x03A10C 24:A0FC: 02        .byte $02    ; <い>
- D - I - 0x03A10D 24:A0FD: 06        .byte $06    ; <か>
- D - I - 0x03A10E 24:A0FE: 01        .byte $01    ; <あ>
- D - I - 0x03A10F 24:A0FF: 00        .byte $00
- D - I - 0x03A110 24:A100: 08        .byte $08    ; <く>
- D - I - 0x03A111 24:A101: 06        .byte $06    ; <か>
- D - I - 0x03A112 24:A102: 04        .byte $04    ; <え>
- D - I - 0x03A113 24:A103: 08        .byte $08    ; <く>
- D - I - 0x03A114 24:A104: 03        .byte $03    ; <う>
- - - - - 0x03A115 24:A105: 00        .byte $00
- D - I - 0x03A116 24:A106: 02        .byte $02    ; <い>
- D - I - 0x03A117 24:A107: 04        .byte $04    ; <え>
- D - I - 0x03A118 24:A108: 03        .byte $03    ; <う>
- D - I - 0x03A119 24:A109: 02        .byte $02    ; <い>
- D - I - 0x03A11A 24:A10A: 00        .byte $00
- D - I - 0x03A11B 24:A10B: 00        .byte $00
- D - I - 0x03A11C 24:A10C: 04        .byte $04    ; <え>
- D - I - 0x03A11D 24:A10D: 06        .byte $06    ; <か>
- D - I - 0x03A11E 24:A10E: 03        .byte $03    ; <う>
- D - I - 0x03A11F 24:A10F: 00        .byte $00
- D - I - 0x03A120 24:A110: 05        .byte $05    ; <お>
- D - I - 0x03A121 24:A111: 02        .byte $02    ; <い>
- D - I - 0x03A122 24:A112: 01        .byte $01    ; <あ>
- D - I - 0x03A123 24:A113: 04        .byte $04    ; <え>
- D - I - 0x03A124 24:A114: 01        .byte $01    ; <あ>
- D - I - 0x03A125 24:A115: 0C        .byte $0C    ; <し>
- D - I - 0x03A126 24:A116: 0B        .byte $0B    ; <さ>
- D - I - 0x03A127 24:A117: 08        .byte $08    ; <く>
- D - I - 0x03A128 24:A118: 0F        .byte $0F    ; <そ>
- - - - - 0x03A129 24:A119: 0B        .byte $0B    ; <さ>
- D - I - 0x03A12A 24:A11A: 09        .byte $09    ; <け>
- D - I - 0x03A12B 24:A11B: 0D        .byte $0D    ; <す>
- D - I - 0x03A12C 24:A11C: 08        .byte $08    ; <く>
- - - - - 0x03A12D 24:A11D: 00        .byte $00
- D - I - 0x03A12E 24:A11E: 14        .byte $14    ; <と>
- D - I - 0x03A12F 24:A11F: 03        .byte $03    ; <う>
- D - I - 0x03A130 24:A120: 00        .byte $00
- D - I - 0x03A131 24:A121: 00        .byte $00
- D - I - 0x03A132 24:A122: 08        .byte $08    ; <く>
- D - I - 0x03A133 24:A123: 07        .byte $07    ; <き>
- D - I - 0x03A134 24:A124: 01        .byte $01    ; <あ>
- D - I - 0x03A135 24:A125: 05        .byte $05    ; <お>
- D - I - 0x03A136 24:A126: 00        .byte $00
- D - I - 0x03A137 24:A127: 00        .byte $00
- D - I - 0x03A138 24:A128: 02        .byte $02    ; <い>
- D - I - 0x03A139 24:A129: 09        .byte $09    ; <け>
- D - I - 0x03A13A 24:A12A: 07        .byte $07    ; <き>
- D - I - 0x03A13B 24:A12B: 0B        .byte $0B    ; <さ>
- D - I - 0x03A13C 24:A12C: 02        .byte $02    ; <い>
- D - I - 0x03A13D 24:A12D: 05        .byte $05    ; <お>
- - - - - 0x03A13E 24:A12E: 00        .byte $00
- D - I - 0x03A13F 24:A12F: 00        .byte $00
- D - I - 0x03A140 24:A130: 02        .byte $02    ; <い>
- - - - - 0x03A141 24:A131: 09        .byte $09    ; <け>
- D - I - 0x03A142 24:A132: 07        .byte $07    ; <き>
- D - I - 0x03A143 24:A133: 0B        .byte $0B    ; <さ>
- D - I - 0x03A144 24:A134: 02        .byte $02    ; <い>
- - - - - 0x03A145 24:A135: 00        .byte $00
- D - I - 0x03A146 24:A136: 20        .byte $20    ; <み>
- D - I - 0x03A147 24:A137: 05        .byte $05    ; <お>
- D - I - 0x03A148 24:A138: 02        .byte $02    ; <い>
- D - I - 0x03A149 24:A139: 07        .byte $07    ; <き>
- D - I - 0x03A14A 24:A13A: 00        .byte $00
- D - I - 0x03A14B 24:A13B: 00        .byte $00
- D - I - 0x03A14C 24:A13C: 00        .byte $00
- D - I - 0x03A14D 24:A13D: 07        .byte $07    ; <き>
- D - I - 0x03A14E 24:A13E: 02        .byte $02    ; <い>
- D - I - 0x03A14F 24:A13F: 05        .byte $05    ; <お>
- D - I - 0x03A150 24:A140: 09        .byte $09    ; <け>
- D - I - 0x03A151 24:A141: 02        .byte $02    ; <い>
- D - I - 0x03A152 24:A142: 01        .byte $01    ; <あ>
- D - I - 0x03A153 24:A143: 04        .byte $04    ; <え>
- D - I - 0x03A154 24:A144: 00        .byte $00
- D - I - 0x03A155 24:A145: 07        .byte $07    ; <き>
- D - I - 0x03A156 24:A146: 02        .byte $02    ; <い>
- D - I - 0x03A157 24:A147: 05        .byte $05    ; <お>
- D - I - 0x03A158 24:A148: 09        .byte $09    ; <け>
- D - I - 0x03A159 24:A149: 02        .byte $02    ; <い>
- D - I - 0x03A15A 24:A14A: 01        .byte $01    ; <あ>
- D - I - 0x03A15B 24:A14B: 04        .byte $04    ; <え>
- D - I - 0x03A15C 24:A14C: 00        .byte $00
- - - - - 0x03A15D 24:A14D: 00        .byte $00
- D - I - 0x03A15E 24:A14E: 02        .byte $02    ; <い>
- D - I - 0x03A15F 24:A14F: 06        .byte $06    ; <か>
- D - I - 0x03A160 24:A150: 03        .byte $03    ; <う>
- D - I - 0x03A161 24:A151: 0B        .byte $0B    ; <さ>
- D - I - 0x03A162 24:A152: 00        .byte $00
- D - I - 0x03A163 24:A153: 00        .byte $00
- D - I - 0x03A164 24:A154: 00        .byte $00
- D - I - 0x03A165 24:A155: 08        .byte $08    ; <く>
- D - I - 0x03A166 24:A156: 03        .byte $03    ; <う>
- D - I - 0x03A167 24:A157: 07        .byte $07    ; <き>
- D - I - 0x03A168 24:A158: 0B        .byte $0B    ; <さ>
- - - - - 0x03A169 24:A159: 02        .byte $02    ; <い>
- D - I - 0x03A16A 24:A15A: 01        .byte $01    ; <あ>
- D - I - 0x03A16B 24:A15B: 04        .byte $04    ; <え>
- - - - - 0x03A16C 24:A15C: 00        .byte $00
- D - I - 0x03A16D 24:A15D: 08        .byte $08    ; <く>
- D - I - 0x03A16E 24:A15E: 03        .byte $03    ; <う>
- D - I - 0x03A16F 24:A15F: 07        .byte $07    ; <き>
- D - I - 0x03A170 24:A160: 0B        .byte $0B    ; <さ>
- - - - - 0x03A171 24:A161: 02        .byte $02    ; <い>
- D - I - 0x03A172 24:A162: 01        .byte $01    ; <あ>
- D - I - 0x03A173 24:A163: 04        .byte $04    ; <え>
- - - - - 0x03A174 24:A164: 00        .byte $00
- - - - - 0x03A175 24:A165: 00        .byte $00
- D - I - 0x03A176 24:A166: 28        .byte $28    ; <り>
- D - I - 0x03A177 24:A167: 0F        .byte $0F    ; <そ>
- D - I - 0x03A178 24:A168: 05        .byte $05    ; <お>
- D - I - 0x03A179 24:A169: 08        .byte $08    ; <く>
- D - I - 0x03A17A 24:A16A: 0E        .byte $0E    ; <せ>
- D - I - 0x03A17B 24:A16B: 10        .byte $10    ; <た>
- D - I - 0x03A17C 24:A16C: 01        .byte $01    ; <あ>
- D - I - 0x03A17D 24:A16D: 12        .byte $12    ; <つ>
- D - I - 0x03A17E 24:A16E: 05        .byte $05    ; <お>
- D - I - 0x03A17F 24:A16F: 08        .byte $08    ; <く>
- D - I - 0x03A180 24:A170: 0F        .byte $0F    ; <そ>
- - - - - 0x03A181 24:A171: 10        .byte $10    ; <た>
- D - I - 0x03A182 24:A172: 0E        .byte $0E    ; <せ>
- D - I - 0x03A183 24:A173: 12        .byte $12    ; <つ>
- D - I - 0x03A184 24:A174: 00        .byte $00
- D - I - 0x03A185 24:A175: 12        .byte $12    ; <つ>
- D - I - 0x03A186 24:A176: 05        .byte $05    ; <お>
- D - I - 0x03A187 24:A177: 08        .byte $08    ; <く>
- D - I - 0x03A188 24:A178: 0F        .byte $0F    ; <そ>
- - - - - 0x03A189 24:A179: 10        .byte $10    ; <た>
- D - I - 0x03A18A 24:A17A: 0E        .byte $0E    ; <せ>
- D - I - 0x03A18B 24:A17B: 12        .byte $12    ; <つ>
- D - I - 0x03A18C 24:A17C: 00        .byte $00
- - - - - 0x03A18D 24:A17D: 00        .byte $00
- D - I - 0x03A18E 24:A17E: 20        .byte $20    ; <み>
- D - I - 0x03A18F 24:A17F: 07        .byte $07    ; <き>
- D - I - 0x03A190 24:A180: 02        .byte $02    ; <い>
- D - I - 0x03A191 24:A181: 06        .byte $06    ; <か>
- D - I - 0x03A192 24:A182: 03        .byte $03    ; <う>
- D - I - 0x03A193 24:A183: 0D        .byte $0D    ; <す>
- D - I - 0x03A194 24:A184: 01        .byte $01    ; <あ>
- D - I - 0x03A195 24:A185: 0A        .byte $0A    ; <こ>
- D - I - 0x03A196 24:A186: 02        .byte $02    ; <い>
- D - I - 0x03A197 24:A187: 04        .byte $04    ; <え>
- D - I - 0x03A198 24:A188: 07        .byte $07    ; <き>
- D - I - 0x03A199 24:A189: 08        .byte $08    ; <く>
- D - I - 0x03A19A 24:A18A: 0A        .byte $0A    ; <こ>
- D - I - 0x03A19B 24:A18B: 0C        .byte $0C    ; <し>
- D - I - 0x03A19C 24:A18C: 00        .byte $00
- D - I - 0x03A19D 24:A18D: 0A        .byte $0A    ; <こ>
- D - I - 0x03A19E 24:A18E: 02        .byte $02    ; <い>
- D - I - 0x03A19F 24:A18F: 04        .byte $04    ; <え>
- D - I - 0x03A1A0 24:A190: 07        .byte $07    ; <き>
- D - I - 0x03A1A1 24:A191: 08        .byte $08    ; <く>
- D - I - 0x03A1A2 24:A192: 0A        .byte $0A    ; <こ>
- D - I - 0x03A1A3 24:A193: 0C        .byte $0C    ; <し>
- - - - - 0x03A1A4 24:A194: 00        .byte $00
- - - - - 0x03A1A5 24:A195: 00        .byte $00
- D - I - 0x03A1A6 24:A196: 1E        .byte $1E    ; <ほ>
- D - I - 0x03A1A7 24:A197: 07        .byte $07    ; <き>
- D - I - 0x03A1A8 24:A198: 01        .byte $01    ; <あ>
- D - I - 0x03A1A9 24:A199: 05        .byte $05    ; <お>
- D - I - 0x03A1AA 24:A19A: 0F        .byte $0F    ; <そ>
- D - I - 0x03A1AB 24:A19B: 09        .byte $09    ; <け>
- D - I - 0x03A1AC 24:A19C: 01        .byte $01    ; <あ>
- D - I - 0x03A1AD 24:A19D: 09        .byte $09    ; <け>
- D - I - 0x03A1AE 24:A19E: 01        .byte $01    ; <あ>
- D - I - 0x03A1AF 24:A19F: 02        .byte $02    ; <い>
- D - I - 0x03A1B0 24:A1A0: 06        .byte $06    ; <か>
- D - I - 0x03A1B1 24:A1A1: 0B        .byte $0B    ; <さ>
- D - I - 0x03A1B2 24:A1A2: 09        .byte $09    ; <け>
- D - I - 0x03A1B3 24:A1A3: 0E        .byte $0E    ; <せ>
- D - I - 0x03A1B4 24:A1A4: 00        .byte $00
- D - I - 0x03A1B5 24:A1A5: 0B        .byte $0B    ; <さ>
- D - I - 0x03A1B6 24:A1A6: 01        .byte $01    ; <あ>
- D - I - 0x03A1B7 24:A1A7: 02        .byte $02    ; <い>
- D - I - 0x03A1B8 24:A1A8: 08        .byte $08    ; <く>
- D - I - 0x03A1B9 24:A1A9: 0D        .byte $0D    ; <す>
- D - I - 0x03A1BA 24:A1AA: 0C        .byte $0C    ; <し>
- D - I - 0x03A1BB 24:A1AB: 11        .byte $11    ; <ち>
- D - I - 0x03A1BC 24:A1AC: 00        .byte $00
- - - - - 0x03A1BD 24:A1AD: 00        .byte $00
- D - I - 0x03A1BE 24:A1AE: 21        .byte $21    ; <む>
- D - I - 0x03A1BF 24:A1AF: 0A        .byte $0A    ; <こ>
- D - I - 0x03A1C0 24:A1B0: 07        .byte $07    ; <き>
- D - I - 0x03A1C1 24:A1B1: 0F        .byte $0F    ; <そ>
- D - I - 0x03A1C2 24:A1B2: 0B        .byte $0B    ; <さ>
- D - I - 0x03A1C3 24:A1B3: 0E        .byte $0E    ; <せ>
- D - I - 0x03A1C4 24:A1B4: 0D        .byte $0D    ; <す>
- D - I - 0x03A1C5 24:A1B5: 0D        .byte $0D    ; <す>
- D - I - 0x03A1C6 24:A1B6: 07        .byte $07    ; <き>
- D - I - 0x03A1C7 24:A1B7: 0A        .byte $0A    ; <こ>
- D - I - 0x03A1C8 24:A1B8: 11        .byte $11    ; <ち>
- D - I - 0x03A1C9 24:A1B9: 0D        .byte $0D    ; <す>
- D - I - 0x03A1CA 24:A1BA: 0B        .byte $0B    ; <さ>
- D - I - 0x03A1CB 24:A1BB: 0F        .byte $0F    ; <そ>
- D - I - 0x03A1CC 24:A1BC: 0D        .byte $0D    ; <す>
- D - I - 0x03A1CD 24:A1BD: 0D        .byte $0D    ; <す>
- D - I - 0x03A1CE 24:A1BE: 07        .byte $07    ; <き>
- D - I - 0x03A1CF 24:A1BF: 0B        .byte $0B    ; <さ>
- D - I - 0x03A1D0 24:A1C0: 11        .byte $11    ; <ち>
- - - - - 0x03A1D1 24:A1C1: 0D        .byte $0D    ; <す>
- D - I - 0x03A1D2 24:A1C2: 0B        .byte $0B    ; <さ>
- D - I - 0x03A1D3 24:A1C3: 0F        .byte $0F    ; <そ>
- D - I - 0x03A1D4 24:A1C4: 0D        .byte $0D    ; <す>
- - - - - 0x03A1D5 24:A1C5: 00        .byte $00
- D - I - 0x03A1D6 24:A1C6: 00        .byte $00
- D - I - 0x03A1D7 24:A1C7: 04        .byte $04    ; <え>
- D - I - 0x03A1D8 24:A1C8: 02        .byte $02    ; <い>
- D - I - 0x03A1D9 24:A1C9: 02        .byte $02    ; <い>
- D - I - 0x03A1DA 24:A1CA: 01        .byte $01    ; <あ>
- D - I - 0x03A1DB 24:A1CB: 00        .byte $00
- D - I - 0x03A1DC 24:A1CC: 00        .byte $00
- D - I - 0x03A1DD 24:A1CD: 07        .byte $07    ; <き>
- - - - - 0x03A1DE 24:A1CE: 02        .byte $02    ; <い>
- D - I - 0x03A1DF 24:A1CF: 01        .byte $01    ; <あ>
- D - I - 0x03A1E0 24:A1D0: 04        .byte $04    ; <え>
- - - - - 0x03A1E1 24:A1D1: 02        .byte $02    ; <い>
- D - I - 0x03A1E2 24:A1D2: 01        .byte $01    ; <あ>
- D - I - 0x03A1E3 24:A1D3: 04        .byte $04    ; <え>
- - - - - 0x03A1E4 24:A1D4: 01        .byte $01    ; <あ>
- D - I - 0x03A1E5 24:A1D5: 07        .byte $07    ; <き>
- - - - - 0x03A1E6 24:A1D6: 02        .byte $02    ; <い>
- D - I - 0x03A1E7 24:A1D7: 01        .byte $01    ; <あ>
- D - I - 0x03A1E8 24:A1D8: 04        .byte $04    ; <え>
- - - - - 0x03A1E9 24:A1D9: 02        .byte $02    ; <い>
- D - I - 0x03A1EA 24:A1DA: 01        .byte $01    ; <あ>
- D - I - 0x03A1EB 24:A1DB: 04        .byte $04    ; <え>
- - - - - 0x03A1EC 24:A1DC: 01        .byte $01    ; <あ>
- - - - - 0x03A1ED 24:A1DD: 00        .byte $00
- D - I - 0x03A1EE 24:A1DE: 00        .byte $00
- D - I - 0x03A1EF 24:A1DF: 01        .byte $01    ; <あ>
- D - I - 0x03A1F0 24:A1E0: 07        .byte $07    ; <き>
- D - I - 0x03A1F1 24:A1E1: 0A        .byte $0A    ; <こ>
- D - I - 0x03A1F2 24:A1E2: 00        .byte $00
- D - I - 0x03A1F3 24:A1E3: 00        .byte $00
- D - I - 0x03A1F4 24:A1E4: 00        .byte $00
- D - I - 0x03A1F5 24:A1E5: 03        .byte $03    ; <う>
- - - - - 0x03A1F6 24:A1E6: 07        .byte $07    ; <き>
- D - I - 0x03A1F7 24:A1E7: 06        .byte $06    ; <か>
- D - I - 0x03A1F8 24:A1E8: 0A        .byte $0A    ; <こ>
- - - - - 0x03A1F9 24:A1E9: 02        .byte $02    ; <い>
- D - I - 0x03A1FA 24:A1EA: 01        .byte $01    ; <あ>
- D - I - 0x03A1FB 24:A1EB: 04        .byte $04    ; <え>
- - - - - 0x03A1FC 24:A1EC: 01        .byte $01    ; <あ>
- D - I - 0x03A1FD 24:A1ED: 03        .byte $03    ; <う>
- - - - - 0x03A1FE 24:A1EE: 07        .byte $07    ; <き>
- D - I - 0x03A1FF 24:A1EF: 06        .byte $06    ; <か>
- D - I - 0x03A200 24:A1F0: 0A        .byte $0A    ; <こ>
- - - - - 0x03A201 24:A1F1: 02        .byte $02    ; <い>
- D - I - 0x03A202 24:A1F2: 01        .byte $01    ; <あ>
- D - I - 0x03A203 24:A1F3: 04        .byte $04    ; <え>
- - - - - 0x03A204 24:A1F4: 01        .byte $01    ; <あ>
- - - - - 0x03A205 24:A1F5: 00        .byte $00
- D - I - 0x03A206 24:A1F6: 1C        .byte $1C    ; <ふ>
- D - I - 0x03A207 24:A1F7: 15        .byte $15    ; <な>
- D - I - 0x03A208 24:A1F8: 1C        .byte $1C    ; <ふ>
- D - I - 0x03A209 24:A1F9: 1F        .byte $1F    ; <ま>
- D - I - 0x03A20A 24:A1FA: 0D        .byte $0D    ; <す>
- D - I - 0x03A20B 24:A1FB: 1C        .byte $1C    ; <ふ>
- D - I - 0x03A20C 24:A1FC: 1F        .byte $1F    ; <ま>
- D - I - 0x03A20D 24:A1FD: 18        .byte $18    ; <ね>
- D - I - 0x03A20E 24:A1FE: 1C        .byte $1C    ; <ふ>
- D - I - 0x03A20F 24:A1FF: 13        .byte $13    ; <て>
- D - I - 0x03A210 24:A200: 20        .byte $20    ; <み>
- D - I - 0x03A211 24:A201: 1B        .byte $1B    ; <ひ>
- D - I - 0x03A212 24:A202: 19        .byte $19    ; <の>
- D - I - 0x03A213 24:A203: 0E        .byte $0E    ; <せ>
- D - I - 0x03A214 24:A204: 1E        .byte $1E    ; <ほ>
- D - I - 0x03A215 24:A205: 18        .byte $18    ; <ね>
- D - I - 0x03A216 24:A206: 1C        .byte $1C    ; <ふ>
- D - I - 0x03A217 24:A207: 13        .byte $13    ; <て>
- D - I - 0x03A218 24:A208: 20        .byte $20    ; <み>
- D - I - 0x03A219 24:A209: 1B        .byte $1B    ; <ひ>
- D - I - 0x03A21A 24:A20A: 19        .byte $19    ; <の>
- D - I - 0x03A21B 24:A20B: 0E        .byte $0E    ; <せ>
- D - I - 0x03A21C 24:A20C: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A21D 24:A20D: 00        .byte $00
- - - - - 0x03A21E 24:A20E: 00        .byte $00
- D - I - 0x03A21F 24:A20F: 00        .byte $00
- D - I - 0x03A220 24:A210: 05        .byte $05    ; <お>
- D - I - 0x03A221 24:A211: 03        .byte $03    ; <う>
- D - I - 0x03A222 24:A212: 00        .byte $00
- D - I - 0x03A223 24:A213: 00        .byte $00
- D - I - 0x03A224 24:A214: 00        .byte $00
- D - I - 0x03A225 24:A215: 02        .byte $02    ; <い>
- D - I - 0x03A226 24:A216: 00        .byte $00
- D - I - 0x03A227 24:A217: 00        .byte $00
- D - I - 0x03A228 24:A218: 01        .byte $01    ; <あ>
- D - I - 0x03A229 24:A219: 00        .byte $00
- D - I - 0x03A22A 24:A21A: 00        .byte $00
- - - - - 0x03A22B 24:A21B: 00        .byte $00
- D - I - 0x03A22C 24:A21C: 00        .byte $00
- D - I - 0x03A22D 24:A21D: 02        .byte $02    ; <い>
- - - - - 0x03A22E 24:A21E: 00        .byte $00
- D - I - 0x03A22F 24:A21F: 00        .byte $00
- - - - - 0x03A230 24:A220: 01        .byte $01    ; <あ>
- D - I - 0x03A231 24:A221: 00        .byte $00
- D - I - 0x03A232 24:A222: 00        .byte $00
- - - - - 0x03A233 24:A223: 00        .byte $00
- D - I - 0x03A234 24:A224: 00        .byte $00
- - - - - 0x03A235 24:A225: 00        .byte $00
- - - - - 0x03A236 24:A226: 00        .byte $00
- D - I - 0x03A237 24:A227: 00        .byte $00
- D - I - 0x03A238 24:A228: 05        .byte $05    ; <お>
- D - I - 0x03A239 24:A229: 03        .byte $03    ; <う>
- D - I - 0x03A23A 24:A22A: 00        .byte $00
- D - I - 0x03A23B 24:A22B: 00        .byte $00
- D - I - 0x03A23C 24:A22C: 00        .byte $00
- D - I - 0x03A23D 24:A22D: 02        .byte $02    ; <い>
- - - - - 0x03A23E 24:A22E: 00        .byte $00
- - - - - 0x03A23F 24:A22F: 00        .byte $00
- D - I - 0x03A240 24:A230: 01        .byte $01    ; <あ>
- - - - - 0x03A241 24:A231: 00        .byte $00
- - - - - 0x03A242 24:A232: 00        .byte $00
- - - - - 0x03A243 24:A233: 00        .byte $00
- - - - - 0x03A244 24:A234: 00        .byte $00
- D - I - 0x03A245 24:A235: 02        .byte $02    ; <い>
- D - I - 0x03A246 24:A236: 00        .byte $00
- - - - - 0x03A247 24:A237: 00        .byte $00
- - - - - 0x03A248 24:A238: 01        .byte $01    ; <あ>
- - - - - 0x03A249 24:A239: 00        .byte $00
- - - - - 0x03A24A 24:A23A: 00        .byte $00
- - - - - 0x03A24B 24:A23B: 00        .byte $00
- D - I - 0x03A24C 24:A23C: 00        .byte $00
- - - - - 0x03A24D 24:A23D: 00        .byte $00
- - - - - 0x03A24E 24:A23E: 00        .byte $00
- - - - - 0x03A24F 24:A23F: 04        .byte $04    ; <え>
- D - I - 0x03A250 24:A240: 07        .byte $07    ; <き>
- - - - - 0x03A251 24:A241: 05        .byte $05    ; <お>
- D - I - 0x03A252 24:A242: 00        .byte $00
- - - - - 0x03A253 24:A243: 00        .byte $00
- D - I - 0x03A254 24:A244: 00        .byte $00
- - - - - 0x03A255 24:A245: 07        .byte $07    ; <き>
- - - - - 0x03A256 24:A246: 04        .byte $04    ; <え>
- - - - - 0x03A257 24:A247: 01        .byte $01    ; <あ>
- - - - - 0x03A258 24:A248: 04        .byte $04    ; <え>
- D - I - 0x03A259 24:A249: 01        .byte $01    ; <あ>
- D - I - 0x03A25A 24:A24A: 00        .byte $00
- D - I - 0x03A25B 24:A24B: 00        .byte $00
- - - - - 0x03A25C 24:A24C: 00        .byte $00
- - - - - 0x03A25D 24:A24D: 07        .byte $07    ; <き>
- - - - - 0x03A25E 24:A24E: 04        .byte $04    ; <え>
- - - - - 0x03A25F 24:A24F: 01        .byte $01    ; <あ>
- - - - - 0x03A260 24:A250: 04        .byte $04    ; <え>
- - - - - 0x03A261 24:A251: 01        .byte $01    ; <あ>
- D - I - 0x03A262 24:A252: 00        .byte $00
- - - - - 0x03A263 24:A253: 00        .byte $00
- D - I - 0x03A264 24:A254: 00        .byte $00
- - - - - 0x03A265 24:A255: 00        .byte $00
- - - - - 0x03A266 24:A256: 00        .byte $00
- - - - - 0x03A267 24:A257: 04        .byte $04    ; <え>
- D - I - 0x03A268 24:A258: 09        .byte $09    ; <け>
- - - - - 0x03A269 24:A259: 07        .byte $07    ; <き>
- D - I - 0x03A26A 24:A25A: 00        .byte $00
- D - I - 0x03A26B 24:A25B: 00        .byte $00
- D - I - 0x03A26C 24:A25C: 00        .byte $00
- D - I - 0x03A26D 24:A25D: 07        .byte $07    ; <き>
- - - - - 0x03A26E 24:A25E: 04        .byte $04    ; <え>
- - - - - 0x03A26F 24:A25F: 01        .byte $01    ; <あ>
- - - - - 0x03A270 24:A260: 04        .byte $04    ; <え>
- D - I - 0x03A271 24:A261: 01        .byte $01    ; <あ>
- - - - - 0x03A272 24:A262: 00        .byte $00
- - - - - 0x03A273 24:A263: 00        .byte $00
- - - - - 0x03A274 24:A264: 00        .byte $00
- - - - - 0x03A275 24:A265: 07        .byte $07    ; <き>
- - - - - 0x03A276 24:A266: 04        .byte $04    ; <え>
- - - - - 0x03A277 24:A267: 01        .byte $01    ; <あ>
- - - - - 0x03A278 24:A268: 04        .byte $04    ; <え>
- - - - - 0x03A279 24:A269: 01        .byte $01    ; <あ>
- - - - - 0x03A27A 24:A26A: 00        .byte $00
- - - - - 0x03A27B 24:A26B: 00        .byte $00
- - - - - 0x03A27C 24:A26C: 00        .byte $00
- - - - - 0x03A27D 24:A26D: 00        .byte $00
- D - I - 0x03A27E 24:A26E: 00        .byte $00
- D - I - 0x03A27F 24:A26F: 07        .byte $07    ; <き>
- D - I - 0x03A280 24:A270: 13        .byte $13    ; <て>
- D - I - 0x03A281 24:A271: 11        .byte $11    ; <ち>
- D - I - 0x03A282 24:A272: 00        .byte $00
- D - I - 0x03A283 24:A273: 00        .byte $00
- D - I - 0x03A284 24:A274: 00        .byte $00
- D - I - 0x03A285 24:A275: 09        .byte $09    ; <け>
- - - - - 0x03A286 24:A276: 01        .byte $01    ; <あ>
- D - I - 0x03A287 24:A277: 01        .byte $01    ; <あ>
- D - I - 0x03A288 24:A278: 04        .byte $04    ; <え>
- - - - - 0x03A289 24:A279: 02        .byte $02    ; <い>
- D - I - 0x03A28A 24:A27A: 02        .byte $02    ; <い>
- D - I - 0x03A28B 24:A27B: 00        .byte $00
- - - - - 0x03A28C 24:A27C: 00        .byte $00
- D - I - 0x03A28D 24:A27D: 08        .byte $08    ; <く>
- - - - - 0x03A28E 24:A27E: 09        .byte $09    ; <け>
- D - I - 0x03A28F 24:A27F: 09        .byte $09    ; <け>
- D - I - 0x03A290 24:A280: 0A        .byte $0A    ; <こ>
- - - - - 0x03A291 24:A281: 02        .byte $02    ; <い>
- D - I - 0x03A292 24:A282: 02        .byte $02    ; <い>
- D - I - 0x03A293 24:A283: 00        .byte $00
- - - - - 0x03A294 24:A284: 00        .byte $00
- - - - - 0x03A295 24:A285: 00        .byte $00
- - - - - 0x03A296 24:A286: 00        .byte $00
- D - I - 0x03A297 24:A287: 09        .byte $09    ; <け>
- D - I - 0x03A298 24:A288: 10        .byte $10    ; <た>
- D - I - 0x03A299 24:A289: 14        .byte $14    ; <と>
- - - - - 0x03A29A 24:A28A: 00        .byte $00
- D - I - 0x03A29B 24:A28B: 00        .byte $00
- - - - - 0x03A29C 24:A28C: 00        .byte $00
- D - I - 0x03A29D 24:A28D: 09        .byte $09    ; <け>
- - - - - 0x03A29E 24:A28E: 07        .byte $07    ; <き>
- - - - - 0x03A29F 24:A28F: 09        .byte $09    ; <け>
- - - - - 0x03A2A0 24:A290: 08        .byte $08    ; <く>
- - - - - 0x03A2A1 24:A291: 02        .byte $02    ; <い>
- - - - - 0x03A2A2 24:A292: 02        .byte $02    ; <い>
- - - - - 0x03A2A3 24:A293: 00        .byte $00
- D - I - 0x03A2A4 24:A294: 00        .byte $00
- - - - - 0x03A2A5 24:A295: 09        .byte $09    ; <け>
- - - - - 0x03A2A6 24:A296: 07        .byte $07    ; <き>
- - - - - 0x03A2A7 24:A297: 09        .byte $09    ; <け>
- - - - - 0x03A2A8 24:A298: 08        .byte $08    ; <く>
- - - - - 0x03A2A9 24:A299: 02        .byte $02    ; <い>
- - - - - 0x03A2AA 24:A29A: 02        .byte $02    ; <い>
- - - - - 0x03A2AB 24:A29B: 00        .byte $00
- D - I - 0x03A2AC 24:A29C: 00        .byte $00
- - - - - 0x03A2AD 24:A29D: 00        .byte $00
- - - - - 0x03A2AE 24:A29E: 00        .byte $00
- D - I - 0x03A2AF 24:A29F: 07        .byte $07    ; <き>
- - - - - 0x03A2B0 24:A2A0: 0D        .byte $0D    ; <す>
- D - I - 0x03A2B1 24:A2A1: 10        .byte $10    ; <た>
- D - I - 0x03A2B2 24:A2A2: 00        .byte $00
- D - I - 0x03A2B3 24:A2A3: 00        .byte $00
- D - I - 0x03A2B4 24:A2A4: 00        .byte $00
- - - - - 0x03A2B5 24:A2A5: 09        .byte $09    ; <け>
- - - - - 0x03A2B6 24:A2A6: 05        .byte $05    ; <お>
- - - - - 0x03A2B7 24:A2A7: 04        .byte $04    ; <え>
- - - - - 0x03A2B8 24:A2A8: 05        .byte $05    ; <お>
- - - - - 0x03A2B9 24:A2A9: 03        .byte $03    ; <う>
- D - I - 0x03A2BA 24:A2AA: 00        .byte $00
- - - - - 0x03A2BB 24:A2AB: 02        .byte $02    ; <い>
- - - - - 0x03A2BC 24:A2AC: 01        .byte $01    ; <あ>
- - - - - 0x03A2BD 24:A2AD: 09        .byte $09    ; <け>
- - - - - 0x03A2BE 24:A2AE: 05        .byte $05    ; <お>
- - - - - 0x03A2BF 24:A2AF: 04        .byte $04    ; <え>
- - - - - 0x03A2C0 24:A2B0: 05        .byte $05    ; <お>
- D - I - 0x03A2C1 24:A2B1: 03        .byte $03    ; <う>
- D - I - 0x03A2C2 24:A2B2: 00        .byte $00
- - - - - 0x03A2C3 24:A2B3: 02        .byte $02    ; <い>
- D - I - 0x03A2C4 24:A2B4: 01        .byte $01    ; <あ>
- - - - - 0x03A2C5 24:A2B5: 00        .byte $00
- - - - - 0x03A2C6 24:A2B6: 00        .byte $00
- D - I - 0x03A2C7 24:A2B7: 07        .byte $07    ; <き>
- D - I - 0x03A2C8 24:A2B8: 10        .byte $10    ; <た>
- D - I - 0x03A2C9 24:A2B9: 14        .byte $14    ; <と>
- D - I - 0x03A2CA 24:A2BA: 00        .byte $00
- D - I - 0x03A2CB 24:A2BB: 00        .byte $00
- D - I - 0x03A2CC 24:A2BC: 00        .byte $00
- D - I - 0x03A2CD 24:A2BD: 09        .byte $09    ; <け>
- - - - - 0x03A2CE 24:A2BE: 05        .byte $05    ; <お>
- - - - - 0x03A2CF 24:A2BF: 04        .byte $04    ; <え>
- - - - - 0x03A2D0 24:A2C0: 05        .byte $05    ; <お>
- - - - - 0x03A2D1 24:A2C1: 02        .byte $02    ; <い>
- - - - - 0x03A2D2 24:A2C2: 00        .byte $00
- D - I - 0x03A2D3 24:A2C3: 02        .byte $02    ; <い>
- - - - - 0x03A2D4 24:A2C4: 01        .byte $01    ; <あ>
- D - I - 0x03A2D5 24:A2C5: 09        .byte $09    ; <け>
- - - - - 0x03A2D6 24:A2C6: 05        .byte $05    ; <お>
- D - I - 0x03A2D7 24:A2C7: 04        .byte $04    ; <え>
- - - - - 0x03A2D8 24:A2C8: 05        .byte $05    ; <お>
- D - I - 0x03A2D9 24:A2C9: 02        .byte $02    ; <い>
- - - - - 0x03A2DA 24:A2CA: 00        .byte $00
- - - - - 0x03A2DB 24:A2CB: 02        .byte $02    ; <い>
- D - I - 0x03A2DC 24:A2CC: 01        .byte $01    ; <あ>
- - - - - 0x03A2DD 24:A2CD: 00        .byte $00
- - - - - 0x03A2DE 24:A2CE: 00        .byte $00
- D - I - 0x03A2DF 24:A2CF: 10        .byte $10    ; <た>
- D - I - 0x03A2E0 24:A2D0: 12        .byte $12    ; <つ>
- D - I - 0x03A2E1 24:A2D1: 16        .byte $16    ; <に>
- - - - - 0x03A2E2 24:A2D2: 08        .byte $08    ; <く>
- D - I - 0x03A2E3 24:A2D3: 08        .byte $08    ; <く>
- D - I - 0x03A2E4 24:A2D4: 08        .byte $08    ; <く>
- D - I - 0x03A2E5 24:A2D5: 12        .byte $12    ; <つ>
- - - - - 0x03A2E6 24:A2D6: 0E        .byte $0E    ; <せ>
- D - I - 0x03A2E7 24:A2D7: 0E        .byte $0E    ; <せ>
- - - - - 0x03A2E8 24:A2D8: 17        .byte $17    ; <ぬ>
- - - - - 0x03A2E9 24:A2D9: 0C        .byte $0C    ; <し>
- - - - - 0x03A2EA 24:A2DA: 0A        .byte $0A    ; <こ>
- - - - - 0x03A2EB 24:A2DB: 0E        .byte $0E    ; <せ>
- - - - - 0x03A2EC 24:A2DC: 0B        .byte $0B    ; <さ>
- - - - - 0x03A2ED 24:A2DD: 12        .byte $12    ; <つ>
- - - - - 0x03A2EE 24:A2DE: 0E        .byte $0E    ; <せ>
- - - - - 0x03A2EF 24:A2DF: 0E        .byte $0E    ; <せ>
- - - - - 0x03A2F0 24:A2E0: 17        .byte $17    ; <ぬ>
- - - - - 0x03A2F1 24:A2E1: 0C        .byte $0C    ; <し>
- - - - - 0x03A2F2 24:A2E2: 0A        .byte $0A    ; <こ>
- D - I - 0x03A2F3 24:A2E3: 0E        .byte $0E    ; <せ>
- D - I - 0x03A2F4 24:A2E4: 0B        .byte $0B    ; <さ>
- - - - - 0x03A2F5 24:A2E5: 00        .byte $00
- - - - - 0x03A2F6 24:A2E6: 00        .byte $00
- - - - - 0x03A2F7 24:A2E7: 0F        .byte $0F    ; <そ>
- D - I - 0x03A2F8 24:A2E8: 11        .byte $11    ; <ち>
- - - - - 0x03A2F9 24:A2E9: 15        .byte $15    ; <な>
- D - I - 0x03A2FA 24:A2EA: 04        .byte $04    ; <え>
- D - I - 0x03A2FB 24:A2EB: 04        .byte $04    ; <え>
- D - I - 0x03A2FC 24:A2EC: 04        .byte $04    ; <え>
- - - - - 0x03A2FD 24:A2ED: 11        .byte $11    ; <ち>
- - - - - 0x03A2FE 24:A2EE: 07        .byte $07    ; <き>
- - - - - 0x03A2FF 24:A2EF: 0F        .byte $0F    ; <そ>
- - - - - 0x03A300 24:A2F0: 06        .byte $06    ; <か>
- - - - - 0x03A301 24:A2F1: 03        .byte $03    ; <う>
- D - I - 0x03A302 24:A2F2: 04        .byte $04    ; <え>
- - - - - 0x03A303 24:A2F3: 05        .byte $05    ; <お>
- - - - - 0x03A304 24:A2F4: 05        .byte $05    ; <お>
- - - - - 0x03A305 24:A2F5: 11        .byte $11    ; <ち>
- - - - - 0x03A306 24:A2F6: 07        .byte $07    ; <き>
- - - - - 0x03A307 24:A2F7: 0F        .byte $0F    ; <そ>
- - - - - 0x03A308 24:A2F8: 06        .byte $06    ; <か>
- - - - - 0x03A309 24:A2F9: 03        .byte $03    ; <う>
- D - I - 0x03A30A 24:A2FA: 04        .byte $04    ; <え>
- - - - - 0x03A30B 24:A2FB: 05        .byte $05    ; <お>
- - - - - 0x03A30C 24:A2FC: 05        .byte $05    ; <お>
- - - - - 0x03A30D 24:A2FD: 00        .byte $00
- - - - - 0x03A30E 24:A2FE: 00        .byte $00
- D - I - 0x03A30F 24:A2FF: 0F        .byte $0F    ; <そ>
- D - I - 0x03A310 24:A300: 13        .byte $13    ; <て>
- D - I - 0x03A311 24:A301: 17        .byte $17    ; <ぬ>
- - - - - 0x03A312 24:A302: 04        .byte $04    ; <え>
- D - I - 0x03A313 24:A303: 04        .byte $04    ; <え>
- D - I - 0x03A314 24:A304: 04        .byte $04    ; <え>
- - - - - 0x03A315 24:A305: 11        .byte $11    ; <ち>
- D - I - 0x03A316 24:A306: 07        .byte $07    ; <き>
- - - - - 0x03A317 24:A307: 0F        .byte $0F    ; <そ>
- D - I - 0x03A318 24:A308: 06        .byte $06    ; <か>
- - - - - 0x03A319 24:A309: 04        .byte $04    ; <え>
- - - - - 0x03A31A 24:A30A: 03        .byte $03    ; <う>
- D - I - 0x03A31B 24:A30B: 04        .byte $04    ; <え>
- - - - - 0x03A31C 24:A30C: 04        .byte $04    ; <え>
- - - - - 0x03A31D 24:A30D: 11        .byte $11    ; <ち>
- - - - - 0x03A31E 24:A30E: 07        .byte $07    ; <き>
- - - - - 0x03A31F 24:A30F: 0F        .byte $0F    ; <そ>
- - - - - 0x03A320 24:A310: 06        .byte $06    ; <か>
- - - - - 0x03A321 24:A311: 04        .byte $04    ; <え>
- - - - - 0x03A322 24:A312: 03        .byte $03    ; <う>
- - - - - 0x03A323 24:A313: 04        .byte $04    ; <え>
- - - - - 0x03A324 24:A314: 04        .byte $04    ; <え>
- - - - - 0x03A325 24:A315: 00        .byte $00
- - - - - 0x03A326 24:A316: 00        .byte $00
- - - - - 0x03A327 24:A317: 09        .byte $09    ; <け>
- D - I - 0x03A328 24:A318: 17        .byte $17    ; <ぬ>
- - - - - 0x03A329 24:A319: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A32A 24:A31A: 09        .byte $09    ; <け>
- - - - - 0x03A32B 24:A31B: 0D        .byte $0D    ; <す>
- D - I - 0x03A32C 24:A31C: 09        .byte $09    ; <け>
- D - I - 0x03A32D 24:A31D: 17        .byte $17    ; <ぬ>
- - - - - 0x03A32E 24:A31E: 11        .byte $11    ; <ち>
- - - - - 0x03A32F 24:A31F: 11        .byte $11    ; <ち>
- - - - - 0x03A330 24:A320: 19        .byte $19    ; <の>
- - - - - 0x03A331 24:A321: 0E        .byte $0E    ; <せ>
- - - - - 0x03A332 24:A322: 0D        .byte $0D    ; <す>
- - - - - 0x03A333 24:A323: 0F        .byte $0F    ; <そ>
- - - - - 0x03A334 24:A324: 0F        .byte $0F    ; <そ>
- D - I - 0x03A335 24:A325: 17        .byte $17    ; <ぬ>
- - - - - 0x03A336 24:A326: 11        .byte $11    ; <ち>
- - - - - 0x03A337 24:A327: 11        .byte $11    ; <ち>
- - - - - 0x03A338 24:A328: 19        .byte $19    ; <の>
- - - - - 0x03A339 24:A329: 0E        .byte $0E    ; <せ>
- - - - - 0x03A33A 24:A32A: 0D        .byte $0D    ; <す>
- - - - - 0x03A33B 24:A32B: 0F        .byte $0F    ; <そ>
- - - - - 0x03A33C 24:A32C: 0F        .byte $0F    ; <そ>
- - - - - 0x03A33D 24:A32D: 00        .byte $00
- - - - - 0x03A33E 24:A32E: 00        .byte $00
- D - I - 0x03A33F 24:A32F: 0D        .byte $0D    ; <す>
- D - I - 0x03A340 24:A330: 19        .byte $19    ; <の>
- D - I - 0x03A341 24:A331: 18        .byte $18    ; <ね>
- - - - - 0x03A342 24:A332: 09        .byte $09    ; <け>
- D - I - 0x03A343 24:A333: 11        .byte $11    ; <ち>
- - - - - 0x03A344 24:A334: 09        .byte $09    ; <け>
- D - I - 0x03A345 24:A335: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A346 24:A336: 11        .byte $11    ; <ち>
- - - - - 0x03A347 24:A337: 11        .byte $11    ; <ち>
- - - - - 0x03A348 24:A338: 19        .byte $19    ; <の>
- - - - - 0x03A349 24:A339: 0E        .byte $0E    ; <せ>
- - - - - 0x03A34A 24:A33A: 0D        .byte $0D    ; <す>
- - - - - 0x03A34B 24:A33B: 0F        .byte $0F    ; <そ>
- D - I - 0x03A34C 24:A33C: 0F        .byte $0F    ; <そ>
- - - - - 0x03A34D 24:A33D: 1B        .byte $1B    ; <ひ>
- D - I - 0x03A34E 24:A33E: 11        .byte $11    ; <ち>
- - - - - 0x03A34F 24:A33F: 0E        .byte $0E    ; <せ>
- - - - - 0x03A350 24:A340: 19        .byte $19    ; <の>
- - - - - 0x03A351 24:A341: 0E        .byte $0E    ; <せ>
- - - - - 0x03A352 24:A342: 0D        .byte $0D    ; <す>
- - - - - 0x03A353 24:A343: 0F        .byte $0F    ; <そ>
- D - I - 0x03A354 24:A344: 0F        .byte $0F    ; <そ>
- - - - - 0x03A355 24:A345: 00        .byte $00
- - - - - 0x03A356 24:A346: 00        .byte $00
- - - - - 0x03A357 24:A347: 10        .byte $10    ; <た>
- - - - - 0x03A358 24:A348: 15        .byte $15    ; <な>
- - - - - 0x03A359 24:A349: 19        .byte $19    ; <の>
- D - I - 0x03A35A 24:A34A: 06        .byte $06    ; <か>
- D - I - 0x03A35B 24:A34B: 06        .byte $06    ; <か>
- - - - - 0x03A35C 24:A34C: 05        .byte $05    ; <お>
- - - - - 0x03A35D 24:A34D: 12        .byte $12    ; <つ>
- - - - - 0x03A35E 24:A34E: 09        .byte $09    ; <け>
- - - - - 0x03A35F 24:A34F: 11        .byte $11    ; <ち>
- - - - - 0x03A360 24:A350: 06        .byte $06    ; <か>
- - - - - 0x03A361 24:A351: 04        .byte $04    ; <え>
- D - I - 0x03A362 24:A352: 03        .byte $03    ; <う>
- - - - - 0x03A363 24:A353: 05        .byte $05    ; <お>
- - - - - 0x03A364 24:A354: 04        .byte $04    ; <え>
- - - - - 0x03A365 24:A355: 12        .byte $12    ; <つ>
- D - I - 0x03A366 24:A356: 09        .byte $09    ; <け>
- - - - - 0x03A367 24:A357: 11        .byte $11    ; <ち>
- - - - - 0x03A368 24:A358: 06        .byte $06    ; <か>
- D - I - 0x03A369 24:A359: 04        .byte $04    ; <え>
- D - I - 0x03A36A 24:A35A: 03        .byte $03    ; <う>
- - - - - 0x03A36B 24:A35B: 05        .byte $05    ; <お>
- D - I - 0x03A36C 24:A35C: 04        .byte $04    ; <え>
- - - - - 0x03A36D 24:A35D: 00        .byte $00
- - - - - 0x03A36E 24:A35E: 00        .byte $00
- D - I - 0x03A36F 24:A35F: 10        .byte $10    ; <た>
- D - I - 0x03A370 24:A360: 15        .byte $15    ; <な>
- D - I - 0x03A371 24:A361: 19        .byte $19    ; <の>
- D - I - 0x03A372 24:A362: 06        .byte $06    ; <か>
- D - I - 0x03A373 24:A363: 06        .byte $06    ; <か>
- D - I - 0x03A374 24:A364: 05        .byte $05    ; <お>
- D - I - 0x03A375 24:A365: 12        .byte $12    ; <つ>
- - - - - 0x03A376 24:A366: 09        .byte $09    ; <け>
- D - I - 0x03A377 24:A367: 11        .byte $11    ; <ち>
- - - - - 0x03A378 24:A368: 06        .byte $06    ; <か>
- - - - - 0x03A379 24:A369: 04        .byte $04    ; <え>
- - - - - 0x03A37A 24:A36A: 03        .byte $03    ; <う>
- - - - - 0x03A37B 24:A36B: 04        .byte $04    ; <え>
- D - I - 0x03A37C 24:A36C: 04        .byte $04    ; <え>
- - - - - 0x03A37D 24:A36D: 12        .byte $12    ; <つ>
- - - - - 0x03A37E 24:A36E: 09        .byte $09    ; <け>
- - - - - 0x03A37F 24:A36F: 11        .byte $11    ; <ち>
- - - - - 0x03A380 24:A370: 06        .byte $06    ; <か>
- D - I - 0x03A381 24:A371: 04        .byte $04    ; <え>
- D - I - 0x03A382 24:A372: 03        .byte $03    ; <う>
- - - - - 0x03A383 24:A373: 04        .byte $04    ; <え>
- D - I - 0x03A384 24:A374: 04        .byte $04    ; <え>
- - - - - 0x03A385 24:A375: 00        .byte $00
- - - - - 0x03A386 24:A376: 00        .byte $00
- D - I - 0x03A387 24:A377: 0E        .byte $0E    ; <せ>
- D - I - 0x03A388 24:A378: 19        .byte $19    ; <の>
- D - I - 0x03A389 24:A379: 10        .byte $10    ; <た>
- - - - - 0x03A38A 24:A37A: 08        .byte $08    ; <く>
- D - I - 0x03A38B 24:A37B: 11        .byte $11    ; <ち>
- - - - - 0x03A38C 24:A37C: 09        .byte $09    ; <け>
- - - - - 0x03A38D 24:A37D: 19        .byte $19    ; <の>
- - - - - 0x03A38E 24:A37E: 11        .byte $11    ; <ち>
- - - - - 0x03A38F 24:A37F: 11        .byte $11    ; <ち>
- - - - - 0x03A390 24:A380: 17        .byte $17    ; <ぬ>
- - - - - 0x03A391 24:A381: 0C        .byte $0C    ; <し>
- - - - - 0x03A392 24:A382: 0B        .byte $0B    ; <さ>
- - - - - 0x03A393 24:A383: 0C        .byte $0C    ; <し>
- - - - - 0x03A394 24:A384: 0C        .byte $0C    ; <し>
- - - - - 0x03A395 24:A385: 19        .byte $19    ; <の>
- - - - - 0x03A396 24:A386: 11        .byte $11    ; <ち>
- D - I - 0x03A397 24:A387: 11        .byte $11    ; <ち>
- - - - - 0x03A398 24:A388: 17        .byte $17    ; <ぬ>
- - - - - 0x03A399 24:A389: 0C        .byte $0C    ; <し>
- - - - - 0x03A39A 24:A38A: 0B        .byte $0B    ; <さ>
- - - - - 0x03A39B 24:A38B: 0C        .byte $0C    ; <し>
- - - - - 0x03A39C 24:A38C: 0C        .byte $0C    ; <し>
- - - - - 0x03A39D 24:A38D: 00        .byte $00
- - - - - 0x03A39E 24:A38E: 00        .byte $00
- - - - - 0x03A39F 24:A38F: 0E        .byte $0E    ; <せ>
- D - I - 0x03A3A0 24:A390: 19        .byte $19    ; <の>
- - - - - 0x03A3A1 24:A391: 10        .byte $10    ; <た>
- D - I - 0x03A3A2 24:A392: 00        .byte $00
- D - I - 0x03A3A3 24:A393: 00        .byte $00
- - - - - 0x03A3A4 24:A394: 0A        .byte $0A    ; <こ>
- - - - - 0x03A3A5 24:A395: 18        .byte $18    ; <ね>
- - - - - 0x03A3A6 24:A396: 11        .byte $11    ; <ち>
- - - - - 0x03A3A7 24:A397: 11        .byte $11    ; <ち>
- - - - - 0x03A3A8 24:A398: 17        .byte $17    ; <ぬ>
- - - - - 0x03A3A9 24:A399: 0E        .byte $0E    ; <せ>
- - - - - 0x03A3AA 24:A39A: 0D        .byte $0D    ; <す>
- - - - - 0x03A3AB 24:A39B: 0E        .byte $0E    ; <せ>
- - - - - 0x03A3AC 24:A39C: 0C        .byte $0C    ; <し>
- - - - - 0x03A3AD 24:A39D: 11        .byte $11    ; <ち>
- - - - - 0x03A3AE 24:A39E: 11        .byte $11    ; <ち>
- - - - - 0x03A3AF 24:A39F: 11        .byte $11    ; <ち>
- - - - - 0x03A3B0 24:A3A0: 17        .byte $17    ; <ぬ>
- - - - - 0x03A3B1 24:A3A1: 10        .byte $10    ; <た>
- - - - - 0x03A3B2 24:A3A2: 0F        .byte $0F    ; <そ>
- - - - - 0x03A3B3 24:A3A3: 0E        .byte $0E    ; <せ>
- - - - - 0x03A3B4 24:A3A4: 0C        .byte $0C    ; <し>
- - - - - 0x03A3B5 24:A3A5: 00        .byte $00
- - - - - 0x03A3B6 24:A3A6: 00        .byte $00
- - - - - 0x03A3B7 24:A3A7: 13        .byte $13    ; <て>
- D - I - 0x03A3B8 24:A3A8: 15        .byte $15    ; <な>
- - - - - 0x03A3B9 24:A3A9: 1A        .byte $1A    ; <は>
- D - I - 0x03A3BA 24:A3AA: 0A        .byte $0A    ; <こ>
- D - I - 0x03A3BB 24:A3AB: 0A        .byte $0A    ; <こ>
- - - - - 0x03A3BC 24:A3AC: 07        .byte $07    ; <き>
- - - - - 0x03A3BD 24:A3AD: 15        .byte $15    ; <な>
- - - - - 0x03A3BE 24:A3AE: 09        .byte $09    ; <け>
- - - - - 0x03A3BF 24:A3AF: 11        .byte $11    ; <ち>
- - - - - 0x03A3C0 24:A3B0: 0B        .byte $0B    ; <さ>
- D - I - 0x03A3C1 24:A3B1: 04        .byte $04    ; <え>
- D - I - 0x03A3C2 24:A3B2: 03        .byte $03    ; <う>
- - - - - 0x03A3C3 24:A3B3: 04        .byte $04    ; <え>
- - - - - 0x03A3C4 24:A3B4: 04        .byte $04    ; <え>
- - - - - 0x03A3C5 24:A3B5: 15        .byte $15    ; <な>
- - - - - 0x03A3C6 24:A3B6: 09        .byte $09    ; <け>
- D - I - 0x03A3C7 24:A3B7: 11        .byte $11    ; <ち>
- - - - - 0x03A3C8 24:A3B8: 0B        .byte $0B    ; <さ>
- - - - - 0x03A3C9 24:A3B9: 04        .byte $04    ; <え>
- - - - - 0x03A3CA 24:A3BA: 03        .byte $03    ; <う>
- - - - - 0x03A3CB 24:A3BB: 04        .byte $04    ; <え>
- - - - - 0x03A3CC 24:A3BC: 04        .byte $04    ; <え>
- - - - - 0x03A3CD 24:A3BD: 00        .byte $00
- - - - - 0x03A3CE 24:A3BE: 00        .byte $00
- - - - - 0x03A3CF 24:A3BF: 13        .byte $13    ; <て>
- D - I - 0x03A3D0 24:A3C0: 15        .byte $15    ; <な>
- D - I - 0x03A3D1 24:A3C1: 1A        .byte $1A    ; <は>
- - - - - 0x03A3D2 24:A3C2: 0A        .byte $0A    ; <こ>
- D - I - 0x03A3D3 24:A3C3: 0A        .byte $0A    ; <こ>
- D - I - 0x03A3D4 24:A3C4: 07        .byte $07    ; <き>
- D - I - 0x03A3D5 24:A3C5: 15        .byte $15    ; <な>
- - - - - 0x03A3D6 24:A3C6: 09        .byte $09    ; <け>
- D - I - 0x03A3D7 24:A3C7: 11        .byte $11    ; <ち>
- - - - - 0x03A3D8 24:A3C8: 15        .byte $15    ; <な>
- - - - - 0x03A3D9 24:A3C9: 04        .byte $04    ; <え>
- - - - - 0x03A3DA 24:A3CA: 03        .byte $03    ; <う>
- - - - - 0x03A3DB 24:A3CB: 04        .byte $04    ; <え>
- D - I - 0x03A3DC 24:A3CC: 04        .byte $04    ; <え>
- - - - - 0x03A3DD 24:A3CD: 15        .byte $15    ; <な>
- - - - - 0x03A3DE 24:A3CE: 09        .byte $09    ; <け>
- - - - - 0x03A3DF 24:A3CF: 11        .byte $11    ; <ち>
- - - - - 0x03A3E0 24:A3D0: 15        .byte $15    ; <な>
- D - I - 0x03A3E1 24:A3D1: 04        .byte $04    ; <え>
- - - - - 0x03A3E2 24:A3D2: 03        .byte $03    ; <う>
- - - - - 0x03A3E3 24:A3D3: 04        .byte $04    ; <え>
- - - - - 0x03A3E4 24:A3D4: 04        .byte $04    ; <え>
- - - - - 0x03A3E5 24:A3D5: 00        .byte $00
- - - - - 0x03A3E6 24:A3D6: 00        .byte $00
- D - I - 0x03A3E7 24:A3D7: 14        .byte $14    ; <と>
- D - I - 0x03A3E8 24:A3D8: 24        .byte $24    ; <や>
- D - I - 0x03A3E9 24:A3D9: 18        .byte $18    ; <ね>
- - - - - 0x03A3EA 24:A3DA: 0B        .byte $0B    ; <さ>
- D - I - 0x03A3EB 24:A3DB: 18        .byte $18    ; <ね>
- D - I - 0x03A3EC 24:A3DC: 0B        .byte $0B    ; <さ>
- - - - - 0x03A3ED 24:A3DD: 21        .byte $21    ; <む>
- - - - - 0x03A3EE 24:A3DE: 13        .byte $13    ; <て>
- - - - - 0x03A3EF 24:A3DF: 13        .byte $13    ; <て>
- - - - - 0x03A3F0 24:A3E0: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A3F1 24:A3E1: 0E        .byte $0E    ; <せ>
- - - - - 0x03A3F2 24:A3E2: 0D        .byte $0D    ; <す>
- - - - - 0x03A3F3 24:A3E3: 0E        .byte $0E    ; <せ>
- - - - - 0x03A3F4 24:A3E4: 0E        .byte $0E    ; <せ>
- - - - - 0x03A3F5 24:A3E5: 22        .byte $22    ; <め>
- - - - - 0x03A3F6 24:A3E6: 13        .byte $13    ; <て>
- - - - - 0x03A3F7 24:A3E7: 13        .byte $13    ; <て>
- - - - - 0x03A3F8 24:A3E8: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A3F9 24:A3E9: 0E        .byte $0E    ; <せ>
- - - - - 0x03A3FA 24:A3EA: 0D        .byte $0D    ; <す>
- - - - - 0x03A3FB 24:A3EB: 0E        .byte $0E    ; <せ>
- D - I - 0x03A3FC 24:A3EC: 0E        .byte $0E    ; <せ>
- - - - - 0x03A3FD 24:A3ED: 00        .byte $00
- - - - - 0x03A3FE 24:A3EE: 00        .byte $00
- D - I - 0x03A3FF 24:A3EF: 13        .byte $13    ; <て>
- D - I - 0x03A400 24:A3F0: 1B        .byte $1B    ; <ひ>
- D - I - 0x03A401 24:A3F1: 1B        .byte $1B    ; <ひ>
- D - I - 0x03A402 24:A3F2: 0B        .byte $0B    ; <さ>
- - - - - 0x03A403 24:A3F3: 13        .byte $13    ; <て>
- - - - - 0x03A404 24:A3F4: 0B        .byte $0B    ; <さ>
- - - - - 0x03A405 24:A3F5: 1F        .byte $1F    ; <ま>
- - - - - 0x03A406 24:A3F6: 13        .byte $13    ; <て>
- - - - - 0x03A407 24:A3F7: 13        .byte $13    ; <て>
- - - - - 0x03A408 24:A3F8: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A409 24:A3F9: 0E        .byte $0E    ; <せ>
- - - - - 0x03A40A 24:A3FA: 0D        .byte $0D    ; <す>
- - - - - 0x03A40B 24:A3FB: 0E        .byte $0E    ; <せ>
- - - - - 0x03A40C 24:A3FC: 0F        .byte $0F    ; <そ>
- - - - - 0x03A40D 24:A3FD: 1F        .byte $1F    ; <ま>
- - - - - 0x03A40E 24:A3FE: 13        .byte $13    ; <て>
- - - - - 0x03A40F 24:A3FF: 13        .byte $13    ; <て>
- - - - - 0x03A410 24:A400: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A411 24:A401: 0E        .byte $0E    ; <せ>
- - - - - 0x03A412 24:A402: 0D        .byte $0D    ; <す>
- - - - - 0x03A413 24:A403: 0E        .byte $0E    ; <せ>
- - - - - 0x03A414 24:A404: 0F        .byte $0F    ; <そ>
- - - - - 0x03A415 24:A405: 00        .byte $00
- - - - - 0x03A416 24:A406: 00        .byte $00
- D - I - 0x03A417 24:A407: 13        .byte $13    ; <て>
- - - - - 0x03A418 24:A408: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A419 24:A409: 19        .byte $19    ; <の>
- D - I - 0x03A41A 24:A40A: 11        .byte $11    ; <ち>
- - - - - 0x03A41B 24:A40B: 13        .byte $13    ; <て>
- - - - - 0x03A41C 24:A40C: 15        .byte $15    ; <な>
- - - - - 0x03A41D 24:A40D: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A41E 24:A40E: 13        .byte $13    ; <て>
- - - - - 0x03A41F 24:A40F: 13        .byte $13    ; <て>
- - - - - 0x03A420 24:A410: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A421 24:A411: 0E        .byte $0E    ; <せ>
- D - I - 0x03A422 24:A412: 0D        .byte $0D    ; <す>
- - - - - 0x03A423 24:A413: 0E        .byte $0E    ; <せ>
- - - - - 0x03A424 24:A414: 0E        .byte $0E    ; <せ>
- - - - - 0x03A425 24:A415: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A426 24:A416: 13        .byte $13    ; <て>
- - - - - 0x03A427 24:A417: 13        .byte $13    ; <て>
- - - - - 0x03A428 24:A418: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A429 24:A419: 0E        .byte $0E    ; <せ>
- - - - - 0x03A42A 24:A41A: 0D        .byte $0D    ; <す>
- - - - - 0x03A42B 24:A41B: 0E        .byte $0E    ; <せ>
- - - - - 0x03A42C 24:A41C: 0E        .byte $0E    ; <せ>
- - - - - 0x03A42D 24:A41D: 00        .byte $00
- - - - - 0x03A42E 24:A41E: 00        .byte $00
- - - - - 0x03A42F 24:A41F: 0F        .byte $0F    ; <そ>
- D - I - 0x03A430 24:A420: 19        .byte $19    ; <の>
- - - - - 0x03A431 24:A421: 1D        .byte $1D    ; <へ>
- - - - - 0x03A432 24:A422: 0A        .byte $0A    ; <こ>
- - - - - 0x03A433 24:A423: 0A        .byte $0A    ; <こ>
- D - I - 0x03A434 24:A424: 05        .byte $05    ; <お>
- - - - - 0x03A435 24:A425: 11        .byte $11    ; <ち>
- - - - - 0x03A436 24:A426: 0D        .byte $0D    ; <す>
- - - - - 0x03A437 24:A427: 15        .byte $15    ; <な>
- - - - - 0x03A438 24:A428: 0F        .byte $0F    ; <そ>
- D - I - 0x03A439 24:A429: 08        .byte $08    ; <く>
- - - - - 0x03A43A 24:A42A: 07        .byte $07    ; <き>
- - - - - 0x03A43B 24:A42B: 08        .byte $08    ; <く>
- - - - - 0x03A43C 24:A42C: 08        .byte $08    ; <く>
- - - - - 0x03A43D 24:A42D: 11        .byte $11    ; <ち>
- - - - - 0x03A43E 24:A42E: 0D        .byte $0D    ; <す>
- - - - - 0x03A43F 24:A42F: 15        .byte $15    ; <な>
- - - - - 0x03A440 24:A430: 0F        .byte $0F    ; <そ>
- - - - - 0x03A441 24:A431: 08        .byte $08    ; <く>
- D - I - 0x03A442 24:A432: 07        .byte $07    ; <き>
- - - - - 0x03A443 24:A433: 08        .byte $08    ; <く>
- - - - - 0x03A444 24:A434: 08        .byte $08    ; <く>
- - - - - 0x03A445 24:A435: 00        .byte $00
- - - - - 0x03A446 24:A436: 00        .byte $00
- D - I - 0x03A447 24:A437: 0F        .byte $0F    ; <そ>
- D - I - 0x03A448 24:A438: 19        .byte $19    ; <の>
- D - I - 0x03A449 24:A439: 1D        .byte $1D    ; <へ>
- D - I - 0x03A44A 24:A43A: 0A        .byte $0A    ; <こ>
- D - I - 0x03A44B 24:A43B: 0A        .byte $0A    ; <こ>
- D - I - 0x03A44C 24:A43C: 05        .byte $05    ; <お>
- D - I - 0x03A44D 24:A43D: 11        .byte $11    ; <ち>
- - - - - 0x03A44E 24:A43E: 0D        .byte $0D    ; <す>
- - - - - 0x03A44F 24:A43F: 15        .byte $15    ; <な>
- - - - - 0x03A450 24:A440: 0F        .byte $0F    ; <そ>
- - - - - 0x03A451 24:A441: 08        .byte $08    ; <く>
- - - - - 0x03A452 24:A442: 07        .byte $07    ; <き>
- - - - - 0x03A453 24:A443: 08        .byte $08    ; <く>
- - - - - 0x03A454 24:A444: 08        .byte $08    ; <く>
- D - I - 0x03A455 24:A445: 11        .byte $11    ; <ち>
- - - - - 0x03A456 24:A446: 0D        .byte $0D    ; <す>
- - - - - 0x03A457 24:A447: 15        .byte $15    ; <な>
- D - I - 0x03A458 24:A448: 0F        .byte $0F    ; <そ>
- - - - - 0x03A459 24:A449: 08        .byte $08    ; <く>
- D - I - 0x03A45A 24:A44A: 07        .byte $07    ; <き>
- - - - - 0x03A45B 24:A44B: 08        .byte $08    ; <く>
- D - I - 0x03A45C 24:A44C: 08        .byte $08    ; <く>
- - - - - 0x03A45D 24:A44D: 00        .byte $00
- - - - - 0x03A45E 24:A44E: 00        .byte $00
- D - I - 0x03A45F 24:A44F: 12        .byte $12    ; <つ>
- D - I - 0x03A460 24:A450: 1E        .byte $1E    ; <ほ>
- D - I - 0x03A461 24:A451: 1C        .byte $1C    ; <ふ>
- D - I - 0x03A462 24:A452: 03        .byte $03    ; <う>
- D - I - 0x03A463 24:A453: 03        .byte $03    ; <う>
- - - - - 0x03A464 24:A454: 0A        .byte $0A    ; <こ>
- D - I - 0x03A465 24:A455: 1A        .byte $1A    ; <は>
- - - - - 0x03A466 24:A456: 15        .byte $15    ; <な>
- - - - - 0x03A467 24:A457: 15        .byte $15    ; <な>
- - - - - 0x03A468 24:A458: 20        .byte $20    ; <み>
- - - - - 0x03A469 24:A459: 14        .byte $14    ; <と>
- - - - - 0x03A46A 24:A45A: 19        .byte $19    ; <の>
- - - - - 0x03A46B 24:A45B: 14        .byte $14    ; <と>
- - - - - 0x03A46C 24:A45C: 10        .byte $10    ; <た>
- - - - - 0x03A46D 24:A45D: 1A        .byte $1A    ; <は>
- - - - - 0x03A46E 24:A45E: 15        .byte $15    ; <な>
- D - I - 0x03A46F 24:A45F: 15        .byte $15    ; <な>
- - - - - 0x03A470 24:A460: 20        .byte $20    ; <み>
- - - - - 0x03A471 24:A461: 14        .byte $14    ; <と>
- - - - - 0x03A472 24:A462: 19        .byte $19    ; <の>
- - - - - 0x03A473 24:A463: 14        .byte $14    ; <と>
- - - - - 0x03A474 24:A464: 10        .byte $10    ; <た>
- - - - - 0x03A475 24:A465: 00        .byte $00
- - - - - 0x03A476 24:A466: 00        .byte $00
- D - I - 0x03A477 24:A467: 12        .byte $12    ; <つ>
- D - I - 0x03A478 24:A468: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A479 24:A469: 24        .byte $24    ; <や>
- - - - - 0x03A47A 24:A46A: 0C        .byte $0C    ; <し>
- - - - - 0x03A47B 24:A46B: 19        .byte $19    ; <の>
- D - I - 0x03A47C 24:A46C: 0A        .byte $0A    ; <こ>
- D - I - 0x03A47D 24:A46D: 19        .byte $19    ; <の>
- - - - - 0x03A47E 24:A46E: 15        .byte $15    ; <な>
- - - - - 0x03A47F 24:A46F: 15        .byte $15    ; <な>
- - - - - 0x03A480 24:A470: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A481 24:A471: 0E        .byte $0E    ; <せ>
- - - - - 0x03A482 24:A472: 0B        .byte $0B    ; <さ>
- - - - - 0x03A483 24:A473: 0E        .byte $0E    ; <せ>
- - - - - 0x03A484 24:A474: 0E        .byte $0E    ; <せ>
- - - - - 0x03A485 24:A475: 19        .byte $19    ; <の>
- - - - - 0x03A486 24:A476: 15        .byte $15    ; <な>
- - - - - 0x03A487 24:A477: 15        .byte $15    ; <な>
- - - - - 0x03A488 24:A478: 1C        .byte $1C    ; <ふ>
- - - - - 0x03A489 24:A479: 0E        .byte $0E    ; <せ>
- - - - - 0x03A48A 24:A47A: 0B        .byte $0B    ; <さ>
- - - - - 0x03A48B 24:A47B: 0E        .byte $0E    ; <せ>
- - - - - 0x03A48C 24:A47C: 0E        .byte $0E    ; <せ>
- - - - - 0x03A48D 24:A47D: 00        .byte $00
- - - - - 0x03A48E 24:A47E: 00        .byte $00
- D - I - 0x03A48F 24:A47F: 11        .byte $11    ; <ち>
- D - I - 0x03A490 24:A480: 1B        .byte $1B    ; <ひ>
- D - I - 0x03A491 24:A481: 20        .byte $20    ; <み>
- D - I - 0x03A492 24:A482: 0E        .byte $0E    ; <せ>
- D - I - 0x03A493 24:A483: 0E        .byte $0E    ; <せ>
- - - - - 0x03A494 24:A484: 0C        .byte $0C    ; <し>
- - - - - 0x03A495 24:A485: 13        .byte $13    ; <て>
- - - - - 0x03A496 24:A486: 0F        .byte $0F    ; <そ>
- - - - - 0x03A497 24:A487: 17        .byte $17    ; <ぬ>
- - - - - 0x03A498 24:A488: 11        .byte $11    ; <ち>
- - - - - 0x03A499 24:A489: 0A        .byte $0A    ; <こ>
- - - - - 0x03A49A 24:A48A: 09        .byte $09    ; <け>
- - - - - 0x03A49B 24:A48B: 0A        .byte $0A    ; <こ>
- - - - - 0x03A49C 24:A48C: 0A        .byte $0A    ; <こ>
- - - - - 0x03A49D 24:A48D: 13        .byte $13    ; <て>
- - - - - 0x03A49E 24:A48E: 0F        .byte $0F    ; <そ>
- - - - - 0x03A49F 24:A48F: 17        .byte $17    ; <ぬ>
- - - - - 0x03A4A0 24:A490: 11        .byte $11    ; <ち>
- - - - - 0x03A4A1 24:A491: 0A        .byte $0A    ; <こ>
- - - - - 0x03A4A2 24:A492: 09        .byte $09    ; <け>
- - - - - 0x03A4A3 24:A493: 0A        .byte $0A    ; <こ>
- - - - - 0x03A4A4 24:A494: 0A        .byte $0A    ; <こ>
- - - - - 0x03A4A5 24:A495: 00        .byte $00
- - - - - 0x03A4A6 24:A496: 00        .byte $00
- - - - - 0x03A4A7 24:A497: 13        .byte $13    ; <て>
- D - I - 0x03A4A8 24:A498: 1D        .byte $1D    ; <へ>
- - - - - 0x03A4A9 24:A499: 22        .byte $22    ; <め>
- D - I - 0x03A4AA 24:A49A: 0E        .byte $0E    ; <せ>
- D - I - 0x03A4AB 24:A49B: 0E        .byte $0E    ; <せ>
- - - - - 0x03A4AC 24:A49C: 0C        .byte $0C    ; <し>
- - - - - 0x03A4AD 24:A49D: 15        .byte $15    ; <な>
- - - - - 0x03A4AE 24:A49E: 0F        .byte $0F    ; <そ>
- - - - - 0x03A4AF 24:A49F: 17        .byte $17    ; <ぬ>
- D - I - 0x03A4B0 24:A4A0: 11        .byte $11    ; <ち>
- - - - - 0x03A4B1 24:A4A1: 0A        .byte $0A    ; <こ>
- D - I - 0x03A4B2 24:A4A2: 09        .byte $09    ; <け>
- - - - - 0x03A4B3 24:A4A3: 0A        .byte $0A    ; <こ>
- - - - - 0x03A4B4 24:A4A4: 0A        .byte $0A    ; <こ>
- D - I - 0x03A4B5 24:A4A5: 15        .byte $15    ; <な>
- - - - - 0x03A4B6 24:A4A6: 0F        .byte $0F    ; <そ>
- - - - - 0x03A4B7 24:A4A7: 17        .byte $17    ; <ぬ>
- - - - - 0x03A4B8 24:A4A8: 11        .byte $11    ; <ち>
- - - - - 0x03A4B9 24:A4A9: 0A        .byte $0A    ; <こ>
- - - - - 0x03A4BA 24:A4AA: 09        .byte $09    ; <け>
- - - - - 0x03A4BB 24:A4AB: 0A        .byte $0A    ; <こ>
- D - I - 0x03A4BC 24:A4AC: 0A        .byte $0A    ; <こ>
- - - - - 0x03A4BD 24:A4AD: 00        .byte $00
- - - - - 0x03A4BE 24:A4AE: 00        .byte $00
- D - I - 0x03A4BF 24:A4AF: 16        .byte $16    ; <に>
- D - I - 0x03A4C0 24:A4B0: 24        .byte $24    ; <や>
- D - I - 0x03A4C1 24:A4B1: 24        .byte $24    ; <や>
- - - - - 0x03A4C2 24:A4B2: 00        .byte $00
- D - I - 0x03A4C3 24:A4B3: 00        .byte $00
- D - I - 0x03A4C4 24:A4B4: 00        .byte $00
- - - - - 0x03A4C5 24:A4B5: 16        .byte $16    ; <に>
- D - I - 0x03A4C6 24:A4B6: 17        .byte $17    ; <ぬ>
- D - I - 0x03A4C7 24:A4B7: 17        .byte $17    ; <ぬ>
- - - - - 0x03A4C8 24:A4B8: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A4C9 24:A4B9: 10        .byte $10    ; <た>
- - - - - 0x03A4CA 24:A4BA: 16        .byte $16    ; <に>
- - - - - 0x03A4CB 24:A4BB: 10        .byte $10    ; <た>
- - - - - 0x03A4CC 24:A4BC: 10        .byte $10    ; <た>
- - - - - 0x03A4CD 24:A4BD: 16        .byte $16    ; <に>
- - - - - 0x03A4CE 24:A4BE: 17        .byte $17    ; <ぬ>
- D - I - 0x03A4CF 24:A4BF: 17        .byte $17    ; <ぬ>
- - - - - 0x03A4D0 24:A4C0: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A4D1 24:A4C1: 10        .byte $10    ; <た>
- - - - - 0x03A4D2 24:A4C2: 16        .byte $16    ; <に>
- - - - - 0x03A4D3 24:A4C3: 10        .byte $10    ; <た>
- D - I - 0x03A4D4 24:A4C4: 10        .byte $10    ; <た>
- - - - - 0x03A4D5 24:A4C5: 00        .byte $00
- - - - - 0x03A4D6 24:A4C6: 00        .byte $00
- D - I - 0x03A4D7 24:A4C7: 0F        .byte $0F    ; <そ>
- D - I - 0x03A4D8 24:A4C8: 21        .byte $21    ; <む>
- D - I - 0x03A4D9 24:A4C9: 27        .byte $27    ; <ら>
- D - I - 0x03A4DA 24:A4CA: 10        .byte $10    ; <た>
- D - I - 0x03A4DB 24:A4CB: 10        .byte $10    ; <た>
- D - I - 0x03A4DC 24:A4CC: 0D        .byte $0D    ; <す>
- D - I - 0x03A4DD 24:A4CD: 11        .byte $11    ; <ち>
- D - I - 0x03A4DE 24:A4CE: 11        .byte $11    ; <ち>
- - - - - 0x03A4DF 24:A4CF: 19        .byte $19    ; <の>
- - - - - 0x03A4E0 24:A4D0: 13        .byte $13    ; <て>
- D - I - 0x03A4E1 24:A4D1: 0C        .byte $0C    ; <し>
- D - I - 0x03A4E2 24:A4D2: 0B        .byte $0B    ; <さ>
- - - - - 0x03A4E3 24:A4D3: 0C        .byte $0C    ; <し>
- - - - - 0x03A4E4 24:A4D4: 0C        .byte $0C    ; <し>
- - - - - 0x03A4E5 24:A4D5: 11        .byte $11    ; <ち>
- D - I - 0x03A4E6 24:A4D6: 11        .byte $11    ; <ち>
- D - I - 0x03A4E7 24:A4D7: 19        .byte $19    ; <の>
- - - - - 0x03A4E8 24:A4D8: 13        .byte $13    ; <て>
- D - I - 0x03A4E9 24:A4D9: 0C        .byte $0C    ; <し>
- - - - - 0x03A4EA 24:A4DA: 0B        .byte $0B    ; <さ>
- - - - - 0x03A4EB 24:A4DB: 0C        .byte $0C    ; <し>
- - - - - 0x03A4EC 24:A4DC: 0C        .byte $0C    ; <し>
- - - - - 0x03A4ED 24:A4DD: 00        .byte $00
- - - - - 0x03A4EE 24:A4DE: 00        .byte $00
- D - I - 0x03A4EF 24:A4DF: 0F        .byte $0F    ; <そ>
- D - I - 0x03A4F0 24:A4E0: 23        .byte $23    ; <も>
- D - I - 0x03A4F1 24:A4E1: 28        .byte $28    ; <り>
- - - - - 0x03A4F2 24:A4E2: 10        .byte $10    ; <た>
- D - I - 0x03A4F3 24:A4E3: 10        .byte $10    ; <た>
- - - - - 0x03A4F4 24:A4E4: 0D        .byte $0D    ; <す>
- - - - - 0x03A4F5 24:A4E5: 11        .byte $11    ; <ち>
- - - - - 0x03A4F6 24:A4E6: 11        .byte $11    ; <ち>
- D - I - 0x03A4F7 24:A4E7: 19        .byte $19    ; <の>
- D - I - 0x03A4F8 24:A4E8: 13        .byte $13    ; <て>
- - - - - 0x03A4F9 24:A4E9: 0C        .byte $0C    ; <し>
- - - - - 0x03A4FA 24:A4EA: 0B        .byte $0B    ; <さ>
- - - - - 0x03A4FB 24:A4EB: 0C        .byte $0C    ; <し>
- - - - - 0x03A4FC 24:A4EC: 0C        .byte $0C    ; <し>
- - - - - 0x03A4FD 24:A4ED: 11        .byte $11    ; <ち>
- D - I - 0x03A4FE 24:A4EE: 11        .byte $11    ; <ち>
- D - I - 0x03A4FF 24:A4EF: 19        .byte $19    ; <の>
- D - I - 0x03A500 24:A4F0: 13        .byte $13    ; <て>
- - - - - 0x03A501 24:A4F1: 0C        .byte $0C    ; <し>
- - - - - 0x03A502 24:A4F2: 0B        .byte $0B    ; <さ>
- - - - - 0x03A503 24:A4F3: 0C        .byte $0C    ; <し>
- - - - - 0x03A504 24:A4F4: 0C        .byte $0C    ; <し>
- - - - - 0x03A505 24:A4F5: 00        .byte $00
- - - - - 0x03A506 24:A4F6: 00        .byte $00
- D - I - 0x03A507 24:A4F7: 15        .byte $15    ; <な>
- D - I - 0x03A508 24:A4F8: 0D        .byte $0D    ; <す>
- D - I - 0x03A509 24:A4F9: 2D        .byte $2D    ; <を>
- - - - - 0x03A50A 24:A4FA: 15        .byte $15    ; <な>
- D - I - 0x03A50B 24:A4FB: 02        .byte $02    ; <い>
- - - - - 0x03A50C 24:A4FC: 10        .byte $10    ; <た>
- D - I - 0x03A50D 24:A4FD: 14        .byte $14    ; <と>
- - - - - 0x03A50E 24:A4FE: 19        .byte $19    ; <の>
- - - - - 0x03A50F 24:A4FF: 19        .byte $19    ; <の>
- - - - - 0x03A510 24:A500: 20        .byte $20    ; <み>
- - - - - 0x03A511 24:A501: 12        .byte $12    ; <つ>
- - - - - 0x03A512 24:A502: 18        .byte $18    ; <ね>
- - - - - 0x03A513 24:A503: 12        .byte $12    ; <つ>
- - - - - 0x03A514 24:A504: 12        .byte $12    ; <つ>
- D - I - 0x03A515 24:A505: 14        .byte $14    ; <と>
- - - - - 0x03A516 24:A506: 19        .byte $19    ; <の>
- - - - - 0x03A517 24:A507: 19        .byte $19    ; <の>
- - - - - 0x03A518 24:A508: 20        .byte $20    ; <み>
- - - - - 0x03A519 24:A509: 12        .byte $12    ; <つ>
- - - - - 0x03A51A 24:A50A: 18        .byte $18    ; <ね>
- - - - - 0x03A51B 24:A50B: 12        .byte $12    ; <つ>
- - - - - 0x03A51C 24:A50C: 12        .byte $12    ; <つ>
- - - - - 0x03A51D 24:A50D: 00        .byte $00
- - - - - 0x03A51E 24:A50E: 00        .byte $00
- - - - - 0x03A51F 24:A50F: 13        .byte $13    ; <て>
- D - I - 0x03A520 24:A510: 24        .byte $24    ; <や>
- D - I - 0x03A521 24:A511: 2A        .byte $2A    ; <れ>
- D - I - 0x03A522 24:A512: 13        .byte $13    ; <て>
- - - - - 0x03A523 24:A513: 13        .byte $13    ; <て>
- D - I - 0x03A524 24:A514: 0D        .byte $0D    ; <す>
- - - - - 0x03A525 24:A515: 15        .byte $15    ; <な>
- D - I - 0x03A526 24:A516: 15        .byte $15    ; <な>
- - - - - 0x03A527 24:A517: 1D        .byte $1D    ; <へ>
- - - - - 0x03A528 24:A518: 17        .byte $17    ; <ぬ>
- - - - - 0x03A529 24:A519: 10        .byte $10    ; <た>
- - - - - 0x03A52A 24:A51A: 0F        .byte $0F    ; <そ>
- - - - - 0x03A52B 24:A51B: 10        .byte $10    ; <た>
- - - - - 0x03A52C 24:A51C: 10        .byte $10    ; <た>
- - - - - 0x03A52D 24:A51D: 15        .byte $15    ; <な>
- - - - - 0x03A52E 24:A51E: 15        .byte $15    ; <な>
- - - - - 0x03A52F 24:A51F: 1D        .byte $1D    ; <へ>
- - - - - 0x03A530 24:A520: 17        .byte $17    ; <ぬ>
- - - - - 0x03A531 24:A521: 10        .byte $10    ; <た>
- - - - - 0x03A532 24:A522: 0F        .byte $0F    ; <そ>
- - - - - 0x03A533 24:A523: 10        .byte $10    ; <た>
- - - - - 0x03A534 24:A524: 10        .byte $10    ; <た>
- - - - - 0x03A535 24:A525: 00        .byte $00
- - - - - 0x03A536 24:A526: 00        .byte $00
- D - I - 0x03A537 24:A527: 15        .byte $15    ; <な>
- D - I - 0x03A538 24:A528: 26        .byte $26    ; <よ>
- D - I - 0x03A539 24:A529: 2C        .byte $2C    ; <わ>
- - - - - 0x03A53A 24:A52A: 13        .byte $13    ; <て>
- D - I - 0x03A53B 24:A52B: 13        .byte $13    ; <て>
- - - - - 0x03A53C 24:A52C: 0D        .byte $0D    ; <す>
- D - I - 0x03A53D 24:A52D: 17        .byte $17    ; <ぬ>
- - - - - 0x03A53E 24:A52E: 15        .byte $15    ; <な>
- - - - - 0x03A53F 24:A52F: 1D        .byte $1D    ; <へ>
- D - I - 0x03A540 24:A530: 17        .byte $17    ; <ぬ>
- - - - - 0x03A541 24:A531: 10        .byte $10    ; <た>
- - - - - 0x03A542 24:A532: 0F        .byte $0F    ; <そ>
- - - - - 0x03A543 24:A533: 10        .byte $10    ; <た>
- D - I - 0x03A544 24:A534: 10        .byte $10    ; <た>
- D - I - 0x03A545 24:A535: 17        .byte $17    ; <ぬ>
- D - I - 0x03A546 24:A536: 15        .byte $15    ; <な>
- - - - - 0x03A547 24:A537: 1D        .byte $1D    ; <へ>
- - - - - 0x03A548 24:A538: 17        .byte $17    ; <ぬ>
- - - - - 0x03A549 24:A539: 10        .byte $10    ; <た>
- - - - - 0x03A54A 24:A53A: 0F        .byte $0F    ; <そ>
- - - - - 0x03A54B 24:A53B: 10        .byte $10    ; <た>
- - - - - 0x03A54C 24:A53C: 10        .byte $10    ; <た>
- - - - - 0x03A54D 24:A53D: 00        .byte $00
- - - - - 0x03A54E 24:A53E: 00        .byte $00
- D - I - 0x03A54F 24:A53F: 29        .byte $29    ; <る>
- D - I - 0x03A550 24:A540: 3C        .byte $3C    ; <9>
- D - I - 0x03A551 24:A541: 3C        .byte $3C    ; <9>
- - - - - 0x03A552 24:A542: 28        .byte $28    ; <り>
- - - - - 0x03A553 24:A543: 28        .byte $28    ; <り>
- D - I - 0x03A554 24:A544: 22        .byte $22    ; <め>
- D - I - 0x03A555 24:A545: 30        .byte $30    ; <ゃ>
- - - - - 0x03A556 24:A546: 21        .byte $21    ; <む>
- D - I - 0x03A557 24:A547: 21        .byte $21    ; <む>
- - - - - 0x03A558 24:A548: 28        .byte $28    ; <り>
- - - - - 0x03A559 24:A549: 1A        .byte $1A    ; <は>
- - - - - 0x03A55A 24:A54A: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A55B 24:A54B: 1A        .byte $1A    ; <は>
- D - I - 0x03A55C 24:A54C: 1A        .byte $1A    ; <は>
- - - - - 0x03A55D 24:A54D: 30        .byte $30    ; <ゃ>
- - - - - 0x03A55E 24:A54E: 21        .byte $21    ; <む>
- - - - - 0x03A55F 24:A54F: 21        .byte $21    ; <む>
- - - - - 0x03A560 24:A550: 28        .byte $28    ; <り>
- - - - - 0x03A561 24:A551: 1A        .byte $1A    ; <は>
- - - - - 0x03A562 24:A552: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A563 24:A553: 1A        .byte $1A    ; <は>
- - - - - 0x03A564 24:A554: 1A        .byte $1A    ; <は>
- - - - - 0x03A565 24:A555: 00        .byte $00
- - - - - 0x03A566 24:A556: 00        .byte $00
- - - - - 0x03A567 24:A557: 13        .byte $13    ; <て>
- D - I - 0x03A568 24:A558: 24        .byte $24    ; <や>
- - - - - 0x03A569 24:A559: 2A        .byte $2A    ; <れ>
- D - I - 0x03A56A 24:A55A: 12        .byte $12    ; <つ>
- D - I - 0x03A56B 24:A55B: 12        .byte $12    ; <つ>
- D - I - 0x03A56C 24:A55C: 10        .byte $10    ; <た>
- - - - - 0x03A56D 24:A55D: 15        .byte $15    ; <な>
- - - - - 0x03A56E 24:A55E: 15        .byte $15    ; <な>
- - - - - 0x03A56F 24:A55F: 1D        .byte $1D    ; <へ>
- - - - - 0x03A570 24:A560: 17        .byte $17    ; <ぬ>
- D - I - 0x03A571 24:A561: 10        .byte $10    ; <た>
- - - - - 0x03A572 24:A562: 0F        .byte $0F    ; <そ>
- - - - - 0x03A573 24:A563: 10        .byte $10    ; <た>
- - - - - 0x03A574 24:A564: 10        .byte $10    ; <た>
- - - - - 0x03A575 24:A565: 15        .byte $15    ; <な>
- - - - - 0x03A576 24:A566: 15        .byte $15    ; <な>
- D - I - 0x03A577 24:A567: 1D        .byte $1D    ; <へ>
- - - - - 0x03A578 24:A568: 17        .byte $17    ; <ぬ>
- D - I - 0x03A579 24:A569: 10        .byte $10    ; <た>
- - - - - 0x03A57A 24:A56A: 0F        .byte $0F    ; <そ>
- - - - - 0x03A57B 24:A56B: 10        .byte $10    ; <た>
- D - I - 0x03A57C 24:A56C: 10        .byte $10    ; <た>
- - - - - 0x03A57D 24:A56D: 00        .byte $00
- - - - - 0x03A57E 24:A56E: 00        .byte $00
- D - I - 0x03A57F 24:A56F: 15        .byte $15    ; <な>
- D - I - 0x03A580 24:A570: 26        .byte $26    ; <よ>
- D - I - 0x03A581 24:A571: 2C        .byte $2C    ; <わ>
- D - I - 0x03A582 24:A572: 12        .byte $12    ; <つ>
- D - I - 0x03A583 24:A573: 12        .byte $12    ; <つ>
- D - I - 0x03A584 24:A574: 10        .byte $10    ; <た>
- - - - - 0x03A585 24:A575: 17        .byte $17    ; <ぬ>
- - - - - 0x03A586 24:A576: 15        .byte $15    ; <な>
- - - - - 0x03A587 24:A577: 1D        .byte $1D    ; <へ>
- - - - - 0x03A588 24:A578: 17        .byte $17    ; <ぬ>
- - - - - 0x03A589 24:A579: 10        .byte $10    ; <た>
- - - - - 0x03A58A 24:A57A: 0F        .byte $0F    ; <そ>
- - - - - 0x03A58B 24:A57B: 10        .byte $10    ; <た>
- - - - - 0x03A58C 24:A57C: 10        .byte $10    ; <た>
- D - I - 0x03A58D 24:A57D: 17        .byte $17    ; <ぬ>
- - - - - 0x03A58E 24:A57E: 15        .byte $15    ; <な>
- D - I - 0x03A58F 24:A57F: 1D        .byte $1D    ; <へ>
- - - - - 0x03A590 24:A580: 17        .byte $17    ; <ぬ>
- - - - - 0x03A591 24:A581: 10        .byte $10    ; <た>
- - - - - 0x03A592 24:A582: 0F        .byte $0F    ; <そ>
- - - - - 0x03A593 24:A583: 10        .byte $10    ; <た>
- D - I - 0x03A594 24:A584: 10        .byte $10    ; <た>
- - - - - 0x03A595 24:A585: 00        .byte $00
- - - - - 0x03A596 24:A586: 01        .byte $01    ; <あ>
- D - I - 0x03A597 24:A587: 15        .byte $15    ; <な>
- D - I - 0x03A598 24:A588: 31        .byte $31    ; <ゅ>
- D - I - 0x03A599 24:A589: 32        .byte $32    ; <ょ>
- - - - - 0x03A59A 24:A58A: 1A        .byte $1A    ; <は>
- D - I - 0x03A59B 24:A58B: 1A        .byte $1A    ; <は>
- - - - - 0x03A59C 24:A58C: 14        .byte $14    ; <と>
- - - - - 0x03A59D 24:A58D: 17        .byte $17    ; <ぬ>
- - - - - 0x03A59E 24:A58E: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A59F 24:A58F: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A5A0 24:A590: 22        .byte $22    ; <め>
- - - - - 0x03A5A1 24:A591: 16        .byte $16    ; <に>
- - - - - 0x03A5A2 24:A592: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A5A3 24:A593: 16        .byte $16    ; <に>
- D - I - 0x03A5A4 24:A594: 16        .byte $16    ; <に>
- - - - - 0x03A5A5 24:A595: 17        .byte $17    ; <ぬ>
- - - - - 0x03A5A6 24:A596: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A5A7 24:A597: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A5A8 24:A598: 22        .byte $22    ; <め>
- - - - - 0x03A5A9 24:A599: 16        .byte $16    ; <に>
- - - - - 0x03A5AA 24:A59A: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A5AB 24:A59B: 16        .byte $16    ; <に>
- D - I - 0x03A5AC 24:A59C: 16        .byte $16    ; <に>
- - - - - 0x03A5AD 24:A59D: 00        .byte $00
- - - - - 0x03A5AE 24:A59E: 00        .byte $00
- - - - - 0x03A5AF 24:A59F: 12        .byte $12    ; <つ>
- D - I - 0x03A5B0 24:A5A0: 25        .byte $25    ; <ゆ>
- - - - - 0x03A5B1 24:A5A1: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A5B2 24:A5A2: 12        .byte $12    ; <つ>
- - - - - 0x03A5B3 24:A5A3: 12        .byte $12    ; <つ>
- D - I - 0x03A5B4 24:A5A4: 10        .byte $10    ; <た>
- - - - - 0x03A5B5 24:A5A5: 15        .byte $15    ; <な>
- - - - - 0x03A5B6 24:A5A6: 17        .byte $17    ; <ぬ>
- - - - - 0x03A5B7 24:A5A7: 20        .byte $20    ; <み>
- - - - - 0x03A5B8 24:A5A8: 19        .byte $19    ; <の>
- - - - - 0x03A5B9 24:A5A9: 12        .byte $12    ; <つ>
- - - - - 0x03A5BA 24:A5AA: 11        .byte $11    ; <ち>
- - - - - 0x03A5BB 24:A5AB: 12        .byte $12    ; <つ>
- - - - - 0x03A5BC 24:A5AC: 10        .byte $10    ; <た>
- - - - - 0x03A5BD 24:A5AD: 15        .byte $15    ; <な>
- - - - - 0x03A5BE 24:A5AE: 17        .byte $17    ; <ぬ>
- - - - - 0x03A5BF 24:A5AF: 20        .byte $20    ; <み>
- - - - - 0x03A5C0 24:A5B0: 19        .byte $19    ; <の>
- D - I - 0x03A5C1 24:A5B1: 12        .byte $12    ; <つ>
- D - I - 0x03A5C2 24:A5B2: 11        .byte $11    ; <ち>
- - - - - 0x03A5C3 24:A5B3: 12        .byte $12    ; <つ>
- D - I - 0x03A5C4 24:A5B4: 10        .byte $10    ; <た>
- - - - - 0x03A5C5 24:A5B5: 00        .byte $00
- - - - - 0x03A5C6 24:A5B6: 00        .byte $00
- D - I - 0x03A5C7 24:A5B7: 12        .byte $12    ; <つ>
- D - I - 0x03A5C8 24:A5B8: 25        .byte $25    ; <ゆ>
- - - - - 0x03A5C9 24:A5B9: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A5CA 24:A5BA: 12        .byte $12    ; <つ>
- D - I - 0x03A5CB 24:A5BB: 12        .byte $12    ; <つ>
- D - I - 0x03A5CC 24:A5BC: 10        .byte $10    ; <た>
- D - I - 0x03A5CD 24:A5BD: 15        .byte $15    ; <な>
- - - - - 0x03A5CE 24:A5BE: 17        .byte $17    ; <ぬ>
- - - - - 0x03A5CF 24:A5BF: 20        .byte $20    ; <み>
- - - - - 0x03A5D0 24:A5C0: 19        .byte $19    ; <の>
- D - I - 0x03A5D1 24:A5C1: 12        .byte $12    ; <つ>
- - - - - 0x03A5D2 24:A5C2: 11        .byte $11    ; <ち>
- - - - - 0x03A5D3 24:A5C3: 12        .byte $12    ; <つ>
- - - - - 0x03A5D4 24:A5C4: 10        .byte $10    ; <た>
- D - I - 0x03A5D5 24:A5C5: 15        .byte $15    ; <な>
- - - - - 0x03A5D6 24:A5C6: 17        .byte $17    ; <ぬ>
- D - I - 0x03A5D7 24:A5C7: 20        .byte $20    ; <み>
- - - - - 0x03A5D8 24:A5C8: 19        .byte $19    ; <の>
- - - - - 0x03A5D9 24:A5C9: 12        .byte $12    ; <つ>
- - - - - 0x03A5DA 24:A5CA: 11        .byte $11    ; <ち>
- - - - - 0x03A5DB 24:A5CB: 12        .byte $12    ; <つ>
- D - I - 0x03A5DC 24:A5CC: 10        .byte $10    ; <た>
- - - - - 0x03A5DD 24:A5CD: 00        .byte $00
- - - - - 0x03A5DE 24:A5CE: 00        .byte $00
- D - I - 0x03A5DF 24:A5CF: 1D        .byte $1D    ; <へ>
- D - I - 0x03A5E0 24:A5D0: 2D        .byte $2D    ; <を>
- D - I - 0x03A5E1 24:A5D1: 27        .byte $27    ; <ら>
- - - - - 0x03A5E2 24:A5D2: 18        .byte $18    ; <ね>
- D - I - 0x03A5E3 24:A5D3: 07        .byte $07    ; <き>
- D - I - 0x03A5E4 24:A5D4: 15        .byte $15    ; <な>
- D - I - 0x03A5E5 24:A5D5: 25        .byte $25    ; <ゆ>
- - - - - 0x03A5E6 24:A5D6: 1E        .byte $1E    ; <ほ>
- D - I - 0x03A5E7 24:A5D7: 21        .byte $21    ; <む>
- - - - - 0x03A5E8 24:A5D8: 26        .byte $26    ; <よ>
- - - - - 0x03A5E9 24:A5D9: 1A        .byte $1A    ; <は>
- - - - - 0x03A5EA 24:A5DA: 22        .byte $22    ; <め>
- - - - - 0x03A5EB 24:A5DB: 1A        .byte $1A    ; <は>
- - - - - 0x03A5EC 24:A5DC: 1A        .byte $1A    ; <は>
- - - - - 0x03A5ED 24:A5DD: 18        .byte $18    ; <ね>
- - - - - 0x03A5EE 24:A5DE: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A5EF 24:A5DF: 21        .byte $21    ; <む>
- - - - - 0x03A5F0 24:A5E0: 26        .byte $26    ; <よ>
- - - - - 0x03A5F1 24:A5E1: 1A        .byte $1A    ; <は>
- - - - - 0x03A5F2 24:A5E2: 22        .byte $22    ; <め>
- - - - - 0x03A5F3 24:A5E3: 1A        .byte $1A    ; <は>
- - - - - 0x03A5F4 24:A5E4: 1A        .byte $1A    ; <は>
- - - - - 0x03A5F5 24:A5E5: 00        .byte $00
- - - - - 0x03A5F6 24:A5E6: 00        .byte $00
- D - I - 0x03A5F7 24:A5E7: 18        .byte $18    ; <ね>
- D - I - 0x03A5F8 24:A5E8: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A5F9 24:A5E9: 2E        .byte $2E    ; <ん>
- - - - - 0x03A5FA 24:A5EA: 14        .byte $14    ; <と>
- D - I - 0x03A5FB 24:A5EB: 16        .byte $16    ; <に>
- - - - - 0x03A5FC 24:A5EC: 12        .byte $12    ; <つ>
- - - - - 0x03A5FD 24:A5ED: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A5FE 24:A5EE: 15        .byte $15    ; <な>
- - - - - 0x03A5FF 24:A5EF: 1D        .byte $1D    ; <へ>
- - - - - 0x03A600 24:A5F0: 17        .byte $17    ; <ぬ>
- - - - - 0x03A601 24:A5F1: 16        .byte $16    ; <に>
- - - - - 0x03A602 24:A5F2: 1C        .byte $1C    ; <ふ>
- - - - - 0x03A603 24:A5F3: 16        .byte $16    ; <に>
- - - - - 0x03A604 24:A5F4: 10        .byte $10    ; <た>
- - - - - 0x03A605 24:A5F5: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A606 24:A5F6: 15        .byte $15    ; <な>
- - - - - 0x03A607 24:A5F7: 1D        .byte $1D    ; <へ>
- - - - - 0x03A608 24:A5F8: 17        .byte $17    ; <ぬ>
- - - - - 0x03A609 24:A5F9: 16        .byte $16    ; <に>
- - - - - 0x03A60A 24:A5FA: 1C        .byte $1C    ; <ふ>
- - - - - 0x03A60B 24:A5FB: 16        .byte $16    ; <に>
- D - I - 0x03A60C 24:A5FC: 10        .byte $10    ; <た>
- - - - - 0x03A60D 24:A5FD: 00        .byte $00
- - - - - 0x03A60E 24:A5FE: 00        .byte $00
- D - I - 0x03A60F 24:A5FF: 16        .byte $16    ; <に>
- D - I - 0x03A610 24:A600: 2F        .byte $2F    ; <っ>
- - - - - 0x03A611 24:A601: 2F        .byte $2F    ; <っ>
- - - - - 0x03A612 24:A602: 12        .byte $12    ; <つ>
- - - - - 0x03A613 24:A603: 14        .byte $14    ; <と>
- - - - - 0x03A614 24:A604: 12        .byte $12    ; <つ>
- - - - - 0x03A615 24:A605: 17        .byte $17    ; <ぬ>
- D - I - 0x03A616 24:A606: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A617 24:A607: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A618 24:A608: 22        .byte $22    ; <め>
- - - - - 0x03A619 24:A609: 14        .byte $14    ; <と>
- - - - - 0x03A61A 24:A60A: 11        .byte $11    ; <ち>
- - - - - 0x03A61B 24:A60B: 14        .byte $14    ; <と>
- - - - - 0x03A61C 24:A60C: 14        .byte $14    ; <と>
- D - I - 0x03A61D 24:A60D: 17        .byte $17    ; <ぬ>
- - - - - 0x03A61E 24:A60E: 1B        .byte $1B    ; <ひ>
- D - I - 0x03A61F 24:A60F: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A620 24:A610: 22        .byte $22    ; <め>
- - - - - 0x03A621 24:A611: 14        .byte $14    ; <と>
- - - - - 0x03A622 24:A612: 11        .byte $11    ; <ち>
- - - - - 0x03A623 24:A613: 14        .byte $14    ; <と>
- - - - - 0x03A624 24:A614: 14        .byte $14    ; <と>
- - - - - 0x03A625 24:A615: 00        .byte $00
- - - - - 0x03A626 24:A616: 00        .byte $00
- - - - - 0x03A627 24:A617: 16        .byte $16    ; <に>
- D - I - 0x03A628 24:A618: 28        .byte $28    ; <り>
- - - - - 0x03A629 24:A619: 2D        .byte $2D    ; <を>
- D - I - 0x03A62A 24:A61A: 12        .byte $12    ; <つ>
- D - I - 0x03A62B 24:A61B: 18        .byte $18    ; <ね>
- D - I - 0x03A62C 24:A61C: 18        .byte $18    ; <ね>
- - - - - 0x03A62D 24:A61D: 19        .byte $19    ; <の>
- - - - - 0x03A62E 24:A61E: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A62F 24:A61F: 24        .byte $24    ; <や>
- - - - - 0x03A630 24:A620: 1D        .byte $1D    ; <へ>
- - - - - 0x03A631 24:A621: 16        .byte $16    ; <に>
- - - - - 0x03A632 24:A622: 15        .byte $15    ; <な>
- - - - - 0x03A633 24:A623: 16        .byte $16    ; <に>
- - - - - 0x03A634 24:A624: 16        .byte $16    ; <に>
- - - - - 0x03A635 24:A625: 19        .byte $19    ; <の>
- - - - - 0x03A636 24:A626: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A637 24:A627: 24        .byte $24    ; <や>
- D - I - 0x03A638 24:A628: 1D        .byte $1D    ; <へ>
- - - - - 0x03A639 24:A629: 16        .byte $16    ; <に>
- - - - - 0x03A63A 24:A62A: 15        .byte $15    ; <な>
- - - - - 0x03A63B 24:A62B: 16        .byte $16    ; <に>
- D - I - 0x03A63C 24:A62C: 16        .byte $16    ; <に>
- - - - - 0x03A63D 24:A62D: 00        .byte $00
- - - - - 0x03A63E 24:A62E: 00        .byte $00
- D - I - 0x03A63F 24:A62F: 14        .byte $14    ; <と>
- D - I - 0x03A640 24:A630: 26        .byte $26    ; <よ>
- D - I - 0x03A641 24:A631: 2B        .byte $2B    ; <ろ>
- D - I - 0x03A642 24:A632: 12        .byte $12    ; <つ>
- D - I - 0x03A643 24:A633: 18        .byte $18    ; <ね>
- D - I - 0x03A644 24:A634: 18        .byte $18    ; <ね>
- - - - - 0x03A645 24:A635: 16        .byte $16    ; <に>
- - - - - 0x03A646 24:A636: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A647 24:A637: 24        .byte $24    ; <や>
- - - - - 0x03A648 24:A638: 1D        .byte $1D    ; <へ>
- D - I - 0x03A649 24:A639: 16        .byte $16    ; <に>
- - - - - 0x03A64A 24:A63A: 15        .byte $15    ; <な>
- - - - - 0x03A64B 24:A63B: 16        .byte $16    ; <に>
- D - I - 0x03A64C 24:A63C: 16        .byte $16    ; <に>
- - - - - 0x03A64D 24:A63D: 16        .byte $16    ; <に>
- - - - - 0x03A64E 24:A63E: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A64F 24:A63F: 24        .byte $24    ; <や>
- - - - - 0x03A650 24:A640: 1D        .byte $1D    ; <へ>
- - - - - 0x03A651 24:A641: 16        .byte $16    ; <に>
- - - - - 0x03A652 24:A642: 15        .byte $15    ; <な>
- - - - - 0x03A653 24:A643: 16        .byte $16    ; <に>
- D - I - 0x03A654 24:A644: 16        .byte $16    ; <に>
- - - - - 0x03A655 24:A645: 00        .byte $00
- - - - - 0x03A656 24:A646: 00        .byte $00
- D - I - 0x03A657 24:A647: 19        .byte $19    ; <の>
- D - I - 0x03A658 24:A648: 2A        .byte $2A    ; <れ>
- D - I - 0x03A659 24:A649: 35        .byte $35    ; <2>
- D - I - 0x03A65A 24:A64A: 14        .byte $14    ; <と>
- D - I - 0x03A65B 24:A64B: 1A        .byte $1A    ; <は>
- - - - - 0x03A65C 24:A64C: 18        .byte $18    ; <ね>
- D - I - 0x03A65D 24:A64D: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A65E 24:A64E: 28        .byte $28    ; <り>
- - - - - 0x03A65F 24:A64F: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A660 24:A650: 30        .byte $30    ; <ゃ>
- - - - - 0x03A661 24:A651: 1A        .byte $1A    ; <は>
- - - - - 0x03A662 24:A652: 23        .byte $23    ; <も>
- - - - - 0x03A663 24:A653: 1A        .byte $1A    ; <は>
- D - I - 0x03A664 24:A654: 1A        .byte $1A    ; <は>
- - - - - 0x03A665 24:A655: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A666 24:A656: 28        .byte $28    ; <り>
- D - I - 0x03A667 24:A657: 2B        .byte $2B    ; <ろ>
- D - I - 0x03A668 24:A658: 30        .byte $30    ; <ゃ>
- - - - - 0x03A669 24:A659: 1A        .byte $1A    ; <は>
- - - - - 0x03A66A 24:A65A: 23        .byte $23    ; <も>
- - - - - 0x03A66B 24:A65B: 1A        .byte $1A    ; <は>
- D - I - 0x03A66C 24:A65C: 1A        .byte $1A    ; <は>
- - - - - 0x03A66D 24:A65D: 00        .byte $00
- - - - - 0x03A66E 24:A65E: 00        .byte $00
- - - - - 0x03A66F 24:A65F: 18        .byte $18    ; <ね>
- D - I - 0x03A670 24:A660: 2E        .byte $2E    ; <ん>
- - - - - 0x03A671 24:A661: 33        .byte $33    ; <0>
- D - I - 0x03A672 24:A662: 16        .byte $16    ; <に>
- D - I - 0x03A673 24:A663: 1C        .byte $1C    ; <ふ>
- - - - - 0x03A674 24:A664: 1A        .byte $1A    ; <は>
- - - - - 0x03A675 24:A665: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A676 24:A666: 1F        .byte $1F    ; <ま>
- - - - - 0x03A677 24:A667: 28        .byte $28    ; <り>
- - - - - 0x03A678 24:A668: 21        .byte $21    ; <む>
- - - - - 0x03A679 24:A669: 1A        .byte $1A    ; <は>
- - - - - 0x03A67A 24:A66A: 19        .byte $19    ; <の>
- - - - - 0x03A67B 24:A66B: 1A        .byte $1A    ; <は>
- - - - - 0x03A67C 24:A66C: 1A        .byte $1A    ; <は>
- - - - - 0x03A67D 24:A66D: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A67E 24:A66E: 1F        .byte $1F    ; <ま>
- - - - - 0x03A67F 24:A66F: 28        .byte $28    ; <り>
- - - - - 0x03A680 24:A670: 21        .byte $21    ; <む>
- - - - - 0x03A681 24:A671: 1A        .byte $1A    ; <は>
- D - I - 0x03A682 24:A672: 19        .byte $19    ; <の>
- - - - - 0x03A683 24:A673: 1A        .byte $1A    ; <は>
- D - I - 0x03A684 24:A674: 1A        .byte $1A    ; <は>
- - - - - 0x03A685 24:A675: 00        .byte $00
- - - - - 0x03A686 24:A676: 00        .byte $00
- D - I - 0x03A687 24:A677: 1A        .byte $1A    ; <は>
- D - I - 0x03A688 24:A678: 30        .byte $30    ; <ゃ>
- - - - - 0x03A689 24:A679: 35        .byte $35    ; <2>
- D - I - 0x03A68A 24:A67A: 16        .byte $16    ; <に>
- D - I - 0x03A68B 24:A67B: 1C        .byte $1C    ; <ふ>
- D - I - 0x03A68C 24:A67C: 1A        .byte $1A    ; <は>
- - - - - 0x03A68D 24:A67D: 1D        .byte $1D    ; <へ>
- - - - - 0x03A68E 24:A67E: 1F        .byte $1F    ; <ま>
- - - - - 0x03A68F 24:A67F: 28        .byte $28    ; <り>
- - - - - 0x03A690 24:A680: 21        .byte $21    ; <む>
- - - - - 0x03A691 24:A681: 1A        .byte $1A    ; <は>
- - - - - 0x03A692 24:A682: 19        .byte $19    ; <の>
- - - - - 0x03A693 24:A683: 1A        .byte $1A    ; <は>
- - - - - 0x03A694 24:A684: 1A        .byte $1A    ; <は>
- - - - - 0x03A695 24:A685: 1D        .byte $1D    ; <へ>
- - - - - 0x03A696 24:A686: 1F        .byte $1F    ; <ま>
- - - - - 0x03A697 24:A687: 28        .byte $28    ; <り>
- - - - - 0x03A698 24:A688: 21        .byte $21    ; <む>
- - - - - 0x03A699 24:A689: 1A        .byte $1A    ; <は>
- - - - - 0x03A69A 24:A68A: 19        .byte $19    ; <の>
- - - - - 0x03A69B 24:A68B: 1A        .byte $1A    ; <は>
- D - I - 0x03A69C 24:A68C: 1A        .byte $1A    ; <は>
- - - - - 0x03A69D 24:A68D: 00        .byte $00
- - - - - 0x03A69E 24:A68E: 00        .byte $00
- D - I - 0x03A69F 24:A68F: 20        .byte $20    ; <み>
- D - I - 0x03A6A0 24:A690: 30        .byte $30    ; <ゃ>
- D - I - 0x03A6A1 24:A691: 38        .byte $38    ; <5>
- D - I - 0x03A6A2 24:A692: 16        .byte $16    ; <に>
- - - - - 0x03A6A3 24:A693: 20        .byte $20    ; <み>
- - - - - 0x03A6A4 24:A694: 1A        .byte $1A    ; <は>
- - - - - 0x03A6A5 24:A695: 22        .byte $22    ; <め>
- - - - - 0x03A6A6 24:A696: 29        .byte $29    ; <る>
- - - - - 0x03A6A7 24:A697: 2F        .byte $2F    ; <っ>
- - - - - 0x03A6A8 24:A698: 2A        .byte $2A    ; <れ>
- - - - - 0x03A6A9 24:A699: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A6AA 24:A69A: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A6AB 24:A69B: 1C        .byte $1C    ; <ふ>
- D - I - 0x03A6AC 24:A69C: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A6AD 24:A69D: 22        .byte $22    ; <め>
- - - - - 0x03A6AE 24:A69E: 29        .byte $29    ; <る>
- D - I - 0x03A6AF 24:A69F: 2F        .byte $2F    ; <っ>
- - - - - 0x03A6B0 24:A6A0: 2A        .byte $2A    ; <れ>
- - - - - 0x03A6B1 24:A6A1: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A6B2 24:A6A2: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A6B3 24:A6A3: 1C        .byte $1C    ; <ふ>
- - - - - 0x03A6B4 24:A6A4: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A6B5 24:A6A5: 00        .byte $00
- - - - - 0x03A6B6 24:A6A6: 00        .byte $00
- D - I - 0x03A6B7 24:A6A7: 1E        .byte $1E    ; <ほ>
- D - I - 0x03A6B8 24:A6A8: 2F        .byte $2F    ; <っ>
- D - I - 0x03A6B9 24:A6A9: 36        .byte $36    ; <3>
- - - - - 0x03A6BA 24:A6AA: 16        .byte $16    ; <に>
- D - I - 0x03A6BB 24:A6AB: 20        .byte $20    ; <み>
- - - - - 0x03A6BC 24:A6AC: 1A        .byte $1A    ; <は>
- - - - - 0x03A6BD 24:A6AD: 20        .byte $20    ; <み>
- - - - - 0x03A6BE 24:A6AE: 29        .byte $29    ; <る>
- - - - - 0x03A6BF 24:A6AF: 2F        .byte $2F    ; <っ>
- - - - - 0x03A6C0 24:A6B0: 2A        .byte $2A    ; <れ>
- - - - - 0x03A6C1 24:A6B1: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A6C2 24:A6B2: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A6C3 24:A6B3: 1C        .byte $1C    ; <ふ>
- D - I - 0x03A6C4 24:A6B4: 1E        .byte $1E    ; <ほ>
- D - I - 0x03A6C5 24:A6B5: 20        .byte $20    ; <み>
- - - - - 0x03A6C6 24:A6B6: 29        .byte $29    ; <る>
- D - I - 0x03A6C7 24:A6B7: 2F        .byte $2F    ; <っ>
- - - - - 0x03A6C8 24:A6B8: 2A        .byte $2A    ; <れ>
- - - - - 0x03A6C9 24:A6B9: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A6CA 24:A6BA: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A6CB 24:A6BB: 1C        .byte $1C    ; <ふ>
- - - - - 0x03A6CC 24:A6BC: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A6CD 24:A6BD: 00        .byte $00
- - - - - 0x03A6CE 24:A6BE: 00        .byte $00
- - - - - 0x03A6CF 24:A6BF: 14        .byte $14    ; <と>
- D - I - 0x03A6D0 24:A6C0: 20        .byte $20    ; <み>
- - - - - 0x03A6D1 24:A6C1: 26        .byte $26    ; <よ>
- D - I - 0x03A6D2 24:A6C2: 14        .byte $14    ; <と>
- D - I - 0x03A6D3 24:A6C3: 1C        .byte $1C    ; <ふ>
- - - - - 0x03A6D4 24:A6C4: 1A        .byte $1A    ; <は>
- - - - - 0x03A6D5 24:A6C5: 17        .byte $17    ; <ぬ>
- - - - - 0x03A6D6 24:A6C6: 1D        .byte $1D    ; <へ>
- - - - - 0x03A6D7 24:A6C7: 26        .byte $26    ; <よ>
- - - - - 0x03A6D8 24:A6C8: 20        .byte $20    ; <み>
- - - - - 0x03A6D9 24:A6C9: 17        .byte $17    ; <ぬ>
- - - - - 0x03A6DA 24:A6CA: 16        .byte $16    ; <に>
- - - - - 0x03A6DB 24:A6CB: 18        .byte $18    ; <ね>
- - - - - 0x03A6DC 24:A6CC: 18        .byte $18    ; <ね>
- - - - - 0x03A6DD 24:A6CD: 17        .byte $17    ; <ぬ>
- - - - - 0x03A6DE 24:A6CE: 1D        .byte $1D    ; <へ>
- - - - - 0x03A6DF 24:A6CF: 26        .byte $26    ; <よ>
- - - - - 0x03A6E0 24:A6D0: 20        .byte $20    ; <み>
- - - - - 0x03A6E1 24:A6D1: 17        .byte $17    ; <ぬ>
- D - I - 0x03A6E2 24:A6D2: 16        .byte $16    ; <に>
- - - - - 0x03A6E3 24:A6D3: 18        .byte $18    ; <ね>
- D - I - 0x03A6E4 24:A6D4: 18        .byte $18    ; <ね>
- - - - - 0x03A6E5 24:A6D5: 00        .byte $00
- - - - - 0x03A6E6 24:A6D6: 00        .byte $00
- - - - - 0x03A6E7 24:A6D7: 14        .byte $14    ; <と>
- - - - - 0x03A6E8 24:A6D8: 20        .byte $20    ; <み>
- D - I - 0x03A6E9 24:A6D9: 26        .byte $26    ; <よ>
- D - I - 0x03A6EA 24:A6DA: 14        .byte $14    ; <と>
- D - I - 0x03A6EB 24:A6DB: 1C        .byte $1C    ; <ふ>
- D - I - 0x03A6EC 24:A6DC: 1A        .byte $1A    ; <は>
- - - - - 0x03A6ED 24:A6DD: 17        .byte $17    ; <ぬ>
- - - - - 0x03A6EE 24:A6DE: 1D        .byte $1D    ; <へ>
- D - I - 0x03A6EF 24:A6DF: 26        .byte $26    ; <よ>
- - - - - 0x03A6F0 24:A6E0: 20        .byte $20    ; <み>
- - - - - 0x03A6F1 24:A6E1: 17        .byte $17    ; <ぬ>
- - - - - 0x03A6F2 24:A6E2: 16        .byte $16    ; <に>
- - - - - 0x03A6F3 24:A6E3: 18        .byte $18    ; <ね>
- - - - - 0x03A6F4 24:A6E4: 18        .byte $18    ; <ね>
- - - - - 0x03A6F5 24:A6E5: 17        .byte $17    ; <ぬ>
- - - - - 0x03A6F6 24:A6E6: 1D        .byte $1D    ; <へ>
- - - - - 0x03A6F7 24:A6E7: 26        .byte $26    ; <よ>
- D - I - 0x03A6F8 24:A6E8: 20        .byte $20    ; <み>
- D - I - 0x03A6F9 24:A6E9: 17        .byte $17    ; <ぬ>
- - - - - 0x03A6FA 24:A6EA: 16        .byte $16    ; <に>
- - - - - 0x03A6FB 24:A6EB: 18        .byte $18    ; <ね>
- - - - - 0x03A6FC 24:A6EC: 18        .byte $18    ; <ね>
- - - - - 0x03A6FD 24:A6ED: 00        .byte $00
- - - - - 0x03A6FE 24:A6EE: 00        .byte $00
- D - I - 0x03A6FF 24:A6EF: 1C        .byte $1C    ; <ふ>
- D - I - 0x03A700 24:A6F0: 2C        .byte $2C    ; <わ>
- D - I - 0x03A701 24:A6F1: 2C        .byte $2C    ; <わ>
- - - - - 0x03A702 24:A6F2: 16        .byte $16    ; <に>
- D - I - 0x03A703 24:A6F3: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A704 24:A6F4: 1A        .byte $1A    ; <は>
- - - - - 0x03A705 24:A6F5: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A706 24:A6F6: 29        .byte $29    ; <る>
- - - - - 0x03A707 24:A6F7: 2F        .byte $2F    ; <っ>
- - - - - 0x03A708 24:A6F8: 2A        .byte $2A    ; <れ>
- - - - - 0x03A709 24:A6F9: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A70A 24:A6FA: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A70B 24:A6FB: 1C        .byte $1C    ; <ふ>
- - - - - 0x03A70C 24:A6FC: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A70D 24:A6FD: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A70E 24:A6FE: 29        .byte $29    ; <る>
- - - - - 0x03A70F 24:A6FF: 2F        .byte $2F    ; <っ>
- - - - - 0x03A710 24:A700: 2A        .byte $2A    ; <れ>
- - - - - 0x03A711 24:A701: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A712 24:A702: 1E        .byte $1E    ; <ほ>
- D - I - 0x03A713 24:A703: 1C        .byte $1C    ; <ふ>
- - - - - 0x03A714 24:A704: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A715 24:A705: 00        .byte $00
- - - - - 0x03A716 24:A706: 00        .byte $00
- D - I - 0x03A717 24:A707: 1B        .byte $1B    ; <ひ>
- D - I - 0x03A718 24:A708: 2C        .byte $2C    ; <わ>
- D - I - 0x03A719 24:A709: 2E        .byte $2E    ; <ん>
- - - - - 0x03A71A 24:A70A: 16        .byte $16    ; <に>
- D - I - 0x03A71B 24:A70B: 26        .byte $26    ; <よ>
- D - I - 0x03A71C 24:A70C: 2D        .byte $2D    ; <を>
- D - I - 0x03A71D 24:A70D: 1C        .byte $1C    ; <ふ>
- - - - - 0x03A71E 24:A70E: 29        .byte $29    ; <る>
- - - - - 0x03A71F 24:A70F: 2F        .byte $2F    ; <っ>
- - - - - 0x03A720 24:A710: 2A        .byte $2A    ; <れ>
- - - - - 0x03A721 24:A711: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A722 24:A712: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A723 24:A713: 1C        .byte $1C    ; <ふ>
- - - - - 0x03A724 24:A714: 1E        .byte $1E    ; <ほ>
- D - I - 0x03A725 24:A715: 1C        .byte $1C    ; <ふ>
- - - - - 0x03A726 24:A716: 29        .byte $29    ; <る>
- D - I - 0x03A727 24:A717: 2F        .byte $2F    ; <っ>
- - - - - 0x03A728 24:A718: 2A        .byte $2A    ; <れ>
- - - - - 0x03A729 24:A719: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A72A 24:A71A: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A72B 24:A71B: 1C        .byte $1C    ; <ふ>
- - - - - 0x03A72C 24:A71C: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A72D 24:A71D: 00        .byte $00
- - - - - 0x03A72E 24:A71E: 00        .byte $00
- - - - - 0x03A72F 24:A71F: 1B        .byte $1B    ; <ひ>
- D - I - 0x03A730 24:A720: 22        .byte $22    ; <め>
- D - I - 0x03A731 24:A721: 32        .byte $32    ; <ょ>
- D - I - 0x03A732 24:A722: 16        .byte $16    ; <に>
- - - - - 0x03A733 24:A723: 20        .byte $20    ; <み>
- - - - - 0x03A734 24:A724: 22        .byte $22    ; <め>
- - - - - 0x03A735 24:A725: 1C        .byte $1C    ; <ふ>
- - - - - 0x03A736 24:A726: 29        .byte $29    ; <る>
- - - - - 0x03A737 24:A727: 2F        .byte $2F    ; <っ>
- - - - - 0x03A738 24:A728: 2A        .byte $2A    ; <れ>
- - - - - 0x03A739 24:A729: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A73A 24:A72A: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A73B 24:A72B: 1C        .byte $1C    ; <ふ>
- - - - - 0x03A73C 24:A72C: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A73D 24:A72D: 1C        .byte $1C    ; <ふ>
- - - - - 0x03A73E 24:A72E: 29        .byte $29    ; <る>
- - - - - 0x03A73F 24:A72F: 2F        .byte $2F    ; <っ>
- - - - - 0x03A740 24:A730: 2A        .byte $2A    ; <れ>
- - - - - 0x03A741 24:A731: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A742 24:A732: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A743 24:A733: 1C        .byte $1C    ; <ふ>
- D - I - 0x03A744 24:A734: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A745 24:A735: 00        .byte $00
- - - - - 0x03A746 24:A736: 00        .byte $00
- D - I - 0x03A747 24:A737: 1F        .byte $1F    ; <ま>
- D - I - 0x03A748 24:A738: 29        .byte $29    ; <る>
- D - I - 0x03A749 24:A739: 31        .byte $31    ; <ゅ>
- - - - - 0x03A74A 24:A73A: 1F        .byte $1F    ; <ま>
- D - I - 0x03A74B 24:A73B: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A74C 24:A73C: 19        .byte $19    ; <の>
- D - I - 0x03A74D 24:A73D: 28        .byte $28    ; <り>
- - - - - 0x03A74E 24:A73E: 23        .byte $23    ; <も>
- D - I - 0x03A74F 24:A73F: 30        .byte $30    ; <ゃ>
- - - - - 0x03A750 24:A740: 2D        .byte $2D    ; <を>
- - - - - 0x03A751 24:A741: 24        .byte $24    ; <や>
- - - - - 0x03A752 24:A742: 22        .byte $22    ; <め>
- - - - - 0x03A753 24:A743: 26        .byte $26    ; <よ>
- - - - - 0x03A754 24:A744: 14        .byte $14    ; <と>
- - - - - 0x03A755 24:A745: 28        .byte $28    ; <り>
- - - - - 0x03A756 24:A746: 23        .byte $23    ; <も>
- - - - - 0x03A757 24:A747: 30        .byte $30    ; <ゃ>
- - - - - 0x03A758 24:A748: 2D        .byte $2D    ; <を>
- - - - - 0x03A759 24:A749: 24        .byte $24    ; <や>
- - - - - 0x03A75A 24:A74A: 22        .byte $22    ; <め>
- D - I - 0x03A75B 24:A74B: 26        .byte $26    ; <よ>
- - - - - 0x03A75C 24:A74C: 14        .byte $14    ; <と>
- - - - - 0x03A75D 24:A74D: 00        .byte $00
- - - - - 0x03A75E 24:A74E: 00        .byte $00
- - - - - 0x03A75F 24:A74F: 19        .byte $19    ; <の>
- - - - - 0x03A760 24:A750: 25        .byte $25    ; <ゆ>
- - - - - 0x03A761 24:A751: 2E        .byte $2E    ; <ん>
- - - - - 0x03A762 24:A752: 12        .byte $12    ; <つ>
- - - - - 0x03A763 24:A753: 19        .byte $19    ; <の>
- - - - - 0x03A764 24:A754: 19        .byte $19    ; <の>
- - - - - 0x03A765 24:A755: 20        .byte $20    ; <み>
- - - - - 0x03A766 24:A756: 1F        .byte $1F    ; <ま>
- - - - - 0x03A767 24:A757: 2A        .byte $2A    ; <れ>
- - - - - 0x03A768 24:A758: 25        .byte $25    ; <ゆ>
- - - - - 0x03A769 24:A759: 16        .byte $16    ; <に>
- - - - - 0x03A76A 24:A75A: 15        .byte $15    ; <な>
- - - - - 0x03A76B 24:A75B: 18        .byte $18    ; <ね>
- - - - - 0x03A76C 24:A75C: 15        .byte $15    ; <な>
- - - - - 0x03A76D 24:A75D: 20        .byte $20    ; <み>
- - - - - 0x03A76E 24:A75E: 1F        .byte $1F    ; <ま>
- - - - - 0x03A76F 24:A75F: 2A        .byte $2A    ; <れ>
- - - - - 0x03A770 24:A760: 25        .byte $25    ; <ゆ>
- - - - - 0x03A771 24:A761: 16        .byte $16    ; <に>
- - - - - 0x03A772 24:A762: 15        .byte $15    ; <な>
- - - - - 0x03A773 24:A763: 18        .byte $18    ; <ね>
- D - I - 0x03A774 24:A764: 15        .byte $15    ; <な>
- - - - - 0x03A775 24:A765: 00        .byte $00
- - - - - 0x03A776 24:A766: 00        .byte $00
- D - I - 0x03A777 24:A767: 16        .byte $16    ; <に>
- D - I - 0x03A778 24:A768: 27        .byte $27    ; <ら>
- - - - - 0x03A779 24:A769: 35        .byte $35    ; <2>
- - - - - 0x03A77A 24:A76A: 11        .byte $11    ; <ち>
- - - - - 0x03A77B 24:A76B: 18        .byte $18    ; <ね>
- - - - - 0x03A77C 24:A76C: 18        .byte $18    ; <ね>
- - - - - 0x03A77D 24:A76D: 1C        .byte $1C    ; <ふ>
- - - - - 0x03A77E 24:A76E: 21        .byte $21    ; <む>
- - - - - 0x03A77F 24:A76F: 2F        .byte $2F    ; <っ>
- - - - - 0x03A780 24:A770: 29        .byte $29    ; <る>
- - - - - 0x03A781 24:A771: 16        .byte $16    ; <に>
- - - - - 0x03A782 24:A772: 18        .byte $18    ; <ね>
- - - - - 0x03A783 24:A773: 15        .byte $15    ; <な>
- D - I - 0x03A784 24:A774: 14        .byte $14    ; <と>
- - - - - 0x03A785 24:A775: 1C        .byte $1C    ; <ふ>
- - - - - 0x03A786 24:A776: 21        .byte $21    ; <む>
- - - - - 0x03A787 24:A777: 2F        .byte $2F    ; <っ>
- - - - - 0x03A788 24:A778: 29        .byte $29    ; <る>
- - - - - 0x03A789 24:A779: 16        .byte $16    ; <に>
- - - - - 0x03A78A 24:A77A: 18        .byte $18    ; <ね>
- - - - - 0x03A78B 24:A77B: 15        .byte $15    ; <な>
- - - - - 0x03A78C 24:A77C: 14        .byte $14    ; <と>
- - - - - 0x03A78D 24:A77D: 00        .byte $00
- - - - - 0x03A78E 24:A77E: 00        .byte $00
- - - - - 0x03A78F 24:A77F: 1E        .byte $1E    ; <ほ>
- D - I - 0x03A790 24:A780: 39        .byte $39    ; <6>
- D - I - 0x03A791 24:A781: 41        .byte $41    ; <ア>
- D - I - 0x03A792 24:A782: 1A        .byte $1A    ; <は>
- - - - - 0x03A793 24:A783: 27        .byte $27    ; <ら>
- D - I - 0x03A794 24:A784: 27        .byte $27    ; <ら>
- - - - - 0x03A795 24:A785: 25        .byte $25    ; <ゆ>
- - - - - 0x03A796 24:A786: 33        .byte $33    ; <0>
- D - I - 0x03A797 24:A787: 34        .byte $34    ; <1>
- - - - - 0x03A798 24:A788: 35        .byte $35    ; <2>
- - - - - 0x03A799 24:A789: 20        .byte $20    ; <み>
- - - - - 0x03A79A 24:A78A: 1F        .byte $1F    ; <ま>
- D - I - 0x03A79B 24:A78B: 23        .byte $23    ; <も>
- D - I - 0x03A79C 24:A78C: 22        .byte $22    ; <め>
- - - - - 0x03A79D 24:A78D: 25        .byte $25    ; <ゆ>
- - - - - 0x03A79E 24:A78E: 33        .byte $33    ; <0>
- - - - - 0x03A79F 24:A78F: 34        .byte $34    ; <1>
- - - - - 0x03A7A0 24:A790: 35        .byte $35    ; <2>
- - - - - 0x03A7A1 24:A791: 20        .byte $20    ; <み>
- - - - - 0x03A7A2 24:A792: 1F        .byte $1F    ; <ま>
- - - - - 0x03A7A3 24:A793: 23        .byte $23    ; <も>
- D - I - 0x03A7A4 24:A794: 22        .byte $22    ; <め>
- - - - - 0x03A7A5 24:A795: 00        .byte $00
- - - - - 0x03A7A6 24:A796: 00        .byte $00
- - - - - 0x03A7A7 24:A797: 1E        .byte $1E    ; <ほ>
- D - I - 0x03A7A8 24:A798: 39        .byte $39    ; <6>
- - - - - 0x03A7A9 24:A799: 41        .byte $41    ; <ア>
- - - - - 0x03A7AA 24:A79A: 17        .byte $17    ; <ぬ>
- D - I - 0x03A7AB 24:A79B: 2D        .byte $2D    ; <を>
- D - I - 0x03A7AC 24:A79C: 30        .byte $30    ; <ゃ>
- D - I - 0x03A7AD 24:A79D: 25        .byte $25    ; <ゆ>
- - - - - 0x03A7AE 24:A79E: 33        .byte $33    ; <0>
- - - - - 0x03A7AF 24:A79F: 34        .byte $34    ; <1>
- - - - - 0x03A7B0 24:A7A0: 37        .byte $37    ; <4>
- - - - - 0x03A7B1 24:A7A1: 28        .byte $28    ; <り>
- - - - - 0x03A7B2 24:A7A2: 26        .byte $26    ; <よ>
- - - - - 0x03A7B3 24:A7A3: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A7B4 24:A7A4: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A7B5 24:A7A5: 25        .byte $25    ; <ゆ>
- - - - - 0x03A7B6 24:A7A6: 33        .byte $33    ; <0>
- - - - - 0x03A7B7 24:A7A7: 34        .byte $34    ; <1>
- - - - - 0x03A7B8 24:A7A8: 37        .byte $37    ; <4>
- - - - - 0x03A7B9 24:A7A9: 28        .byte $28    ; <り>
- - - - - 0x03A7BA 24:A7AA: 26        .byte $26    ; <よ>
- - - - - 0x03A7BB 24:A7AB: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A7BC 24:A7AC: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A7BD 24:A7AD: 00        .byte $00
- - - - - 0x03A7BE 24:A7AE: 00        .byte $00
- D - I - 0x03A7BF 24:A7AF: 15        .byte $15    ; <な>
- D - I - 0x03A7C0 24:A7B0: 26        .byte $26    ; <よ>
- D - I - 0x03A7C1 24:A7B1: 30        .byte $30    ; <ゃ>
- D - I - 0x03A7C2 24:A7B2: 07        .byte $07    ; <き>
- D - I - 0x03A7C3 24:A7B3: 0E        .byte $0E    ; <せ>
- D - I - 0x03A7C4 24:A7B4: 0E        .byte $0E    ; <せ>
- - - - - 0x03A7C5 24:A7B5: 18        .byte $18    ; <ね>
- - - - - 0x03A7C6 24:A7B6: 20        .byte $20    ; <み>
- - - - - 0x03A7C7 24:A7B7: 2D        .byte $2D    ; <を>
- - - - - 0x03A7C8 24:A7B8: 27        .byte $27    ; <ら>
- - - - - 0x03A7C9 24:A7B9: 16        .byte $16    ; <に>
- - - - - 0x03A7CA 24:A7BA: 15        .byte $15    ; <な>
- - - - - 0x03A7CB 24:A7BB: 18        .byte $18    ; <ね>
- - - - - 0x03A7CC 24:A7BC: 14        .byte $14    ; <と>
- - - - - 0x03A7CD 24:A7BD: 18        .byte $18    ; <ね>
- - - - - 0x03A7CE 24:A7BE: 20        .byte $20    ; <み>
- - - - - 0x03A7CF 24:A7BF: 2D        .byte $2D    ; <を>
- - - - - 0x03A7D0 24:A7C0: 27        .byte $27    ; <ら>
- - - - - 0x03A7D1 24:A7C1: 16        .byte $16    ; <に>
- - - - - 0x03A7D2 24:A7C2: 15        .byte $15    ; <な>
- - - - - 0x03A7D3 24:A7C3: 18        .byte $18    ; <ね>
- - - - - 0x03A7D4 24:A7C4: 14        .byte $14    ; <と>
- - - - - 0x03A7D5 24:A7C5: 00        .byte $00
- - - - - 0x03A7D6 24:A7C6: 00        .byte $00
- D - I - 0x03A7D7 24:A7C7: 17        .byte $17    ; <ぬ>
- D - I - 0x03A7D8 24:A7C8: 25        .byte $25    ; <ゆ>
- - - - - 0x03A7D9 24:A7C9: 2E        .byte $2E    ; <ん>
- D - I - 0x03A7DA 24:A7CA: 19        .byte $19    ; <の>
- D - I - 0x03A7DB 24:A7CB: 13        .byte $13    ; <て>
- - - - - 0x03A7DC 24:A7CC: 15        .byte $15    ; <な>
- - - - - 0x03A7DD 24:A7CD: 1D        .byte $1D    ; <へ>
- - - - - 0x03A7DE 24:A7CE: 1F        .byte $1F    ; <ま>
- - - - - 0x03A7DF 24:A7CF: 2A        .byte $2A    ; <れ>
- - - - - 0x03A7E0 24:A7D0: 24        .byte $24    ; <や>
- - - - - 0x03A7E1 24:A7D1: 1F        .byte $1F    ; <ま>
- - - - - 0x03A7E2 24:A7D2: 1D        .byte $1D    ; <へ>
- - - - - 0x03A7E3 24:A7D3: 22        .byte $22    ; <め>
- - - - - 0x03A7E4 24:A7D4: 14        .byte $14    ; <と>
- - - - - 0x03A7E5 24:A7D5: 1F        .byte $1F    ; <ま>
- - - - - 0x03A7E6 24:A7D6: 1F        .byte $1F    ; <ま>
- - - - - 0x03A7E7 24:A7D7: 2A        .byte $2A    ; <れ>
- - - - - 0x03A7E8 24:A7D8: 26        .byte $26    ; <よ>
- - - - - 0x03A7E9 24:A7D9: 21        .byte $21    ; <む>
- - - - - 0x03A7EA 24:A7DA: 20        .byte $20    ; <み>
- - - - - 0x03A7EB 24:A7DB: 25        .byte $25    ; <ゆ>
- - - - - 0x03A7EC 24:A7DC: 14        .byte $14    ; <と>
- - - - - 0x03A7ED 24:A7DD: 00        .byte $00
- - - - - 0x03A7EE 24:A7DE: 00        .byte $00
- - - - - 0x03A7EF 24:A7DF: 13        .byte $13    ; <て>
- - - - - 0x03A7F0 24:A7E0: 24        .byte $24    ; <や>
- - - - - 0x03A7F1 24:A7E1: 29        .byte $29    ; <る>
- D - I - 0x03A7F2 24:A7E2: 19        .byte $19    ; <の>
- - - - - 0x03A7F3 24:A7E3: 1F        .byte $1F    ; <ま>
- - - - - 0x03A7F4 24:A7E4: 19        .byte $19    ; <の>
- - - - - 0x03A7F5 24:A7E5: 19        .byte $19    ; <の>
- - - - - 0x03A7F6 24:A7E6: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A7F7 24:A7E7: 28        .byte $28    ; <り>
- - - - - 0x03A7F8 24:A7E8: 20        .byte $20    ; <み>
- - - - - 0x03A7F9 24:A7E9: 1D        .byte $1D    ; <へ>
- - - - - 0x03A7FA 24:A7EA: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A7FB 24:A7EB: 1F        .byte $1F    ; <ま>
- - - - - 0x03A7FC 24:A7EC: 16        .byte $16    ; <に>
- - - - - 0x03A7FD 24:A7ED: 19        .byte $19    ; <の>
- - - - - 0x03A7FE 24:A7EE: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A7FF 24:A7EF: 28        .byte $28    ; <り>
- - - - - 0x03A800 24:A7F0: 20        .byte $20    ; <み>
- - - - - 0x03A801 24:A7F1: 1D        .byte $1D    ; <へ>
- - - - - 0x03A802 24:A7F2: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A803 24:A7F3: 1F        .byte $1F    ; <ま>
- - - - - 0x03A804 24:A7F4: 16        .byte $16    ; <に>
- - - - - 0x03A805 24:A7F5: 00        .byte $00
- - - - - 0x03A806 24:A7F6: 00        .byte $00
- - - - - 0x03A807 24:A7F7: 17        .byte $17    ; <ぬ>
- D - I - 0x03A808 24:A7F8: 26        .byte $26    ; <よ>
- - - - - 0x03A809 24:A7F9: 2F        .byte $2F    ; <っ>
- - - - - 0x03A80A 24:A7FA: 14        .byte $14    ; <と>
- D - I - 0x03A80B 24:A7FB: 1B        .byte $1B    ; <ひ>
- - - - - 0x03A80C 24:A7FC: 19        .byte $19    ; <の>
- - - - - 0x03A80D 24:A7FD: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A80E 24:A7FE: 20        .byte $20    ; <み>
- - - - - 0x03A80F 24:A7FF: 2C        .byte $2C    ; <わ>
- - - - - 0x03A810 24:A800: 25        .byte $25    ; <ゆ>
- - - - - 0x03A811 24:A801: 1C        .byte $1C    ; <ふ>
- - - - - 0x03A812 24:A802: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A813 24:A803: 20        .byte $20    ; <み>
- - - - - 0x03A814 24:A804: 14        .byte $14    ; <と>
- - - - - 0x03A815 24:A805: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A816 24:A806: 20        .byte $20    ; <み>
- - - - - 0x03A817 24:A807: 2C        .byte $2C    ; <わ>
- - - - - 0x03A818 24:A808: 25        .byte $25    ; <ゆ>
- D - I - 0x03A819 24:A809: 1C        .byte $1C    ; <ふ>
- - - - - 0x03A81A 24:A80A: 1E        .byte $1E    ; <ほ>
- - - - - 0x03A81B 24:A80B: 20        .byte $20    ; <み>
- - - - - 0x03A81C 24:A80C: 14        .byte $14    ; <と>
- - - - - 0x03A81D 24:A80D: 00        .byte $00
- - - - - 0x03A81E 24:A80E: 00        .byte $00
- D - I - 0x03A81F 24:A80F: 15        .byte $15    ; <な>
- - - - - 0x03A820 24:A810: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A821 24:A811: 38        .byte $38    ; <5>
- D - I - 0x03A822 24:A812: 1C        .byte $1C    ; <ふ>
- D - I - 0x03A823 24:A813: 26        .byte $26    ; <よ>
- - - - - 0x03A824 24:A814: 25        .byte $25    ; <ゆ>
- - - - - 0x03A825 24:A815: 21        .byte $21    ; <む>
- - - - - 0x03A826 24:A816: 25        .byte $25    ; <ゆ>
- - - - - 0x03A827 24:A817: 32        .byte $32    ; <ょ>
- - - - - 0x03A828 24:A818: 2F        .byte $2F    ; <っ>
- - - - - 0x03A829 24:A819: 21        .byte $21    ; <む>
- - - - - 0x03A82A 24:A81A: 1F        .byte $1F    ; <ま>
- - - - - 0x03A82B 24:A81B: 23        .byte $23    ; <も>
- D - I - 0x03A82C 24:A81C: 21        .byte $21    ; <む>
- - - - - 0x03A82D 24:A81D: 21        .byte $21    ; <む>
- - - - - 0x03A82E 24:A81E: 25        .byte $25    ; <ゆ>
- - - - - 0x03A82F 24:A81F: 33        .byte $33    ; <0>
- - - - - 0x03A830 24:A820: 2F        .byte $2F    ; <っ>
- - - - - 0x03A831 24:A821: 21        .byte $21    ; <む>
- - - - - 0x03A832 24:A822: 1F        .byte $1F    ; <ま>
- - - - - 0x03A833 24:A823: 23        .byte $23    ; <も>
- - - - - 0x03A834 24:A824: 21        .byte $21    ; <む>
- - - - - 0x03A835 24:A825: 00        .byte $00
- - - - - 0x03A836 24:A826: 00        .byte $00
- D - I - 0x03A837 24:A827: 3B        .byte $3B    ; <8>
- D - I - 0x03A838 24:A828: 32        .byte $32    ; <ょ>
- D - I - 0x03A839 24:A829: 37        .byte $37    ; <4>
- D - I - 0x03A83A 24:A82A: 1C        .byte $1C    ; <ふ>
- D - I - 0x03A83B 24:A82B: 1C        .byte $1C    ; <ふ>
- D - I - 0x03A83C 24:A82C: 24        .byte $24    ; <や>
- D - I - 0x03A83D 24:A82D: 3D        .byte $3D    ; <+>
- - - - - 0x03A83E 24:A82E: 29        .byte $29    ; <る>
- D - I - 0x03A83F 24:A82F: 32        .byte $32    ; <ょ>
- - - - - 0x03A840 24:A830: 2B        .byte $2B    ; <ろ>
- D - I - 0x03A841 24:A831: 24        .byte $24    ; <や>
- D - I - 0x03A842 24:A832: 23        .byte $23    ; <も>
- - - - - 0x03A843 24:A833: 24        .byte $24    ; <や>
- D - I - 0x03A844 24:A834: 24        .byte $24    ; <や>
- D - I - 0x03A845 24:A835: 3D        .byte $3D    ; <+>
- - - - - 0x03A846 24:A836: 29        .byte $29    ; <る>
- - - - - 0x03A847 24:A837: 32        .byte $32    ; <ょ>
- - - - - 0x03A848 24:A838: 2B        .byte $2B    ; <ろ>
- D - I - 0x03A849 24:A839: 24        .byte $24    ; <や>
- D - I - 0x03A84A 24:A83A: 23        .byte $23    ; <も>
- - - - - 0x03A84B 24:A83B: 24        .byte $24    ; <や>
- D - I - 0x03A84C 24:A83C: 24        .byte $24    ; <や>
- - - - - 0x03A84D 24:A83D: 00        .byte $00
- - - - - 0x03A84E 24:A83E: 00        .byte $00
- D - I - 0x03A84F 24:A83F: 3D        .byte $3D    ; <+>
- D - I - 0x03A850 24:A840: 35        .byte $35    ; <2>
- - - - - 0x03A851 24:A841: 3A        .byte $3A    ; <7>
- - - - - 0x03A852 24:A842: 1C        .byte $1C    ; <ふ>
- D - I - 0x03A853 24:A843: 1C        .byte $1C    ; <ふ>
- D - I - 0x03A854 24:A844: 24        .byte $24    ; <や>
- D - I - 0x03A855 24:A845: 3F        .byte $3F    ; <•>
- D - I - 0x03A856 24:A846: 29        .byte $29    ; <る>
- - - - - 0x03A857 24:A847: 32        .byte $32    ; <ょ>
- - - - - 0x03A858 24:A848: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A859 24:A849: 24        .byte $24    ; <や>
- - - - - 0x03A85A 24:A84A: 23        .byte $23    ; <も>
- D - I - 0x03A85B 24:A84B: 24        .byte $24    ; <や>
- - - - - 0x03A85C 24:A84C: 24        .byte $24    ; <や>
- D - I - 0x03A85D 24:A84D: 3F        .byte $3F    ; <•>
- - - - - 0x03A85E 24:A84E: 29        .byte $29    ; <る>
- - - - - 0x03A85F 24:A84F: 32        .byte $32    ; <ょ>
- - - - - 0x03A860 24:A850: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A861 24:A851: 24        .byte $24    ; <や>
- - - - - 0x03A862 24:A852: 23        .byte $23    ; <も>
- - - - - 0x03A863 24:A853: 24        .byte $24    ; <や>
- D - I - 0x03A864 24:A854: 24        .byte $24    ; <や>
- - - - - 0x03A865 24:A855: 00        .byte $00
- - - - - 0x03A866 24:A856: 00        .byte $00
- - - - - 0x03A867 24:A857: 3F        .byte $3F    ; <•>
- D - I - 0x03A868 24:A858: 34        .byte $34    ; <1>
- - - - - 0x03A869 24:A859: 39        .byte $39    ; <6>
- D - I - 0x03A86A 24:A85A: 1E        .byte $1E    ; <ほ>
- D - I - 0x03A86B 24:A85B: 1E        .byte $1E    ; <ほ>
- D - I - 0x03A86C 24:A85C: 26        .byte $26    ; <よ>
- - - - - 0x03A86D 24:A85D: 41        .byte $41    ; <ア>
- - - - - 0x03A86E 24:A85E: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A86F 24:A85F: 34        .byte $34    ; <1>
- - - - - 0x03A870 24:A860: 2D        .byte $2D    ; <を>
- - - - - 0x03A871 24:A861: 26        .byte $26    ; <よ>
- - - - - 0x03A872 24:A862: 25        .byte $25    ; <ゆ>
- - - - - 0x03A873 24:A863: 26        .byte $26    ; <よ>
- D - I - 0x03A874 24:A864: 26        .byte $26    ; <よ>
- - - - - 0x03A875 24:A865: 41        .byte $41    ; <ア>
- - - - - 0x03A876 24:A866: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A877 24:A867: 34        .byte $34    ; <1>
- - - - - 0x03A878 24:A868: 2D        .byte $2D    ; <を>
- D - I - 0x03A879 24:A869: 26        .byte $26    ; <よ>
- D - I - 0x03A87A 24:A86A: 25        .byte $25    ; <ゆ>
- - - - - 0x03A87B 24:A86B: 26        .byte $26    ; <よ>
- - - - - 0x03A87C 24:A86C: 26        .byte $26    ; <よ>
- - - - - 0x03A87D 24:A86D: 00        .byte $00
- - - - - 0x03A87E 24:A86E: 00        .byte $00
- - - - - 0x03A87F 24:A86F: 41        .byte $41    ; <ア>
- D - I - 0x03A880 24:A870: 36        .byte $36    ; <3>
- D - I - 0x03A881 24:A871: 3B        .byte $3B    ; <8>
- D - I - 0x03A882 24:A872: 1E        .byte $1E    ; <ほ>
- D - I - 0x03A883 24:A873: 1E        .byte $1E    ; <ほ>
- D - I - 0x03A884 24:A874: 26        .byte $26    ; <よ>
- - - - - 0x03A885 24:A875: 43        .byte $43    ; <ウ>
- - - - - 0x03A886 24:A876: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A887 24:A877: 34        .byte $34    ; <1>
- - - - - 0x03A888 24:A878: 2D        .byte $2D    ; <を>
- - - - - 0x03A889 24:A879: 26        .byte $26    ; <よ>
- - - - - 0x03A88A 24:A87A: 25        .byte $25    ; <ゆ>
- - - - - 0x03A88B 24:A87B: 26        .byte $26    ; <よ>
- D - I - 0x03A88C 24:A87C: 26        .byte $26    ; <よ>
- - - - - 0x03A88D 24:A87D: 43        .byte $43    ; <ウ>
- - - - - 0x03A88E 24:A87E: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A88F 24:A87F: 34        .byte $34    ; <1>
- - - - - 0x03A890 24:A880: 2D        .byte $2D    ; <を>
- - - - - 0x03A891 24:A881: 26        .byte $26    ; <よ>
- - - - - 0x03A892 24:A882: 25        .byte $25    ; <ゆ>
- - - - - 0x03A893 24:A883: 26        .byte $26    ; <よ>
- - - - - 0x03A894 24:A884: 26        .byte $26    ; <よ>
- - - - - 0x03A895 24:A885: 00        .byte $00
- - - - - 0x03A896 24:A886: 00        .byte $00
- D - I - 0x03A897 24:A887: 43        .byte $43    ; <ウ>
- D - I - 0x03A898 24:A888: 3B        .byte $3B    ; <8>
- D - I - 0x03A899 24:A889: 3E        .byte $3E    ; <Jr>
- - - - - 0x03A89A 24:A88A: 22        .byte $22    ; <め>
- D - I - 0x03A89B 24:A88B: 22        .byte $22    ; <め>
- D - I - 0x03A89C 24:A88C: 2A        .byte $2A    ; <れ>
- - - - - 0x03A89D 24:A88D: 45        .byte $45    ; <オ>
- - - - - 0x03A89E 24:A88E: 2D        .byte $2D    ; <を>
- - - - - 0x03A89F 24:A88F: 36        .byte $36    ; <3>
- - - - - 0x03A8A0 24:A890: 2F        .byte $2F    ; <っ>
- - - - - 0x03A8A1 24:A891: 28        .byte $28    ; <り>
- - - - - 0x03A8A2 24:A892: 27        .byte $27    ; <ら>
- - - - - 0x03A8A3 24:A893: 28        .byte $28    ; <り>
- D - I - 0x03A8A4 24:A894: 28        .byte $28    ; <り>
- - - - - 0x03A8A5 24:A895: 41        .byte $41    ; <ア>
- - - - - 0x03A8A6 24:A896: 2D        .byte $2D    ; <を>
- - - - - 0x03A8A7 24:A897: 36        .byte $36    ; <3>
- - - - - 0x03A8A8 24:A898: 2F        .byte $2F    ; <っ>
- D - I - 0x03A8A9 24:A899: 28        .byte $28    ; <り>
- - - - - 0x03A8AA 24:A89A: 27        .byte $27    ; <ら>
- - - - - 0x03A8AB 24:A89B: 28        .byte $28    ; <り>
- - - - - 0x03A8AC 24:A89C: 28        .byte $28    ; <り>
- - - - - 0x03A8AD 24:A89D: 00        .byte $00
- - - - - 0x03A8AE 24:A89E: 00        .byte $00
- D - I - 0x03A8AF 24:A89F: 45        .byte $45    ; <オ>
- D - I - 0x03A8B0 24:A8A0: 36        .byte $36    ; <3>
- - - - - 0x03A8B1 24:A8A1: 3D        .byte $3D    ; <+>
- D - I - 0x03A8B2 24:A8A2: 2A        .byte $2A    ; <れ>
- D - I - 0x03A8B3 24:A8A3: 22        .byte $22    ; <め>
- D - I - 0x03A8B4 24:A8A4: 28        .byte $28    ; <り>
- - - - - 0x03A8B5 24:A8A5: 47        .byte $47    ; <キ>
- - - - - 0x03A8B6 24:A8A6: 2D        .byte $2D    ; <を>
- D - I - 0x03A8B7 24:A8A7: 37        .byte $37    ; <4>
- - - - - 0x03A8B8 24:A8A8: 2F        .byte $2F    ; <っ>
- - - - - 0x03A8B9 24:A8A9: 30        .byte $30    ; <ゃ>
- - - - - 0x03A8BA 24:A8AA: 38        .byte $38    ; <5>
- - - - - 0x03A8BB 24:A8AB: 30        .byte $30    ; <ゃ>
- - - - - 0x03A8BC 24:A8AC: 30        .byte $30    ; <ゃ>
- - - - - 0x03A8BD 24:A8AD: 47        .byte $47    ; <キ>
- D - I - 0x03A8BE 24:A8AE: 2D        .byte $2D    ; <を>
- - - - - 0x03A8BF 24:A8AF: 37        .byte $37    ; <4>
- - - - - 0x03A8C0 24:A8B0: 2F        .byte $2F    ; <っ>
- - - - - 0x03A8C1 24:A8B1: 30        .byte $30    ; <ゃ>
- - - - - 0x03A8C2 24:A8B2: 38        .byte $38    ; <5>
- - - - - 0x03A8C3 24:A8B3: 30        .byte $30    ; <ゃ>
- - - - - 0x03A8C4 24:A8B4: 30        .byte $30    ; <ゃ>
- - - - - 0x03A8C5 24:A8B5: 00        .byte $00
- - - - - 0x03A8C6 24:A8B6: 00        .byte $00
- D - I - 0x03A8C7 24:A8B7: 47        .byte $47    ; <キ>
- D - I - 0x03A8C8 24:A8B8: 38        .byte $38    ; <5>
- D - I - 0x03A8C9 24:A8B9: 3F        .byte $3F    ; <•>
- D - I - 0x03A8CA 24:A8BA: 2A        .byte $2A    ; <れ>
- D - I - 0x03A8CB 24:A8BB: 22        .byte $22    ; <め>
- D - I - 0x03A8CC 24:A8BC: 28        .byte $28    ; <り>
- D - I - 0x03A8CD 24:A8BD: 49        .byte $49    ; <ケ>
- D - I - 0x03A8CE 24:A8BE: 2D        .byte $2D    ; <を>
- - - - - 0x03A8CF 24:A8BF: 37        .byte $37    ; <4>
- - - - - 0x03A8D0 24:A8C0: 2F        .byte $2F    ; <っ>
- - - - - 0x03A8D1 24:A8C1: 30        .byte $30    ; <ゃ>
- - - - - 0x03A8D2 24:A8C2: 38        .byte $38    ; <5>
- - - - - 0x03A8D3 24:A8C3: 30        .byte $30    ; <ゃ>
- - - - - 0x03A8D4 24:A8C4: 30        .byte $30    ; <ゃ>
- D - I - 0x03A8D5 24:A8C5: 49        .byte $49    ; <ケ>
- - - - - 0x03A8D6 24:A8C6: 2D        .byte $2D    ; <を>
- D - I - 0x03A8D7 24:A8C7: 37        .byte $37    ; <4>
- - - - - 0x03A8D8 24:A8C8: 2F        .byte $2F    ; <っ>
- - - - - 0x03A8D9 24:A8C9: 30        .byte $30    ; <ゃ>
- - - - - 0x03A8DA 24:A8CA: 38        .byte $38    ; <5>
- D - I - 0x03A8DB 24:A8CB: 30        .byte $30    ; <ゃ>
- - - - - 0x03A8DC 24:A8CC: 30        .byte $30    ; <ゃ>
- - - - - 0x03A8DD 24:A8CD: 00        .byte $00
- - - - - 0x03A8DE 24:A8CE: 00        .byte $00
- - - - - 0x03A8DF 24:A8CF: 47        .byte $47    ; <キ>
- D - I - 0x03A8E0 24:A8D0: 38        .byte $38    ; <5>
- - - - - 0x03A8E1 24:A8D1: 3F        .byte $3F    ; <•>
- D - I - 0x03A8E2 24:A8D2: 22        .byte $22    ; <め>
- D - I - 0x03A8E3 24:A8D3: 22        .byte $22    ; <め>
- D - I - 0x03A8E4 24:A8D4: 2A        .byte $2A    ; <れ>
- - - - - 0x03A8E5 24:A8D5: 4B        .byte $4B    ; <サ>
- - - - - 0x03A8E6 24:A8D6: 33        .byte $33    ; <0>
- - - - - 0x03A8E7 24:A8D7: 3C        .byte $3C    ; <9>
- - - - - 0x03A8E8 24:A8D8: 35        .byte $35    ; <2>
- D - I - 0x03A8E9 24:A8D9: 2E        .byte $2E    ; <ん>
- D - I - 0x03A8EA 24:A8DA: 2D        .byte $2D    ; <を>
- - - - - 0x03A8EB 24:A8DB: 2E        .byte $2E    ; <ん>
- - - - - 0x03A8EC 24:A8DC: 2E        .byte $2E    ; <ん>
- - - - - 0x03A8ED 24:A8DD: 49        .byte $49    ; <ケ>
- D - I - 0x03A8EE 24:A8DE: 2F        .byte $2F    ; <っ>
- - - - - 0x03A8EF 24:A8DF: 38        .byte $38    ; <5>
- - - - - 0x03A8F0 24:A8E0: 31        .byte $31    ; <ゅ>
- - - - - 0x03A8F1 24:A8E1: 2A        .byte $2A    ; <れ>
- D - I - 0x03A8F2 24:A8E2: 29        .byte $29    ; <る>
- - - - - 0x03A8F3 24:A8E3: 2A        .byte $2A    ; <れ>
- D - I - 0x03A8F4 24:A8E4: 2A        .byte $2A    ; <れ>
- - - - - 0x03A8F5 24:A8E5: 00        .byte $00
- - - - - 0x03A8F6 24:A8E6: 00        .byte $00
- D - I - 0x03A8F7 24:A8E7: 49        .byte $49    ; <ケ>
- D - I - 0x03A8F8 24:A8E8: 3A        .byte $3A    ; <7>
- D - I - 0x03A8F9 24:A8E9: 41        .byte $41    ; <ア>
- D - I - 0x03A8FA 24:A8EA: 22        .byte $22    ; <め>
- D - I - 0x03A8FB 24:A8EB: 22        .byte $22    ; <め>
- D - I - 0x03A8FC 24:A8EC: 2A        .byte $2A    ; <れ>
- D - I - 0x03A8FD 24:A8ED: 4D        .byte $4D    ; <ス>
- - - - - 0x03A8FE 24:A8EE: 33        .byte $33    ; <0>
- D - I - 0x03A8FF 24:A8EF: 3C        .byte $3C    ; <9>
- - - - - 0x03A900 24:A8F0: 35        .byte $35    ; <2>
- - - - - 0x03A901 24:A8F1: 2E        .byte $2E    ; <ん>
- - - - - 0x03A902 24:A8F2: 2D        .byte $2D    ; <を>
- - - - - 0x03A903 24:A8F3: 2E        .byte $2E    ; <ん>
- D - I - 0x03A904 24:A8F4: 2E        .byte $2E    ; <ん>
- D - I - 0x03A905 24:A8F5: 4B        .byte $4B    ; <サ>
- D - I - 0x03A906 24:A8F6: 2F        .byte $2F    ; <っ>
- D - I - 0x03A907 24:A8F7: 38        .byte $38    ; <5>
- - - - - 0x03A908 24:A8F8: 31        .byte $31    ; <ゅ>
- - - - - 0x03A909 24:A8F9: 2A        .byte $2A    ; <れ>
- - - - - 0x03A90A 24:A8FA: 29        .byte $29    ; <る>
- - - - - 0x03A90B 24:A8FB: 2A        .byte $2A    ; <れ>
- D - I - 0x03A90C 24:A8FC: 2A        .byte $2A    ; <れ>
- - - - - 0x03A90D 24:A8FD: 00        .byte $00
- - - - - 0x03A90E 24:A8FE: 00        .byte $00
- - - - - 0x03A90F 24:A8FF: 48        .byte $48    ; <ク>
- - - - - 0x03A910 24:A900: 3A        .byte $3A    ; <7>
- - - - - 0x03A911 24:A901: 41        .byte $41    ; <ア>
- D - I - 0x03A912 24:A902: 24        .byte $24    ; <や>
- D - I - 0x03A913 24:A903: 24        .byte $24    ; <や>
- D - I - 0x03A914 24:A904: 2C        .byte $2C    ; <わ>
- - - - - 0x03A915 24:A905: 4A        .byte $4A    ; <コ>
- D - I - 0x03A916 24:A906: 31        .byte $31    ; <ゅ>
- - - - - 0x03A917 24:A907: 3A        .byte $3A    ; <7>
- - - - - 0x03A918 24:A908: 33        .byte $33    ; <0>
- - - - - 0x03A919 24:A909: 2C        .byte $2C    ; <わ>
- - - - - 0x03A91A 24:A90A: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A91B 24:A90B: 2C        .byte $2C    ; <わ>
- - - - - 0x03A91C 24:A90C: 2C        .byte $2C    ; <わ>
- - - - - 0x03A91D 24:A90D: 4C        .byte $4C    ; <シ>
- D - I - 0x03A91E 24:A90E: 33        .byte $33    ; <0>
- - - - - 0x03A91F 24:A90F: 3C        .byte $3C    ; <9>
- - - - - 0x03A920 24:A910: 35        .byte $35    ; <2>
- - - - - 0x03A921 24:A911: 2E        .byte $2E    ; <ん>
- - - - - 0x03A922 24:A912: 2D        .byte $2D    ; <を>
- - - - - 0x03A923 24:A913: 2E        .byte $2E    ; <ん>
- D - I - 0x03A924 24:A914: 2E        .byte $2E    ; <ん>
- - - - - 0x03A925 24:A915: 00        .byte $00
- - - - - 0x03A926 24:A916: 00        .byte $00
- D - I - 0x03A927 24:A917: 4A        .byte $4A    ; <コ>
- D - I - 0x03A928 24:A918: 3C        .byte $3C    ; <9>
- D - I - 0x03A929 24:A919: 43        .byte $43    ; <ウ>
- D - I - 0x03A92A 24:A91A: 24        .byte $24    ; <や>
- D - I - 0x03A92B 24:A91B: 24        .byte $24    ; <や>
- D - I - 0x03A92C 24:A91C: 2C        .byte $2C    ; <わ>
- D - I - 0x03A92D 24:A91D: 4C        .byte $4C    ; <シ>
- D - I - 0x03A92E 24:A91E: 31        .byte $31    ; <ゅ>
- - - - - 0x03A92F 24:A91F: 3A        .byte $3A    ; <7>
- - - - - 0x03A930 24:A920: 33        .byte $33    ; <0>
- - - - - 0x03A931 24:A921: 2C        .byte $2C    ; <わ>
- - - - - 0x03A932 24:A922: 2B        .byte $2B    ; <ろ>
- D - I - 0x03A933 24:A923: 2C        .byte $2C    ; <わ>
- D - I - 0x03A934 24:A924: 2C        .byte $2C    ; <わ>
- D - I - 0x03A935 24:A925: 4E        .byte $4E    ; <セ>
- - - - - 0x03A936 24:A926: 33        .byte $33    ; <0>
- - - - - 0x03A937 24:A927: 3C        .byte $3C    ; <9>
- - - - - 0x03A938 24:A928: 35        .byte $35    ; <2>
- - - - - 0x03A939 24:A929: 2E        .byte $2E    ; <ん>
- - - - - 0x03A93A 24:A92A: 2D        .byte $2D    ; <を>
- - - - - 0x03A93B 24:A92B: 2E        .byte $2E    ; <ん>
- - - - - 0x03A93C 24:A92C: 2E        .byte $2E    ; <ん>
- - - - - 0x03A93D 24:A92D: 00        .byte $00
- - - - - 0x03A93E 24:A92E: 00        .byte $00
- - - - - 0x03A93F 24:A92F: 43        .byte $43    ; <ウ>
- D - I - 0x03A940 24:A930: 41        .byte $41    ; <ア>
- - - - - 0x03A941 24:A931: 44        .byte $44    ; <エ>
- D - I - 0x03A942 24:A932: 24        .byte $24    ; <や>
- D - I - 0x03A943 24:A933: 1E        .byte $1E    ; <ほ>
- D - I - 0x03A944 24:A934: 2C        .byte $2C    ; <わ>
- - - - - 0x03A945 24:A935: 45        .byte $45    ; <オ>
- - - - - 0x03A946 24:A936: 31        .byte $31    ; <ゅ>
- - - - - 0x03A947 24:A937: 3A        .byte $3A    ; <7>
- - - - - 0x03A948 24:A938: 33        .byte $33    ; <0>
- D - I - 0x03A949 24:A939: 2C        .byte $2C    ; <わ>
- D - I - 0x03A94A 24:A93A: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A94B 24:A93B: 2C        .byte $2C    ; <わ>
- - - - - 0x03A94C 24:A93C: 2C        .byte $2C    ; <わ>
- - - - - 0x03A94D 24:A93D: 45        .byte $45    ; <オ>
- - - - - 0x03A94E 24:A93E: 31        .byte $31    ; <ゅ>
- - - - - 0x03A94F 24:A93F: 3A        .byte $3A    ; <7>
- D - I - 0x03A950 24:A940: 33        .byte $33    ; <0>
- - - - - 0x03A951 24:A941: 2C        .byte $2C    ; <わ>
- - - - - 0x03A952 24:A942: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A953 24:A943: 2C        .byte $2C    ; <わ>
- - - - - 0x03A954 24:A944: 2C        .byte $2C    ; <わ>
- - - - - 0x03A955 24:A945: 00        .byte $00
- - - - - 0x03A956 24:A946: 00        .byte $00
- - - - - 0x03A957 24:A947: 45        .byte $45    ; <オ>
- D - I - 0x03A958 24:A948: 43        .byte $43    ; <ウ>
- - - - - 0x03A959 24:A949: 46        .byte $46    ; <カ>
- D - I - 0x03A95A 24:A94A: 24        .byte $24    ; <や>
- D - I - 0x03A95B 24:A94B: 1E        .byte $1E    ; <ほ>
- D - I - 0x03A95C 24:A94C: 2C        .byte $2C    ; <わ>
- - - - - 0x03A95D 24:A94D: 47        .byte $47    ; <キ>
- - - - - 0x03A95E 24:A94E: 31        .byte $31    ; <ゅ>
- - - - - 0x03A95F 24:A94F: 3A        .byte $3A    ; <7>
- - - - - 0x03A960 24:A950: 33        .byte $33    ; <0>
- - - - - 0x03A961 24:A951: 2C        .byte $2C    ; <わ>
- - - - - 0x03A962 24:A952: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A963 24:A953: 2C        .byte $2C    ; <わ>
- - - - - 0x03A964 24:A954: 2C        .byte $2C    ; <わ>
- D - I - 0x03A965 24:A955: 47        .byte $47    ; <キ>
- - - - - 0x03A966 24:A956: 31        .byte $31    ; <ゅ>
- - - - - 0x03A967 24:A957: 3A        .byte $3A    ; <7>
- - - - - 0x03A968 24:A958: 33        .byte $33    ; <0>
- - - - - 0x03A969 24:A959: 2C        .byte $2C    ; <わ>
- - - - - 0x03A96A 24:A95A: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A96B 24:A95B: 2C        .byte $2C    ; <わ>
- - - - - 0x03A96C 24:A95C: 2C        .byte $2C    ; <わ>
- - - - - 0x03A96D 24:A95D: 00        .byte $00
- - - - - 0x03A96E 24:A95E: 00        .byte $00
- D - I - 0x03A96F 24:A95F: 47        .byte $47    ; <キ>
- D - I - 0x03A970 24:A960: 45        .byte $45    ; <オ>
- - - - - 0x03A971 24:A961: 46        .byte $46    ; <カ>
- - - - - 0x03A972 24:A962: 24        .byte $24    ; <や>
- D - I - 0x03A973 24:A963: 23        .byte $23    ; <も>
- - - - - 0x03A974 24:A964: 2C        .byte $2C    ; <わ>
- - - - - 0x03A975 24:A965: 3C        .byte $3C    ; <9>
- - - - - 0x03A976 24:A966: 31        .byte $31    ; <ゅ>
- - - - - 0x03A977 24:A967: 3A        .byte $3A    ; <7>
- - - - - 0x03A978 24:A968: 33        .byte $33    ; <0>
- - - - - 0x03A979 24:A969: 2C        .byte $2C    ; <わ>
- - - - - 0x03A97A 24:A96A: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A97B 24:A96B: 2C        .byte $2C    ; <わ>
- - - - - 0x03A97C 24:A96C: 2C        .byte $2C    ; <わ>
- D - I - 0x03A97D 24:A96D: 48        .byte $48    ; <ク>
- - - - - 0x03A97E 24:A96E: 31        .byte $31    ; <ゅ>
- - - - - 0x03A97F 24:A96F: 3A        .byte $3A    ; <7>
- - - - - 0x03A980 24:A970: 33        .byte $33    ; <0>
- - - - - 0x03A981 24:A971: 2C        .byte $2C    ; <わ>
- - - - - 0x03A982 24:A972: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A983 24:A973: 2C        .byte $2C    ; <わ>
- - - - - 0x03A984 24:A974: 2C        .byte $2C    ; <わ>
- - - - - 0x03A985 24:A975: 00        .byte $00
- - - - - 0x03A986 24:A976: 00        .byte $00
- D - I - 0x03A987 24:A977: 47        .byte $47    ; <キ>
- D - I - 0x03A988 24:A978: 45        .byte $45    ; <オ>
- D - I - 0x03A989 24:A979: 4A        .byte $4A    ; <コ>
- - - - - 0x03A98A 24:A97A: 24        .byte $24    ; <や>
- D - I - 0x03A98B 24:A97B: 23        .byte $23    ; <も>
- - - - - 0x03A98C 24:A97C: 2C        .byte $2C    ; <わ>
- - - - - 0x03A98D 24:A97D: 3C        .byte $3C    ; <9>
- - - - - 0x03A98E 24:A97E: 31        .byte $31    ; <ゅ>
- - - - - 0x03A98F 24:A97F: 3A        .byte $3A    ; <7>
- - - - - 0x03A990 24:A980: 33        .byte $33    ; <0>
- - - - - 0x03A991 24:A981: 2C        .byte $2C    ; <わ>
- - - - - 0x03A992 24:A982: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A993 24:A983: 2C        .byte $2C    ; <わ>
- - - - - 0x03A994 24:A984: 2C        .byte $2C    ; <わ>
- D - I - 0x03A995 24:A985: 48        .byte $48    ; <ク>
- - - - - 0x03A996 24:A986: 31        .byte $31    ; <ゅ>
- - - - - 0x03A997 24:A987: 3A        .byte $3A    ; <7>
- - - - - 0x03A998 24:A988: 33        .byte $33    ; <0>
- - - - - 0x03A999 24:A989: 2C        .byte $2C    ; <わ>
- - - - - 0x03A99A 24:A98A: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A99B 24:A98B: 2C        .byte $2C    ; <わ>
- - - - - 0x03A99C 24:A98C: 2C        .byte $2C    ; <わ>
- - - - - 0x03A99D 24:A98D: 00        .byte $00
- - - - - 0x03A99E 24:A98E: 00        .byte $00
- D - I - 0x03A99F 24:A98F: 3E        .byte $3E    ; <Jr>
- D - I - 0x03A9A0 24:A990: 32        .byte $32    ; <ょ>
- D - I - 0x03A9A1 24:A991: 37        .byte $37    ; <4>
- D - I - 0x03A9A2 24:A992: 1C        .byte $1C    ; <ふ>
- D - I - 0x03A9A3 24:A993: 1C        .byte $1C    ; <ふ>
- D - I - 0x03A9A4 24:A994: 24        .byte $24    ; <や>
- D - I - 0x03A9A5 24:A995: 40        .byte $40    ; <「>
- D - I - 0x03A9A6 24:A996: 29        .byte $29    ; <る>
- D - I - 0x03A9A7 24:A997: 32        .byte $32    ; <ょ>
- D - I - 0x03A9A8 24:A998: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A9A9 24:A999: 24        .byte $24    ; <や>
- D - I - 0x03A9AA 24:A99A: 23        .byte $23    ; <も>
- D - I - 0x03A9AB 24:A99B: 24        .byte $24    ; <や>
- - - - - 0x03A9AC 24:A99C: 24        .byte $24    ; <や>
- D - I - 0x03A9AD 24:A99D: 40        .byte $40    ; <「>
- - - - - 0x03A9AE 24:A99E: 29        .byte $29    ; <る>
- - - - - 0x03A9AF 24:A99F: 32        .byte $32    ; <ょ>
- D - I - 0x03A9B0 24:A9A0: 2B        .byte $2B    ; <ろ>
- - - - - 0x03A9B1 24:A9A1: 24        .byte $24    ; <や>
- - - - - 0x03A9B2 24:A9A2: 23        .byte $23    ; <も>
- - - - - 0x03A9B3 24:A9A3: 24        .byte $24    ; <や>
- D - I - 0x03A9B4 24:A9A4: 24        .byte $24    ; <や>
- - - - - 0x03A9B5 24:A9A5: 00        .byte $00
- - - - - 0x03A9B6 24:A9A6: 00        .byte $00
- - - - - 0x03A9B7 24:A9A7: 3C        .byte $3C    ; <9>
- D - I - 0x03A9B8 24:A9A8: 41        .byte $41    ; <ア>
- - - - - 0x03A9B9 24:A9A9: 41        .byte $41    ; <ア>
- D - I - 0x03A9BA 24:A9AA: 26        .byte $26    ; <よ>
- D - I - 0x03A9BB 24:A9AB: 20        .byte $20    ; <み>
- D - I - 0x03A9BC 24:A9AC: 2E        .byte $2E    ; <ん>
- - - - - 0x03A9BD 24:A9AD: 3E        .byte $3E    ; <Jr>
- - - - - 0x03A9BE 24:A9AE: 33        .byte $33    ; <0>
- - - - - 0x03A9BF 24:A9AF: 3C        .byte $3C    ; <9>
- - - - - 0x03A9C0 24:A9B0: 35        .byte $35    ; <2>
- D - I - 0x03A9C1 24:A9B1: 2E        .byte $2E    ; <ん>
- - - - - 0x03A9C2 24:A9B2: 2D        .byte $2D    ; <を>
- - - - - 0x03A9C3 24:A9B3: 32        .byte $32    ; <ょ>
- D - I - 0x03A9C4 24:A9B4: 2E        .byte $2E    ; <ん>
- - - - - 0x03A9C5 24:A9B5: 3E        .byte $3E    ; <Jr>
- - - - - 0x03A9C6 24:A9B6: 33        .byte $33    ; <0>
- D - I - 0x03A9C7 24:A9B7: 3C        .byte $3C    ; <9>
- - - - - 0x03A9C8 24:A9B8: 35        .byte $35    ; <2>
- D - I - 0x03A9C9 24:A9B9: 2E        .byte $2E    ; <ん>
- - - - - 0x03A9CA 24:A9BA: 2D        .byte $2D    ; <を>
- - - - - 0x03A9CB 24:A9BB: 32        .byte $32    ; <ょ>
- - - - - 0x03A9CC 24:A9BC: 2E        .byte $2E    ; <ん>
- - - - - 0x03A9CD 24:A9BD: 00        .byte $00
- - - - - 0x03A9CE 24:A9BE: 00        .byte $00
- D - I - 0x03A9CF 24:A9BF: 3E        .byte $3E    ; <Jr>
- D - I - 0x03A9D0 24:A9C0: 43        .byte $43    ; <ウ>
- - - - - 0x03A9D1 24:A9C1: 43        .byte $43    ; <ウ>
- D - I - 0x03A9D2 24:A9C2: 26        .byte $26    ; <よ>
- D - I - 0x03A9D3 24:A9C3: 20        .byte $20    ; <み>
- D - I - 0x03A9D4 24:A9C4: 2E        .byte $2E    ; <ん>
- D - I - 0x03A9D5 24:A9C5: 40        .byte $40    ; <「>
- D - I - 0x03A9D6 24:A9C6: 33        .byte $33    ; <0>
- - - - - 0x03A9D7 24:A9C7: 3C        .byte $3C    ; <9>
- - - - - 0x03A9D8 24:A9C8: 35        .byte $35    ; <2>
- D - I - 0x03A9D9 24:A9C9: 2E        .byte $2E    ; <ん>
- - - - - 0x03A9DA 24:A9CA: 2D        .byte $2D    ; <を>
- - - - - 0x03A9DB 24:A9CB: 32        .byte $32    ; <ょ>
- D - I - 0x03A9DC 24:A9CC: 2E        .byte $2E    ; <ん>
- - - - - 0x03A9DD 24:A9CD: 40        .byte $40    ; <「>
- D - I - 0x03A9DE 24:A9CE: 33        .byte $33    ; <0>
- D - I - 0x03A9DF 24:A9CF: 3C        .byte $3C    ; <9>
- - - - - 0x03A9E0 24:A9D0: 35        .byte $35    ; <2>
- - - - - 0x03A9E1 24:A9D1: 2E        .byte $2E    ; <ん>
- D - I - 0x03A9E2 24:A9D2: 2D        .byte $2D    ; <を>
- - - - - 0x03A9E3 24:A9D3: 32        .byte $32    ; <ょ>
- D - I - 0x03A9E4 24:A9D4: 2E        .byte $2E    ; <ん>
- - - - - 0x03A9E5 24:A9D5: 00        .byte $00
- - - - - 0x03A9E6 24:A9D6: 00        .byte $00
- D - I - 0x03A9E7 24:A9D7: 54        .byte $54    ; <ト>
- D - I - 0x03A9E8 24:A9D8: 46        .byte $46    ; <カ>
- D - I - 0x03A9E9 24:A9D9: 46        .byte $46    ; <カ>
- - - - - 0x03A9EA 24:A9DA: 28        .byte $28    ; <り>
- D - I - 0x03A9EB 24:A9DB: 23        .byte $23    ; <も>
- D - I - 0x03A9EC 24:A9DC: 31        .byte $31    ; <ゅ>
- - - - - 0x03A9ED 24:A9DD: 56        .byte $56    ; <ニ>
- - - - - 0x03A9EE 24:A9DE: 33        .byte $33    ; <0>
- - - - - 0x03A9EF 24:A9DF: 3C        .byte $3C    ; <9>
- - - - - 0x03A9F0 24:A9E0: 35        .byte $35    ; <2>
- - - - - 0x03A9F1 24:A9E1: 2E        .byte $2E    ; <ん>
- - - - - 0x03A9F2 24:A9E2: 2D        .byte $2D    ; <を>
- - - - - 0x03A9F3 24:A9E3: 36        .byte $36    ; <3>
- D - I - 0x03A9F4 24:A9E4: 2E        .byte $2E    ; <ん>
- D - I - 0x03A9F5 24:A9E5: 56        .byte $56    ; <ニ>
- - - - - 0x03A9F6 24:A9E6: 33        .byte $33    ; <0>
- D - I - 0x03A9F7 24:A9E7: 3C        .byte $3C    ; <9>
- - - - - 0x03A9F8 24:A9E8: 35        .byte $35    ; <2>
- - - - - 0x03A9F9 24:A9E9: 2E        .byte $2E    ; <ん>
- - - - - 0x03A9FA 24:A9EA: 2D        .byte $2D    ; <を>
- - - - - 0x03A9FB 24:A9EB: 36        .byte $36    ; <3>
- D - I - 0x03A9FC 24:A9EC: 2E        .byte $2E    ; <ん>
- - - - - 0x03A9FD 24:A9ED: 00        .byte $00
- - - - - 0x03A9FE 24:A9EE: 00        .byte $00
- - - - - 0x03A9FF 24:A9EF: 40        .byte $40    ; <「>
- D - I - 0x03AA00 24:A9F0: 4A        .byte $4A    ; <コ>
- - - - - 0x03AA01 24:A9F1: 44        .byte $44    ; <エ>
- D - I - 0x03AA02 24:A9F2: 28        .byte $28    ; <り>
- D - I - 0x03AA03 24:A9F3: 22        .byte $22    ; <め>
- D - I - 0x03AA04 24:A9F4: 30        .byte $30    ; <ゃ>
- - - - - 0x03AA05 24:A9F5: 42        .byte $42    ; <イ>
- - - - - 0x03AA06 24:A9F6: 35        .byte $35    ; <2>
- D - I - 0x03AA07 24:A9F7: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AA08 24:A9F8: 37        .byte $37    ; <4>
- - - - - 0x03AA09 24:A9F9: 30        .byte $30    ; <ゃ>
- D - I - 0x03AA0A 24:A9FA: 2F        .byte $2F    ; <っ>
- - - - - 0x03AA0B 24:A9FB: 34        .byte $34    ; <1>
- D - I - 0x03AA0C 24:A9FC: 30        .byte $30    ; <ゃ>
- - - - - 0x03AA0D 24:A9FD: 46        .byte $46    ; <カ>
- D - I - 0x03AA0E 24:A9FE: 37        .byte $37    ; <4>
- - - - - 0x03AA0F 24:A9FF: 40        .byte $40    ; <「>
- - - - - 0x03AA10 24:AA00: 39        .byte $39    ; <6>
- - - - - 0x03AA11 24:AA01: 32        .byte $32    ; <ょ>
- D - I - 0x03AA12 24:AA02: 31        .byte $31    ; <ゅ>
- - - - - 0x03AA13 24:AA03: 36        .byte $36    ; <3>
- - - - - 0x03AA14 24:AA04: 32        .byte $32    ; <ょ>
- - - - - 0x03AA15 24:AA05: 00        .byte $00
- - - - - 0x03AA16 24:AA06: 00        .byte $00
- D - I - 0x03AA17 24:AA07: 42        .byte $42    ; <イ>
- D - I - 0x03AA18 24:AA08: 4C        .byte $4C    ; <シ>
- D - I - 0x03AA19 24:AA09: 46        .byte $46    ; <カ>
- D - I - 0x03AA1A 24:AA0A: 28        .byte $28    ; <り>
- D - I - 0x03AA1B 24:AA0B: 22        .byte $22    ; <め>
- D - I - 0x03AA1C 24:AA0C: 30        .byte $30    ; <ゃ>
- - - - - 0x03AA1D 24:AA0D: 44        .byte $44    ; <エ>
- - - - - 0x03AA1E 24:AA0E: 35        .byte $35    ; <2>
- D - I - 0x03AA1F 24:AA0F: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AA20 24:AA10: 37        .byte $37    ; <4>
- - - - - 0x03AA21 24:AA11: 30        .byte $30    ; <ゃ>
- - - - - 0x03AA22 24:AA12: 2F        .byte $2F    ; <っ>
- - - - - 0x03AA23 24:AA13: 34        .byte $34    ; <1>
- D - I - 0x03AA24 24:AA14: 30        .byte $30    ; <ゃ>
- D - I - 0x03AA25 24:AA15: 48        .byte $48    ; <ク>
- - - - - 0x03AA26 24:AA16: 37        .byte $37    ; <4>
- D - I - 0x03AA27 24:AA17: 40        .byte $40    ; <「>
- D - I - 0x03AA28 24:AA18: 39        .byte $39    ; <6>
- - - - - 0x03AA29 24:AA19: 32        .byte $32    ; <ょ>
- - - - - 0x03AA2A 24:AA1A: 31        .byte $31    ; <ゅ>
- - - - - 0x03AA2B 24:AA1B: 36        .byte $36    ; <3>
- D - I - 0x03AA2C 24:AA1C: 32        .byte $32    ; <ょ>
- - - - - 0x03AA2D 24:AA1D: 00        .byte $00
- - - - - 0x03AA2E 24:AA1E: 00        .byte $00
- D - I - 0x03AA2F 24:AA1F: 59        .byte $59    ; <ノ>
- D - I - 0x03AA30 24:AA20: 4C        .byte $4C    ; <シ>
- D - I - 0x03AA31 24:AA21: 48        .byte $48    ; <ク>
- D - I - 0x03AA32 24:AA22: 28        .byte $28    ; <り>
- D - I - 0x03AA33 24:AA23: 22        .byte $22    ; <め>
- D - I - 0x03AA34 24:AA24: 30        .byte $30    ; <ゃ>
- D - I - 0x03AA35 24:AA25: 5B        .byte $5B    ; <ヒ>
- - - - - 0x03AA36 24:AA26: 35        .byte $35    ; <2>
- - - - - 0x03AA37 24:AA27: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AA38 24:AA28: 37        .byte $37    ; <4>
- - - - - 0x03AA39 24:AA29: 30        .byte $30    ; <ゃ>
- - - - - 0x03AA3A 24:AA2A: 2F        .byte $2F    ; <っ>
- - - - - 0x03AA3B 24:AA2B: 34        .byte $34    ; <1>
- D - I - 0x03AA3C 24:AA2C: 30        .byte $30    ; <ゃ>
- D - I - 0x03AA3D 24:AA2D: 5E        .byte $5E    ; <ホ>
- - - - - 0x03AA3E 24:AA2E: 37        .byte $37    ; <4>
- - - - - 0x03AA3F 24:AA2F: 42        .byte $42    ; <イ>
- - - - - 0x03AA40 24:AA30: 39        .byte $39    ; <6>
- - - - - 0x03AA41 24:AA31: 32        .byte $32    ; <ょ>
- - - - - 0x03AA42 24:AA32: 31        .byte $31    ; <ゅ>
- - - - - 0x03AA43 24:AA33: 36        .byte $36    ; <3>
- D - I - 0x03AA44 24:AA34: 32        .byte $32    ; <ょ>
- - - - - 0x03AA45 24:AA35: 00        .byte $00
- - - - - 0x03AA46 24:AA36: 00        .byte $00
- D - I - 0x03AA47 24:AA37: 57        .byte $57    ; <ヌ>
- D - I - 0x03AA48 24:AA38: 4C        .byte $4C    ; <シ>
- D - I - 0x03AA49 24:AA39: 46        .byte $46    ; <カ>
- D - I - 0x03AA4A 24:AA3A: 41        .byte $41    ; <ア>
- D - I - 0x03AA4B 24:AA3B: 22        .byte $22    ; <め>
- D - I - 0x03AA4C 24:AA3C: 30        .byte $30    ; <ゃ>
- - - - - 0x03AA4D 24:AA3D: 59        .byte $59    ; <ノ>
- - - - - 0x03AA4E 24:AA3E: 35        .byte $35    ; <2>
- - - - - 0x03AA4F 24:AA3F: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AA50 24:AA40: 37        .byte $37    ; <4>
- - - - - 0x03AA51 24:AA41: 30        .byte $30    ; <ゃ>
- - - - - 0x03AA52 24:AA42: 3B        .byte $3B    ; <8>
- - - - - 0x03AA53 24:AA43: 34        .byte $34    ; <1>
- - - - - 0x03AA54 24:AA44: 30        .byte $30    ; <ゃ>
- - - - - 0x03AA55 24:AA45: 5C        .byte $5C    ; <フ>
- - - - - 0x03AA56 24:AA46: 37        .byte $37    ; <4>
- - - - - 0x03AA57 24:AA47: 40        .byte $40    ; <「>
- - - - - 0x03AA58 24:AA48: 39        .byte $39    ; <6>
- - - - - 0x03AA59 24:AA49: 32        .byte $32    ; <ょ>
- - - - - 0x03AA5A 24:AA4A: 3D        .byte $3D    ; <+>
- - - - - 0x03AA5B 24:AA4B: 36        .byte $36    ; <3>
- - - - - 0x03AA5C 24:AA4C: 32        .byte $32    ; <ょ>
- - - - - 0x03AA5D 24:AA4D: 00        .byte $00
- - - - - 0x03AA5E 24:AA4E: 00        .byte $00
- - - - - 0x03AA5F 24:AA4F: 46        .byte $46    ; <カ>
- D - I - 0x03AA60 24:AA50: 4E        .byte $4E    ; <セ>
- - - - - 0x03AA61 24:AA51: 4A        .byte $4A    ; <コ>
- D - I - 0x03AA62 24:AA52: 2C        .byte $2C    ; <わ>
- D - I - 0x03AA63 24:AA53: 26        .byte $26    ; <よ>
- D - I - 0x03AA64 24:AA54: 34        .byte $34    ; <1>
- - - - - 0x03AA65 24:AA55: 48        .byte $48    ; <ク>
- - - - - 0x03AA66 24:AA56: 39        .byte $39    ; <6>
- - - - - 0x03AA67 24:AA57: 42        .byte $42    ; <イ>
- - - - - 0x03AA68 24:AA58: 3B        .byte $3B    ; <8>
- D - I - 0x03AA69 24:AA59: 34        .byte $34    ; <1>
- - - - - 0x03AA6A 24:AA5A: 33        .byte $33    ; <0>
- - - - - 0x03AA6B 24:AA5B: 38        .byte $38    ; <5>
- - - - - 0x03AA6C 24:AA5C: 34        .byte $34    ; <1>
- - - - - 0x03AA6D 24:AA5D: 48        .byte $48    ; <ク>
- - - - - 0x03AA6E 24:AA5E: 39        .byte $39    ; <6>
- - - - - 0x03AA6F 24:AA5F: 42        .byte $42    ; <イ>
- - - - - 0x03AA70 24:AA60: 3B        .byte $3B    ; <8>
- D - I - 0x03AA71 24:AA61: 34        .byte $34    ; <1>
- - - - - 0x03AA72 24:AA62: 33        .byte $33    ; <0>
- - - - - 0x03AA73 24:AA63: 38        .byte $38    ; <5>
- D - I - 0x03AA74 24:AA64: 34        .byte $34    ; <1>
- - - - - 0x03AA75 24:AA65: 00        .byte $00
- - - - - 0x03AA76 24:AA66: 00        .byte $00
- D - I - 0x03AA77 24:AA67: 4A        .byte $4A    ; <コ>
- D - I - 0x03AA78 24:AA68: 52        .byte $52    ; <ツ>
- D - I - 0x03AA79 24:AA69: 4E        .byte $4E    ; <セ>
- D - I - 0x03AA7A 24:AA6A: 2C        .byte $2C    ; <わ>
- D - I - 0x03AA7B 24:AA6B: 26        .byte $26    ; <よ>
- D - I - 0x03AA7C 24:AA6C: 34        .byte $34    ; <1>
- - - - - 0x03AA7D 24:AA6D: 4C        .byte $4C    ; <シ>
- - - - - 0x03AA7E 24:AA6E: 39        .byte $39    ; <6>
- D - I - 0x03AA7F 24:AA6F: 42        .byte $42    ; <イ>
- - - - - 0x03AA80 24:AA70: 3B        .byte $3B    ; <8>
- D - I - 0x03AA81 24:AA71: 34        .byte $34    ; <1>
- D - I - 0x03AA82 24:AA72: 33        .byte $33    ; <0>
- - - - - 0x03AA83 24:AA73: 38        .byte $38    ; <5>
- D - I - 0x03AA84 24:AA74: 34        .byte $34    ; <1>
- - - - - 0x03AA85 24:AA75: 4C        .byte $4C    ; <シ>
- D - I - 0x03AA86 24:AA76: 39        .byte $39    ; <6>
- D - I - 0x03AA87 24:AA77: 42        .byte $42    ; <イ>
- - - - - 0x03AA88 24:AA78: 3B        .byte $3B    ; <8>
- D - I - 0x03AA89 24:AA79: 34        .byte $34    ; <1>
- - - - - 0x03AA8A 24:AA7A: 33        .byte $33    ; <0>
- - - - - 0x03AA8B 24:AA7B: 38        .byte $38    ; <5>
- - - - - 0x03AA8C 24:AA7C: 34        .byte $34    ; <1>
- - - - - 0x03AA8D 24:AA7D: 00        .byte $00
- - - - - 0x03AA8E 24:AA7E: 00        .byte $00
- D - I - 0x03AA8F 24:AA7F: 56        .byte $56    ; <ニ>
- D - I - 0x03AA90 24:AA80: 50        .byte $50    ; <タ>
- D - I - 0x03AA91 24:AA81: 4E        .byte $4E    ; <セ>
- D - I - 0x03AA92 24:AA82: 2B        .byte $2B    ; <ろ>
- D - I - 0x03AA93 24:AA83: 25        .byte $25    ; <ゆ>
- D - I - 0x03AA94 24:AA84: 33        .byte $33    ; <0>
- D - I - 0x03AA95 24:AA85: 58        .byte $58    ; <ネ>
- - - - - 0x03AA96 24:AA86: 39        .byte $39    ; <6>
- - - - - 0x03AA97 24:AA87: 42        .byte $42    ; <イ>
- - - - - 0x03AA98 24:AA88: 3B        .byte $3B    ; <8>
- - - - - 0x03AA99 24:AA89: 34        .byte $34    ; <1>
- - - - - 0x03AA9A 24:AA8A: 33        .byte $33    ; <0>
- - - - - 0x03AA9B 24:AA8B: 38        .byte $38    ; <5>
- D - I - 0x03AA9C 24:AA8C: 34        .byte $34    ; <1>
- D - I - 0x03AA9D 24:AA8D: 58        .byte $58    ; <ネ>
- - - - - 0x03AA9E 24:AA8E: 39        .byte $39    ; <6>
- - - - - 0x03AA9F 24:AA8F: 42        .byte $42    ; <イ>
- - - - - 0x03AAA0 24:AA90: 3B        .byte $3B    ; <8>
- - - - - 0x03AAA1 24:AA91: 34        .byte $34    ; <1>
- - - - - 0x03AAA2 24:AA92: 33        .byte $33    ; <0>
- - - - - 0x03AAA3 24:AA93: 38        .byte $38    ; <5>
- D - I - 0x03AAA4 24:AA94: 34        .byte $34    ; <1>
- - - - - 0x03AAA5 24:AA95: 00        .byte $00
- - - - - 0x03AAA6 24:AA96: 00        .byte $00
- - - - - 0x03AAA7 24:AA97: 44        .byte $44    ; <エ>
- D - I - 0x03AAA8 24:AA98: 5A        .byte $5A    ; <ハ>
- - - - - 0x03AAA9 24:AA99: 4C        .byte $4C    ; <シ>
- D - I - 0x03AAAA 24:AA9A: 2E        .byte $2E    ; <ん>
- D - I - 0x03AAAB 24:AA9B: 28        .byte $28    ; <り>
- D - I - 0x03AAAC 24:AA9C: 34        .byte $34    ; <1>
- - - - - 0x03AAAD 24:AA9D: 46        .byte $46    ; <カ>
- - - - - 0x03AAAE 24:AA9E: 3B        .byte $3B    ; <8>
- - - - - 0x03AAAF 24:AA9F: 44        .byte $44    ; <エ>
- - - - - 0x03AAB0 24:AAA0: 3D        .byte $3D    ; <+>
- - - - - 0x03AAB1 24:AAA1: 36        .byte $36    ; <3>
- D - I - 0x03AAB2 24:AAA2: 35        .byte $35    ; <2>
- - - - - 0x03AAB3 24:AAA3: 3A        .byte $3A    ; <7>
- - - - - 0x03AAB4 24:AAA4: 40        .byte $40    ; <「>
- - - - - 0x03AAB5 24:AAA5: 46        .byte $46    ; <カ>
- - - - - 0x03AAB6 24:AAA6: 3B        .byte $3B    ; <8>
- - - - - 0x03AAB7 24:AAA7: 44        .byte $44    ; <エ>
- - - - - 0x03AAB8 24:AAA8: 3D        .byte $3D    ; <+>
- D - I - 0x03AAB9 24:AAA9: 36        .byte $36    ; <3>
- - - - - 0x03AABA 24:AAAA: 35        .byte $35    ; <2>
- - - - - 0x03AABB 24:AAAB: 3C        .byte $3C    ; <9>
- - - - - 0x03AABC 24:AAAC: 38        .byte $38    ; <5>
- - - - - 0x03AABD 24:AAAD: 00        .byte $00
- - - - - 0x03AABE 24:AAAE: 00        .byte $00
- - - - - 0x03AABF 24:AAAF: 46        .byte $46    ; <カ>
- D - I - 0x03AAC0 24:AAB0: 5C        .byte $5C    ; <フ>
- D - I - 0x03AAC1 24:AAB1: 4E        .byte $4E    ; <セ>
- - - - - 0x03AAC2 24:AAB2: 2E        .byte $2E    ; <ん>
- D - I - 0x03AAC3 24:AAB3: 28        .byte $28    ; <り>
- D - I - 0x03AAC4 24:AAB4: 34        .byte $34    ; <1>
- D - I - 0x03AAC5 24:AAB5: 48        .byte $48    ; <ク>
- - - - - 0x03AAC6 24:AAB6: 3B        .byte $3B    ; <8>
- D - I - 0x03AAC7 24:AAB7: 44        .byte $44    ; <エ>
- - - - - 0x03AAC8 24:AAB8: 3D        .byte $3D    ; <+>
- - - - - 0x03AAC9 24:AAB9: 36        .byte $36    ; <3>
- - - - - 0x03AACA 24:AABA: 35        .byte $35    ; <2>
- - - - - 0x03AACB 24:AABB: 3A        .byte $3A    ; <7>
- D - I - 0x03AACC 24:AABC: 40        .byte $40    ; <「>
- D - I - 0x03AACD 24:AABD: 48        .byte $48    ; <ク>
- - - - - 0x03AACE 24:AABE: 3B        .byte $3B    ; <8>
- D - I - 0x03AACF 24:AABF: 44        .byte $44    ; <エ>
- D - I - 0x03AAD0 24:AAC0: 3D        .byte $3D    ; <+>
- - - - - 0x03AAD1 24:AAC1: 36        .byte $36    ; <3>
- - - - - 0x03AAD2 24:AAC2: 35        .byte $35    ; <2>
- - - - - 0x03AAD3 24:AAC3: 3C        .byte $3C    ; <9>
- D - I - 0x03AAD4 24:AAC4: 38        .byte $38    ; <5>
- - - - - 0x03AAD5 24:AAC5: 00        .byte $00
- - - - - 0x03AAD6 24:AAC6: 00        .byte $00
- D - I - 0x03AAD7 24:AAC7: 4C        .byte $4C    ; <シ>
- D - I - 0x03AAD8 24:AAC8: 5E        .byte $5E    ; <ホ>
- D - I - 0x03AAD9 24:AAC9: 42        .byte $42    ; <イ>
- - - - - 0x03AADA 24:AACA: 30        .byte $30    ; <ゃ>
- D - I - 0x03AADB 24:AACB: 32        .byte $32    ; <ょ>
- D - I - 0x03AADC 24:AACC: 3A        .byte $3A    ; <7>
- - - - - 0x03AADD 24:AACD: 4C        .byte $4C    ; <シ>
- - - - - 0x03AADE 24:AACE: 3B        .byte $3B    ; <8>
- - - - - 0x03AADF 24:AACF: 44        .byte $44    ; <エ>
- - - - - 0x03AAE0 24:AAD0: 3D        .byte $3D    ; <+>
- - - - - 0x03AAE1 24:AAD1: 36        .byte $36    ; <3>
- - - - - 0x03AAE2 24:AAD2: 35        .byte $35    ; <2>
- - - - - 0x03AAE3 24:AAD3: 3A        .byte $3A    ; <7>
- D - I - 0x03AAE4 24:AAD4: 40        .byte $40    ; <「>
- - - - - 0x03AAE5 24:AAD5: 4C        .byte $4C    ; <シ>
- - - - - 0x03AAE6 24:AAD6: 3B        .byte $3B    ; <8>
- - - - - 0x03AAE7 24:AAD7: 44        .byte $44    ; <エ>
- - - - - 0x03AAE8 24:AAD8: 3D        .byte $3D    ; <+>
- - - - - 0x03AAE9 24:AAD9: 36        .byte $36    ; <3>
- - - - - 0x03AAEA 24:AADA: 35        .byte $35    ; <2>
- - - - - 0x03AAEB 24:AADB: 3C        .byte $3C    ; <9>
- D - I - 0x03AAEC 24:AADC: 38        .byte $38    ; <5>
- - - - - 0x03AAED 24:AADD: 00        .byte $00
- - - - - 0x03AAEE 24:AADE: 00        .byte $00
- D - I - 0x03AAEF 24:AADF: 4C        .byte $4C    ; <シ>
- D - I - 0x03AAF0 24:AAE0: 60        .byte $60    ; <ミ>
- D - I - 0x03AAF1 24:AAE1: 56        .byte $56    ; <ニ>
- D - I - 0x03AAF2 24:AAE2: 3C        .byte $3C    ; <9>
- D - I - 0x03AAF3 24:AAE3: 34        .byte $34    ; <1>
- D - I - 0x03AAF4 24:AAE4: 43        .byte $43    ; <ウ>
- - - - - 0x03AAF5 24:AAE5: 4D        .byte $4D    ; <ス>
- - - - - 0x03AAF6 24:AAE6: 3B        .byte $3B    ; <8>
- - - - - 0x03AAF7 24:AAE7: 44        .byte $44    ; <エ>
- - - - - 0x03AAF8 24:AAE8: 3D        .byte $3D    ; <+>
- - - - - 0x03AAF9 24:AAE9: 36        .byte $36    ; <3>
- - - - - 0x03AAFA 24:AAEA: 35        .byte $35    ; <2>
- - - - - 0x03AAFB 24:AAEB: 3A        .byte $3A    ; <7>
- - - - - 0x03AAFC 24:AAEC: 40        .byte $40    ; <「>
- - - - - 0x03AAFD 24:AAED: 4D        .byte $4D    ; <ス>
- - - - - 0x03AAFE 24:AAEE: 3B        .byte $3B    ; <8>
- - - - - 0x03AAFF 24:AAEF: 44        .byte $44    ; <エ>
- - - - - 0x03AB00 24:AAF0: 3D        .byte $3D    ; <+>
- - - - - 0x03AB01 24:AAF1: 36        .byte $36    ; <3>
- - - - - 0x03AB02 24:AAF2: 35        .byte $35    ; <2>
- - - - - 0x03AB03 24:AAF3: 3C        .byte $3C    ; <9>
- D - I - 0x03AB04 24:AAF4: 38        .byte $38    ; <5>
- - - - - 0x03AB05 24:AAF5: 00        .byte $00
- - - - - 0x03AB06 24:AAF6: 00        .byte $00
- D - I - 0x03AB07 24:AAF7: 4C        .byte $4C    ; <シ>
- D - I - 0x03AB08 24:AAF8: 5C        .byte $5C    ; <フ>
- D - I - 0x03AB09 24:AAF9: 56        .byte $56    ; <ニ>
- D - I - 0x03AB0A 24:AAFA: 32        .byte $32    ; <ょ>
- D - I - 0x03AB0B 24:AAFB: 2C        .byte $2C    ; <わ>
- D - I - 0x03AB0C 24:AAFC: 38        .byte $38    ; <5>
- D - I - 0x03AB0D 24:AAFD: 4E        .byte $4E    ; <セ>
- - - - - 0x03AB0E 24:AAFE: 3D        .byte $3D    ; <+>
- - - - - 0x03AB0F 24:AAFF: 46        .byte $46    ; <カ>
- - - - - 0x03AB10 24:AB00: 3F        .byte $3F    ; <•>
- D - I - 0x03AB11 24:AB01: 38        .byte $38    ; <5>
- - - - - 0x03AB12 24:AB02: 37        .byte $37    ; <4>
- - - - - 0x03AB13 24:AB03: 3C        .byte $3C    ; <9>
- D - I - 0x03AB14 24:AB04: 38        .byte $38    ; <5>
- D - I - 0x03AB15 24:AB05: 4E        .byte $4E    ; <セ>
- - - - - 0x03AB16 24:AB06: 3D        .byte $3D    ; <+>
- D - I - 0x03AB17 24:AB07: 46        .byte $46    ; <カ>
- - - - - 0x03AB18 24:AB08: 3F        .byte $3F    ; <•>
- - - - - 0x03AB19 24:AB09: 38        .byte $38    ; <5>
- D - I - 0x03AB1A 24:AB0A: 37        .byte $37    ; <4>
- - - - - 0x03AB1B 24:AB0B: 3C        .byte $3C    ; <9>
- - - - - 0x03AB1C 24:AB0C: 38        .byte $38    ; <5>
- - - - - 0x03AB1D 24:AB0D: 00        .byte $00
- - - - - 0x03AB1E 24:AB0E: 00        .byte $00
- D - I - 0x03AB1F 24:AB0F: 4E        .byte $4E    ; <セ>
- D - I - 0x03AB20 24:AB10: 5E        .byte $5E    ; <ホ>
- D - I - 0x03AB21 24:AB11: 58        .byte $58    ; <ネ>
- D - I - 0x03AB22 24:AB12: 32        .byte $32    ; <ょ>
- D - I - 0x03AB23 24:AB13: 2C        .byte $2C    ; <わ>
- D - I - 0x03AB24 24:AB14: 38        .byte $38    ; <5>
- D - I - 0x03AB25 24:AB15: 50        .byte $50    ; <タ>
- - - - - 0x03AB26 24:AB16: 3D        .byte $3D    ; <+>
- D - I - 0x03AB27 24:AB17: 46        .byte $46    ; <カ>
- D - I - 0x03AB28 24:AB18: 3F        .byte $3F    ; <•>
- D - I - 0x03AB29 24:AB19: 38        .byte $38    ; <5>
- - - - - 0x03AB2A 24:AB1A: 37        .byte $37    ; <4>
- D - I - 0x03AB2B 24:AB1B: 3C        .byte $3C    ; <9>
- D - I - 0x03AB2C 24:AB1C: 38        .byte $38    ; <5>
- - - - - 0x03AB2D 24:AB1D: 50        .byte $50    ; <タ>
- - - - - 0x03AB2E 24:AB1E: 3D        .byte $3D    ; <+>
- - - - - 0x03AB2F 24:AB1F: 46        .byte $46    ; <カ>
- - - - - 0x03AB30 24:AB20: 3F        .byte $3F    ; <•>
- D - I - 0x03AB31 24:AB21: 38        .byte $38    ; <5>
- - - - - 0x03AB32 24:AB22: 37        .byte $37    ; <4>
- - - - - 0x03AB33 24:AB23: 3C        .byte $3C    ; <9>
- D - I - 0x03AB34 24:AB24: 38        .byte $38    ; <5>
- - - - - 0x03AB35 24:AB25: 00        .byte $00
- - - - - 0x03AB36 24:AB26: 00        .byte $00
- D - I - 0x03AB37 24:AB27: 57        .byte $57    ; <ヌ>
- D - I - 0x03AB38 24:AB28: 64        .byte $64    ; <ヤ>
- D - I - 0x03AB39 24:AB29: 5E        .byte $5E    ; <ホ>
- D - I - 0x03AB3A 24:AB2A: 34        .byte $34    ; <1>
- D - I - 0x03AB3B 24:AB2B: 2E        .byte $2E    ; <ん>
- D - I - 0x03AB3C 24:AB2C: 3A        .byte $3A    ; <7>
- D - I - 0x03AB3D 24:AB2D: 5C        .byte $5C    ; <フ>
- - - - - 0x03AB3E 24:AB2E: 3D        .byte $3D    ; <+>
- - - - - 0x03AB3F 24:AB2F: 46        .byte $46    ; <カ>
- - - - - 0x03AB40 24:AB30: 3F        .byte $3F    ; <•>
- - - - - 0x03AB41 24:AB31: 38        .byte $38    ; <5>
- - - - - 0x03AB42 24:AB32: 37        .byte $37    ; <4>
- D - I - 0x03AB43 24:AB33: 3C        .byte $3C    ; <9>
- - - - - 0x03AB44 24:AB34: 38        .byte $38    ; <5>
- D - I - 0x03AB45 24:AB35: 5C        .byte $5C    ; <フ>
- - - - - 0x03AB46 24:AB36: 3D        .byte $3D    ; <+>
- - - - - 0x03AB47 24:AB37: 46        .byte $46    ; <カ>
- - - - - 0x03AB48 24:AB38: 3F        .byte $3F    ; <•>
- - - - - 0x03AB49 24:AB39: 38        .byte $38    ; <5>
- - - - - 0x03AB4A 24:AB3A: 37        .byte $37    ; <4>
- - - - - 0x03AB4B 24:AB3B: 3C        .byte $3C    ; <9>
- - - - - 0x03AB4C 24:AB3C: 38        .byte $38    ; <5>
- - - - - 0x03AB4D 24:AB3D: 00        .byte $00
- - - - - 0x03AB4E 24:AB3E: 00        .byte $00
- - - - - 0x03AB4F 24:AB3F: 48        .byte $48    ; <ク>
- - - - - 0x03AB50 24:AB40: 53        .byte $53    ; <テ>
- - - - - 0x03AB51 24:AB41: 4E        .byte $4E    ; <セ>
- D - I - 0x03AB52 24:AB42: 3A        .byte $3A    ; <7>
- D - I - 0x03AB53 24:AB43: 32        .byte $32    ; <ょ>
- D - I - 0x03AB54 24:AB44: 2C        .byte $2C    ; <わ>
- - - - - 0x03AB55 24:AB45: 4A        .byte $4A    ; <コ>
- - - - - 0x03AB56 24:AB46: 3F        .byte $3F    ; <•>
- - - - - 0x03AB57 24:AB47: 48        .byte $48    ; <ク>
- - - - - 0x03AB58 24:AB48: 4B        .byte $4B    ; <サ>
- - - - - 0x03AB59 24:AB49: 3A        .byte $3A    ; <7>
- - - - - 0x03AB5A 24:AB4A: 39        .byte $39    ; <6>
- - - - - 0x03AB5B 24:AB4B: 3E        .byte $3E    ; <Jr>
- D - I - 0x03AB5C 24:AB4C: 3A        .byte $3A    ; <7>
- - - - - 0x03AB5D 24:AB4D: 4C        .byte $4C    ; <シ>
- - - - - 0x03AB5E 24:AB4E: 41        .byte $41    ; <ア>
- - - - - 0x03AB5F 24:AB4F: 4A        .byte $4A    ; <コ>
- - - - - 0x03AB60 24:AB50: 4D        .byte $4D    ; <ス>
- - - - - 0x03AB61 24:AB51: 3C        .byte $3C    ; <9>
- - - - - 0x03AB62 24:AB52: 3B        .byte $3B    ; <8>
- - - - - 0x03AB63 24:AB53: 40        .byte $40    ; <「>
- D - I - 0x03AB64 24:AB54: 3C        .byte $3C    ; <9>
- - - - - 0x03AB65 24:AB55: 00        .byte $00
- - - - - 0x03AB66 24:AB56: 00        .byte $00
- D - I - 0x03AB67 24:AB57: 4A        .byte $4A    ; <コ>
- D - I - 0x03AB68 24:AB58: 55        .byte $55    ; <ナ>
- D - I - 0x03AB69 24:AB59: 50        .byte $50    ; <タ>
- D - I - 0x03AB6A 24:AB5A: 3A        .byte $3A    ; <7>
- D - I - 0x03AB6B 24:AB5B: 32        .byte $32    ; <ょ>
- D - I - 0x03AB6C 24:AB5C: 2C        .byte $2C    ; <わ>
- D - I - 0x03AB6D 24:AB5D: 4C        .byte $4C    ; <シ>
- - - - - 0x03AB6E 24:AB5E: 3F        .byte $3F    ; <•>
- D - I - 0x03AB6F 24:AB5F: 48        .byte $48    ; <ク>
- - - - - 0x03AB70 24:AB60: 4B        .byte $4B    ; <サ>
- D - I - 0x03AB71 24:AB61: 3A        .byte $3A    ; <7>
- - - - - 0x03AB72 24:AB62: 39        .byte $39    ; <6>
- - - - - 0x03AB73 24:AB63: 3E        .byte $3E    ; <Jr>
- D - I - 0x03AB74 24:AB64: 3A        .byte $3A    ; <7>
- D - I - 0x03AB75 24:AB65: 4E        .byte $4E    ; <セ>
- - - - - 0x03AB76 24:AB66: 41        .byte $41    ; <ア>
- - - - - 0x03AB77 24:AB67: 4A        .byte $4A    ; <コ>
- D - I - 0x03AB78 24:AB68: 4D        .byte $4D    ; <ス>
- - - - - 0x03AB79 24:AB69: 3C        .byte $3C    ; <9>
- - - - - 0x03AB7A 24:AB6A: 3B        .byte $3B    ; <8>
- - - - - 0x03AB7B 24:AB6B: 40        .byte $40    ; <「>
- D - I - 0x03AB7C 24:AB6C: 3C        .byte $3C    ; <9>
- - - - - 0x03AB7D 24:AB6D: 00        .byte $00
- - - - - 0x03AB7E 24:AB6E: 00        .byte $00
- D - I - 0x03AB7F 24:AB6F: 4E        .byte $4E    ; <セ>
- D - I - 0x03AB80 24:AB70: 58        .byte $58    ; <ネ>
- D - I - 0x03AB81 24:AB71: 54        .byte $54    ; <ト>
- - - - - 0x03AB82 24:AB72: 3E        .byte $3E    ; <Jr>
- D - I - 0x03AB83 24:AB73: 36        .byte $36    ; <3>
- - - - - 0x03AB84 24:AB74: 32        .byte $32    ; <ょ>
- D - I - 0x03AB85 24:AB75: 50        .byte $50    ; <タ>
- - - - - 0x03AB86 24:AB76: 43        .byte $43    ; <ウ>
- - - - - 0x03AB87 24:AB77: 4C        .byte $4C    ; <シ>
- - - - - 0x03AB88 24:AB78: 4F        .byte $4F    ; <ソ>
- - - - - 0x03AB89 24:AB79: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AB8A 24:AB7A: 3D        .byte $3D    ; <+>
- - - - - 0x03AB8B 24:AB7B: 42        .byte $42    ; <イ>
- - - - - 0x03AB8C 24:AB7C: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AB8D 24:AB7D: 4D        .byte $4D    ; <ス>
- - - - - 0x03AB8E 24:AB7E: 45        .byte $45    ; <オ>
- - - - - 0x03AB8F 24:AB7F: 4E        .byte $4E    ; <セ>
- - - - - 0x03AB90 24:AB80: 51        .byte $51    ; <チ>
- - - - - 0x03AB91 24:AB81: 40        .byte $40    ; <「>
- - - - - 0x03AB92 24:AB82: 3F        .byte $3F    ; <•>
- - - - - 0x03AB93 24:AB83: 44        .byte $44    ; <エ>
- D - I - 0x03AB94 24:AB84: 40        .byte $40    ; <「>
- - - - - 0x03AB95 24:AB85: 00        .byte $00
- - - - - 0x03AB96 24:AB86: 00        .byte $00
- - - - - 0x03AB97 24:AB87: 4A        .byte $4A    ; <コ>
- D - I - 0x03AB98 24:AB88: 57        .byte $57    ; <ヌ>
- - - - - 0x03AB99 24:AB89: 53        .byte $53    ; <テ>
- D - I - 0x03AB9A 24:AB8A: 34        .byte $34    ; <1>
- D - I - 0x03AB9B 24:AB8B: 34        .byte $34    ; <1>
- D - I - 0x03AB9C 24:AB8C: 36        .byte $36    ; <3>
- D - I - 0x03AB9D 24:AB8D: 4C        .byte $4C    ; <シ>
- - - - - 0x03AB9E 24:AB8E: 41        .byte $41    ; <ア>
- - - - - 0x03AB9F 24:AB8F: 4A        .byte $4A    ; <コ>
- - - - - 0x03ABA0 24:AB90: 4D        .byte $4D    ; <ス>
- D - I - 0x03ABA1 24:AB91: 3C        .byte $3C    ; <9>
- D - I - 0x03ABA2 24:AB92: 3B        .byte $3B    ; <8>
- - - - - 0x03ABA3 24:AB93: 40        .byte $40    ; <「>
- - - - - 0x03ABA4 24:AB94: 3C        .byte $3C    ; <9>
- - - - - 0x03ABA5 24:AB95: 4C        .byte $4C    ; <シ>
- - - - - 0x03ABA6 24:AB96: 41        .byte $41    ; <ア>
- - - - - 0x03ABA7 24:AB97: 4A        .byte $4A    ; <コ>
- - - - - 0x03ABA8 24:AB98: 4D        .byte $4D    ; <ス>
- - - - - 0x03ABA9 24:AB99: 3C        .byte $3C    ; <9>
- - - - - 0x03ABAA 24:AB9A: 3B        .byte $3B    ; <8>
- - - - - 0x03ABAB 24:AB9B: 40        .byte $40    ; <「>
- D - I - 0x03ABAC 24:AB9C: 3C        .byte $3C    ; <9>
- - - - - 0x03ABAD 24:AB9D: 00        .byte $00
- - - - - 0x03ABAE 24:AB9E: 00        .byte $00
- D - I - 0x03ABAF 24:AB9F: 4C        .byte $4C    ; <シ>
- D - I - 0x03ABB0 24:ABA0: 58        .byte $58    ; <ネ>
- - - - - 0x03ABB1 24:ABA1: 55        .byte $55    ; <ナ>
- D - I - 0x03ABB2 24:ABA2: 34        .byte $34    ; <1>
- D - I - 0x03ABB3 24:ABA3: 34        .byte $34    ; <1>
- D - I - 0x03ABB4 24:ABA4: 36        .byte $36    ; <3>
- D - I - 0x03ABB5 24:ABA5: 4E        .byte $4E    ; <セ>
- - - - - 0x03ABB6 24:ABA6: 41        .byte $41    ; <ア>
- D - I - 0x03ABB7 24:ABA7: 4A        .byte $4A    ; <コ>
- - - - - 0x03ABB8 24:ABA8: 4D        .byte $4D    ; <ス>
- - - - - 0x03ABB9 24:ABA9: 3C        .byte $3C    ; <9>
- - - - - 0x03ABBA 24:ABAA: 3B        .byte $3B    ; <8>
- - - - - 0x03ABBB 24:ABAB: 40        .byte $40    ; <「>
- D - I - 0x03ABBC 24:ABAC: 3C        .byte $3C    ; <9>
- - - - - 0x03ABBD 24:ABAD: 4E        .byte $4E    ; <セ>
- - - - - 0x03ABBE 24:ABAE: 41        .byte $41    ; <ア>
- - - - - 0x03ABBF 24:ABAF: 4A        .byte $4A    ; <コ>
- - - - - 0x03ABC0 24:ABB0: 4D        .byte $4D    ; <ス>
- D - I - 0x03ABC1 24:ABB1: 3C        .byte $3C    ; <9>
- - - - - 0x03ABC2 24:ABB2: 3B        .byte $3B    ; <8>
- - - - - 0x03ABC3 24:ABB3: 40        .byte $40    ; <「>
- - - - - 0x03ABC4 24:ABB4: 3C        .byte $3C    ; <9>
- - - - - 0x03ABC5 24:ABB5: 00        .byte $00
- - - - - 0x03ABC6 24:ABB6: 00        .byte $00
- D - I - 0x03ABC7 24:ABB7: 5F        .byte $5F    ; <マ>
- D - I - 0x03ABC8 24:ABB8: 5E        .byte $5E    ; <ホ>
- D - I - 0x03ABC9 24:ABB9: 5A        .byte $5A    ; <ハ>
- D - I - 0x03ABCA 24:ABBA: 3E        .byte $3E    ; <Jr>
- D - I - 0x03ABCB 24:ABBB: 42        .byte $42    ; <イ>
- D - I - 0x03ABCC 24:ABBC: 4A        .byte $4A    ; <コ>
- D - I - 0x03ABCD 24:ABBD: 5C        .byte $5C    ; <フ>
- - - - - 0x03ABCE 24:ABBE: 41        .byte $41    ; <ア>
- - - - - 0x03ABCF 24:ABBF: 4A        .byte $4A    ; <コ>
- - - - - 0x03ABD0 24:ABC0: 4D        .byte $4D    ; <ス>
- - - - - 0x03ABD1 24:ABC1: 3C        .byte $3C    ; <9>
- - - - - 0x03ABD2 24:ABC2: 3B        .byte $3B    ; <8>
- - - - - 0x03ABD3 24:ABC3: 40        .byte $40    ; <「>
- - - - - 0x03ABD4 24:ABC4: 3C        .byte $3C    ; <9>
- - - - - 0x03ABD5 24:ABC5: 4E        .byte $4E    ; <セ>
- - - - - 0x03ABD6 24:ABC6: 41        .byte $41    ; <ア>
- - - - - 0x03ABD7 24:ABC7: 4A        .byte $4A    ; <コ>
- - - - - 0x03ABD8 24:ABC8: 4D        .byte $4D    ; <ス>
- D - I - 0x03ABD9 24:ABC9: 3C        .byte $3C    ; <9>
- - - - - 0x03ABDA 24:ABCA: 3B        .byte $3B    ; <8>
- - - - - 0x03ABDB 24:ABCB: 40        .byte $40    ; <「>
- D - I - 0x03ABDC 24:ABCC: 3C        .byte $3C    ; <9>
- - - - - 0x03ABDD 24:ABCD: 00        .byte $00
- - - - - 0x03ABDE 24:ABCE: 00        .byte $00
- D - I - 0x03ABDF 24:ABCF: 5B        .byte $5B    ; <ヒ>
- D - I - 0x03ABE0 24:ABD0: 5A        .byte $5A    ; <ハ>
- D - I - 0x03ABE1 24:ABD1: 56        .byte $56    ; <ニ>
- D - I - 0x03ABE2 24:ABD2: 50        .byte $50    ; <タ>
- D - I - 0x03ABE3 24:ABD3: 39        .byte $39    ; <6>
- - - - - 0x03ABE4 24:ABD4: 3C        .byte $3C    ; <9>
- - - - - 0x03ABE5 24:ABD5: 50        .byte $50    ; <タ>
- - - - - 0x03ABE6 24:ABD6: 45        .byte $45    ; <オ>
- - - - - 0x03ABE7 24:ABD7: 4E        .byte $4E    ; <セ>
- - - - - 0x03ABE8 24:ABD8: 51        .byte $51    ; <チ>
- - - - - 0x03ABE9 24:ABD9: 40        .byte $40    ; <「>
- - - - - 0x03ABEA 24:ABDA: 49        .byte $49    ; <ケ>
- - - - - 0x03ABEB 24:ABDB: 44        .byte $44    ; <エ>
- - - - - 0x03ABEC 24:ABDC: 40        .byte $40    ; <「>
- - - - - 0x03ABED 24:ABDD: 5B        .byte $5B    ; <ヒ>
- - - - - 0x03ABEE 24:ABDE: 4B        .byte $4B    ; <サ>
- - - - - 0x03ABEF 24:ABDF: 54        .byte $54    ; <ト>
- - - - - 0x03ABF0 24:ABE0: 57        .byte $57    ; <ヌ>
- - - - - 0x03ABF1 24:ABE1: 46        .byte $46    ; <カ>
- - - - - 0x03ABF2 24:ABE2: 45        .byte $45    ; <オ>
- - - - - 0x03ABF3 24:ABE3: 4A        .byte $4A    ; <コ>
- - - - - 0x03ABF4 24:ABE4: 46        .byte $46    ; <カ>
- - - - - 0x03ABF5 24:ABE5: 00        .byte $00
- - - - - 0x03ABF6 24:ABE6: 00        .byte $00
- - - - - 0x03ABF7 24:ABE7: 4D        .byte $4D    ; <ス>
- D - I - 0x03ABF8 24:ABE8: 57        .byte $57    ; <ヌ>
- D - I - 0x03ABF9 24:ABE9: 53        .byte $53    ; <テ>
- D - I - 0x03ABFA 24:ABEA: 34        .byte $34    ; <1>
- - - - - 0x03ABFB 24:ABEB: 34        .byte $34    ; <1>
- D - I - 0x03ABFC 24:ABEC: 32        .byte $32    ; <ょ>
- - - - - 0x03ABFD 24:ABED: 4F        .byte $4F    ; <ソ>
- - - - - 0x03ABFE 24:ABEE: 41        .byte $41    ; <ア>
- - - - - 0x03ABFF 24:ABEF: 4A        .byte $4A    ; <コ>
- - - - - 0x03AC00 24:ABF0: 4D        .byte $4D    ; <ス>
- - - - - 0x03AC01 24:ABF1: 3C        .byte $3C    ; <9>
- - - - - 0x03AC02 24:ABF2: 3B        .byte $3B    ; <8>
- - - - - 0x03AC03 24:ABF3: 40        .byte $40    ; <「>
- - - - - 0x03AC04 24:ABF4: 3C        .byte $3C    ; <9>
- - - - - 0x03AC05 24:ABF5: 4F        .byte $4F    ; <ソ>
- - - - - 0x03AC06 24:ABF6: 41        .byte $41    ; <ア>
- - - - - 0x03AC07 24:ABF7: 4A        .byte $4A    ; <コ>
- - - - - 0x03AC08 24:ABF8: 4D        .byte $4D    ; <ス>
- - - - - 0x03AC09 24:ABF9: 3C        .byte $3C    ; <9>
- - - - - 0x03AC0A 24:ABFA: 3B        .byte $3B    ; <8>
- - - - - 0x03AC0B 24:ABFB: 40        .byte $40    ; <「>
- - - - - 0x03AC0C 24:ABFC: 3C        .byte $3C    ; <9>
- - - - - 0x03AC0D 24:ABFD: 00        .byte $00
- - - - - 0x03AC0E 24:ABFE: 00        .byte $00
- - - - - 0x03AC0F 24:ABFF: 55        .byte $55    ; <ナ>
- D - I - 0x03AC10 24:AC00: 5E        .byte $5E    ; <ホ>
- D - I - 0x03AC11 24:AC01: 5A        .byte $5A    ; <ハ>
- D - I - 0x03AC12 24:AC02: 36        .byte $36    ; <3>
- D - I - 0x03AC13 24:AC03: 36        .byte $36    ; <3>
- - - - - 0x03AC14 24:AC04: 36        .byte $36    ; <3>
- - - - - 0x03AC15 24:AC05: 59        .byte $59    ; <ノ>
- - - - - 0x03AC16 24:AC06: 43        .byte $43    ; <ウ>
- - - - - 0x03AC17 24:AC07: 4C        .byte $4C    ; <シ>
- - - - - 0x03AC18 24:AC08: 4F        .byte $4F    ; <ソ>
- - - - - 0x03AC19 24:AC09: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AC1A 24:AC0A: 3D        .byte $3D    ; <+>
- - - - - 0x03AC1B 24:AC0B: 42        .byte $42    ; <イ>
- D - I - 0x03AC1C 24:AC0C: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AC1D 24:AC0D: 59        .byte $59    ; <ノ>
- - - - - 0x03AC1E 24:AC0E: 43        .byte $43    ; <ウ>
- - - - - 0x03AC1F 24:AC0F: 4C        .byte $4C    ; <シ>
- - - - - 0x03AC20 24:AC10: 4F        .byte $4F    ; <ソ>
- - - - - 0x03AC21 24:AC11: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AC22 24:AC12: 3D        .byte $3D    ; <+>
- - - - - 0x03AC23 24:AC13: 42        .byte $42    ; <イ>
- - - - - 0x03AC24 24:AC14: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AC25 24:AC15: 00        .byte $00
- - - - - 0x03AC26 24:AC16: 00        .byte $00
- - - - - 0x03AC27 24:AC17: 61        .byte $61    ; <ム>
- D - I - 0x03AC28 24:AC18: 5A        .byte $5A    ; <ハ>
- D - I - 0x03AC29 24:AC19: 56        .byte $56    ; <ニ>
- - - - - 0x03AC2A 24:AC1A: 34        .byte $34    ; <1>
- D - I - 0x03AC2B 24:AC1B: 34        .byte $34    ; <1>
- D - I - 0x03AC2C 24:AC1C: 36        .byte $36    ; <3>
- D - I - 0x03AC2D 24:AC1D: 5E        .byte $5E    ; <ホ>
- - - - - 0x03AC2E 24:AC1E: 43        .byte $43    ; <ウ>
- - - - - 0x03AC2F 24:AC1F: 4C        .byte $4C    ; <シ>
- - - - - 0x03AC30 24:AC20: 4F        .byte $4F    ; <ソ>
- - - - - 0x03AC31 24:AC21: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AC32 24:AC22: 3D        .byte $3D    ; <+>
- - - - - 0x03AC33 24:AC23: 42        .byte $42    ; <イ>
- - - - - 0x03AC34 24:AC24: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AC35 24:AC25: 54        .byte $54    ; <ト>
- - - - - 0x03AC36 24:AC26: 45        .byte $45    ; <オ>
- - - - - 0x03AC37 24:AC27: 4E        .byte $4E    ; <セ>
- - - - - 0x03AC38 24:AC28: 51        .byte $51    ; <チ>
- - - - - 0x03AC39 24:AC29: 40        .byte $40    ; <「>
- - - - - 0x03AC3A 24:AC2A: 3F        .byte $3F    ; <•>
- - - - - 0x03AC3B 24:AC2B: 44        .byte $44    ; <エ>
- - - - - 0x03AC3C 24:AC2C: 40        .byte $40    ; <「>
- - - - - 0x03AC3D 24:AC2D: 00        .byte $00
- - - - - 0x03AC3E 24:AC2E: 00        .byte $00
- D - I - 0x03AC3F 24:AC2F: 50        .byte $50    ; <タ>
- D - I - 0x03AC40 24:AC30: 60        .byte $60    ; <ミ>
- D - I - 0x03AC41 24:AC31: 68        .byte $68    ; <リ>
- - - - - 0x03AC42 24:AC32: 40        .byte $40    ; <「>
- D - I - 0x03AC43 24:AC33: 46        .byte $46    ; <カ>
- D - I - 0x03AC44 24:AC34: 4C        .byte $4C    ; <シ>
- - - - - 0x03AC45 24:AC35: 56        .byte $56    ; <ニ>
- - - - - 0x03AC46 24:AC36: 43        .byte $43    ; <ウ>
- - - - - 0x03AC47 24:AC37: 4C        .byte $4C    ; <シ>
- - - - - 0x03AC48 24:AC38: 4F        .byte $4F    ; <ソ>
- - - - - 0x03AC49 24:AC39: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AC4A 24:AC3A: 3D        .byte $3D    ; <+>
- - - - - 0x03AC4B 24:AC3B: 42        .byte $42    ; <イ>
- - - - - 0x03AC4C 24:AC3C: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AC4D 24:AC3D: 52        .byte $52    ; <ツ>
- - - - - 0x03AC4E 24:AC3E: 43        .byte $43    ; <ウ>
- - - - - 0x03AC4F 24:AC3F: 4C        .byte $4C    ; <シ>
- - - - - 0x03AC50 24:AC40: 4F        .byte $4F    ; <ソ>
- - - - - 0x03AC51 24:AC41: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AC52 24:AC42: 3D        .byte $3D    ; <+>
- - - - - 0x03AC53 24:AC43: 42        .byte $42    ; <イ>
- D - I - 0x03AC54 24:AC44: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AC55 24:AC45: 00        .byte $00
- - - - - 0x03AC56 24:AC46: 00        .byte $00
- D - I - 0x03AC57 24:AC47: 55        .byte $55    ; <ナ>
- D - I - 0x03AC58 24:AC48: 60        .byte $60    ; <ミ>
- - - - - 0x03AC59 24:AC49: 58        .byte $58    ; <ネ>
- D - I - 0x03AC5A 24:AC4A: 36        .byte $36    ; <3>
- - - - - 0x03AC5B 24:AC4B: 36        .byte $36    ; <3>
- D - I - 0x03AC5C 24:AC4C: 36        .byte $36    ; <3>
- - - - - 0x03AC5D 24:AC4D: 58        .byte $58    ; <ネ>
- - - - - 0x03AC5E 24:AC4E: 43        .byte $43    ; <ウ>
- - - - - 0x03AC5F 24:AC4F: 4C        .byte $4C    ; <シ>
- - - - - 0x03AC60 24:AC50: 4F        .byte $4F    ; <ソ>
- - - - - 0x03AC61 24:AC51: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AC62 24:AC52: 3D        .byte $3D    ; <+>
- - - - - 0x03AC63 24:AC53: 42        .byte $42    ; <イ>
- - - - - 0x03AC64 24:AC54: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AC65 24:AC55: 58        .byte $58    ; <ネ>
- - - - - 0x03AC66 24:AC56: 43        .byte $43    ; <ウ>
- - - - - 0x03AC67 24:AC57: 4C        .byte $4C    ; <シ>
- - - - - 0x03AC68 24:AC58: 4F        .byte $4F    ; <ソ>
- - - - - 0x03AC69 24:AC59: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AC6A 24:AC5A: 3D        .byte $3D    ; <+>
- - - - - 0x03AC6B 24:AC5B: 42        .byte $42    ; <イ>
- - - - - 0x03AC6C 24:AC5C: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AC6D 24:AC5D: 00        .byte $00
- - - - - 0x03AC6E 24:AC5E: 00        .byte $00
- - - - - 0x03AC6F 24:AC5F: 56        .byte $56    ; <ニ>
- D - I - 0x03AC70 24:AC60: 5C        .byte $5C    ; <フ>
- - - - - 0x03AC71 24:AC61: 58        .byte $58    ; <ネ>
- D - I - 0x03AC72 24:AC62: 55        .byte $55    ; <ナ>
- - - - - 0x03AC73 24:AC63: 31        .byte $31    ; <ゅ>
- D - I - 0x03AC74 24:AC64: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AC75 24:AC65: 56        .byte $56    ; <ニ>
- - - - - 0x03AC76 24:AC66: 47        .byte $47    ; <キ>
- - - - - 0x03AC77 24:AC67: 50        .byte $50    ; <タ>
- - - - - 0x03AC78 24:AC68: 53        .byte $53    ; <テ>
- - - - - 0x03AC79 24:AC69: 42        .byte $42    ; <イ>
- - - - - 0x03AC7A 24:AC6A: 4B        .byte $4B    ; <サ>
- - - - - 0x03AC7B 24:AC6B: 46        .byte $46    ; <カ>
- - - - - 0x03AC7C 24:AC6C: 42        .byte $42    ; <イ>
- - - - - 0x03AC7D 24:AC6D: 56        .byte $56    ; <ニ>
- - - - - 0x03AC7E 24:AC6E: 47        .byte $47    ; <キ>
- D - I - 0x03AC7F 24:AC6F: 50        .byte $50    ; <タ>
- - - - - 0x03AC80 24:AC70: 53        .byte $53    ; <テ>
- - - - - 0x03AC81 24:AC71: 42        .byte $42    ; <イ>
- - - - - 0x03AC82 24:AC72: 4B        .byte $4B    ; <サ>
- - - - - 0x03AC83 24:AC73: 46        .byte $46    ; <カ>
- - - - - 0x03AC84 24:AC74: 42        .byte $42    ; <イ>
- - - - - 0x03AC85 24:AC75: 00        .byte $00
- - - - - 0x03AC86 24:AC76: 00        .byte $00
- - - - - 0x03AC87 24:AC77: 52        .byte $52    ; <ツ>
- D - I - 0x03AC88 24:AC78: 59        .byte $59    ; <ノ>
- D - I - 0x03AC89 24:AC79: 55        .byte $55    ; <ナ>
- D - I - 0x03AC8A 24:AC7A: 36        .byte $36    ; <3>
- - - - - 0x03AC8B 24:AC7B: 36        .byte $36    ; <3>
- D - I - 0x03AC8C 24:AC7C: 32        .byte $32    ; <ょ>
- - - - - 0x03AC8D 24:AC7D: 54        .byte $54    ; <ト>
- - - - - 0x03AC8E 24:AC7E: 41        .byte $41    ; <ア>
- - - - - 0x03AC8F 24:AC7F: 4A        .byte $4A    ; <コ>
- - - - - 0x03AC90 24:AC80: 4D        .byte $4D    ; <ス>
- D - I - 0x03AC91 24:AC81: 3C        .byte $3C    ; <9>
- - - - - 0x03AC92 24:AC82: 3B        .byte $3B    ; <8>
- - - - - 0x03AC93 24:AC83: 40        .byte $40    ; <「>
- - - - - 0x03AC94 24:AC84: 3C        .byte $3C    ; <9>
- - - - - 0x03AC95 24:AC85: 54        .byte $54    ; <ト>
- - - - - 0x03AC96 24:AC86: 41        .byte $41    ; <ア>
- - - - - 0x03AC97 24:AC87: 4A        .byte $4A    ; <コ>
- - - - - 0x03AC98 24:AC88: 4D        .byte $4D    ; <ス>
- D - I - 0x03AC99 24:AC89: 3C        .byte $3C    ; <9>
- D - I - 0x03AC9A 24:AC8A: 3B        .byte $3B    ; <8>
- - - - - 0x03AC9B 24:AC8B: 40        .byte $40    ; <「>
- D - I - 0x03AC9C 24:AC8C: 3C        .byte $3C    ; <9>
- - - - - 0x03AC9D 24:AC8D: 00        .byte $00
- - - - - 0x03AC9E 24:AC8E: 00        .byte $00
- - - - - 0x03AC9F 24:AC8F: 54        .byte $54    ; <ト>
- - - - - 0x03ACA0 24:AC90: 60        .byte $60    ; <ミ>
- - - - - 0x03ACA1 24:AC91: 68        .byte $68    ; <リ>
- - - - - 0x03ACA2 24:AC92: 42        .byte $42    ; <イ>
- - - - - 0x03ACA3 24:AC93: 48        .byte $48    ; <ク>
- - - - - 0x03ACA4 24:AC94: 3C        .byte $3C    ; <9>
- - - - - 0x03ACA5 24:AC95: 5F        .byte $5F    ; <マ>
- - - - - 0x03ACA6 24:AC96: 45        .byte $45    ; <オ>
- - - - - 0x03ACA7 24:AC97: 4E        .byte $4E    ; <セ>
- - - - - 0x03ACA8 24:AC98: 51        .byte $51    ; <チ>
- - - - - 0x03ACA9 24:AC99: 40        .byte $40    ; <「>
- - - - - 0x03ACAA 24:AC9A: 3F        .byte $3F    ; <•>
- - - - - 0x03ACAB 24:AC9B: 44        .byte $44    ; <エ>
- - - - - 0x03ACAC 24:AC9C: 40        .byte $40    ; <「>
- - - - - 0x03ACAD 24:AC9D: 56        .byte $56    ; <ニ>
- - - - - 0x03ACAE 24:AC9E: 45        .byte $45    ; <オ>
- - - - - 0x03ACAF 24:AC9F: 4E        .byte $4E    ; <セ>
- - - - - 0x03ACB0 24:ACA0: 51        .byte $51    ; <チ>
- - - - - 0x03ACB1 24:ACA1: 40        .byte $40    ; <「>
- - - - - 0x03ACB2 24:ACA2: 3F        .byte $3F    ; <•>
- - - - - 0x03ACB3 24:ACA3: 44        .byte $44    ; <エ>
- D - I - 0x03ACB4 24:ACA4: 40        .byte $40    ; <「>
- - - - - 0x03ACB5 24:ACA5: 00        .byte $00
- - - - - 0x03ACB6 24:ACA6: 00        .byte $00
- - - - - 0x03ACB7 24:ACA7: 54        .byte $54    ; <ト>
- D - I - 0x03ACB8 24:ACA8: 5B        .byte $5B    ; <ヒ>
- - - - - 0x03ACB9 24:ACA9: 55        .byte $55    ; <ナ>
- D - I - 0x03ACBA 24:ACAA: 36        .byte $36    ; <3>
- - - - - 0x03ACBB 24:ACAB: 36        .byte $36    ; <3>
- D - I - 0x03ACBC 24:ACAC: 32        .byte $32    ; <ょ>
- D - I - 0x03ACBD 24:ACAD: 55        .byte $55    ; <ナ>
- - - - - 0x03ACBE 24:ACAE: 41        .byte $41    ; <ア>
- - - - - 0x03ACBF 24:ACAF: 4A        .byte $4A    ; <コ>
- - - - - 0x03ACC0 24:ACB0: 4D        .byte $4D    ; <ス>
- - - - - 0x03ACC1 24:ACB1: 3C        .byte $3C    ; <9>
- - - - - 0x03ACC2 24:ACB2: 3B        .byte $3B    ; <8>
- - - - - 0x03ACC3 24:ACB3: 40        .byte $40    ; <「>
- D - I - 0x03ACC4 24:ACB4: 3C        .byte $3C    ; <9>
- - - - - 0x03ACC5 24:ACB5: 59        .byte $59    ; <ノ>
- - - - - 0x03ACC6 24:ACB6: 45        .byte $45    ; <オ>
- - - - - 0x03ACC7 24:ACB7: 4E        .byte $4E    ; <セ>
- - - - - 0x03ACC8 24:ACB8: 51        .byte $51    ; <チ>
- - - - - 0x03ACC9 24:ACB9: 40        .byte $40    ; <「>
- - - - - 0x03ACCA 24:ACBA: 3F        .byte $3F    ; <•>
- - - - - 0x03ACCB 24:ACBB: 44        .byte $44    ; <エ>
- - - - - 0x03ACCC 24:ACBC: 40        .byte $40    ; <「>
- - - - - 0x03ACCD 24:ACBD: 00        .byte $00
- - - - - 0x03ACCE 24:ACBE: 00        .byte $00
- - - - - 0x03ACCF 24:ACBF: 58        .byte $58    ; <ネ>
- D - I - 0x03ACD0 24:ACC0: 60        .byte $60    ; <ミ>
- - - - - 0x03ACD1 24:ACC1: 54        .byte $54    ; <ト>
- D - I - 0x03ACD2 24:ACC2: 3A        .byte $3A    ; <7>
- D - I - 0x03ACD3 24:ACC3: 3A        .byte $3A    ; <7>
- - - - - 0x03ACD4 24:ACC4: 46        .byte $46    ; <カ>
- - - - - 0x03ACD5 24:ACC5: 5B        .byte $5B    ; <ヒ>
- - - - - 0x03ACD6 24:ACC6: 47        .byte $47    ; <キ>
- - - - - 0x03ACD7 24:ACC7: 50        .byte $50    ; <タ>
- - - - - 0x03ACD8 24:ACC8: 53        .byte $53    ; <テ>
- - - - - 0x03ACD9 24:ACC9: 42        .byte $42    ; <イ>
- - - - - 0x03ACDA 24:ACCA: 41        .byte $41    ; <ア>
- - - - - 0x03ACDB 24:ACCB: 46        .byte $46    ; <カ>
- D - I - 0x03ACDC 24:ACCC: 42        .byte $42    ; <イ>
- - - - - 0x03ACDD 24:ACCD: 5B        .byte $5B    ; <ヒ>
- - - - - 0x03ACDE 24:ACCE: 47        .byte $47    ; <キ>
- - - - - 0x03ACDF 24:ACCF: 50        .byte $50    ; <タ>
- - - - - 0x03ACE0 24:ACD0: 53        .byte $53    ; <テ>
- - - - - 0x03ACE1 24:ACD1: 42        .byte $42    ; <イ>
- - - - - 0x03ACE2 24:ACD2: 41        .byte $41    ; <ア>
- - - - - 0x03ACE3 24:ACD3: 46        .byte $46    ; <カ>
- - - - - 0x03ACE4 24:ACD4: 42        .byte $42    ; <イ>
- - - - - 0x03ACE5 24:ACD5: 00        .byte $00
- - - - - 0x03ACE6 24:ACD6: 00        .byte $00
- - - - - 0x03ACE7 24:ACD7: 56        .byte $56    ; <ニ>
- - - - - 0x03ACE8 24:ACD8: 58        .byte $58    ; <ネ>
- - - - - 0x03ACE9 24:ACD9: 5B        .byte $5B    ; <ヒ>
- D - I - 0x03ACEA 24:ACDA: 3A        .byte $3A    ; <7>
- - - - - 0x03ACEB 24:ACDB: 3A        .byte $3A    ; <7>
- - - - - 0x03ACEC 24:ACDC: 3A        .byte $3A    ; <7>
- - - - - 0x03ACED 24:ACDD: 58        .byte $58    ; <ネ>
- - - - - 0x03ACEE 24:ACDE: 47        .byte $47    ; <キ>
- - - - - 0x03ACEF 24:ACDF: 50        .byte $50    ; <タ>
- - - - - 0x03ACF0 24:ACE0: 53        .byte $53    ; <テ>
- - - - - 0x03ACF1 24:ACE1: 42        .byte $42    ; <イ>
- - - - - 0x03ACF2 24:ACE2: 41        .byte $41    ; <ア>
- - - - - 0x03ACF3 24:ACE3: 46        .byte $46    ; <カ>
- - - - - 0x03ACF4 24:ACE4: 42        .byte $42    ; <イ>
- - - - - 0x03ACF5 24:ACE5: 58        .byte $58    ; <ネ>
- - - - - 0x03ACF6 24:ACE6: 47        .byte $47    ; <キ>
- - - - - 0x03ACF7 24:ACE7: 50        .byte $50    ; <タ>
- - - - - 0x03ACF8 24:ACE8: 53        .byte $53    ; <テ>
- - - - - 0x03ACF9 24:ACE9: 42        .byte $42    ; <イ>
- - - - - 0x03ACFA 24:ACEA: 41        .byte $41    ; <ア>
- - - - - 0x03ACFB 24:ACEB: 46        .byte $46    ; <カ>
- - - - - 0x03ACFC 24:ACEC: 42        .byte $42    ; <イ>
- - - - - 0x03ACFD 24:ACED: 00        .byte $00
- - - - - 0x03ACFE 24:ACEE: 00        .byte $00
- D - I - 0x03ACFF 24:ACEF: 57        .byte $57    ; <ヌ>
- D - I - 0x03AD00 24:ACF0: 5C        .byte $5C    ; <フ>
- - - - - 0x03AD01 24:ACF1: 5E        .byte $5E    ; <ホ>
- D - I - 0x03AD02 24:ACF2: 3A        .byte $3A    ; <7>
- D - I - 0x03AD03 24:ACF3: 3A        .byte $3A    ; <7>
- D - I - 0x03AD04 24:ACF4: 3A        .byte $3A    ; <7>
- - - - - 0x03AD05 24:ACF5: 59        .byte $59    ; <ノ>
- - - - - 0x03AD06 24:ACF6: 47        .byte $47    ; <キ>
- - - - - 0x03AD07 24:ACF7: 50        .byte $50    ; <タ>
- - - - - 0x03AD08 24:ACF8: 53        .byte $53    ; <テ>
- - - - - 0x03AD09 24:ACF9: 42        .byte $42    ; <イ>
- - - - - 0x03AD0A 24:ACFA: 41        .byte $41    ; <ア>
- - - - - 0x03AD0B 24:ACFB: 46        .byte $46    ; <カ>
- D - I - 0x03AD0C 24:ACFC: 42        .byte $42    ; <イ>
- - - - - 0x03AD0D 24:ACFD: 59        .byte $59    ; <ノ>
- - - - - 0x03AD0E 24:ACFE: 47        .byte $47    ; <キ>
- - - - - 0x03AD0F 24:ACFF: 50        .byte $50    ; <タ>
- - - - - 0x03AD10 24:AD00: 53        .byte $53    ; <テ>
- - - - - 0x03AD11 24:AD01: 42        .byte $42    ; <イ>
- - - - - 0x03AD12 24:AD02: 41        .byte $41    ; <ア>
- - - - - 0x03AD13 24:AD03: 46        .byte $46    ; <カ>
- - - - - 0x03AD14 24:AD04: 42        .byte $42    ; <イ>
- - - - - 0x03AD15 24:AD05: 00        .byte $00
- - - - - 0x03AD16 24:AD06: 00        .byte $00
- D - I - 0x03AD17 24:AD07: 58        .byte $58    ; <ネ>
- D - I - 0x03AD18 24:AD08: 5E        .byte $5E    ; <ホ>
- - - - - 0x03AD19 24:AD09: 5A        .byte $5A    ; <ハ>
- - - - - 0x03AD1A 24:AD0A: 36        .byte $36    ; <3>
- D - I - 0x03AD1B 24:AD0B: 36        .byte $36    ; <3>
- - - - - 0x03AD1C 24:AD0C: 32        .byte $32    ; <ょ>
- - - - - 0x03AD1D 24:AD0D: 5C        .byte $5C    ; <フ>
- - - - - 0x03AD1E 24:AD0E: 41        .byte $41    ; <ア>
- D - I - 0x03AD1F 24:AD0F: 4A        .byte $4A    ; <コ>
- - - - - 0x03AD20 24:AD10: 4D        .byte $4D    ; <ス>
- - - - - 0x03AD21 24:AD11: 3C        .byte $3C    ; <9>
- - - - - 0x03AD22 24:AD12: 3B        .byte $3B    ; <8>
- - - - - 0x03AD23 24:AD13: 40        .byte $40    ; <「>
- D - I - 0x03AD24 24:AD14: 3C        .byte $3C    ; <9>
- D - I - 0x03AD25 24:AD15: 5C        .byte $5C    ; <フ>
- - - - - 0x03AD26 24:AD16: 41        .byte $41    ; <ア>
- - - - - 0x03AD27 24:AD17: 4A        .byte $4A    ; <コ>
- - - - - 0x03AD28 24:AD18: 4D        .byte $4D    ; <ス>
- - - - - 0x03AD29 24:AD19: 3C        .byte $3C    ; <9>
- - - - - 0x03AD2A 24:AD1A: 3B        .byte $3B    ; <8>
- - - - - 0x03AD2B 24:AD1B: 40        .byte $40    ; <「>
- - - - - 0x03AD2C 24:AD1C: 3C        .byte $3C    ; <9>
- - - - - 0x03AD2D 24:AD1D: 00        .byte $00
- - - - - 0x03AD2E 24:AD1E: 00        .byte $00
- D - I - 0x03AD2F 24:AD1F: 55        .byte $55    ; <ナ>
- D - I - 0x03AD30 24:AD20: 60        .byte $60    ; <ミ>
- D - I - 0x03AD31 24:AD21: 58        .byte $58    ; <ネ>
- - - - - 0x03AD32 24:AD22: 45        .byte $45    ; <オ>
- D - I - 0x03AD33 24:AD23: 4B        .byte $4B    ; <サ>
- - - - - 0x03AD34 24:AD24: 40        .byte $40    ; <「>
- D - I - 0x03AD35 24:AD25: 5F        .byte $5F    ; <マ>
- - - - - 0x03AD36 24:AD26: 48        .byte $48    ; <ク>
- - - - - 0x03AD37 24:AD27: 51        .byte $51    ; <チ>
- - - - - 0x03AD38 24:AD28: 54        .byte $54    ; <ト>
- - - - - 0x03AD39 24:AD29: 43        .byte $43    ; <ウ>
- - - - - 0x03AD3A 24:AD2A: 42        .byte $42    ; <イ>
- - - - - 0x03AD3B 24:AD2B: 47        .byte $47    ; <キ>
- D - I - 0x03AD3C 24:AD2C: 43        .byte $43    ; <ウ>
- - - - - 0x03AD3D 24:AD2D: 57        .byte $57    ; <ヌ>
- - - - - 0x03AD3E 24:AD2E: 48        .byte $48    ; <ク>
- - - - - 0x03AD3F 24:AD2F: 51        .byte $51    ; <チ>
- - - - - 0x03AD40 24:AD30: 54        .byte $54    ; <ト>
- - - - - 0x03AD41 24:AD31: 43        .byte $43    ; <ウ>
- - - - - 0x03AD42 24:AD32: 42        .byte $42    ; <イ>
- - - - - 0x03AD43 24:AD33: 47        .byte $47    ; <キ>
- D - I - 0x03AD44 24:AD34: 43        .byte $43    ; <ウ>
- - - - - 0x03AD45 24:AD35: 00        .byte $00
- - - - - 0x03AD46 24:AD36: 00        .byte $00
- D - I - 0x03AD47 24:AD37: 54        .byte $54    ; <ト>
- D - I - 0x03AD48 24:AD38: 60        .byte $60    ; <ミ>
- D - I - 0x03AD49 24:AD39: 56        .byte $56    ; <ニ>
- - - - - 0x03AD4A 24:AD3A: 39        .byte $39    ; <6>
- D - I - 0x03AD4B 24:AD3B: 39        .byte $39    ; <6>
- - - - - 0x03AD4C 24:AD3C: 36        .byte $36    ; <3>
- - - - - 0x03AD4D 24:AD3D: 5C        .byte $5C    ; <フ>
- - - - - 0x03AD4E 24:AD3E: 44        .byte $44    ; <エ>
- - - - - 0x03AD4F 24:AD3F: 4D        .byte $4D    ; <ス>
- - - - - 0x03AD50 24:AD40: 50        .byte $50    ; <タ>
- - - - - 0x03AD51 24:AD41: 3F        .byte $3F    ; <•>
- - - - - 0x03AD52 24:AD42: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AD53 24:AD43: 43        .byte $43    ; <ウ>
- D - I - 0x03AD54 24:AD44: 3F        .byte $3F    ; <•>
- - - - - 0x03AD55 24:AD45: 5C        .byte $5C    ; <フ>
- - - - - 0x03AD56 24:AD46: 44        .byte $44    ; <エ>
- D - I - 0x03AD57 24:AD47: 4D        .byte $4D    ; <ス>
- D - I - 0x03AD58 24:AD48: 50        .byte $50    ; <タ>
- - - - - 0x03AD59 24:AD49: 3F        .byte $3F    ; <•>
- - - - - 0x03AD5A 24:AD4A: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AD5B 24:AD4B: 43        .byte $43    ; <ウ>
- D - I - 0x03AD5C 24:AD4C: 3F        .byte $3F    ; <•>
- - - - - 0x03AD5D 24:AD4D: 00        .byte $00
- - - - - 0x03AD5E 24:AD4E: 00        .byte $00
- - - - - 0x03AD5F 24:AD4F: 56        .byte $56    ; <ニ>
- D - I - 0x03AD60 24:AD50: 5A        .byte $5A    ; <ハ>
- - - - - 0x03AD61 24:AD51: 61        .byte $61    ; <ム>
- - - - - 0x03AD62 24:AD52: 39        .byte $39    ; <6>
- D - I - 0x03AD63 24:AD53: 3D        .byte $3D    ; <+>
- D - I - 0x03AD64 24:AD54: 37        .byte $37    ; <4>
- - - - - 0x03AD65 24:AD55: 5A        .byte $5A    ; <ハ>
- D - I - 0x03AD66 24:AD56: 44        .byte $44    ; <エ>
- - - - - 0x03AD67 24:AD57: 4D        .byte $4D    ; <ス>
- - - - - 0x03AD68 24:AD58: 50        .byte $50    ; <タ>
- - - - - 0x03AD69 24:AD59: 3F        .byte $3F    ; <•>
- - - - - 0x03AD6A 24:AD5A: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AD6B 24:AD5B: 43        .byte $43    ; <ウ>
- - - - - 0x03AD6C 24:AD5C: 3F        .byte $3F    ; <•>
- - - - - 0x03AD6D 24:AD5D: 5A        .byte $5A    ; <ハ>
- - - - - 0x03AD6E 24:AD5E: 44        .byte $44    ; <エ>
- D - I - 0x03AD6F 24:AD5F: 4D        .byte $4D    ; <ス>
- - - - - 0x03AD70 24:AD60: 50        .byte $50    ; <タ>
- - - - - 0x03AD71 24:AD61: 3F        .byte $3F    ; <•>
- - - - - 0x03AD72 24:AD62: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AD73 24:AD63: 43        .byte $43    ; <ウ>
- - - - - 0x03AD74 24:AD64: 3F        .byte $3F    ; <•>
- - - - - 0x03AD75 24:AD65: 00        .byte $00
- - - - - 0x03AD76 24:AD66: 00        .byte $00
- D - I - 0x03AD77 24:AD67: 56        .byte $56    ; <ニ>
- D - I - 0x03AD78 24:AD68: 5A        .byte $5A    ; <ハ>
- D - I - 0x03AD79 24:AD69: 58        .byte $58    ; <ネ>
- D - I - 0x03AD7A 24:AD6A: 39        .byte $39    ; <6>
- - - - - 0x03AD7B 24:AD6B: 3D        .byte $3D    ; <+>
- D - I - 0x03AD7C 24:AD6C: 37        .byte $37    ; <4>
- - - - - 0x03AD7D 24:AD6D: 5B        .byte $5B    ; <ヒ>
- - - - - 0x03AD7E 24:AD6E: 44        .byte $44    ; <エ>
- D - I - 0x03AD7F 24:AD6F: 4D        .byte $4D    ; <ス>
- - - - - 0x03AD80 24:AD70: 50        .byte $50    ; <タ>
- - - - - 0x03AD81 24:AD71: 3F        .byte $3F    ; <•>
- - - - - 0x03AD82 24:AD72: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AD83 24:AD73: 43        .byte $43    ; <ウ>
- D - I - 0x03AD84 24:AD74: 3F        .byte $3F    ; <•>
- - - - - 0x03AD85 24:AD75: 5B        .byte $5B    ; <ヒ>
- - - - - 0x03AD86 24:AD76: 44        .byte $44    ; <エ>
- - - - - 0x03AD87 24:AD77: 4D        .byte $4D    ; <ス>
- - - - - 0x03AD88 24:AD78: 50        .byte $50    ; <タ>
- - - - - 0x03AD89 24:AD79: 3F        .byte $3F    ; <•>
- - - - - 0x03AD8A 24:AD7A: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AD8B 24:AD7B: 43        .byte $43    ; <ウ>
- - - - - 0x03AD8C 24:AD7C: 3F        .byte $3F    ; <•>
- - - - - 0x03AD8D 24:AD7D: 00        .byte $00
- - - - - 0x03AD8E 24:AD7E: 00        .byte $00
- D - I - 0x03AD8F 24:AD7F: 57        .byte $57    ; <ヌ>
- D - I - 0x03AD90 24:AD80: 5D        .byte $5D    ; <ヘ>
- D - I - 0x03AD91 24:AD81: 62        .byte $62    ; <メ>
- D - I - 0x03AD92 24:AD82: 39        .byte $39    ; <6>
- D - I - 0x03AD93 24:AD83: 41        .byte $41    ; <ア>
- - - - - 0x03AD94 24:AD84: 3C        .byte $3C    ; <9>
- - - - - 0x03AD95 24:AD85: 5C        .byte $5C    ; <フ>
- - - - - 0x03AD96 24:AD86: 44        .byte $44    ; <エ>
- - - - - 0x03AD97 24:AD87: 4D        .byte $4D    ; <ス>
- - - - - 0x03AD98 24:AD88: 50        .byte $50    ; <タ>
- D - I - 0x03AD99 24:AD89: 3F        .byte $3F    ; <•>
- - - - - 0x03AD9A 24:AD8A: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AD9B 24:AD8B: 43        .byte $43    ; <ウ>
- - - - - 0x03AD9C 24:AD8C: 3F        .byte $3F    ; <•>
- - - - - 0x03AD9D 24:AD8D: 5C        .byte $5C    ; <フ>
- - - - - 0x03AD9E 24:AD8E: 44        .byte $44    ; <エ>
- - - - - 0x03AD9F 24:AD8F: 4D        .byte $4D    ; <ス>
- - - - - 0x03ADA0 24:AD90: 50        .byte $50    ; <タ>
- - - - - 0x03ADA1 24:AD91: 3F        .byte $3F    ; <•>
- D - I - 0x03ADA2 24:AD92: 3E        .byte $3E    ; <Jr>
- - - - - 0x03ADA3 24:AD93: 43        .byte $43    ; <ウ>
- D - I - 0x03ADA4 24:AD94: 3F        .byte $3F    ; <•>
- - - - - 0x03ADA5 24:AD95: 00        .byte $00
- - - - - 0x03ADA6 24:AD96: 00        .byte $00
- D - I - 0x03ADA7 24:AD97: 44        .byte $44    ; <エ>
- D - I - 0x03ADA8 24:AD98: 5A        .byte $5A    ; <ハ>
- - - - - 0x03ADA9 24:AD99: 61        .byte $61    ; <ム>
- - - - - 0x03ADAA 24:AD9A: 39        .byte $39    ; <6>
- - - - - 0x03ADAB 24:AD9B: 3D        .byte $3D    ; <+>
- D - I - 0x03ADAC 24:AD9C: 35        .byte $35    ; <2>
- - - - - 0x03ADAD 24:AD9D: 5A        .byte $5A    ; <ハ>
- - - - - 0x03ADAE 24:AD9E: 44        .byte $44    ; <エ>
- - - - - 0x03ADAF 24:AD9F: 4D        .byte $4D    ; <ス>
- - - - - 0x03ADB0 24:ADA0: 50        .byte $50    ; <タ>
- - - - - 0x03ADB1 24:ADA1: 3F        .byte $3F    ; <•>
- - - - - 0x03ADB2 24:ADA2: 3E        .byte $3E    ; <Jr>
- - - - - 0x03ADB3 24:ADA3: 43        .byte $43    ; <ウ>
- - - - - 0x03ADB4 24:ADA4: 3F        .byte $3F    ; <•>
- - - - - 0x03ADB5 24:ADA5: 5A        .byte $5A    ; <ハ>
- - - - - 0x03ADB6 24:ADA6: 44        .byte $44    ; <エ>
- D - I - 0x03ADB7 24:ADA7: 4D        .byte $4D    ; <ス>
- - - - - 0x03ADB8 24:ADA8: 50        .byte $50    ; <タ>
- - - - - 0x03ADB9 24:ADA9: 3F        .byte $3F    ; <•>
- - - - - 0x03ADBA 24:ADAA: 3E        .byte $3E    ; <Jr>
- - - - - 0x03ADBB 24:ADAB: 43        .byte $43    ; <ウ>
- - - - - 0x03ADBC 24:ADAC: 3F        .byte $3F    ; <•>
- - - - - 0x03ADBD 24:ADAD: 00        .byte $00
- - - - - 0x03ADBE 24:ADAE: 00        .byte $00
- - - - - 0x03ADBF 24:ADAF: 56        .byte $56    ; <ニ>
- D - I - 0x03ADC0 24:ADB0: 5B        .byte $5B    ; <ヒ>
- - - - - 0x03ADC1 24:ADB1: 5B        .byte $5B    ; <ヒ>
- - - - - 0x03ADC2 24:ADB2: 3B        .byte $3B    ; <8>
- - - - - 0x03ADC3 24:ADB3: 3B        .byte $3B    ; <8>
- D - I - 0x03ADC4 24:ADB4: 3C        .byte $3C    ; <9>
- - - - - 0x03ADC5 24:ADB5: 58        .byte $58    ; <ネ>
- D - I - 0x03ADC6 24:ADB6: 48        .byte $48    ; <ク>
- - - - - 0x03ADC7 24:ADB7: 51        .byte $51    ; <チ>
- - - - - 0x03ADC8 24:ADB8: 54        .byte $54    ; <ト>
- - - - - 0x03ADC9 24:ADB9: 43        .byte $43    ; <ウ>
- - - - - 0x03ADCA 24:ADBA: 42        .byte $42    ; <イ>
- - - - - 0x03ADCB 24:ADBB: 47        .byte $47    ; <キ>
- - - - - 0x03ADCC 24:ADBC: 43        .byte $43    ; <ウ>
- - - - - 0x03ADCD 24:ADBD: 56        .byte $56    ; <ニ>
- - - - - 0x03ADCE 24:ADBE: 46        .byte $46    ; <カ>
- - - - - 0x03ADCF 24:ADBF: 4F        .byte $4F    ; <ソ>
- - - - - 0x03ADD0 24:ADC0: 52        .byte $52    ; <ツ>
- - - - - 0x03ADD1 24:ADC1: 41        .byte $41    ; <ア>
- - - - - 0x03ADD2 24:ADC2: 40        .byte $40    ; <「>
- - - - - 0x03ADD3 24:ADC3: 45        .byte $45    ; <オ>
- - - - - 0x03ADD4 24:ADC4: 41        .byte $41    ; <ア>
- - - - - 0x03ADD5 24:ADC5: 00        .byte $00
- - - - - 0x03ADD6 24:ADC6: 00        .byte $00
- - - - - 0x03ADD7 24:ADC7: 56        .byte $56    ; <ニ>
- D - I - 0x03ADD8 24:ADC8: 5B        .byte $5B    ; <ヒ>
- - - - - 0x03ADD9 24:ADC9: 5B        .byte $5B    ; <ヒ>
- D - I - 0x03ADDA 24:ADCA: 3B        .byte $3B    ; <8>
- D - I - 0x03ADDB 24:ADCB: 3B        .byte $3B    ; <8>
- - - - - 0x03ADDC 24:ADCC: 3C        .byte $3C    ; <9>
- - - - - 0x03ADDD 24:ADCD: 56        .byte $56    ; <ニ>
- - - - - 0x03ADDE 24:ADCE: 46        .byte $46    ; <カ>
- - - - - 0x03ADDF 24:ADCF: 4F        .byte $4F    ; <ソ>
- - - - - 0x03ADE0 24:ADD0: 52        .byte $52    ; <ツ>
- - - - - 0x03ADE1 24:ADD1: 41        .byte $41    ; <ア>
- - - - - 0x03ADE2 24:ADD2: 40        .byte $40    ; <「>
- - - - - 0x03ADE3 24:ADD3: 45        .byte $45    ; <オ>
- - - - - 0x03ADE4 24:ADD4: 41        .byte $41    ; <ア>
- - - - - 0x03ADE5 24:ADD5: 58        .byte $58    ; <ネ>
- - - - - 0x03ADE6 24:ADD6: 48        .byte $48    ; <ク>
- - - - - 0x03ADE7 24:ADD7: 51        .byte $51    ; <チ>
- - - - - 0x03ADE8 24:ADD8: 54        .byte $54    ; <ト>
- D - I - 0x03ADE9 24:ADD9: 43        .byte $43    ; <ウ>
- - - - - 0x03ADEA 24:ADDA: 42        .byte $42    ; <イ>
- - - - - 0x03ADEB 24:ADDB: 47        .byte $47    ; <キ>
- - - - - 0x03ADEC 24:ADDC: 43        .byte $43    ; <ウ>
- - - - - 0x03ADED 24:ADDD: 00        .byte $00
- - - - - 0x03ADEE 24:ADDE: 00        .byte $00
- - - - - 0x03ADEF 24:ADDF: 59        .byte $59    ; <ノ>
- - - - - 0x03ADF0 24:ADE0: 5D        .byte $5D    ; <ヘ>
- - - - - 0x03ADF1 24:ADE1: 56        .byte $56    ; <ニ>
- D - I - 0x03ADF2 24:ADE2: 2E        .byte $2E    ; <ん>
- D - I - 0x03ADF3 24:ADE3: 2E        .byte $2E    ; <ん>
- - - - - 0x03ADF4 24:ADE4: 3A        .byte $3A    ; <7>
- - - - - 0x03ADF5 24:ADE5: 5A        .byte $5A    ; <ハ>
- - - - - 0x03ADF6 24:ADE6: 46        .byte $46    ; <カ>
- - - - - 0x03ADF7 24:ADE7: 4F        .byte $4F    ; <ソ>
- - - - - 0x03ADF8 24:ADE8: 52        .byte $52    ; <ツ>
- - - - - 0x03ADF9 24:ADE9: 41        .byte $41    ; <ア>
- - - - - 0x03ADFA 24:ADEA: 40        .byte $40    ; <「>
- - - - - 0x03ADFB 24:ADEB: 45        .byte $45    ; <オ>
- - - - - 0x03ADFC 24:ADEC: 41        .byte $41    ; <ア>
- - - - - 0x03ADFD 24:ADED: 59        .byte $59    ; <ノ>
- - - - - 0x03ADFE 24:ADEE: 4A        .byte $4A    ; <コ>
- - - - - 0x03ADFF 24:ADEF: 53        .byte $53    ; <テ>
- - - - - 0x03AE00 24:ADF0: 56        .byte $56    ; <ニ>
- - - - - 0x03AE01 24:ADF1: 45        .byte $45    ; <オ>
- - - - - 0x03AE02 24:ADF2: 44        .byte $44    ; <エ>
- - - - - 0x03AE03 24:ADF3: 49        .byte $49    ; <ケ>
- - - - - 0x03AE04 24:ADF4: 45        .byte $45    ; <オ>
- - - - - 0x03AE05 24:ADF5: 00        .byte $00
- - - - - 0x03AE06 24:ADF6: 00        .byte $00
- - - - - 0x03AE07 24:ADF7: 45        .byte $45    ; <オ>
- D - I - 0x03AE08 24:ADF8: 5B        .byte $5B    ; <ヒ>
- - - - - 0x03AE09 24:ADF9: 60        .byte $60    ; <ミ>
- D - I - 0x03AE0A 24:ADFA: 3B        .byte $3B    ; <8>
- D - I - 0x03AE0B 24:ADFB: 3F        .byte $3F    ; <•>
- - - - - 0x03AE0C 24:ADFC: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AE0D 24:ADFD: 5C        .byte $5C    ; <フ>
- - - - - 0x03AE0E 24:ADFE: 46        .byte $46    ; <カ>
- - - - - 0x03AE0F 24:ADFF: 4F        .byte $4F    ; <ソ>
- - - - - 0x03AE10 24:AE00: 52        .byte $52    ; <ツ>
- - - - - 0x03AE11 24:AE01: 41        .byte $41    ; <ア>
- - - - - 0x03AE12 24:AE02: 40        .byte $40    ; <「>
- - - - - 0x03AE13 24:AE03: 45        .byte $45    ; <オ>
- - - - - 0x03AE14 24:AE04: 41        .byte $41    ; <ア>
- - - - - 0x03AE15 24:AE05: 5C        .byte $5C    ; <フ>
- - - - - 0x03AE16 24:AE06: 46        .byte $46    ; <カ>
- - - - - 0x03AE17 24:AE07: 4F        .byte $4F    ; <ソ>
- - - - - 0x03AE18 24:AE08: 52        .byte $52    ; <ツ>
- - - - - 0x03AE19 24:AE09: 41        .byte $41    ; <ア>
- - - - - 0x03AE1A 24:AE0A: 40        .byte $40    ; <「>
- - - - - 0x03AE1B 24:AE0B: 45        .byte $45    ; <オ>
- - - - - 0x03AE1C 24:AE0C: 41        .byte $41    ; <ア>
- - - - - 0x03AE1D 24:AE0D: 00        .byte $00
- - - - - 0x03AE1E 24:AE0E: 00        .byte $00
- D - I - 0x03AE1F 24:AE0F: 5A        .byte $5A    ; <ハ>
- D - I - 0x03AE20 24:AE10: 60        .byte $60    ; <ミ>
- D - I - 0x03AE21 24:AE11: 78        .byte $78    ; <?>
- - - - - 0x03AE22 24:AE12: 46        .byte $46    ; <カ>
- D - I - 0x03AE23 24:AE13: 4E        .byte $4E    ; <セ>
- - - - - 0x03AE24 24:AE14: 40        .byte $40    ; <「>
- - - - - 0x03AE25 24:AE15: 64        .byte $64    ; <ヤ>
- - - - - 0x03AE26 24:AE16: 49        .byte $49    ; <ケ>
- - - - - 0x03AE27 24:AE17: 52        .byte $52    ; <ツ>
- - - - - 0x03AE28 24:AE18: 55        .byte $55    ; <ナ>
- - - - - 0x03AE29 24:AE19: 44        .byte $44    ; <エ>
- - - - - 0x03AE2A 24:AE1A: 43        .byte $43    ; <ウ>
- - - - - 0x03AE2B 24:AE1B: 48        .byte $48    ; <ク>
- - - - - 0x03AE2C 24:AE1C: 44        .byte $44    ; <エ>
- - - - - 0x03AE2D 24:AE1D: 5B        .byte $5B    ; <ヒ>
- - - - - 0x03AE2E 24:AE1E: 49        .byte $49    ; <ケ>
- - - - - 0x03AE2F 24:AE1F: 52        .byte $52    ; <ツ>
- - - - - 0x03AE30 24:AE20: 55        .byte $55    ; <ナ>
- - - - - 0x03AE31 24:AE21: 44        .byte $44    ; <エ>
- - - - - 0x03AE32 24:AE22: 43        .byte $43    ; <ウ>
- - - - - 0x03AE33 24:AE23: 48        .byte $48    ; <ク>
- - - - - 0x03AE34 24:AE24: 44        .byte $44    ; <エ>
- - - - - 0x03AE35 24:AE25: 00        .byte $00
- - - - - 0x03AE36 24:AE26: 00        .byte $00
- D - I - 0x03AE37 24:AE27: 1B        .byte $1B    ; <ひ>
- D - I - 0x03AE38 24:AE28: 31        .byte $31    ; <ゅ>
- D - I - 0x03AE39 24:AE29: 37        .byte $37    ; <4>
- - - - - 0x03AE3A 24:AE2A: 20        .byte $20    ; <み>
- - - - - 0x03AE3B 24:AE2B: 20        .byte $20    ; <み>
- - - - - 0x03AE3C 24:AE2C: 20        .byte $20    ; <み>
- - - - - 0x03AE3D 24:AE2D: 1E        .byte $1E    ; <ほ>
- D - I - 0x03AE3E 24:AE2E: 21        .byte $21    ; <む>
- - - - - 0x03AE3F 24:AE2F: 2A        .byte $2A    ; <れ>
- - - - - 0x03AE40 24:AE30: 23        .byte $23    ; <も>
- - - - - 0x03AE41 24:AE31: 1C        .byte $1C    ; <ふ>
- - - - - 0x03AE42 24:AE32: 1B        .byte $1B    ; <ひ>
- - - - - 0x03AE43 24:AE33: 1C        .byte $1C    ; <ふ>
- - - - - 0x03AE44 24:AE34: 1C        .byte $1C    ; <ふ>
- D - I - 0x03AE45 24:AE35: 1E        .byte $1E    ; <ほ>
- - - - - 0x03AE46 24:AE36: 21        .byte $21    ; <む>
- D - I - 0x03AE47 24:AE37: 2A        .byte $2A    ; <れ>
- - - - - 0x03AE48 24:AE38: 23        .byte $23    ; <も>
- - - - - 0x03AE49 24:AE39: 1C        .byte $1C    ; <ふ>
- - - - - 0x03AE4A 24:AE3A: 1B        .byte $1B    ; <ひ>
- - - - - 0x03AE4B 24:AE3B: 1C        .byte $1C    ; <ふ>
- - - - - 0x03AE4C 24:AE3C: 1C        .byte $1C    ; <ふ>
- - - - - 0x03AE4D 24:AE3D: 00        .byte $00
- - - - - 0x03AE4E 24:AE3E: 00        .byte $00
- D - I - 0x03AE4F 24:AE3F: 4C        .byte $4C    ; <シ>
- - - - - 0x03AE50 24:AE40: 60        .byte $60    ; <ミ>
- D - I - 0x03AE51 24:AE41: 75        .byte $75    ; <ェ>
- - - - - 0x03AE52 24:AE42: 40        .byte $40    ; <「>
- - - - - 0x03AE53 24:AE43: 46        .byte $46    ; <カ>
- - - - - 0x03AE54 24:AE44: 4C        .byte $4C    ; <シ>
- - - - - 0x03AE55 24:AE45: 50        .byte $50    ; <タ>
- - - - - 0x03AE56 24:AE46: 43        .byte $43    ; <ウ>
- - - - - 0x03AE57 24:AE47: 4C        .byte $4C    ; <シ>
- - - - - 0x03AE58 24:AE48: 4F        .byte $4F    ; <ソ>
- - - - - 0x03AE59 24:AE49: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AE5A 24:AE4A: 3D        .byte $3D    ; <+>
- - - - - 0x03AE5B 24:AE4B: 42        .byte $42    ; <イ>
- - - - - 0x03AE5C 24:AE4C: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AE5D 24:AE4D: 4E        .byte $4E    ; <セ>
- - - - - 0x03AE5E 24:AE4E: 43        .byte $43    ; <ウ>
- - - - - 0x03AE5F 24:AE4F: 4C        .byte $4C    ; <シ>
- - - - - 0x03AE60 24:AE50: 4F        .byte $4F    ; <ソ>
- - - - - 0x03AE61 24:AE51: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AE62 24:AE52: 3D        .byte $3D    ; <+>
- - - - - 0x03AE63 24:AE53: 42        .byte $42    ; <イ>
- - - - - 0x03AE64 24:AE54: 3E        .byte $3E    ; <Jr>
- - - - - 0x03AE65 24:AE55: 00        .byte $00
- - - - - 0x03AE66 24:AE56: 00        .byte $00
- D - I - 0x03AE67 24:AE57: 57        .byte $57    ; <ヌ>
- D - I - 0x03AE68 24:AE58: 66        .byte $66    ; <ヨ>
- D - I - 0x03AE69 24:AE59: 6F        .byte $6F    ; <ッ>
- - - - - 0x03AE6A 24:AE5A: 4C        .byte $4C    ; <シ>
- D - I - 0x03AE6B 24:AE5B: 54        .byte $54    ; <ト>
- - - - - 0x03AE6C 24:AE5C: 54        .byte $54    ; <ト>
- D - I - 0x03AE6D 24:AE5D: 62        .byte $62    ; <メ>
- - - - - 0x03AE6E 24:AE5E: 4F        .byte $4F    ; <ソ>
- - - - - 0x03AE6F 24:AE5F: 58        .byte $58    ; <ネ>
- - - - - 0x03AE70 24:AE60: 5B        .byte $5B    ; <ヒ>
- - - - - 0x03AE71 24:AE61: 4A        .byte $4A    ; <コ>
- - - - - 0x03AE72 24:AE62: 49        .byte $49    ; <ケ>
- - - - - 0x03AE73 24:AE63: 4E        .byte $4E    ; <セ>
- - - - - 0x03AE74 24:AE64: 4A        .byte $4A    ; <コ>
- - - - - 0x03AE75 24:AE65: 59        .byte $59    ; <ノ>
- - - - - 0x03AE76 24:AE66: 4F        .byte $4F    ; <ソ>
- - - - - 0x03AE77 24:AE67: 58        .byte $58    ; <ネ>
- - - - - 0x03AE78 24:AE68: 5B        .byte $5B    ; <ヒ>
- - - - - 0x03AE79 24:AE69: 4A        .byte $4A    ; <コ>
- - - - - 0x03AE7A 24:AE6A: 49        .byte $49    ; <ケ>
- - - - - 0x03AE7B 24:AE6B: 4E        .byte $4E    ; <セ>
- - - - - 0x03AE7C 24:AE6C: 4A        .byte $4A    ; <コ>
- - - - - 0x03AE7D 24:AE6D: 00        .byte $00
- - - - - 0x03AE7E 24:AE6E: 00        .byte $00
- D - I - 0x03AE7F 24:AE6F: 1A        .byte $1A    ; <は>
- D - I - 0x03AE80 24:AE70: 20        .byte $20    ; <み>
- D - I - 0x03AE81 24:AE71: 30        .byte $30    ; <ゃ>
- - - - - 0x03AE82 24:AE72: 17        .byte $17    ; <ぬ>
- D - I - 0x03AE83 24:AE73: 17        .byte $17    ; <ぬ>
- D - I - 0x03AE84 24:AE74: 0F        .byte $0F    ; <そ>
- - - - - 0x03AE85 24:AE75: 1C        .byte $1C    ; <ふ>
- - - - - 0x03AE86 24:AE76: 18        .byte $18    ; <ね>
- D - I - 0x03AE87 24:AE77: 20        .byte $20    ; <み>
- D - I - 0x03AE88 24:AE78: 1A        .byte $1A    ; <は>
- - - - - 0x03AE89 24:AE79: 13        .byte $13    ; <て>
- - - - - 0x03AE8A 24:AE7A: 12        .byte $12    ; <つ>
- - - - - 0x03AE8B 24:AE7B: 13        .byte $13    ; <て>
- - - - - 0x03AE8C 24:AE7C: 11        .byte $11    ; <ち>
- - - - - 0x03AE8D 24:AE7D: 1C        .byte $1C    ; <ふ>
- - - - - 0x03AE8E 24:AE7E: 18        .byte $18    ; <ね>
- - - - - 0x03AE8F 24:AE7F: 20        .byte $20    ; <み>
- - - - - 0x03AE90 24:AE80: 1A        .byte $1A    ; <は>
- - - - - 0x03AE91 24:AE81: 13        .byte $13    ; <て>
- - - - - 0x03AE92 24:AE82: 12        .byte $12    ; <つ>
- - - - - 0x03AE93 24:AE83: 13        .byte $13    ; <て>
- - - - - 0x03AE94 24:AE84: 11        .byte $11    ; <ち>
- - - - - 0x03AE95 24:AE85: 00        .byte $00



tbl_AE86:
- D - I - 0x03AE96 24:AE86: 00        .byte $00
- D - I - 0x03AE97 24:AE87: 01        .byte $01    ; <あ>
- D - I - 0x03AE98 24:AE88: 06        .byte $06    ; <か>
- D - I - 0x03AE99 24:AE89: 06        .byte $06    ; <か>
- D - I - 0x03AE9A 24:AE8A: 01        .byte $01    ; <あ>
- D - I - 0x03AE9B 24:AE8B: 01        .byte $01    ; <あ>
- D - I - 0x03AE9C 24:AE8C: 06        .byte $06    ; <か>
- D - I - 0x03AE9D 24:AE8D: 05        .byte $05    ; <お>
- D - I - 0x03AE9E 24:AE8E: 00        .byte $00
- D - I - 0x03AE9F 24:AE8F: 00        .byte $00
- D - I - 0x03AEA0 24:AE90: 00        .byte $00
- D - I - 0x03AEA1 24:AE91: 03        .byte $03    ; <う>
- D - I - 0x03AEA2 24:AE92: 01        .byte $01    ; <あ>
- D - I - 0x03AEA3 24:AE93: 01        .byte $01    ; <あ>
- D - I - 0x03AEA4 24:AE94: 01        .byte $01    ; <あ>
- D - I - 0x03AEA5 24:AE95: 03        .byte $03    ; <う>
- D - I - 0x03AEA6 24:AE96: 14        .byte $14    ; <と>
- D - I - 0x03AEA7 24:AE97: 0F        .byte $0F    ; <そ>
- D - I - 0x03AEA8 24:AE98: 1B        .byte $1B    ; <ひ>
- D - I - 0x03AEA9 24:AE99: 26        .byte $26    ; <よ>
- D - I - 0x03AEAA 24:AE9A: 13        .byte $13    ; <て>
- D - I - 0x03AEAB 24:AE9B: 13        .byte $13    ; <て>
- D - I - 0x03AEAC 24:AE9C: 16        .byte $16    ; <に>
- D - I - 0x03AEAD 24:AE9D: 17        .byte $17    ; <ぬ>
- D - I - 0x03AEAE 24:AE9E: 1C        .byte $1C    ; <ふ>
- D - I - 0x03AEAF 24:AE9F: 14        .byte $14    ; <と>
- D - I - 0x03AEB0 24:AEA0: 2B        .byte $2B    ; <ろ>
- D - I - 0x03AEB1 24:AEA1: 2E        .byte $2E    ; <ん>
- D - I - 0x03AEB2 24:AEA2: 1A        .byte $1A    ; <は>
- D - I - 0x03AEB3 24:AEA3: 1A        .byte $1A    ; <は>
- D - I - 0x03AEB4 24:AEA4: 26        .byte $26    ; <よ>
- D - I - 0x03AEB5 24:AEA5: 2B        .byte $2B    ; <ろ>
- - - - - 0x03AEB6 24:AEA6: 00        .byte $00
- - - - - 0x03AEB7 24:AEA7: 0A        .byte $0A    ; <こ>
- D - I - 0x03AEB8 24:AEA8: 04        .byte $04    ; <え>
- D - I - 0x03AEB9 24:AEA9: 04        .byte $04    ; <え>
- D - I - 0x03AEBA 24:AEAA: 00        .byte $00
- D - I - 0x03AEBB 24:AEAB: 00        .byte $00
- - - - - 0x03AEBC 24:AEAC: 08        .byte $08    ; <く>
- - - - - 0x03AEBD 24:AEAD: 08        .byte $08    ; <く>
- - - - - 0x03AEBE 24:AEAE: 00        .byte $00
- - - - - 0x03AEBF 24:AEAF: 0A        .byte $0A    ; <こ>
- D - I - 0x03AEC0 24:AEB0: 08        .byte $08    ; <く>
- D - I - 0x03AEC1 24:AEB1: 08        .byte $08    ; <く>
- D - I - 0x03AEC2 24:AEB2: 02        .byte $02    ; <い>
- D - I - 0x03AEC3 24:AEB3: 02        .byte $02    ; <い>
- - - - - 0x03AEC4 24:AEB4: 08        .byte $08    ; <く>
- - - - - 0x03AEC5 24:AEB5: 08        .byte $08    ; <く>
- - - - - 0x03AEC6 24:AEB6: 00        .byte $00
- - - - - 0x03AEC7 24:AEB7: 0A        .byte $0A    ; <こ>
- - - - - 0x03AEC8 24:AEB8: 14        .byte $14    ; <と>
- D - I - 0x03AEC9 24:AEB9: 14        .byte $14    ; <と>
- D - I - 0x03AECA 24:AEBA: 37        .byte $37    ; <4>
- D - I - 0x03AECB 24:AEBB: 37        .byte $37    ; <4>
- - - - - 0x03AECC 24:AEBC: 2D        .byte $2D    ; <を>
- - - - - 0x03AECD 24:AEBD: 2D        .byte $2D    ; <を>
- - - - - 0x03AECE 24:AEBE: 00        .byte $00
- - - - - 0x03AECF 24:AEBF: 0A        .byte $0A    ; <こ>
- D - I - 0x03AED0 24:AEC0: 12        .byte $12    ; <つ>
- D - I - 0x03AED1 24:AEC1: 12        .byte $12    ; <つ>
- - - - - 0x03AED2 24:AEC2: 0B        .byte $0B    ; <さ>
- D - I - 0x03AED3 24:AEC3: 0B        .byte $0B    ; <さ>
- - - - - 0x03AED4 24:AEC4: 0C        .byte $0C    ; <し>
- - - - - 0x03AED5 24:AEC5: 0C        .byte $0C    ; <し>
- - - - - 0x03AED6 24:AEC6: 00        .byte $00
- - - - - 0x03AED7 24:AEC7: 0A        .byte $0A    ; <こ>
- D - I - 0x03AED8 24:AEC8: 0F        .byte $0F    ; <そ>
- D - I - 0x03AED9 24:AEC9: 13        .byte $13    ; <て>
- - - - - 0x03AEDA 24:AECA: 0A        .byte $0A    ; <こ>
- - - - - 0x03AEDB 24:AECB: 0A        .byte $0A    ; <こ>
- - - - - 0x03AEDC 24:AECC: 0C        .byte $0C    ; <し>
- - - - - 0x03AEDD 24:AECD: 0C        .byte $0C    ; <し>
- - - - - 0x03AEDE 24:AECE: 00        .byte $00
- - - - - 0x03AEDF 24:AECF: 0A        .byte $0A    ; <こ>
- D - I - 0x03AEE0 24:AED0: 14        .byte $14    ; <と>
- D - I - 0x03AEE1 24:AED1: 16        .byte $16    ; <に>
- - - - - 0x03AEE2 24:AED2: 0D        .byte $0D    ; <す>
- - - - - 0x03AEE3 24:AED3: 0D        .byte $0D    ; <す>
- - - - - 0x03AEE4 24:AED4: 0E        .byte $0E    ; <せ>
- - - - - 0x03AEE5 24:AED5: 0E        .byte $0E    ; <せ>
- - - - - 0x03AEE6 24:AED6: 00        .byte $00
- - - - - 0x03AEE7 24:AED7: 0A        .byte $0A    ; <こ>
- D - I - 0x03AEE8 24:AED8: 11        .byte $11    ; <ち>
- D - I - 0x03AEE9 24:AED9: 14        .byte $14    ; <と>
- - - - - 0x03AEEA 24:AEDA: 12        .byte $12    ; <つ>
- D - I - 0x03AEEB 24:AEDB: 12        .byte $12    ; <つ>
- - - - - 0x03AEEC 24:AEDC: 12        .byte $12    ; <つ>
- - - - - 0x03AEED 24:AEDD: 12        .byte $12    ; <つ>
- - - - - 0x03AEEE 24:AEDE: 00        .byte $00
- - - - - 0x03AEEF 24:AEDF: 14        .byte $14    ; <と>
- D - I - 0x03AEF0 24:AEE0: 1A        .byte $1A    ; <は>
- D - I - 0x03AEF1 24:AEE1: 1B        .byte $1B    ; <ひ>
- - - - - 0x03AEF2 24:AEE2: 18        .byte $18    ; <ね>
- - - - - 0x03AEF3 24:AEE3: 18        .byte $18    ; <ね>
- - - - - 0x03AEF4 24:AEE4: 18        .byte $18    ; <ね>
- - - - - 0x03AEF5 24:AEE5: 18        .byte $18    ; <ね>
- - - - - 0x03AEF6 24:AEE6: 00        .byte $00
- - - - - 0x03AEF7 24:AEE7: 14        .byte $14    ; <と>
- D - I - 0x03AEF8 24:AEE8: 1D        .byte $1D    ; <へ>
- D - I - 0x03AEF9 24:AEE9: 20        .byte $20    ; <み>
- - - - - 0x03AEFA 24:AEEA: 17        .byte $17    ; <ぬ>
- D - I - 0x03AEFB 24:AEEB: 17        .byte $17    ; <ぬ>
- - - - - 0x03AEFC 24:AEEC: 18        .byte $18    ; <ね>
- - - - - 0x03AEFD 24:AEED: 18        .byte $18    ; <ね>
- - - - - 0x03AEFE 24:AEEE: 00        .byte $00
- - - - - 0x03AEFF 24:AEEF: 14        .byte $14    ; <と>
- - - - - 0x03AF00 24:AEF0: 1F        .byte $1F    ; <ま>
- D - I - 0x03AF01 24:AEF1: 22        .byte $22    ; <め>
- - - - - 0x03AF02 24:AEF2: 18        .byte $18    ; <ね>
- D - I - 0x03AF03 24:AEF3: 18        .byte $18    ; <ね>
- - - - - 0x03AF04 24:AEF4: 18        .byte $18    ; <ね>
- - - - - 0x03AF05 24:AEF5: 18        .byte $18    ; <ね>
- - - - - 0x03AF06 24:AEF6: 00        .byte $00
- - - - - 0x03AF07 24:AEF7: 14        .byte $14    ; <と>
- D - I - 0x03AF08 24:AEF8: 1F        .byte $1F    ; <ま>
- - - - - 0x03AF09 24:AEF9: 23        .byte $23    ; <も>
- - - - - 0x03AF0A 24:AEFA: 18        .byte $18    ; <ね>
- D - I - 0x03AF0B 24:AEFB: 18        .byte $18    ; <ね>
- - - - - 0x03AF0C 24:AEFC: 1A        .byte $1A    ; <は>
- - - - - 0x03AF0D 24:AEFD: 1A        .byte $1A    ; <は>
- - - - - 0x03AF0E 24:AEFE: 00        .byte $00
- - - - - 0x03AF0F 24:AEFF: 14        .byte $14    ; <と>
- D - I - 0x03AF10 24:AF00: 1A        .byte $1A    ; <は>
- - - - - 0x03AF11 24:AF01: 26        .byte $26    ; <よ>
- - - - - 0x03AF12 24:AF02: 1E        .byte $1E    ; <ほ>
- - - - - 0x03AF13 24:AF03: 1E        .byte $1E    ; <ほ>
- - - - - 0x03AF14 24:AF04: 20        .byte $20    ; <み>
- - - - - 0x03AF15 24:AF05: 20        .byte $20    ; <み>
- - - - - 0x03AF16 24:AF06: 00        .byte $00
- - - - - 0x03AF17 24:AF07: 19        .byte $19    ; <の>
- D - I - 0x03AF18 24:AF08: 28        .byte $28    ; <り>
- - - - - 0x03AF19 24:AF09: 28        .byte $28    ; <り>
- D - I - 0x03AF1A 24:AF0A: 1C        .byte $1C    ; <ふ>
- D - I - 0x03AF1B 24:AF0B: 1C        .byte $1C    ; <ふ>
- - - - - 0x03AF1C 24:AF0C: 20        .byte $20    ; <み>
- - - - - 0x03AF1D 24:AF0D: 20        .byte $20    ; <み>
- - - - - 0x03AF1E 24:AF0E: 00        .byte $00
- - - - - 0x03AF1F 24:AF0F: 19        .byte $19    ; <の>
- - - - - 0x03AF20 24:AF10: 2C        .byte $2C    ; <わ>
- D - I - 0x03AF21 24:AF11: 2C        .byte $2C    ; <わ>
- - - - - 0x03AF22 24:AF12: 1E        .byte $1E    ; <ほ>
- D - I - 0x03AF23 24:AF13: 1E        .byte $1E    ; <ほ>
- - - - - 0x03AF24 24:AF14: 22        .byte $22    ; <め>
- - - - - 0x03AF25 24:AF15: 22        .byte $22    ; <め>
- - - - - 0x03AF26 24:AF16: 00        .byte $00
- - - - - 0x03AF27 24:AF17: 19        .byte $19    ; <の>
- D - I - 0x03AF28 24:AF18: 40        .byte $40    ; <「>
- D - I - 0x03AF29 24:AF19: 40        .byte $40    ; <「>
- - - - - 0x03AF2A 24:AF1A: 2C        .byte $2C    ; <わ>
- - - - - 0x03AF2B 24:AF1B: 2C        .byte $2C    ; <わ>
- - - - - 0x03AF2C 24:AF1C: 30        .byte $30    ; <ゃ>
- - - - - 0x03AF2D 24:AF1D: 30        .byte $30    ; <ゃ>
- - - - - 0x03AF2E 24:AF1E: 00        .byte $00
- - - - - 0x03AF2F 24:AF1F: 19        .byte $19    ; <の>
- D - I - 0x03AF30 24:AF20: 21        .byte $21    ; <む>
- D - I - 0x03AF31 24:AF21: 2D        .byte $2D    ; <を>
- - - - - 0x03AF32 24:AF22: 28        .byte $28    ; <り>
- D - I - 0x03AF33 24:AF23: 28        .byte $28    ; <り>
- - - - - 0x03AF34 24:AF24: 2C        .byte $2C    ; <わ>
- - - - - 0x03AF35 24:AF25: 2C        .byte $2C    ; <わ>
- - - - - 0x03AF36 24:AF26: 00        .byte $00
- - - - - 0x03AF37 24:AF27: 1E        .byte $1E    ; <ほ>
- D - I - 0x03AF38 24:AF28: 30        .byte $30    ; <ゃ>
- D - I - 0x03AF39 24:AF29: 30        .byte $30    ; <ゃ>
- - - - - 0x03AF3A 24:AF2A: 28        .byte $28    ; <り>
- - - - - 0x03AF3B 24:AF2B: 28        .byte $28    ; <り>
- - - - - 0x03AF3C 24:AF2C: 2C        .byte $2C    ; <わ>
- - - - - 0x03AF3D 24:AF2D: 2C        .byte $2C    ; <わ>
- - - - - 0x03AF3E 24:AF2E: 00        .byte $00
- - - - - 0x03AF3F 24:AF2F: 1E        .byte $1E    ; <ほ>
- D - I - 0x03AF40 24:AF30: 3A        .byte $3A    ; <7>
- D - I - 0x03AF41 24:AF31: 3A        .byte $3A    ; <7>
- - - - - 0x03AF42 24:AF32: 2C        .byte $2C    ; <わ>
- - - - - 0x03AF43 24:AF33: 2C        .byte $2C    ; <わ>
- - - - - 0x03AF44 24:AF34: 30        .byte $30    ; <ゃ>
- - - - - 0x03AF45 24:AF35: 30        .byte $30    ; <ゃ>
- - - - - 0x03AF46 24:AF36: 00        .byte $00
- - - - - 0x03AF47 24:AF37: 1E        .byte $1E    ; <ほ>
- D - I - 0x03AF48 24:AF38: 3F        .byte $3F    ; <•>
- D - I - 0x03AF49 24:AF39: 3F        .byte $3F    ; <•>
- - - - - 0x03AF4A 24:AF3A: 2C        .byte $2C    ; <わ>
- - - - - 0x03AF4B 24:AF3B: 2C        .byte $2C    ; <わ>
- - - - - 0x03AF4C 24:AF3C: 30        .byte $30    ; <ゃ>
- - - - - 0x03AF4D 24:AF3D: 30        .byte $30    ; <ゃ>
- - - - - 0x03AF4E 24:AF3E: 00        .byte $00
- - - - - 0x03AF4F 24:AF3F: 1E        .byte $1E    ; <ほ>
- D - I - 0x03AF50 24:AF40: 43        .byte $43    ; <ウ>
- D - I - 0x03AF51 24:AF41: 43        .byte $43    ; <ウ>
- - - - - 0x03AF52 24:AF42: 2C        .byte $2C    ; <わ>
- D - I - 0x03AF53 24:AF43: 2C        .byte $2C    ; <わ>
- - - - - 0x03AF54 24:AF44: 30        .byte $30    ; <ゃ>
- - - - - 0x03AF55 24:AF45: 30        .byte $30    ; <ゃ>
- - - - - 0x03AF56 24:AF46: 00        .byte $00
- - - - - 0x03AF57 24:AF47: 1E        .byte $1E    ; <ほ>
- D - I - 0x03AF58 24:AF48: 4A        .byte $4A    ; <コ>
- D - I - 0x03AF59 24:AF49: 4A        .byte $4A    ; <コ>
- - - - - 0x03AF5A 24:AF4A: 2F        .byte $2F    ; <っ>
- D - I - 0x03AF5B 24:AF4B: 2F        .byte $2F    ; <っ>
- - - - - 0x03AF5C 24:AF4C: 35        .byte $35    ; <2>
- - - - - 0x03AF5D 24:AF4D: 35        .byte $35    ; <2>
- - - - - 0x03AF5E 24:AF4E: 00        .byte $00
- - - - - 0x03AF5F 24:AF4F: 1E        .byte $1E    ; <ほ>
- D - I - 0x03AF60 24:AF50: 48        .byte $48    ; <ク>
- D - I - 0x03AF61 24:AF51: 48        .byte $48    ; <ク>
- - - - - 0x03AF62 24:AF52: 2F        .byte $2F    ; <っ>
- D - I - 0x03AF63 24:AF53: 2F        .byte $2F    ; <っ>
- - - - - 0x03AF64 24:AF54: 35        .byte $35    ; <2>
- - - - - 0x03AF65 24:AF55: 35        .byte $35    ; <2>
- - - - - 0x03AF66 24:AF56: 00        .byte $00
- - - - - 0x03AF67 24:AF57: 23        .byte $23    ; <も>
- D - I - 0x03AF68 24:AF58: 32        .byte $32    ; <ょ>
- D - I - 0x03AF69 24:AF59: 32        .byte $32    ; <ょ>
- - - - - 0x03AF6A 24:AF5A: 1E        .byte $1E    ; <ほ>
- D - I - 0x03AF6B 24:AF5B: 1E        .byte $1E    ; <ほ>
- - - - - 0x03AF6C 24:AF5C: 1E        .byte $1E    ; <ほ>
- - - - - 0x03AF6D 24:AF5D: 1E        .byte $1E    ; <ほ>
- - - - - 0x03AF6E 24:AF5E: 00        .byte $00
- - - - - 0x03AF6F 24:AF5F: 28        .byte $28    ; <り>
- D - I - 0x03AF70 24:AF60: 44        .byte $44    ; <エ>
- D - I - 0x03AF71 24:AF61: 4C        .byte $4C    ; <シ>
- - - - - 0x03AF72 24:AF62: 38        .byte $38    ; <5>
- - - - - 0x03AF73 24:AF63: 38        .byte $38    ; <5>
- - - - - 0x03AF74 24:AF64: 3A        .byte $3A    ; <7>
- - - - - 0x03AF75 24:AF65: 3A        .byte $3A    ; <7>
- - - - - 0x03AF76 24:AF66: 00        .byte $00
- - - - - 0x03AF77 24:AF67: 28        .byte $28    ; <り>
- D - I - 0x03AF78 24:AF68: 46        .byte $46    ; <カ>
- D - I - 0x03AF79 24:AF69: 4E        .byte $4E    ; <セ>
- - - - - 0x03AF7A 24:AF6A: 3A        .byte $3A    ; <7>
- D - I - 0x03AF7B 24:AF6B: 3A        .byte $3A    ; <7>
- - - - - 0x03AF7C 24:AF6C: 3F        .byte $3F    ; <•>
- - - - - 0x03AF7D 24:AF6D: 3F        .byte $3F    ; <•>
- - - - - 0x03AF7E 24:AF6E: 00        .byte $00
- - - - - 0x03AF7F 24:AF6F: 28        .byte $28    ; <り>
- D - I - 0x03AF80 24:AF70: 49        .byte $49    ; <ケ>
- - - - - 0x03AF81 24:AF71: 51        .byte $51    ; <チ>
- - - - - 0x03AF82 24:AF72: 41        .byte $41    ; <ア>
- D - I - 0x03AF83 24:AF73: 41        .byte $41    ; <ア>
- - - - - 0x03AF84 24:AF74: 42        .byte $42    ; <イ>
- - - - - 0x03AF85 24:AF75: 42        .byte $42    ; <イ>
- - - - - 0x03AF86 24:AF76: 00        .byte $00
- - - - - 0x03AF87 24:AF77: 28        .byte $28    ; <り>
- D - I - 0x03AF88 24:AF78: 48        .byte $48    ; <ク>
- D - I - 0x03AF89 24:AF79: 50        .byte $50    ; <タ>
- - - - - 0x03AF8A 24:AF7A: 43        .byte $43    ; <ウ>
- - - - - 0x03AF8B 24:AF7B: 43        .byte $43    ; <ウ>
- - - - - 0x03AF8C 24:AF7C: 44        .byte $44    ; <エ>
- - - - - 0x03AF8D 24:AF7D: 44        .byte $44    ; <エ>
- - - - - 0x03AF8E 24:AF7E: 00        .byte $00
- - - - - 0x03AF8F 24:AF7F: 2D        .byte $2D    ; <を>
- D - I - 0x03AF90 24:AF80: 49        .byte $49    ; <ケ>
- D - I - 0x03AF91 24:AF81: 53        .byte $53    ; <テ>
- D - I - 0x03AF92 24:AF82: 43        .byte $43    ; <ウ>
- D - I - 0x03AF93 24:AF83: 43        .byte $43    ; <ウ>
- - - - - 0x03AF94 24:AF84: 44        .byte $44    ; <エ>
- - - - - 0x03AF95 24:AF85: 44        .byte $44    ; <エ>
- - - - - 0x03AF96 24:AF86: 00        .byte $00
- - - - - 0x03AF97 24:AF87: 2D        .byte $2D    ; <を>
- - - - - 0x03AF98 24:AF88: 5A        .byte $5A    ; <ハ>
- D - I - 0x03AF99 24:AF89: 64        .byte $64    ; <ヤ>
- - - - - 0x03AF9A 24:AF8A: 53        .byte $53    ; <テ>
- D - I - 0x03AF9B 24:AF8B: 53        .byte $53    ; <テ>
- - - - - 0x03AF9C 24:AF8C: 50        .byte $50    ; <タ>
- - - - - 0x03AF9D 24:AF8D: 50        .byte $50    ; <タ>
- - - - - 0x03AF9E 24:AF8E: 00        .byte $00
- - - - - 0x03AF9F 24:AF8F: 2D        .byte $2D    ; <を>
- D - I - 0x03AFA0 24:AF90: 50        .byte $50    ; <タ>
- D - I - 0x03AFA1 24:AF91: 5A        .byte $5A    ; <ハ>
- - - - - 0x03AFA2 24:AF92: 49        .byte $49    ; <ケ>
- D - I - 0x03AFA3 24:AF93: 49        .byte $49    ; <ケ>
- - - - - 0x03AFA4 24:AF94: 4A        .byte $4A    ; <コ>
- - - - - 0x03AFA5 24:AF95: 4A        .byte $4A    ; <コ>
- - - - - 0x03AFA6 24:AF96: 00        .byte $00
- - - - - 0x03AFA7 24:AF97: 2D        .byte $2D    ; <を>
- D - I - 0x03AFA8 24:AF98: 50        .byte $50    ; <タ>
- D - I - 0x03AFA9 24:AF99: 5A        .byte $5A    ; <ハ>
- - - - - 0x03AFAA 24:AF9A: 4B        .byte $4B    ; <サ>
- D - I - 0x03AFAB 24:AF9B: 4B        .byte $4B    ; <サ>
- - - - - 0x03AFAC 24:AF9C: 4C        .byte $4C    ; <シ>
- - - - - 0x03AFAD 24:AF9D: 4C        .byte $4C    ; <シ>
- - - - - 0x03AFAE 24:AF9E: 00        .byte $00
- - - - - 0x03AFAF 24:AF9F: 32        .byte $32    ; <ょ>
- - - - - 0x03AFB0 24:AFA0: 5E        .byte $5E    ; <ホ>
- D - I - 0x03AFB1 24:AFA1: 66        .byte $66    ; <ヨ>
- - - - - 0x03AFB2 24:AFA2: 5D        .byte $5D    ; <ヘ>
- - - - - 0x03AFB3 24:AFA3: 5D        .byte $5D    ; <ヘ>
- - - - - 0x03AFB4 24:AFA4: 5A        .byte $5A    ; <ハ>
- - - - - 0x03AFB5 24:AFA5: 5A        .byte $5A    ; <ハ>
- - - - - 0x03AFB6 24:AFA6: 00        .byte $00
- - - - - 0x03AFB7 24:AFA7: 32        .byte $32    ; <ょ>
- D - I - 0x03AFB8 24:AFA8: 52        .byte $52    ; <ツ>
- - - - - 0x03AFB9 24:AFA9: 6C        .byte $6C    ; <ワ>
- - - - - 0x03AFBA 24:AFAA: 65        .byte $65    ; <ユ>
- D - I - 0x03AFBB 24:AFAB: 65        .byte $65    ; <ユ>
- - - - - 0x03AFBC 24:AFAC: 62        .byte $62    ; <メ>
- - - - - 0x03AFBD 24:AFAD: 62        .byte $62    ; <メ>



tbl_AFAE:
- D - I - 0x03AFBE 24:AFAE: 80        .byte $80
- D - I - 0x03AFBF 24:AFAF: 03        .byte $03    ; <う>
- D - I - 0x03AFC0 24:AFB0: 70        .byte $70    ; <ャ>
- D - I - 0x03AFC1 24:AFB1: 03        .byte $03    ; <う>
- D - I - 0x03AFC2 24:AFB2: 40        .byte $40    ; <「>
- D - I - 0x03AFC3 24:AFB3: 04        .byte $04    ; <え>
- D - I - 0x03AFC4 24:AFB4: A5        .byte $A5    ; <ざ>
- D - I - 0x03AFC5 24:AFB5: 03        .byte $03    ; <う>
- D - I - 0x03AFC6 24:AFB6: 86        .byte $86    ; <F>
- D - I - 0x03AFC7 24:AFB7: 03        .byte $03    ; <う>
- D - I - 0x03AFC8 24:AFB8: D0        .byte $D0    ; <ペ>
- D - I - 0x03AFC9 24:AFB9: 02        .byte $02    ; <い>
- D - I - 0x03AFCA 24:AFBA: 90        .byte $90    ; <U>
- D - I - 0x03AFCB 24:AFBB: 03        .byte $03    ; <う>
- D - I - 0x03AFCC 24:AFBC: 80        .byte $80
- D - I - 0x03AFCD 24:AFBD: 03        .byte $03    ; <う>
- D - I - 0x03AFCE 24:AFBE: 50        .byte $50    ; <タ>
- D - I - 0x03AFCF 24:AFBF: 04        .byte $04    ; <え>
- D - I - 0x03AFD0 24:AFC0: B5        .byte $B5    ; <ギ>
- D - I - 0x03AFD1 24:AFC1: 03        .byte $03    ; <う>
- D - I - 0x03AFD2 24:AFC2: 96        .byte $96
- D - I - 0x03AFD3 24:AFC3: 03        .byte $03    ; <う>
- D - I - 0x03AFD4 24:AFC4: E0        .byte $E0
- D - I - 0x03AFD5 24:AFC5: 02        .byte $02    ; <い>
- D - I - 0x03AFD6 24:AFC6: A0        .byte $A0    ; <が>
- D - I - 0x03AFD7 24:AFC7: 03        .byte $03    ; <う>
- D - I - 0x03AFD8 24:AFC8: 90        .byte $90    ; <U>
- D - I - 0x03AFD9 24:AFC9: 03        .byte $03    ; <う>
- D - I - 0x03AFDA 24:AFCA: 60        .byte $60    ; <ミ>
- D - I - 0x03AFDB 24:AFCB: 04        .byte $04    ; <え>
- D - I - 0x03AFDC 24:AFCC: C5        .byte $C5    ; <ブ>
- D - I - 0x03AFDD 24:AFCD: 03        .byte $03    ; <う>
- D - I - 0x03AFDE 24:AFCE: A6        .byte $A6    ; <じ>
- D - I - 0x03AFDF 24:AFCF: 03        .byte $03    ; <う>
- D - I - 0x03AFE0 24:AFD0: F0        .byte $F0
- D - I - 0x03AFE1 24:AFD1: 02        .byte $02    ; <い>
- D - I - 0x03AFE2 24:AFD2: B0        .byte $B0    ; <び>
- D - I - 0x03AFE3 24:AFD3: 03        .byte $03    ; <う>
- D - I - 0x03AFE4 24:AFD4: A0        .byte $A0    ; <が>
- D - I - 0x03AFE5 24:AFD5: 03        .byte $03    ; <う>
- D - I - 0x03AFE6 24:AFD6: 70        .byte $70    ; <ャ>
- D - I - 0x03AFE7 24:AFD7: 04        .byte $04    ; <え>
- D - I - 0x03AFE8 24:AFD8: D5        .byte $D5
- D - I - 0x03AFE9 24:AFD9: 03        .byte $03    ; <う>
- D - I - 0x03AFEA 24:AFDA: B6        .byte $B6    ; <グ>
- D - I - 0x03AFEB 24:AFDB: 03        .byte $03    ; <う>
- D - I - 0x03AFEC 24:AFDC: 00        .byte $00
- D - I - 0x03AFED 24:AFDD: 03        .byte $03    ; <う>
- D - I - 0x03AFEE 24:AFDE: 80        .byte $80
- D - I - 0x03AFEF 24:AFDF: 03        .byte $03    ; <う>
- D - I - 0x03AFF0 24:AFE0: 90        .byte $90    ; <U>
- D - I - 0x03AFF1 24:AFE1: 03        .byte $03    ; <う>
- D - I - 0x03AFF2 24:AFE2: 40        .byte $40    ; <「>
- D - I - 0x03AFF3 24:AFE3: 04        .byte $04    ; <え>
- D - I - 0x03AFF4 24:AFE4: A5        .byte $A5    ; <ざ>
- D - I - 0x03AFF5 24:AFE5: 03        .byte $03    ; <う>
- D - I - 0x03AFF6 24:AFE6: 86        .byte $86    ; <F>
- D - I - 0x03AFF7 24:AFE7: 03        .byte $03    ; <う>
- D - I - 0x03AFF8 24:AFE8: D0        .byte $D0    ; <ペ>
- D - I - 0x03AFF9 24:AFE9: 02        .byte $02    ; <い>
- D - I - 0x03AFFA 24:AFEA: 80        .byte $80
- D - I - 0x03AFFB 24:AFEB: 03        .byte $03    ; <う>
- D - I - 0x03AFFC 24:AFEC: A0        .byte $A0    ; <が>
- D - I - 0x03AFFD 24:AFED: 03        .byte $03    ; <う>
- D - I - 0x03AFFE 24:AFEE: 40        .byte $40    ; <「>
- D - I - 0x03AFFF 24:AFEF: 04        .byte $04    ; <え>
- D - I - 0x03B000 24:AFF0: A5        .byte $A5    ; <ざ>
- D - I - 0x03B001 24:AFF1: 03        .byte $03    ; <う>
- D - I - 0x03B002 24:AFF2: 86        .byte $86    ; <F>
- D - I - 0x03B003 24:AFF3: 03        .byte $03    ; <う>
- D - I - 0x03B004 24:AFF4: D0        .byte $D0    ; <ペ>
- D - I - 0x03B005 24:AFF5: 02        .byte $02    ; <い>
- D - I - 0x03B006 24:AFF6: 80        .byte $80
- D - I - 0x03B007 24:AFF7: 03        .byte $03    ; <う>
- D - I - 0x03B008 24:AFF8: 70        .byte $70    ; <ャ>
- D - I - 0x03B009 24:AFF9: 03        .byte $03    ; <う>
- D - I - 0x03B00A 24:AFFA: 50        .byte $50    ; <タ>
- D - I - 0x03B00B 24:AFFB: 04        .byte $04    ; <え>
- D - I - 0x03B00C 24:AFFC: A5        .byte $A5    ; <ざ>
- D - I - 0x03B00D 24:AFFD: 03        .byte $03    ; <う>
- D - I - 0x03B00E 24:AFFE: 86        .byte $86    ; <F>
- D - I - 0x03B00F 24:AFFF: 03        .byte $03    ; <う>
- D - I - 0x03B010 24:B000: D0        .byte $D0    ; <ペ>
- D - I - 0x03B011 24:B001: 02        .byte $02    ; <い>
- D - I - 0x03B012 24:B002: 80        .byte $80
- D - I - 0x03B013 24:B003: 03        .byte $03    ; <う>
- D - I - 0x03B014 24:B004: 70        .byte $70    ; <ャ>
- D - I - 0x03B015 24:B005: 03        .byte $03    ; <う>
- D - I - 0x03B016 24:B006: 70        .byte $70    ; <ャ>
- D - I - 0x03B017 24:B007: 04        .byte $04    ; <え>
- D - I - 0x03B018 24:B008: A5        .byte $A5    ; <ざ>
- D - I - 0x03B019 24:B009: 03        .byte $03    ; <う>
- D - I - 0x03B01A 24:B00A: 86        .byte $86    ; <F>
- D - I - 0x03B01B 24:B00B: 03        .byte $03    ; <う>
- D - I - 0x03B01C 24:B00C: D0        .byte $D0    ; <ペ>
- D - I - 0x03B01D 24:B00D: 02        .byte $02    ; <い>
- D - I - 0x03B01E 24:B00E: A0        .byte $A0    ; <が>
- D - I - 0x03B01F 24:B00F: 03        .byte $03    ; <う>
- D - I - 0x03B020 24:B010: 70        .byte $70    ; <ャ>
- D - I - 0x03B021 24:B011: 03        .byte $03    ; <う>
- D - I - 0x03B022 24:B012: 40        .byte $40    ; <「>
- D - I - 0x03B023 24:B013: 04        .byte $04    ; <え>
- D - I - 0x03B024 24:B014: C5        .byte $C5    ; <ブ>
- D - I - 0x03B025 24:B015: 03        .byte $03    ; <う>
- D - I - 0x03B026 24:B016: 86        .byte $86    ; <F>
- D - I - 0x03B027 24:B017: 03        .byte $03    ; <う>
- D - I - 0x03B028 24:B018: D0        .byte $D0    ; <ペ>
- D - I - 0x03B029 24:B019: 02        .byte $02    ; <い>
- D - I - 0x03B02A 24:B01A: C0        .byte $C0    ; <ヅ>
- D - I - 0x03B02B 24:B01B: 03        .byte $03    ; <う>
- D - I - 0x03B02C 24:B01C: 70        .byte $70    ; <ャ>
- D - I - 0x03B02D 24:B01D: 03        .byte $03    ; <う>
- D - I - 0x03B02E 24:B01E: 40        .byte $40    ; <「>
- D - I - 0x03B02F 24:B01F: 04        .byte $04    ; <え>
- D - I - 0x03B030 24:B020: E5        .byte $E5
- D - I - 0x03B031 24:B021: 03        .byte $03    ; <う>
- D - I - 0x03B032 24:B022: 86        .byte $86    ; <F>
- D - I - 0x03B033 24:B023: 03        .byte $03    ; <う>
- D - I - 0x03B034 24:B024: D0        .byte $D0    ; <ペ>
- D - I - 0x03B035 24:B025: 02        .byte $02    ; <い>
- D - I - 0x03B036 24:B026: A0        .byte $A0    ; <が>
- D - I - 0x03B037 24:B027: 03        .byte $03    ; <う>
- D - I - 0x03B038 24:B028: D8        .byte $D8
- D - I - 0x03B039 24:B029: 03        .byte $03    ; <う>
- D - I - 0x03B03A 24:B02A: 40        .byte $40    ; <「>
- D - I - 0x03B03B 24:B02B: 04        .byte $04    ; <え>
- D - I - 0x03B03C 24:B02C: A5        .byte $A5    ; <ざ>
- D - I - 0x03B03D 24:B02D: 03        .byte $03    ; <う>
- D - I - 0x03B03E 24:B02E: 86        .byte $86    ; <F>
- D - I - 0x03B03F 24:B02F: 03        .byte $03    ; <う>
- D - I - 0x03B040 24:B030: D0        .byte $D0    ; <ペ>
- D - I - 0x03B041 24:B031: 02        .byte $02    ; <い>
- D - I - 0x03B042 24:B032: C0        .byte $C0    ; <ヅ>
- D - I - 0x03B043 24:B033: 04        .byte $04    ; <え>
- D - I - 0x03B044 24:B034: 70        .byte $70    ; <ャ>
- D - I - 0x03B045 24:B035: 03        .byte $03    ; <う>
- D - I - 0x03B046 24:B036: C0        .byte $C0    ; <ヅ>
- D - I - 0x03B047 24:B037: 04        .byte $04    ; <え>
- D - I - 0x03B048 24:B038: 45        .byte $45    ; <オ>
- D - I - 0x03B049 24:B039: 04        .byte $04    ; <え>
- D - I - 0x03B04A 24:B03A: 86        .byte $86    ; <F>
- D - I - 0x03B04B 24:B03B: 03        .byte $03    ; <う>
- D - I - 0x03B04C 24:B03C: D0        .byte $D0    ; <ペ>
- D - I - 0x03B04D 24:B03D: 02        .byte $02    ; <い>
- D - I - 0x03B04E 24:B03E: 80        .byte $80
- D - I - 0x03B04F 24:B03F: 05        .byte $05    ; <お>
- D - I - 0x03B050 24:B040: 80        .byte $80
- D - I - 0x03B051 24:B041: 03        .byte $03    ; <う>
- D - I - 0x03B052 24:B042: C0        .byte $C0    ; <ヅ>
- D - I - 0x03B053 24:B043: 04        .byte $04    ; <え>
- D - I - 0x03B054 24:B044: A5        .byte $A5    ; <ざ>
- D - I - 0x03B055 24:B045: 03        .byte $03    ; <う>
- D - I - 0x03B056 24:B046: 86        .byte $86    ; <F>
- D - I - 0x03B057 24:B047: 03        .byte $03    ; <う>
- D - I - 0x03B058 24:B048: D0        .byte $D0    ; <ペ>
- D - I - 0x03B059 24:B049: 02        .byte $02    ; <い>
- - - - - 0x03B05A 24:B04A: A0        .byte $A0    ; <が>
- - - - - 0x03B05B 24:B04B: 03        .byte $03    ; <う>
- - - - - 0x03B05C 24:B04C: 70        .byte $70    ; <ャ>
- - - - - 0x03B05D 24:B04D: 03        .byte $03    ; <う>
- - - - - 0x03B05E 24:B04E: 40        .byte $40    ; <「>
- - - - - 0x03B05F 24:B04F: 04        .byte $04    ; <え>
- - - - - 0x03B060 24:B050: A5        .byte $A5    ; <ざ>
- - - - - 0x03B061 24:B051: 03        .byte $03    ; <う>
- - - - - 0x03B062 24:B052: 86        .byte $86    ; <F>
- - - - - 0x03B063 24:B053: 03        .byte $03    ; <う>
- - - - - 0x03B064 24:B054: D0        .byte $D0    ; <ペ>
- - - - - 0x03B065 24:B055: 02        .byte $02    ; <い>
- D - I - 0x03B066 24:B056: 40        .byte $40    ; <「>
- D - I - 0x03B067 24:B057: 05        .byte $05    ; <お>
- D - I - 0x03B068 24:B058: 70        .byte $70    ; <ャ>
- D - I - 0x03B069 24:B059: 03        .byte $03    ; <う>
- D - I - 0x03B06A 24:B05A: 60        .byte $60    ; <ミ>
- D - I - 0x03B06B 24:B05B: 04        .byte $04    ; <え>
- D - I - 0x03B06C 24:B05C: A5        .byte $A5    ; <ざ>
- D - I - 0x03B06D 24:B05D: 03        .byte $03    ; <う>
- D - I - 0x03B06E 24:B05E: 86        .byte $86    ; <F>
- D - I - 0x03B06F 24:B05F: 03        .byte $03    ; <う>
- D - I - 0x03B070 24:B060: D0        .byte $D0    ; <ペ>
- D - I - 0x03B071 24:B061: 02        .byte $02    ; <い>
- D - I - 0x03B072 24:B062: C0        .byte $C0    ; <ヅ>
- D - I - 0x03B073 24:B063: 04        .byte $04    ; <え>
- D - I - 0x03B074 24:B064: D0        .byte $D0    ; <ペ>
- D - I - 0x03B075 24:B065: 03        .byte $03    ; <う>
- D - I - 0x03B076 24:B066: 20        .byte $20    ; <み>
- D - I - 0x03B077 24:B067: 05        .byte $05    ; <お>
- D - I - 0x03B078 24:B068: 95        .byte $95
- D - I - 0x03B079 24:B069: 04        .byte $04    ; <え>
- D - I - 0x03B07A 24:B06A: 96        .byte $96
- D - I - 0x03B07B 24:B06B: 03        .byte $03    ; <う>
- D - I - 0x03B07C 24:B06C: E0        .byte $E0
- D - I - 0x03B07D 24:B06D: 02        .byte $02    ; <い>
- D - I - 0x03B07E 24:B06E: A0        .byte $A0    ; <が>
- D - I - 0x03B07F 24:B06F: 04        .byte $04    ; <え>
- D - I - 0x03B080 24:B070: 80        .byte $80
- D - I - 0x03B081 24:B071: 03        .byte $03    ; <う>
- D - I - 0x03B082 24:B072: 50        .byte $50    ; <タ>
- D - I - 0x03B083 24:B073: 04        .byte $04    ; <え>
- D - I - 0x03B084 24:B074: 40        .byte $40    ; <「>
- D - I - 0x03B085 24:B075: 04        .byte $04    ; <え>
- - - - - 0x03B086 24:B076: 86        .byte $86    ; <F>
- - - - - 0x03B087 24:B077: 03        .byte $03    ; <う>
- D - I - 0x03B088 24:B078: D0        .byte $D0    ; <ペ>
- D - I - 0x03B089 24:B079: 02        .byte $02    ; <い>
- D - I - 0x03B08A 24:B07A: 80        .byte $80
- D - I - 0x03B08B 24:B07B: 05        .byte $05    ; <お>
- D - I - 0x03B08C 24:B07C: 80        .byte $80
- D - I - 0x03B08D 24:B07D: 03        .byte $03    ; <う>
- D - I - 0x03B08E 24:B07E: 20        .byte $20    ; <み>
- D - I - 0x03B08F 24:B07F: 05        .byte $05    ; <お>
- D - I - 0x03B090 24:B080: A5        .byte $A5    ; <ざ>
- D - I - 0x03B091 24:B081: 03        .byte $03    ; <う>
- D - I - 0x03B092 24:B082: 86        .byte $86    ; <F>
- D - I - 0x03B093 24:B083: 03        .byte $03    ; <う>
- D - I - 0x03B094 24:B084: D0        .byte $D0    ; <ペ>
- D - I - 0x03B095 24:B085: 02        .byte $02    ; <い>
- - - - - 0x03B096 24:B086: 80        .byte $80
- - - - - 0x03B097 24:B087: 03        .byte $03    ; <う>
- - - - - 0x03B098 24:B088: 00        .byte $00
- - - - - 0x03B099 24:B089: 04        .byte $04    ; <え>
- - - - - 0x03B09A 24:B08A: 60        .byte $60    ; <ミ>
- - - - - 0x03B09B 24:B08B: 05        .byte $05    ; <お>
- - - - - 0x03B09C 24:B08C: A5        .byte $A5    ; <ざ>
- - - - - 0x03B09D 24:B08D: 03        .byte $03    ; <う>
- - - - - 0x03B09E 24:B08E: 86        .byte $86    ; <F>
- - - - - 0x03B09F 24:B08F: 03        .byte $03    ; <う>
- - - - - 0x03B0A0 24:B090: D0        .byte $D0    ; <ペ>
- - - - - 0x03B0A1 24:B091: 02        .byte $02    ; <い>
- D - I - 0x03B0A2 24:B092: 60        .byte $60    ; <ミ>
- D - I - 0x03B0A3 24:B093: 04        .byte $04    ; <え>
- D - I - 0x03B0A4 24:B094: 50        .byte $50    ; <タ>
- D - I - 0x03B0A5 24:B095: 04        .byte $04    ; <え>
- D - I - 0x03B0A6 24:B096: D0        .byte $D0    ; <ペ>
- D - I - 0x03B0A7 24:B097: 04        .byte $04    ; <え>
- D - I - 0x03B0A8 24:B098: 95        .byte $95
- D - I - 0x03B0A9 24:B099: 04        .byte $04    ; <え>
- D - I - 0x03B0AA 24:B09A: 96        .byte $96
- D - I - 0x03B0AB 24:B09B: 03        .byte $03    ; <う>
- D - I - 0x03B0AC 24:B09C: E0        .byte $E0
- D - I - 0x03B0AD 24:B09D: 02        .byte $02    ; <い>
- D - I - 0x03B0AE 24:B09E: 60        .byte $60    ; <ミ>
- D - I - 0x03B0AF 24:B09F: 04        .byte $04    ; <え>
- D - I - 0x03B0B0 24:B0A0: 00        .byte $00
- D - I - 0x03B0B1 24:B0A1: 0A        .byte $0A    ; <こ>
- D - I - 0x03B0B2 24:B0A2: D0        .byte $D0    ; <ペ>
- D - I - 0x03B0B3 24:B0A3: 04        .byte $04    ; <え>
- D - I - 0x03B0B4 24:B0A4: 95        .byte $95
- D - I - 0x03B0B5 24:B0A5: 04        .byte $04    ; <え>
- - - - - 0x03B0B6 24:B0A6: 96        .byte $96
- - - - - 0x03B0B7 24:B0A7: 03        .byte $03    ; <う>
- - - - - 0x03B0B8 24:B0A8: E0        .byte $E0
- - - - - 0x03B0B9 24:B0A9: 02        .byte $02    ; <い>
- D - I - 0x03B0BA 24:B0AA: A0        .byte $A0    ; <が>
- D - I - 0x03B0BB 24:B0AB: 04        .byte $04    ; <え>
- D - I - 0x03B0BC 24:B0AC: 00        .byte $00
- D - I - 0x03B0BD 24:B0AD: 06        .byte $06    ; <か>
- D - I - 0x03B0BE 24:B0AE: F0        .byte $F0
- D - I - 0x03B0BF 24:B0AF: 00        .byte $00
- D - I - 0x03B0C0 24:B0B0: B5        .byte $B5    ; <ギ>
- D - I - 0x03B0C1 24:B0B1: 04        .byte $04    ; <え>
- - - - - 0x03B0C2 24:B0B2: 86        .byte $86    ; <F>
- - - - - 0x03B0C3 24:B0B3: 03        .byte $03    ; <う>
- - - - - 0x03B0C4 24:B0B4: D0        .byte $D0    ; <ペ>
- - - - - 0x03B0C5 24:B0B5: 02        .byte $02    ; <い>
- - - - - 0x03B0C6 24:B0B6: 00        .byte $00
- - - - - 0x03B0C7 24:B0B7: 06        .byte $06    ; <か>
- D - I - 0x03B0C8 24:B0B8: 00        .byte $00
- D - I - 0x03B0C9 24:B0B9: 06        .byte $06    ; <か>
- D - I - 0x03B0CA 24:B0BA: 00        .byte $00
- D - I - 0x03B0CB 24:B0BB: 08        .byte $08    ; <く>
- - - - - 0x03B0CC 24:B0BC: 00        .byte $00
- - - - - 0x03B0CD 24:B0BD: 08        .byte $08    ; <く>
- - - - - 0x03B0CE 24:B0BE: 86        .byte $86    ; <F>
- - - - - 0x03B0CF 24:B0BF: 03        .byte $03    ; <う>
- - - - - 0x03B0D0 24:B0C0: D0        .byte $D0    ; <ペ>
- - - - - 0x03B0D1 24:B0C1: 02        .byte $02    ; <い>
- - - - - 0x03B0D2 24:B0C2: 90        .byte $90    ; <U>
- - - - - 0x03B0D3 24:B0C3: 03        .byte $03    ; <う>
- D - I - 0x03B0D4 24:B0C4: 00        .byte $00
- D - I - 0x03B0D5 24:B0C5: 08        .byte $08    ; <く>
- - - - - 0x03B0D6 24:B0C6: 50        .byte $50    ; <タ>
- - - - - 0x03B0D7 24:B0C7: 04        .byte $04    ; <え>
- - - - - 0x03B0D8 24:B0C8: A5        .byte $A5    ; <ざ>
- - - - - 0x03B0D9 24:B0C9: 03        .byte $03    ; <う>
- - - - - 0x03B0DA 24:B0CA: 96        .byte $96
- - - - - 0x03B0DB 24:B0CB: 03        .byte $03    ; <う>
- - - - - 0x03B0DC 24:B0CC: E0        .byte $E0
- - - - - 0x03B0DD 24:B0CD: 02        .byte $02    ; <い>
- D - I - 0x03B0DE 24:B0CE: 80        .byte $80
- D - I - 0x03B0DF 24:B0CF: 05        .byte $05    ; <お>
- D - I - 0x03B0E0 24:B0D0: 80        .byte $80
- D - I - 0x03B0E1 24:B0D1: 05        .byte $05    ; <お>
- D - I - 0x03B0E2 24:B0D2: D0        .byte $D0    ; <ペ>
- D - I - 0x03B0E3 24:B0D3: 04        .byte $04    ; <え>
- D - I - 0x03B0E4 24:B0D4: 95        .byte $95
- D - I - 0x03B0E5 24:B0D5: 04        .byte $04    ; <え>
- D - I - 0x03B0E6 24:B0D6: 96        .byte $96
- D - I - 0x03B0E7 24:B0D7: 03        .byte $03    ; <う>
- - - - - 0x03B0E8 24:B0D8: E0        .byte $E0
- - - - - 0x03B0E9 24:B0D9: 02        .byte $02    ; <い>
- D - I - 0x03B0EA 24:B0DA: 50        .byte $50    ; <タ>
- D - I - 0x03B0EB 24:B0DB: 04        .byte $04    ; <え>
- D - I - 0x03B0EC 24:B0DC: 00        .byte $00
- D - I - 0x03B0ED 24:B0DD: 04        .byte $04    ; <え>
- D - I - 0x03B0EE 24:B0DE: D0        .byte $D0    ; <ペ>
- D - I - 0x03B0EF 24:B0DF: 04        .byte $04    ; <え>
- D - I - 0x03B0F0 24:B0E0: 95        .byte $95
- D - I - 0x03B0F1 24:B0E1: 04        .byte $04    ; <え>
- D - I - 0x03B0F2 24:B0E2: 86        .byte $86    ; <F>
- D - I - 0x03B0F3 24:B0E3: 03        .byte $03    ; <う>
- D - I - 0x03B0F4 24:B0E4: D0        .byte $D0    ; <ペ>
- D - I - 0x03B0F5 24:B0E5: 02        .byte $02    ; <い>
- D - I - 0x03B0F6 24:B0E6: 80        .byte $80
- D - I - 0x03B0F7 24:B0E7: 04        .byte $04    ; <え>
- D - I - 0x03B0F8 24:B0E8: 00        .byte $00
- D - I - 0x03B0F9 24:B0E9: 04        .byte $04    ; <え>
- D - I - 0x03B0FA 24:B0EA: 80        .byte $80
- D - I - 0x03B0FB 24:B0EB: 04        .byte $04    ; <え>
- D - I - 0x03B0FC 24:B0EC: 25        .byte $25    ; <ゆ>
- D - I - 0x03B0FD 24:B0ED: 04        .byte $04    ; <え>
- - - - - 0x03B0FE 24:B0EE: 86        .byte $86    ; <F>
- - - - - 0x03B0FF 24:B0EF: 03        .byte $03    ; <う>
- - - - - 0x03B100 24:B0F0: D0        .byte $D0    ; <ペ>
- - - - - 0x03B101 24:B0F1: 02        .byte $02    ; <い>
- D - I - 0x03B102 24:B0F2: 00        .byte $00
- D - I - 0x03B103 24:B0F3: 04        .byte $04    ; <え>
- D - I - 0x03B104 24:B0F4: 00        .byte $00
- D - I - 0x03B105 24:B0F5: 08        .byte $08    ; <く>
- D - I - 0x03B106 24:B0F6: 80        .byte $80
- D - I - 0x03B107 24:B0F7: 04        .byte $04    ; <え>
- D - I - 0x03B108 24:B0F8: A5        .byte $A5    ; <ざ>
- D - I - 0x03B109 24:B0F9: 03        .byte $03    ; <う>
- - - - - 0x03B10A 24:B0FA: 86        .byte $86    ; <F>
- - - - - 0x03B10B 24:B0FB: 03        .byte $03    ; <う>
- D - I - 0x03B10C 24:B0FC: D0        .byte $D0    ; <ペ>
- D - I - 0x03B10D 24:B0FD: 02        .byte $02    ; <い>
- D - I - 0x03B10E 24:B0FE: 00        .byte $00
- D - I - 0x03B10F 24:B0FF: 04        .byte $04    ; <え>
- D - I - 0x03B110 24:B100: 00        .byte $00
- D - I - 0x03B111 24:B101: 04        .byte $04    ; <え>
- D - I - 0x03B112 24:B102: 30        .byte $30    ; <ゃ>
- D - I - 0x03B113 24:B103: 04        .byte $04    ; <え>
- D - I - 0x03B114 24:B104: A5        .byte $A5    ; <ざ>
- D - I - 0x03B115 24:B105: 03        .byte $03    ; <う>
- - - - - 0x03B116 24:B106: 86        .byte $86    ; <F>
- - - - - 0x03B117 24:B107: 03        .byte $03    ; <う>
- D - I - 0x03B118 24:B108: D0        .byte $D0    ; <ペ>
- D - I - 0x03B119 24:B109: 02        .byte $02    ; <い>
- D - I - 0x03B11A 24:B10A: C0        .byte $C0    ; <ヅ>
- D - I - 0x03B11B 24:B10B: 03        .byte $03    ; <う>
- D - I - 0x03B11C 24:B10C: 00        .byte $00
- D - I - 0x03B11D 24:B10D: 04        .byte $04    ; <え>
- D - I - 0x03B11E 24:B10E: 80        .byte $80
- D - I - 0x03B11F 24:B10F: 04        .byte $04    ; <え>
- D - I - 0x03B120 24:B110: A5        .byte $A5    ; <ざ>
- D - I - 0x03B121 24:B111: 03        .byte $03    ; <う>
- - - - - 0x03B122 24:B112: 86        .byte $86    ; <F>
- - - - - 0x03B123 24:B113: 03        .byte $03    ; <う>
- D - I - 0x03B124 24:B114: D0        .byte $D0    ; <ペ>
- D - I - 0x03B125 24:B115: 02        .byte $02    ; <い>
- - - - - 0x03B126 24:B116: 50        .byte $50    ; <タ>
- - - - - 0x03B127 24:B117: 04        .byte $04    ; <え>
- - - - - 0x03B128 24:B118: 00        .byte $00
- - - - - 0x03B129 24:B119: 04        .byte $04    ; <え>
- - - - - 0x03B12A 24:B11A: D0        .byte $D0    ; <ペ>
- - - - - 0x03B12B 24:B11B: 04        .byte $04    ; <え>
- - - - - 0x03B12C 24:B11C: 95        .byte $95
- - - - - 0x03B12D 24:B11D: 04        .byte $04    ; <え>
- - - - - 0x03B12E 24:B11E: 86        .byte $86    ; <F>
- - - - - 0x03B12F 24:B11F: 03        .byte $03    ; <う>
- - - - - 0x03B130 24:B120: D0        .byte $D0    ; <ペ>
- - - - - 0x03B131 24:B121: 02        .byte $02    ; <い>
- - - - - 0x03B132 24:B122: 50        .byte $50    ; <タ>
- - - - - 0x03B133 24:B123: 04        .byte $04    ; <え>
- - - - - 0x03B134 24:B124: 00        .byte $00
- - - - - 0x03B135 24:B125: 04        .byte $04    ; <え>
- - - - - 0x03B136 24:B126: D0        .byte $D0    ; <ペ>
- - - - - 0x03B137 24:B127: 04        .byte $04    ; <え>
- - - - - 0x03B138 24:B128: 95        .byte $95
- - - - - 0x03B139 24:B129: 04        .byte $04    ; <え>
- - - - - 0x03B13A 24:B12A: 86        .byte $86    ; <F>
- - - - - 0x03B13B 24:B12B: 03        .byte $03    ; <う>
- - - - - 0x03B13C 24:B12C: D0        .byte $D0    ; <ペ>
- - - - - 0x03B13D 24:B12D: 02        .byte $02    ; <い>



tbl_B12E:
; 
- D - I - 0x03B13E 24:B12E: 12        .byte $12    ; <つ>
- D - I - 0x03B13F 24:B12F: 22        .byte $22    ; <め>
- D - I - 0x03B140 24:B130: 22        .byte $22    ; <め>
- D - I - 0x03B141 24:B131: 43        .byte $43    ; <ウ>
- D - I - 0x03B142 24:B132: 11        .byte $11    ; <ち>
- D - I - 0x03B143 24:B133: 23        .byte $23    ; <も>
- D - I - 0x03B144 24:B134: 33        .byte $33    ; <0>
- D - I - 0x03B145 24:B135: 34        .byte $34    ; <1>
- D - I - 0x03B146 24:B136: 11        .byte $11    ; <ち>
- D - I - 0x03B147 24:B137: 13        .byte $13    ; <て>
- D - I - 0x03B148 24:B138: 32        .byte $32    ; <ょ>
- D - I - 0x03B149 24:B139: 43        .byte $43    ; <ウ>
- D - I - 0x03B14A 24:B13A: 11        .byte $11    ; <ち>
- D - I - 0x03B14B 24:B13B: 11        .byte $11    ; <ち>
- D - I - 0x03B14C 24:B13C: 33        .byte $33    ; <0>
- D - I - 0x03B14D 24:B13D: 23        .byte $23    ; <も>
- D - I - 0x03B14E 24:B13E: 22        .byte $22    ; <め>
- D - I - 0x03B14F 24:B13F: 23        .byte $23    ; <も>
- D - I - 0x03B150 24:B140: 34        .byte $34    ; <1>
- D - I - 0x03B151 24:B141: 33        .byte $33    ; <0>
- D - I - 0x03B152 24:B142: 22        .byte $22    ; <め>
- D - I - 0x03B153 24:B143: 22        .byte $22    ; <め>
- D - I - 0x03B154 24:B144: 33        .byte $33    ; <0>
- D - I - 0x03B155 24:B145: 34        .byte $34    ; <1>
- D - I - 0x03B156 24:B146: 00        .byte $00
- D - I - 0x03B157 24:B147: 22        .byte $22    ; <め>
- D - I - 0x03B158 24:B148: 21        .byte $21    ; <む>
- D - I - 0x03B159 24:B149: 33        .byte $33    ; <0>
- D - I - 0x03B15A 24:B14A: 00        .byte $00
- D - I - 0x03B15B 24:B14B: 00        .byte $00
- D - I - 0x03B15C 24:B14C: 02        .byte $02    ; <い>
- D - I - 0x03B15D 24:B14D: 31        .byte $31    ; <ゅ>
- D - I - 0x03B15E 24:B14E: 00        .byte $00
- D - I - 0x03B15F 24:B14F: 00        .byte $00
- D - I - 0x03B160 24:B150: 00        .byte $00
- D - I - 0x03B161 24:B151: 31        .byte $31    ; <ゅ>
- D - I - 0x03B162 24:B152: 11        .byte $11    ; <ち>
- D - I - 0x03B163 24:B153: 11        .byte $11    ; <ち>
- D - I - 0x03B164 24:B154: 11        .byte $11    ; <ち>
- D - I - 0x03B165 24:B155: 02        .byte $02    ; <い>
- D - I - 0x03B166 24:B156: 11        .byte $11    ; <ち>
- D - I - 0x03B167 24:B157: 11        .byte $11    ; <ち>
- D - I - 0x03B168 24:B158: 12        .byte $12    ; <つ>
- D - I - 0x03B169 24:B159: 20        .byte $20    ; <み>
- D - I - 0x03B16A 24:B15A: 11        .byte $11    ; <ち>
- D - I - 0x03B16B 24:B15B: 11        .byte $11    ; <ち>
- D - I - 0x03B16C 24:B15C: 11        .byte $11    ; <ち>
- D - I - 0x03B16D 24:B15D: 12        .byte $12    ; <つ>
; 
- D - I - 0x03B16E 24:B15E: 22        .byte $22    ; <め>
- D - I - 0x03B16F 24:B15F: 22        .byte $22    ; <め>
- D - I - 0x03B170 24:B160: 22        .byte $22    ; <め>
- D - I - 0x03B171 24:B161: 43        .byte $43    ; <ウ>
- D - I - 0x03B172 24:B162: 22        .byte $22    ; <め>
- D - I - 0x03B173 24:B163: 22        .byte $22    ; <め>
- D - I - 0x03B174 24:B164: 13        .byte $13    ; <て>
- D - I - 0x03B175 24:B165: 34        .byte $34    ; <1>
- D - I - 0x03B176 24:B166: 11        .byte $11    ; <ち>
- D - I - 0x03B177 24:B167: 22        .byte $22    ; <め>
- D - I - 0x03B178 24:B168: 22        .byte $22    ; <め>
- D - I - 0x03B179 24:B169: 43        .byte $43    ; <ウ>
- D - I - 0x03B17A 24:B16A: 11        .byte $11    ; <ち>
- D - I - 0x03B17B 24:B16B: 13        .byte $13    ; <て>
- D - I - 0x03B17C 24:B16C: 22        .byte $22    ; <め>
- D - I - 0x03B17D 24:B16D: 23        .byte $23    ; <も>
- D - I - 0x03B17E 24:B16E: 22        .byte $22    ; <め>
- D - I - 0x03B17F 24:B16F: 22        .byte $22    ; <め>
- D - I - 0x03B180 24:B170: 23        .byte $23    ; <も>
- D - I - 0x03B181 24:B171: 43        .byte $43    ; <ウ>
- D - I - 0x03B182 24:B172: 22        .byte $22    ; <め>
- D - I - 0x03B183 24:B173: 22        .byte $22    ; <め>
- D - I - 0x03B184 24:B174: 22        .byte $22    ; <め>
- D - I - 0x03B185 24:B175: 34        .byte $34    ; <1>
- - - - - 0x03B186 24:B176: 00        .byte $00
- - - - - 0x03B187 24:B177: 22        .byte $22    ; <め>
- - - - - 0x03B188 24:B178: 21        .byte $21    ; <む>
- D - I - 0x03B189 24:B179: 33        .byte $33    ; <0>
- D - I - 0x03B18A 24:B17A: 00        .byte $00
- D - I - 0x03B18B 24:B17B: 02        .byte $02    ; <い>
- D - I - 0x03B18C 24:B17C: 22        .byte $22    ; <め>
- D - I - 0x03B18D 24:B17D: 31        .byte $31    ; <ゅ>
- - - - - 0x03B18E 24:B17E: 00        .byte $00
- - - - - 0x03B18F 24:B17F: 00        .byte $00
- D - I - 0x03B190 24:B180: 23        .byte $23    ; <も>
- - - - - 0x03B191 24:B181: 11        .byte $11    ; <ち>
- - - - - 0x03B192 24:B182: 11        .byte $11    ; <ち>
- - - - - 0x03B193 24:B183: 11        .byte $11    ; <ち>
- - - - - 0x03B194 24:B184: 22        .byte $22    ; <め>
- - - - - 0x03B195 24:B185: 02        .byte $02    ; <い>
- - - - - 0x03B196 24:B186: 11        .byte $11    ; <ち>
- - - - - 0x03B197 24:B187: 11        .byte $11    ; <ち>
- - - - - 0x03B198 24:B188: 22        .byte $22    ; <め>
- - - - - 0x03B199 24:B189: 20        .byte $20    ; <み>
- - - - - 0x03B19A 24:B18A: 11        .byte $11    ; <ち>
- - - - - 0x03B19B 24:B18B: 11        .byte $11    ; <ち>
- - - - - 0x03B19C 24:B18C: 11        .byte $11    ; <ち>
- - - - - 0x03B19D 24:B18D: 22        .byte $22    ; <め>
; 
- - - - - 0x03B19E 24:B18E: 12        .byte $12    ; <つ>
- D - I - 0x03B19F 24:B18F: 22        .byte $22    ; <め>
- D - I - 0x03B1A0 24:B190: 23        .byte $23    ; <も>
- - - - - 0x03B1A1 24:B191: 43        .byte $43    ; <ウ>
- D - I - 0x03B1A2 24:B192: 12        .byte $12    ; <つ>
- D - I - 0x03B1A3 24:B193: 33        .byte $33    ; <0>
- D - I - 0x03B1A4 24:B194: 33        .byte $33    ; <0>
- D - I - 0x03B1A5 24:B195: 34        .byte $34    ; <1>
- D - I - 0x03B1A6 24:B196: 11        .byte $11    ; <ち>
- - - - - 0x03B1A7 24:B197: 33        .byte $33    ; <0>
- D - I - 0x03B1A8 24:B198: 32        .byte $32    ; <ょ>
- D - I - 0x03B1A9 24:B199: 43        .byte $43    ; <ウ>
- D - I - 0x03B1AA 24:B19A: 11        .byte $11    ; <ち>
- D - I - 0x03B1AB 24:B19B: 13        .byte $13    ; <て>
- D - I - 0x03B1AC 24:B19C: 33        .byte $33    ; <0>
- D - I - 0x03B1AD 24:B19D: 23        .byte $23    ; <も>
- D - I - 0x03B1AE 24:B19E: 23        .byte $23    ; <も>
- D - I - 0x03B1AF 24:B19F: 33        .byte $33    ; <0>
- D - I - 0x03B1B0 24:B1A0: 34        .byte $34    ; <1>
- D - I - 0x03B1B1 24:B1A1: 33        .byte $33    ; <0>
- - - - - 0x03B1B2 24:B1A2: 22        .byte $22    ; <め>
- - - - - 0x03B1B3 24:B1A3: 33        .byte $33    ; <0>
- - - - - 0x03B1B4 24:B1A4: 33        .byte $33    ; <0>
- - - - - 0x03B1B5 24:B1A5: 34        .byte $34    ; <1>
- - - - - 0x03B1B6 24:B1A6: 00        .byte $00
- - - - - 0x03B1B7 24:B1A7: 22        .byte $22    ; <め>
- - - - - 0x03B1B8 24:B1A8: 31        .byte $31    ; <ゅ>
- - - - - 0x03B1B9 24:B1A9: 33        .byte $33    ; <0>
- - - - - 0x03B1BA 24:B1AA: 00        .byte $00
- D - I - 0x03B1BB 24:B1AB: 00        .byte $00
- D - I - 0x03B1BC 24:B1AC: 33        .byte $33    ; <0>
- - - - - 0x03B1BD 24:B1AD: 31        .byte $31    ; <ゅ>
- D - I - 0x03B1BE 24:B1AE: 00        .byte $00
- - - - - 0x03B1BF 24:B1AF: 00        .byte $00
- D - I - 0x03B1C0 24:B1B0: 33        .byte $33    ; <0>
- - - - - 0x03B1C1 24:B1B1: 31        .byte $31    ; <ゅ>
- - - - - 0x03B1C2 24:B1B2: 11        .byte $11    ; <ち>
- - - - - 0x03B1C3 24:B1B3: 11        .byte $11    ; <ち>
- - - - - 0x03B1C4 24:B1B4: 10        .byte $10    ; <た>
- - - - - 0x03B1C5 24:B1B5: 02        .byte $02    ; <い>
- D - I - 0x03B1C6 24:B1B6: 11        .byte $11    ; <ち>
- D - I - 0x03B1C7 24:B1B7: 11        .byte $11    ; <ち>
- - - - - 0x03B1C8 24:B1B8: 12        .byte $12    ; <つ>
- - - - - 0x03B1C9 24:B1B9: 00        .byte $00
- - - - - 0x03B1CA 24:B1BA: 11        .byte $11    ; <ち>
- - - - - 0x03B1CB 24:B1BB: 11        .byte $11    ; <ち>
- - - - - 0x03B1CC 24:B1BC: 11        .byte $11    ; <ち>
- - - - - 0x03B1CD 24:B1BD: 02        .byte $02    ; <い>
; 
- - - - - 0x03B1CE 24:B1BE: 11        .byte $11    ; <ち>
- - - - - 0x03B1CF 24:B1BF: 22        .byte $22    ; <め>
- - - - - 0x03B1D0 24:B1C0: 22        .byte $22    ; <め>
- - - - - 0x03B1D1 24:B1C1: 43        .byte $43    ; <ウ>
- - - - - 0x03B1D2 24:B1C2: 11        .byte $11    ; <ち>
- - - - - 0x03B1D3 24:B1C3: 11        .byte $11    ; <ち>
- - - - - 0x03B1D4 24:B1C4: 23        .byte $23    ; <も>
- - - - - 0x03B1D5 24:B1C5: 34        .byte $34    ; <1>
- - - - - 0x03B1D6 24:B1C6: 11        .byte $11    ; <ち>
- - - - - 0x03B1D7 24:B1C7: 11        .byte $11    ; <ち>
- - - - - 0x03B1D8 24:B1C8: 32        .byte $32    ; <ょ>
- - - - - 0x03B1D9 24:B1C9: 43        .byte $43    ; <ウ>
- - - - - 0x03B1DA 24:B1CA: 11        .byte $11    ; <ち>
- - - - - 0x03B1DB 24:B1CB: 11        .byte $11    ; <ち>
- - - - - 0x03B1DC 24:B1CC: 13        .byte $13    ; <て>
- - - - - 0x03B1DD 24:B1CD: 23        .byte $23    ; <も>
- - - - - 0x03B1DE 24:B1CE: 22        .byte $22    ; <め>
- - - - - 0x03B1DF 24:B1CF: 33        .byte $33    ; <0>
- - - - - 0x03B1E0 24:B1D0: 34        .byte $34    ; <1>
- - - - - 0x03B1E1 24:B1D1: 33        .byte $33    ; <0>
- - - - - 0x03B1E2 24:B1D2: 22        .byte $22    ; <め>
- - - - - 0x03B1E3 24:B1D3: 23        .byte $23    ; <も>
- - - - - 0x03B1E4 24:B1D4: 33        .byte $33    ; <0>
- - - - - 0x03B1E5 24:B1D5: 34        .byte $34    ; <1>
- D - I - 0x03B1E6 24:B1D6: 00        .byte $00
- D - I - 0x03B1E7 24:B1D7: 00        .byte $00
- D - I - 0x03B1E8 24:B1D8: 02        .byte $02    ; <い>
- - - - - 0x03B1E9 24:B1D9: 13        .byte $13    ; <て>
- D - I - 0x03B1EA 24:B1DA: 00        .byte $00
- D - I - 0x03B1EB 24:B1DB: 00        .byte $00
- D - I - 0x03B1EC 24:B1DC: 02        .byte $02    ; <い>
- D - I - 0x03B1ED 24:B1DD: 13        .byte $13    ; <て>
- D - I - 0x03B1EE 24:B1DE: 00        .byte $00
- D - I - 0x03B1EF 24:B1DF: 00        .byte $00
- D - I - 0x03B1F0 24:B1E0: 00        .byte $00
- D - I - 0x03B1F1 24:B1E1: 13        .byte $13    ; <て>
- D - I - 0x03B1F2 24:B1E2: 11        .byte $11    ; <ち>
- - - - - 0x03B1F3 24:B1E3: 11        .byte $11    ; <ち>
- - - - - 0x03B1F4 24:B1E4: 11        .byte $11    ; <ち>
- - - - - 0x03B1F5 24:B1E5: 12        .byte $12    ; <つ>
- - - - - 0x03B1F6 24:B1E6: 11        .byte $11    ; <ち>
- D - I - 0x03B1F7 24:B1E7: 11        .byte $11    ; <ち>
- - - - - 0x03B1F8 24:B1E8: 11        .byte $11    ; <ち>
- - - - - 0x03B1F9 24:B1E9: 12        .byte $12    ; <つ>
- D - I - 0x03B1FA 24:B1EA: 11        .byte $11    ; <ち>
- D - I - 0x03B1FB 24:B1EB: 11        .byte $11    ; <ち>
- - - - - 0x03B1FC 24:B1EC: 11        .byte $11    ; <ち>
- D - I - 0x03B1FD 24:B1ED: 12        .byte $12    ; <つ>
; 
- - - - - 0x03B1FE 24:B1EE: 11        .byte $11    ; <ち>
- D - I - 0x03B1FF 24:B1EF: 11        .byte $11    ; <ち>
- - - - - 0x03B200 24:B1F0: 12        .byte $12    ; <つ>
- D - I - 0x03B201 24:B1F1: 33        .byte $33    ; <0>
- D - I - 0x03B202 24:B1F2: 11        .byte $11    ; <ち>
- D - I - 0x03B203 24:B1F3: 22        .byte $22    ; <め>
- D - I - 0x03B204 24:B1F4: 33        .byte $33    ; <0>
- D - I - 0x03B205 24:B1F5: 33        .byte $33    ; <0>
- D - I - 0x03B206 24:B1F6: 11        .byte $11    ; <ち>
- D - I - 0x03B207 24:B1F7: 11        .byte $11    ; <ち>
- D - I - 0x03B208 24:B1F8: 32        .byte $32    ; <ょ>
- D - I - 0x03B209 24:B1F9: 23        .byte $23    ; <も>
- D - I - 0x03B20A 24:B1FA: 11        .byte $11    ; <ち>
- - - - - 0x03B20B 24:B1FB: 11        .byte $11    ; <ち>
- - - - - 0x03B20C 24:B1FC: 13        .byte $13    ; <て>
- D - I - 0x03B20D 24:B1FD: 23        .byte $23    ; <も>
- D - I - 0x03B20E 24:B1FE: 33        .byte $33    ; <0>
- D - I - 0x03B20F 24:B1FF: 33        .byte $33    ; <0>
- D - I - 0x03B210 24:B200: 32        .byte $32    ; <ょ>
- D - I - 0x03B211 24:B201: 23        .byte $23    ; <も>
- - - - - 0x03B212 24:B202: 33        .byte $33    ; <0>
- - - - - 0x03B213 24:B203: 33        .byte $33    ; <0>
- - - - - 0x03B214 24:B204: 22        .byte $22    ; <め>
- - - - - 0x03B215 24:B205: 24        .byte $24    ; <や>
- - - - - 0x03B216 24:B206: 00        .byte $00
- - - - - 0x03B217 24:B207: 22        .byte $22    ; <め>
- - - - - 0x03B218 24:B208: 21        .byte $21    ; <む>
- - - - - 0x03B219 24:B209: 33        .byte $33    ; <0>
- - - - - 0x03B21A 24:B20A: 00        .byte $00
- - - - - 0x03B21B 24:B20B: 00        .byte $00
- - - - - 0x03B21C 24:B20C: 23        .byte $23    ; <も>
- - - - - 0x03B21D 24:B20D: 11        .byte $11    ; <ち>
- - - - - 0x03B21E 24:B20E: 00        .byte $00
- - - - - 0x03B21F 24:B20F: 00        .byte $00
- - - - - 0x03B220 24:B210: 03        .byte $03    ; <う>
- - - - - 0x03B221 24:B211: 11        .byte $11    ; <ち>
- - - - - 0x03B222 24:B212: 31        .byte $31    ; <ゅ>
- - - - - 0x03B223 24:B213: 11        .byte $11    ; <ち>
- - - - - 0x03B224 24:B214: 11        .byte $11    ; <ち>
- - - - - 0x03B225 24:B215: 02        .byte $02    ; <い>
- - - - - 0x03B226 24:B216: 31        .byte $31    ; <ゅ>
- - - - - 0x03B227 24:B217: 11        .byte $11    ; <ち>
- - - - - 0x03B228 24:B218: 12        .byte $12    ; <つ>
- - - - - 0x03B229 24:B219: 20        .byte $20    ; <み>
- - - - - 0x03B22A 24:B21A: 31        .byte $31    ; <ゅ>
- - - - - 0x03B22B 24:B21B: 11        .byte $11    ; <ち>
- - - - - 0x03B22C 24:B21C: 11        .byte $11    ; <ち>
- - - - - 0x03B22D 24:B21D: 12        .byte $12    ; <つ>
; 
- - - - - 0x03B22E 24:B21E: 22        .byte $22    ; <め>
- - - - - 0x03B22F 24:B21F: 22        .byte $22    ; <め>
- - - - - 0x03B230 24:B220: 22        .byte $22    ; <め>
- - - - - 0x03B231 24:B221: 43        .byte $43    ; <ウ>
- D - I - 0x03B232 24:B222: 12        .byte $12    ; <つ>
- D - I - 0x03B233 24:B223: 22        .byte $22    ; <め>
- D - I - 0x03B234 24:B224: 22        .byte $22    ; <め>
- - - - - 0x03B235 24:B225: 33        .byte $33    ; <0>
- - - - - 0x03B236 24:B226: 11        .byte $11    ; <ち>
- - - - - 0x03B237 24:B227: 22        .byte $22    ; <め>
- D - I - 0x03B238 24:B228: 22        .byte $22    ; <め>
- - - - - 0x03B239 24:B229: 23        .byte $23    ; <も>
- - - - - 0x03B23A 24:B22A: 11        .byte $11    ; <ち>
- - - - - 0x03B23B 24:B22B: 13        .byte $13    ; <て>
- - - - - 0x03B23C 24:B22C: 22        .byte $22    ; <め>
- - - - - 0x03B23D 24:B22D: 23        .byte $23    ; <も>
- D - I - 0x03B23E 24:B22E: 33        .byte $33    ; <0>
- D - I - 0x03B23F 24:B22F: 33        .byte $33    ; <0>
- D - I - 0x03B240 24:B230: 24        .byte $24    ; <や>
- - - - - 0x03B241 24:B231: 23        .byte $23    ; <も>
- - - - - 0x03B242 24:B232: 33        .byte $33    ; <0>
- - - - - 0x03B243 24:B233: 33        .byte $33    ; <0>
- D - I - 0x03B244 24:B234: 32        .byte $32    ; <ょ>
- - - - - 0x03B245 24:B235: 24        .byte $24    ; <や>
- - - - - 0x03B246 24:B236: 00        .byte $00
- D - I - 0x03B247 24:B237: 00        .byte $00
- D - I - 0x03B248 24:B238: 00        .byte $00
- D - I - 0x03B249 24:B239: 23        .byte $23    ; <も>
- D - I - 0x03B24A 24:B23A: 00        .byte $00
- D - I - 0x03B24B 24:B23B: 00        .byte $00
- D - I - 0x03B24C 24:B23C: 00        .byte $00
- D - I - 0x03B24D 24:B23D: 03        .byte $03    ; <う>
- D - I - 0x03B24E 24:B23E: 00        .byte $00
- D - I - 0x03B24F 24:B23F: 00        .byte $00
- D - I - 0x03B250 24:B240: 00        .byte $00
- D - I - 0x03B251 24:B241: 23        .byte $23    ; <も>
- - - - - 0x03B252 24:B242: 33        .byte $33    ; <0>
- - - - - 0x03B253 24:B243: 33        .byte $33    ; <0>
- - - - - 0x03B254 24:B244: 33        .byte $33    ; <0>
- D - I - 0x03B255 24:B245: 32        .byte $32    ; <ょ>
- - - - - 0x03B256 24:B246: 33        .byte $33    ; <0>
- - - - - 0x03B257 24:B247: 33        .byte $33    ; <0>
- - - - - 0x03B258 24:B248: 33        .byte $33    ; <0>
- - - - - 0x03B259 24:B249: 32        .byte $32    ; <ょ>
- - - - - 0x03B25A 24:B24A: 33        .byte $33    ; <0>
- - - - - 0x03B25B 24:B24B: 33        .byte $33    ; <0>
- - - - - 0x03B25C 24:B24C: 33        .byte $33    ; <0>
- D - I - 0x03B25D 24:B24D: 32        .byte $32    ; <ょ>
; 
- D - I - 0x03B25E 24:B24E: 12        .byte $12    ; <つ>
- - - - - 0x03B25F 24:B24F: 33        .byte $33    ; <0>
- - - - - 0x03B260 24:B250: 33        .byte $33    ; <0>
- D - I - 0x03B261 24:B251: 43        .byte $43    ; <ウ>
- D - I - 0x03B262 24:B252: 12        .byte $12    ; <つ>
- D - I - 0x03B263 24:B253: 33        .byte $33    ; <0>
- - - - - 0x03B264 24:B254: 33        .byte $33    ; <0>
- D - I - 0x03B265 24:B255: 33        .byte $33    ; <0>
- D - I - 0x03B266 24:B256: 11        .byte $11    ; <ち>
- - - - - 0x03B267 24:B257: 33        .byte $33    ; <0>
- D - I - 0x03B268 24:B258: 32        .byte $32    ; <ょ>
- - - - - 0x03B269 24:B259: 33        .byte $33    ; <0>
- - - - - 0x03B26A 24:B25A: 11        .byte $11    ; <ち>
- - - - - 0x03B26B 24:B25B: 13        .byte $13    ; <て>
- - - - - 0x03B26C 24:B25C: 33        .byte $33    ; <0>
- - - - - 0x03B26D 24:B25D: 33        .byte $33    ; <0>
- D - I - 0x03B26E 24:B25E: 32        .byte $32    ; <ょ>
- D - I - 0x03B26F 24:B25F: 33        .byte $33    ; <0>
- D - I - 0x03B270 24:B260: 33        .byte $33    ; <0>
- D - I - 0x03B271 24:B261: 33        .byte $33    ; <0>
- D - I - 0x03B272 24:B262: 22        .byte $22    ; <め>
- - - - - 0x03B273 24:B263: 33        .byte $33    ; <0>
- - - - - 0x03B274 24:B264: 33        .byte $33    ; <0>
- - - - - 0x03B275 24:B265: 34        .byte $34    ; <1>
- D - I - 0x03B276 24:B266: 00        .byte $00
- D - I - 0x03B277 24:B267: 00        .byte $00
- D - I - 0x03B278 24:B268: 00        .byte $00
- - - - - 0x03B279 24:B269: 00        .byte $00
- D - I - 0x03B27A 24:B26A: 00        .byte $00
- D - I - 0x03B27B 24:B26B: 00        .byte $00
- D - I - 0x03B27C 24:B26C: 00        .byte $00
- D - I - 0x03B27D 24:B26D: 00        .byte $00
- D - I - 0x03B27E 24:B26E: 00        .byte $00
- D - I - 0x03B27F 24:B26F: 00        .byte $00
- D - I - 0x03B280 24:B270: 00        .byte $00
- D - I - 0x03B281 24:B271: 00        .byte $00
- - - - - 0x03B282 24:B272: 00        .byte $00
- - - - - 0x03B283 24:B273: 00        .byte $00
- - - - - 0x03B284 24:B274: 00        .byte $00
- - - - - 0x03B285 24:B275: 00        .byte $00
- - - - - 0x03B286 24:B276: 00        .byte $00
- - - - - 0x03B287 24:B277: 00        .byte $00
- - - - - 0x03B288 24:B278: 00        .byte $00
- - - - - 0x03B289 24:B279: 00        .byte $00
- - - - - 0x03B28A 24:B27A: 00        .byte $00
- - - - - 0x03B28B 24:B27B: 00        .byte $00
- - - - - 0x03B28C 24:B27C: 00        .byte $00
- - - - - 0x03B28D 24:B27D: 00        .byte $00
; 
- - - - - 0x03B28E 24:B27E: 12        .byte $12    ; <つ>
- - - - - 0x03B28F 24:B27F: 22        .byte $22    ; <め>
- D - I - 0x03B290 24:B280: 22        .byte $22    ; <め>
- D - I - 0x03B291 24:B281: 43        .byte $43    ; <ウ>
- D - I - 0x03B292 24:B282: 13        .byte $13    ; <て>
- D - I - 0x03B293 24:B283: 23        .byte $23    ; <も>
- D - I - 0x03B294 24:B284: 33        .byte $33    ; <0>
- D - I - 0x03B295 24:B285: 33        .byte $33    ; <0>
- D - I - 0x03B296 24:B286: 11        .byte $11    ; <ち>
- D - I - 0x03B297 24:B287: 33        .byte $33    ; <0>
- D - I - 0x03B298 24:B288: 32        .byte $32    ; <ょ>
- D - I - 0x03B299 24:B289: 33        .byte $33    ; <0>
- D - I - 0x03B29A 24:B28A: 11        .byte $11    ; <ち>
- - - - - 0x03B29B 24:B28B: 13        .byte $13    ; <て>
- - - - - 0x03B29C 24:B28C: 33        .byte $33    ; <0>
- D - I - 0x03B29D 24:B28D: 33        .byte $33    ; <0>
- D - I - 0x03B29E 24:B28E: 22        .byte $22    ; <め>
- D - I - 0x03B29F 24:B28F: 33        .byte $33    ; <0>
- D - I - 0x03B2A0 24:B290: 33        .byte $33    ; <0>
- D - I - 0x03B2A1 24:B291: 33        .byte $33    ; <0>
- - - - - 0x03B2A2 24:B292: 22        .byte $22    ; <め>
- - - - - 0x03B2A3 24:B293: 33        .byte $33    ; <0>
- - - - - 0x03B2A4 24:B294: 33        .byte $33    ; <0>
- - - - - 0x03B2A5 24:B295: 34        .byte $34    ; <1>
- - - - - 0x03B2A6 24:B296: 03        .byte $03    ; <う>
- - - - - 0x03B2A7 24:B297: 23        .byte $23    ; <も>
- D - I - 0x03B2A8 24:B298: 31        .byte $31    ; <ゅ>
- D - I - 0x03B2A9 24:B299: 33        .byte $33    ; <0>
- - - - - 0x03B2AA 24:B29A: 00        .byte $00
- D - I - 0x03B2AB 24:B29B: 33        .byte $33    ; <0>
- D - I - 0x03B2AC 24:B29C: 33        .byte $33    ; <0>
- - - - - 0x03B2AD 24:B29D: 31        .byte $31    ; <ゅ>
- - - - - 0x03B2AE 24:B29E: 00        .byte $00
- - - - - 0x03B2AF 24:B29F: 33        .byte $33    ; <0>
- - - - - 0x03B2B0 24:B2A0: 33        .byte $33    ; <0>
- - - - - 0x03B2B1 24:B2A1: 31        .byte $31    ; <ゅ>
- - - - - 0x03B2B2 24:B2A2: 00        .byte $00
- - - - - 0x03B2B3 24:B2A3: 00        .byte $00
- - - - - 0x03B2B4 24:B2A4: 00        .byte $00
- - - - - 0x03B2B5 24:B2A5: 00        .byte $00
- - - - - 0x03B2B6 24:B2A6: 00        .byte $00
- - - - - 0x03B2B7 24:B2A7: 00        .byte $00
- - - - - 0x03B2B8 24:B2A8: 00        .byte $00
- - - - - 0x03B2B9 24:B2A9: 00        .byte $00
- - - - - 0x03B2BA 24:B2AA: 00        .byte $00
- - - - - 0x03B2BB 24:B2AB: 00        .byte $00
- - - - - 0x03B2BC 24:B2AC: 00        .byte $00
- - - - - 0x03B2BD 24:B2AD: 00        .byte $00
; 
- - - - - 0x03B2BE 24:B2AE: 22        .byte $22    ; <め>
- - - - - 0x03B2BF 24:B2AF: 22        .byte $22    ; <め>
- - - - - 0x03B2C0 24:B2B0: 44        .byte $44    ; <エ>
- - - - - 0x03B2C1 24:B2B1: 43        .byte $43    ; <ウ>
- D - I - 0x03B2C2 24:B2B2: 12        .byte $12    ; <つ>
- D - I - 0x03B2C3 24:B2B3: 24        .byte $24    ; <や>
- D - I - 0x03B2C4 24:B2B4: 44        .byte $44    ; <エ>
- D - I - 0x03B2C5 24:B2B5: 43        .byte $43    ; <ウ>
- - - - - 0x03B2C6 24:B2B6: 31        .byte $31    ; <ゅ>
- D - I - 0x03B2C7 24:B2B7: 22        .byte $22    ; <め>
- D - I - 0x03B2C8 24:B2B8: 44        .byte $44    ; <エ>
- D - I - 0x03B2C9 24:B2B9: 44        .byte $44    ; <エ>
- D - I - 0x03B2CA 24:B2BA: 11        .byte $11    ; <ち>
- - - - - 0x03B2CB 24:B2BB: 13        .byte $13    ; <て>
- D - I - 0x03B2CC 24:B2BC: 33        .byte $33    ; <0>
- D - I - 0x03B2CD 24:B2BD: 22        .byte $22    ; <め>
- D - I - 0x03B2CE 24:B2BE: 22        .byte $22    ; <め>
- D - I - 0x03B2CF 24:B2BF: 24        .byte $24    ; <や>
- D - I - 0x03B2D0 24:B2C0: 34        .byte $34    ; <1>
- D - I - 0x03B2D1 24:B2C1: 33        .byte $33    ; <0>
- - - - - 0x03B2D2 24:B2C2: 22        .byte $22    ; <め>
- - - - - 0x03B2D3 24:B2C3: 22        .byte $22    ; <め>
- - - - - 0x03B2D4 24:B2C4: 23        .byte $23    ; <も>
- D - I - 0x03B2D5 24:B2C5: 34        .byte $34    ; <1>
- - - - - 0x03B2D6 24:B2C6: 03        .byte $03    ; <う>
- - - - - 0x03B2D7 24:B2C7: 23        .byte $23    ; <も>
- - - - - 0x03B2D8 24:B2C8: 33        .byte $33    ; <0>
- - - - - 0x03B2D9 24:B2C9: 33        .byte $33    ; <0>
- - - - - 0x03B2DA 24:B2CA: 00        .byte $00
- - - - - 0x03B2DB 24:B2CB: 33        .byte $33    ; <0>
- - - - - 0x03B2DC 24:B2CC: 33        .byte $33    ; <0>
- - - - - 0x03B2DD 24:B2CD: 33        .byte $33    ; <0>
- - - - - 0x03B2DE 24:B2CE: 00        .byte $00
- - - - - 0x03B2DF 24:B2CF: 33        .byte $33    ; <0>
- - - - - 0x03B2E0 24:B2D0: 33        .byte $33    ; <0>
- - - - - 0x03B2E1 24:B2D1: 33        .byte $33    ; <0>
- - - - - 0x03B2E2 24:B2D2: 00        .byte $00
- - - - - 0x03B2E3 24:B2D3: 00        .byte $00
- - - - - 0x03B2E4 24:B2D4: 00        .byte $00
- - - - - 0x03B2E5 24:B2D5: 00        .byte $00
- - - - - 0x03B2E6 24:B2D6: 00        .byte $00
- - - - - 0x03B2E7 24:B2D7: 00        .byte $00
- - - - - 0x03B2E8 24:B2D8: 00        .byte $00
- - - - - 0x03B2E9 24:B2D9: 00        .byte $00
- - - - - 0x03B2EA 24:B2DA: 00        .byte $00
- - - - - 0x03B2EB 24:B2DB: 00        .byte $00
- - - - - 0x03B2EC 24:B2DC: 00        .byte $00
- - - - - 0x03B2ED 24:B2DD: 00        .byte $00
; 
- - - - - 0x03B2EE 24:B2DE: 11        .byte $11    ; <ち>
- - - - - 0x03B2EF 24:B2DF: 22        .byte $22    ; <め>
- - - - - 0x03B2F0 24:B2E0: 22        .byte $22    ; <め>
- D - I - 0x03B2F1 24:B2E1: 43        .byte $43    ; <ウ>
- D - I - 0x03B2F2 24:B2E2: 11        .byte $11    ; <ち>
- D - I - 0x03B2F3 24:B2E3: 11        .byte $11    ; <ち>
- - - - - 0x03B2F4 24:B2E4: 23        .byte $23    ; <も>
- D - I - 0x03B2F5 24:B2E5: 34        .byte $34    ; <1>
- - - - - 0x03B2F6 24:B2E6: 11        .byte $11    ; <ち>
- D - I - 0x03B2F7 24:B2E7: 11        .byte $11    ; <ち>
- D - I - 0x03B2F8 24:B2E8: 32        .byte $32    ; <ょ>
- D - I - 0x03B2F9 24:B2E9: 43        .byte $43    ; <ウ>
- D - I - 0x03B2FA 24:B2EA: 11        .byte $11    ; <ち>
- - - - - 0x03B2FB 24:B2EB: 11        .byte $11    ; <ち>
- - - - - 0x03B2FC 24:B2EC: 13        .byte $13    ; <て>
- - - - - 0x03B2FD 24:B2ED: 23        .byte $23    ; <も>
- D - I - 0x03B2FE 24:B2EE: 22        .byte $22    ; <め>
- D - I - 0x03B2FF 24:B2EF: 23        .byte $23    ; <も>
- D - I - 0x03B300 24:B2F0: 33        .byte $33    ; <0>
- D - I - 0x03B301 24:B2F1: 33        .byte $33    ; <0>
- - - - - 0x03B302 24:B2F2: 22        .byte $22    ; <め>
- D - I - 0x03B303 24:B2F3: 22        .byte $22    ; <め>
- D - I - 0x03B304 24:B2F4: 33        .byte $33    ; <0>
- D - I - 0x03B305 24:B2F5: 34        .byte $34    ; <1>
- - - - - 0x03B306 24:B2F6: 01        .byte $01    ; <あ>
- - - - - 0x03B307 24:B2F7: 23        .byte $23    ; <も>
- - - - - 0x03B308 24:B2F8: 01        .byte $01    ; <あ>
- - - - - 0x03B309 24:B2F9: 23        .byte $23    ; <も>
- - - - - 0x03B30A 24:B2FA: 01        .byte $01    ; <あ>
- - - - - 0x03B30B 24:B2FB: 23        .byte $23    ; <も>
- - - - - 0x03B30C 24:B2FC: 01        .byte $01    ; <あ>
- - - - - 0x03B30D 24:B2FD: 23        .byte $23    ; <も>
- - - - - 0x03B30E 24:B2FE: 01        .byte $01    ; <あ>
- - - - - 0x03B30F 24:B2FF: 23        .byte $23    ; <も>
- - - - - 0x03B310 24:B300: 01        .byte $01    ; <あ>
- - - - - 0x03B311 24:B301: 23        .byte $23    ; <も>
- - - - - 0x03B312 24:B302: 01        .byte $01    ; <あ>
- - - - - 0x03B313 24:B303: 23        .byte $23    ; <も>
- - - - - 0x03B314 24:B304: 01        .byte $01    ; <あ>
- - - - - 0x03B315 24:B305: 23        .byte $23    ; <も>
- - - - - 0x03B316 24:B306: 01        .byte $01    ; <あ>
- - - - - 0x03B317 24:B307: 23        .byte $23    ; <も>
- - - - - 0x03B318 24:B308: 01        .byte $01    ; <あ>
- - - - - 0x03B319 24:B309: 23        .byte $23    ; <も>
- - - - - 0x03B31A 24:B30A: 01        .byte $01    ; <あ>
- - - - - 0x03B31B 24:B30B: 23        .byte $23    ; <も>
- - - - - 0x03B31C 24:B30C: 01        .byte $01    ; <あ>
- - - - - 0x03B31D 24:B30D: 23        .byte $23    ; <も>
; 
- - - - - 0x03B31E 24:B30E: 33        .byte $33    ; <0>
- - - - - 0x03B31F 24:B30F: 33        .byte $33    ; <0>
- - - - - 0x03B320 24:B310: 33        .byte $33    ; <0>
- - - - - 0x03B321 24:B311: 33        .byte $33    ; <0>
- D - I - 0x03B322 24:B312: 33        .byte $33    ; <0>
- - - - - 0x03B323 24:B313: 33        .byte $33    ; <0>
- D - I - 0x03B324 24:B314: 33        .byte $33    ; <0>
- D - I - 0x03B325 24:B315: 33        .byte $33    ; <0>
- D - I - 0x03B326 24:B316: 33        .byte $33    ; <0>
- D - I - 0x03B327 24:B317: 33        .byte $33    ; <0>
- D - I - 0x03B328 24:B318: 33        .byte $33    ; <0>
- D - I - 0x03B329 24:B319: 33        .byte $33    ; <0>
- D - I - 0x03B32A 24:B31A: 33        .byte $33    ; <0>
- D - I - 0x03B32B 24:B31B: 33        .byte $33    ; <0>
- D - I - 0x03B32C 24:B31C: 33        .byte $33    ; <0>
- D - I - 0x03B32D 24:B31D: 33        .byte $33    ; <0>
- D - I - 0x03B32E 24:B31E: 33        .byte $33    ; <0>
- D - I - 0x03B32F 24:B31F: 33        .byte $33    ; <0>
- D - I - 0x03B330 24:B320: 33        .byte $33    ; <0>
- D - I - 0x03B331 24:B321: 33        .byte $33    ; <0>
- - - - - 0x03B332 24:B322: 33        .byte $33    ; <0>
- - - - - 0x03B333 24:B323: 33        .byte $33    ; <0>
- - - - - 0x03B334 24:B324: 33        .byte $33    ; <0>
- - - - - 0x03B335 24:B325: 33        .byte $33    ; <0>
- - - - - 0x03B336 24:B326: 01        .byte $01    ; <あ>
- - - - - 0x03B337 24:B327: 23        .byte $23    ; <も>
- - - - - 0x03B338 24:B328: 01        .byte $01    ; <あ>
- - - - - 0x03B339 24:B329: 23        .byte $23    ; <も>
- - - - - 0x03B33A 24:B32A: 01        .byte $01    ; <あ>
- - - - - 0x03B33B 24:B32B: 23        .byte $23    ; <も>
- - - - - 0x03B33C 24:B32C: 01        .byte $01    ; <あ>
- - - - - 0x03B33D 24:B32D: 23        .byte $23    ; <も>
- - - - - 0x03B33E 24:B32E: 01        .byte $01    ; <あ>
- - - - - 0x03B33F 24:B32F: 23        .byte $23    ; <も>
- - - - - 0x03B340 24:B330: 01        .byte $01    ; <あ>
- - - - - 0x03B341 24:B331: 23        .byte $23    ; <も>
- - - - - 0x03B342 24:B332: 01        .byte $01    ; <あ>
- - - - - 0x03B343 24:B333: 23        .byte $23    ; <も>
- - - - - 0x03B344 24:B334: 01        .byte $01    ; <あ>
- - - - - 0x03B345 24:B335: 23        .byte $23    ; <も>
- - - - - 0x03B346 24:B336: 01        .byte $01    ; <あ>
- - - - - 0x03B347 24:B337: 23        .byte $23    ; <も>
- - - - - 0x03B348 24:B338: 01        .byte $01    ; <あ>
- - - - - 0x03B349 24:B339: 23        .byte $23    ; <も>
- - - - - 0x03B34A 24:B33A: 01        .byte $01    ; <あ>
- - - - - 0x03B34B 24:B33B: 23        .byte $23    ; <も>
- - - - - 0x03B34C 24:B33C: 01        .byte $01    ; <あ>
- - - - - 0x03B34D 24:B33D: 23        .byte $23    ; <も>
; 
- - - - - 0x03B34E 24:B33E: 11        .byte $11    ; <ち>
- D - I - 0x03B34F 24:B33F: 11        .byte $11    ; <ち>
- - - - - 0x03B350 24:B340: 23        .byte $23    ; <も>
- D - I - 0x03B351 24:B341: 33        .byte $33    ; <0>
- D - I - 0x03B352 24:B342: 11        .byte $11    ; <ち>
- D - I - 0x03B353 24:B343: 12        .byte $12    ; <つ>
- D - I - 0x03B354 24:B344: 33        .byte $33    ; <0>
- D - I - 0x03B355 24:B345: 33        .byte $33    ; <0>
- D - I - 0x03B356 24:B346: 11        .byte $11    ; <ち>
- - - - - 0x03B357 24:B347: 11        .byte $11    ; <ち>
- D - I - 0x03B358 24:B348: 32        .byte $32    ; <ょ>
- D - I - 0x03B359 24:B349: 33        .byte $33    ; <0>
- D - I - 0x03B35A 24:B34A: 11        .byte $11    ; <ち>
- - - - - 0x03B35B 24:B34B: 11        .byte $11    ; <ち>
- - - - - 0x03B35C 24:B34C: 13        .byte $13    ; <て>
- - - - - 0x03B35D 24:B34D: 23        .byte $23    ; <も>
- D - I - 0x03B35E 24:B34E: 21        .byte $21    ; <む>
- D - I - 0x03B35F 24:B34F: 23        .byte $23    ; <も>
- D - I - 0x03B360 24:B350: 33        .byte $33    ; <0>
- D - I - 0x03B361 24:B351: 33        .byte $33    ; <0>
- - - - - 0x03B362 24:B352: 22        .byte $22    ; <め>
- D - I - 0x03B363 24:B353: 23        .byte $23    ; <も>
- D - I - 0x03B364 24:B354: 33        .byte $33    ; <0>
- D - I - 0x03B365 24:B355: 34        .byte $34    ; <1>
- - - - - 0x03B366 24:B356: 01        .byte $01    ; <あ>
- - - - - 0x03B367 24:B357: 23        .byte $23    ; <も>
- - - - - 0x03B368 24:B358: 01        .byte $01    ; <あ>
- - - - - 0x03B369 24:B359: 23        .byte $23    ; <も>
- - - - - 0x03B36A 24:B35A: 01        .byte $01    ; <あ>
- - - - - 0x03B36B 24:B35B: 23        .byte $23    ; <も>
- - - - - 0x03B36C 24:B35C: 01        .byte $01    ; <あ>
- - - - - 0x03B36D 24:B35D: 23        .byte $23    ; <も>
- - - - - 0x03B36E 24:B35E: 01        .byte $01    ; <あ>
- - - - - 0x03B36F 24:B35F: 23        .byte $23    ; <も>
- - - - - 0x03B370 24:B360: 01        .byte $01    ; <あ>
- - - - - 0x03B371 24:B361: 23        .byte $23    ; <も>
- - - - - 0x03B372 24:B362: 01        .byte $01    ; <あ>
- - - - - 0x03B373 24:B363: 23        .byte $23    ; <も>
- - - - - 0x03B374 24:B364: 01        .byte $01    ; <あ>
- - - - - 0x03B375 24:B365: 23        .byte $23    ; <も>
- - - - - 0x03B376 24:B366: 01        .byte $01    ; <あ>
- - - - - 0x03B377 24:B367: 23        .byte $23    ; <も>
- - - - - 0x03B378 24:B368: 01        .byte $01    ; <あ>
- - - - - 0x03B379 24:B369: 23        .byte $23    ; <も>
- - - - - 0x03B37A 24:B36A: 01        .byte $01    ; <あ>
- - - - - 0x03B37B 24:B36B: 23        .byte $23    ; <も>
- - - - - 0x03B37C 24:B36C: 01        .byte $01    ; <あ>
- - - - - 0x03B37D 24:B36D: 23        .byte $23    ; <も>
; 
- - - - - 0x03B37E 24:B36E: 17        .byte $17    ; <ぬ>
- - - - - 0x03B37F 24:B36F: 22        .byte $22    ; <め>
- - - - - 0x03B380 24:B370: 22        .byte $22    ; <め>
- - - - - 0x03B381 24:B371: 43        .byte $43    ; <ウ>
- - - - - 0x03B382 24:B372: 71        .byte $71    ; <ュ>
- - - - - 0x03B383 24:B373: 23        .byte $23    ; <も>
- - - - - 0x03B384 24:B374: 33        .byte $33    ; <0>
- - - - - 0x03B385 24:B375: 34        .byte $34    ; <1>
- - - - - 0x03B386 24:B376: 11        .byte $11    ; <ち>
- D - I - 0x03B387 24:B377: 33        .byte $33    ; <0>
- - - - - 0x03B388 24:B378: 32        .byte $32    ; <ょ>
- - - - - 0x03B389 24:B379: 43        .byte $43    ; <ウ>
- - - - - 0x03B38A 24:B37A: 11        .byte $11    ; <ち>
- D - I - 0x03B38B 24:B37B: 11        .byte $11    ; <ち>
- D - I - 0x03B38C 24:B37C: 33        .byte $33    ; <0>
- - - - - 0x03B38D 24:B37D: 23        .byte $23    ; <も>
- D - I - 0x03B38E 24:B37E: 22        .byte $22    ; <め>
- D - I - 0x03B38F 24:B37F: 23        .byte $23    ; <も>
- D - I - 0x03B390 24:B380: 77        .byte $77    ; <:>
- D - I - 0x03B391 24:B381: 37        .byte $37    ; <4>
- - - - - 0x03B392 24:B382: 22        .byte $22    ; <め>
- - - - - 0x03B393 24:B383: 27        .byte $27    ; <ら>
- - - - - 0x03B394 24:B384: 73        .byte $73    ; <ヮ>
- - - - - 0x03B395 24:B385: 34        .byte $34    ; <1>
- - - - - 0x03B396 24:B386: 01        .byte $01    ; <あ>
- - - - - 0x03B397 24:B387: 23        .byte $23    ; <も>
- - - - - 0x03B398 24:B388: 01        .byte $01    ; <あ>
- - - - - 0x03B399 24:B389: 23        .byte $23    ; <も>
- - - - - 0x03B39A 24:B38A: 01        .byte $01    ; <あ>
- - - - - 0x03B39B 24:B38B: 23        .byte $23    ; <も>
- - - - - 0x03B39C 24:B38C: 01        .byte $01    ; <あ>
- - - - - 0x03B39D 24:B38D: 23        .byte $23    ; <も>
- - - - - 0x03B39E 24:B38E: 01        .byte $01    ; <あ>
- - - - - 0x03B39F 24:B38F: 23        .byte $23    ; <も>
- - - - - 0x03B3A0 24:B390: 01        .byte $01    ; <あ>
- - - - - 0x03B3A1 24:B391: 23        .byte $23    ; <も>
- - - - - 0x03B3A2 24:B392: 01        .byte $01    ; <あ>
- - - - - 0x03B3A3 24:B393: 23        .byte $23    ; <も>
- - - - - 0x03B3A4 24:B394: 01        .byte $01    ; <あ>
- - - - - 0x03B3A5 24:B395: 23        .byte $23    ; <も>
- - - - - 0x03B3A6 24:B396: 01        .byte $01    ; <あ>
- - - - - 0x03B3A7 24:B397: 23        .byte $23    ; <も>
- - - - - 0x03B3A8 24:B398: 01        .byte $01    ; <あ>
- - - - - 0x03B3A9 24:B399: 23        .byte $23    ; <も>
- - - - - 0x03B3AA 24:B39A: 01        .byte $01    ; <あ>
- - - - - 0x03B3AB 24:B39B: 23        .byte $23    ; <も>
- - - - - 0x03B3AC 24:B39C: 01        .byte $01    ; <あ>
- - - - - 0x03B3AD 24:B39D: 23        .byte $23    ; <も>
; 
- - - - - 0x03B3AE 24:B39E: 11        .byte $11    ; <ち>
- - - - - 0x03B3AF 24:B39F: 11        .byte $11    ; <ち>
- D - I - 0x03B3B0 24:B3A0: 12        .byte $12    ; <つ>
- - - - - 0x03B3B1 24:B3A1: 33        .byte $33    ; <0>
- - - - - 0x03B3B2 24:B3A2: 11        .byte $11    ; <ち>
- - - - - 0x03B3B3 24:B3A3: 12        .byte $12    ; <つ>
- - - - - 0x03B3B4 24:B3A4: 33        .byte $33    ; <0>
- - - - - 0x03B3B5 24:B3A5: 33        .byte $33    ; <0>
- - - - - 0x03B3B6 24:B3A6: 11        .byte $11    ; <ち>
- - - - - 0x03B3B7 24:B3A7: 11        .byte $11    ; <ち>
- - - - - 0x03B3B8 24:B3A8: 32        .byte $32    ; <ょ>
- - - - - 0x03B3B9 24:B3A9: 23        .byte $23    ; <も>
- - - - - 0x03B3BA 24:B3AA: 11        .byte $11    ; <ち>
- - - - - 0x03B3BB 24:B3AB: 11        .byte $11    ; <ち>
- - - - - 0x03B3BC 24:B3AC: 13        .byte $13    ; <て>
- - - - - 0x03B3BD 24:B3AD: 23        .byte $23    ; <も>
- - - - - 0x03B3BE 24:B3AE: 33        .byte $33    ; <0>
- - - - - 0x03B3BF 24:B3AF: 33        .byte $33    ; <0>
- - - - - 0x03B3C0 24:B3B0: 32        .byte $32    ; <ょ>
- - - - - 0x03B3C1 24:B3B1: 23        .byte $23    ; <も>
- - - - - 0x03B3C2 24:B3B2: 33        .byte $33    ; <0>
- - - - - 0x03B3C3 24:B3B3: 33        .byte $33    ; <0>
- - - - - 0x03B3C4 24:B3B4: 22        .byte $22    ; <め>
- - - - - 0x03B3C5 24:B3B5: 24        .byte $24    ; <や>
- - - - - 0x03B3C6 24:B3B6: 01        .byte $01    ; <あ>
- - - - - 0x03B3C7 24:B3B7: 23        .byte $23    ; <も>
- - - - - 0x03B3C8 24:B3B8: 01        .byte $01    ; <あ>
- - - - - 0x03B3C9 24:B3B9: 23        .byte $23    ; <も>
- - - - - 0x03B3CA 24:B3BA: 01        .byte $01    ; <あ>
- - - - - 0x03B3CB 24:B3BB: 23        .byte $23    ; <も>
- - - - - 0x03B3CC 24:B3BC: 01        .byte $01    ; <あ>
- - - - - 0x03B3CD 24:B3BD: 23        .byte $23    ; <も>
- - - - - 0x03B3CE 24:B3BE: 01        .byte $01    ; <あ>
- - - - - 0x03B3CF 24:B3BF: 23        .byte $23    ; <も>
- - - - - 0x03B3D0 24:B3C0: 01        .byte $01    ; <あ>
- - - - - 0x03B3D1 24:B3C1: 23        .byte $23    ; <も>
- - - - - 0x03B3D2 24:B3C2: 01        .byte $01    ; <あ>
- - - - - 0x03B3D3 24:B3C3: 23        .byte $23    ; <も>
- - - - - 0x03B3D4 24:B3C4: 01        .byte $01    ; <あ>
- - - - - 0x03B3D5 24:B3C5: 23        .byte $23    ; <も>
- - - - - 0x03B3D6 24:B3C6: 01        .byte $01    ; <あ>
- - - - - 0x03B3D7 24:B3C7: 23        .byte $23    ; <も>
- - - - - 0x03B3D8 24:B3C8: 01        .byte $01    ; <あ>
- - - - - 0x03B3D9 24:B3C9: 23        .byte $23    ; <も>
- - - - - 0x03B3DA 24:B3CA: 01        .byte $01    ; <あ>
- - - - - 0x03B3DB 24:B3CB: 23        .byte $23    ; <も>
- - - - - 0x03B3DC 24:B3CC: 01        .byte $01    ; <あ>
- - - - - 0x03B3DD 24:B3CD: 23        .byte $23    ; <も>
; 
- - - - - 0x03B3DE 24:B3CE: 66        .byte $66    ; <ヨ>
- - - - - 0x03B3DF 24:B3CF: 55        .byte $55    ; <ナ>
- - - - - 0x03B3E0 24:B3D0: 52        .byte $52    ; <ツ>
- - - - - 0x03B3E1 24:B3D1: 33        .byte $33    ; <0>
- D - I - 0x03B3E2 24:B3D2: 65        .byte $65    ; <ユ>
- D - I - 0x03B3E3 24:B3D3: 52        .byte $52    ; <ツ>
- D - I - 0x03B3E4 24:B3D4: 33        .byte $33    ; <0>
- D - I - 0x03B3E5 24:B3D5: 33        .byte $33    ; <0>
- - - - - 0x03B3E6 24:B3D6: 66        .byte $66    ; <ヨ>
- - - - - 0x03B3E7 24:B3D7: 53        .byte $53    ; <テ>
- D - I - 0x03B3E8 24:B3D8: 32        .byte $32    ; <ょ>
- - - - - 0x03B3E9 24:B3D9: 23        .byte $23    ; <も>
- D - I - 0x03B3EA 24:B3DA: 66        .byte $66    ; <ヨ>
- - - - - 0x03B3EB 24:B3DB: 55        .byte $55    ; <ナ>
- - - - - 0x03B3EC 24:B3DC: 33        .byte $33    ; <0>
- D - I - 0x03B3ED 24:B3DD: 33        .byte $33    ; <0>
- D - I - 0x03B3EE 24:B3DE: 33        .byte $33    ; <0>
- D - I - 0x03B3EF 24:B3DF: 33        .byte $33    ; <0>
- D - I - 0x03B3F0 24:B3E0: 32        .byte $32    ; <ょ>
- D - I - 0x03B3F1 24:B3E1: 24        .byte $24    ; <や>
- - - - - 0x03B3F2 24:B3E2: 33        .byte $33    ; <0>
- - - - - 0x03B3F3 24:B3E3: 33        .byte $33    ; <0>
- - - - - 0x03B3F4 24:B3E4: 22        .byte $22    ; <め>
- - - - - 0x03B3F5 24:B3E5: 24        .byte $24    ; <や>
- - - - - 0x03B3F6 24:B3E6: 01        .byte $01    ; <あ>
- - - - - 0x03B3F7 24:B3E7: 23        .byte $23    ; <も>
- - - - - 0x03B3F8 24:B3E8: 01        .byte $01    ; <あ>
- - - - - 0x03B3F9 24:B3E9: 23        .byte $23    ; <も>
- - - - - 0x03B3FA 24:B3EA: 01        .byte $01    ; <あ>
- - - - - 0x03B3FB 24:B3EB: 23        .byte $23    ; <も>
- - - - - 0x03B3FC 24:B3EC: 01        .byte $01    ; <あ>
- - - - - 0x03B3FD 24:B3ED: 23        .byte $23    ; <も>
- - - - - 0x03B3FE 24:B3EE: 01        .byte $01    ; <あ>
- - - - - 0x03B3FF 24:B3EF: 23        .byte $23    ; <も>
- - - - - 0x03B400 24:B3F0: 01        .byte $01    ; <あ>
- - - - - 0x03B401 24:B3F1: 23        .byte $23    ; <も>
- - - - - 0x03B402 24:B3F2: 01        .byte $01    ; <あ>
- - - - - 0x03B403 24:B3F3: 23        .byte $23    ; <も>
- - - - - 0x03B404 24:B3F4: 01        .byte $01    ; <あ>
- - - - - 0x03B405 24:B3F5: 23        .byte $23    ; <も>
- - - - - 0x03B406 24:B3F6: 01        .byte $01    ; <あ>
- - - - - 0x03B407 24:B3F7: 23        .byte $23    ; <も>
- - - - - 0x03B408 24:B3F8: 01        .byte $01    ; <あ>
- - - - - 0x03B409 24:B3F9: 23        .byte $23    ; <も>
- - - - - 0x03B40A 24:B3FA: 01        .byte $01    ; <あ>
- - - - - 0x03B40B 24:B3FB: 23        .byte $23    ; <も>
- - - - - 0x03B40C 24:B3FC: 01        .byte $01    ; <あ>
- - - - - 0x03B40D 24:B3FD: 23        .byte $23    ; <も>
; 
- D - I - 0x03B40E 24:B3FE: 11        .byte $11    ; <ち>
- D - I - 0x03B40F 24:B3FF: 11        .byte $11    ; <ち>
- - - - - 0x03B410 24:B400: 11        .byte $11    ; <ち>
- - - - - 0x03B411 24:B401: 33        .byte $33    ; <0>
- D - I - 0x03B412 24:B402: 11        .byte $11    ; <ち>
- D - I - 0x03B413 24:B403: 23        .byte $23    ; <も>
- - - - - 0x03B414 24:B404: 33        .byte $33    ; <0>
- - - - - 0x03B415 24:B405: 34        .byte $34    ; <1>
- - - - - 0x03B416 24:B406: 11        .byte $11    ; <ち>
- D - I - 0x03B417 24:B407: 13        .byte $13    ; <て>
- - - - - 0x03B418 24:B408: 32        .byte $32    ; <ょ>
- D - I - 0x03B419 24:B409: 43        .byte $43    ; <ウ>
- - - - - 0x03B41A 24:B40A: 11        .byte $11    ; <ち>
- - - - - 0x03B41B 24:B40B: 11        .byte $11    ; <ち>
- - - - - 0x03B41C 24:B40C: 33        .byte $33    ; <0>
- - - - - 0x03B41D 24:B40D: 23        .byte $23    ; <も>
- D - I - 0x03B41E 24:B40E: 22        .byte $22    ; <め>
- D - I - 0x03B41F 24:B40F: 23        .byte $23    ; <も>
- D - I - 0x03B420 24:B410: 34        .byte $34    ; <1>
- D - I - 0x03B421 24:B411: 33        .byte $33    ; <0>
- - - - - 0x03B422 24:B412: 22        .byte $22    ; <め>
- - - - - 0x03B423 24:B413: 22        .byte $22    ; <め>
- - - - - 0x03B424 24:B414: 33        .byte $33    ; <0>
- D - I - 0x03B425 24:B415: 34        .byte $34    ; <1>
- - - - - 0x03B426 24:B416: 01        .byte $01    ; <あ>
- - - - - 0x03B427 24:B417: 23        .byte $23    ; <も>
- - - - - 0x03B428 24:B418: 01        .byte $01    ; <あ>
- - - - - 0x03B429 24:B419: 23        .byte $23    ; <も>
- - - - - 0x03B42A 24:B41A: 01        .byte $01    ; <あ>
- - - - - 0x03B42B 24:B41B: 23        .byte $23    ; <も>
- - - - - 0x03B42C 24:B41C: 01        .byte $01    ; <あ>
- - - - - 0x03B42D 24:B41D: 23        .byte $23    ; <も>
- - - - - 0x03B42E 24:B41E: 01        .byte $01    ; <あ>
- - - - - 0x03B42F 24:B41F: 23        .byte $23    ; <も>
- - - - - 0x03B430 24:B420: 01        .byte $01    ; <あ>
- - - - - 0x03B431 24:B421: 23        .byte $23    ; <も>
- - - - - 0x03B432 24:B422: 01        .byte $01    ; <あ>
- - - - - 0x03B433 24:B423: 23        .byte $23    ; <も>
- - - - - 0x03B434 24:B424: 01        .byte $01    ; <あ>
- - - - - 0x03B435 24:B425: 23        .byte $23    ; <も>
- - - - - 0x03B436 24:B426: 01        .byte $01    ; <あ>
- - - - - 0x03B437 24:B427: 23        .byte $23    ; <も>
- - - - - 0x03B438 24:B428: 01        .byte $01    ; <あ>
- - - - - 0x03B439 24:B429: 23        .byte $23    ; <も>
- - - - - 0x03B43A 24:B42A: 01        .byte $01    ; <あ>
- - - - - 0x03B43B 24:B42B: 23        .byte $23    ; <も>
- - - - - 0x03B43C 24:B42C: 01        .byte $01    ; <あ>
- - - - - 0x03B43D 24:B42D: 23        .byte $23    ; <も>
; 
- D - I - 0x03B43E 24:B42E: 12        .byte $12    ; <つ>
- - - - - 0x03B43F 24:B42F: 22        .byte $22    ; <め>
- - - - - 0x03B440 24:B430: 23        .byte $23    ; <も>
- D - I - 0x03B441 24:B431: 43        .byte $43    ; <ウ>
- D - I - 0x03B442 24:B432: 12        .byte $12    ; <つ>
- D - I - 0x03B443 24:B433: 33        .byte $33    ; <0>
- D - I - 0x03B444 24:B434: 33        .byte $33    ; <0>
- D - I - 0x03B445 24:B435: 34        .byte $34    ; <1>
- D - I - 0x03B446 24:B436: 11        .byte $11    ; <ち>
- D - I - 0x03B447 24:B437: 33        .byte $33    ; <0>
- D - I - 0x03B448 24:B438: 32        .byte $32    ; <ょ>
- D - I - 0x03B449 24:B439: 43        .byte $43    ; <ウ>
- D - I - 0x03B44A 24:B43A: 11        .byte $11    ; <ち>
- D - I - 0x03B44B 24:B43B: 13        .byte $13    ; <て>
- D - I - 0x03B44C 24:B43C: 33        .byte $33    ; <0>
- D - I - 0x03B44D 24:B43D: 23        .byte $23    ; <も>
- D - I - 0x03B44E 24:B43E: 22        .byte $22    ; <め>
- D - I - 0x03B44F 24:B43F: 23        .byte $23    ; <も>
- D - I - 0x03B450 24:B440: 34        .byte $34    ; <1>
- D - I - 0x03B451 24:B441: 33        .byte $33    ; <0>
- D - I - 0x03B452 24:B442: 22        .byte $22    ; <め>
- D - I - 0x03B453 24:B443: 22        .byte $22    ; <め>
- - - - - 0x03B454 24:B444: 33        .byte $33    ; <0>
- D - I - 0x03B455 24:B445: 34        .byte $34    ; <1>
- - - - - 0x03B456 24:B446: 01        .byte $01    ; <あ>
- - - - - 0x03B457 24:B447: 23        .byte $23    ; <も>
- - - - - 0x03B458 24:B448: 01        .byte $01    ; <あ>
- - - - - 0x03B459 24:B449: 23        .byte $23    ; <も>
- - - - - 0x03B45A 24:B44A: 01        .byte $01    ; <あ>
- - - - - 0x03B45B 24:B44B: 23        .byte $23    ; <も>
- - - - - 0x03B45C 24:B44C: 01        .byte $01    ; <あ>
- - - - - 0x03B45D 24:B44D: 23        .byte $23    ; <も>
- - - - - 0x03B45E 24:B44E: 01        .byte $01    ; <あ>
- - - - - 0x03B45F 24:B44F: 23        .byte $23    ; <も>
- - - - - 0x03B460 24:B450: 01        .byte $01    ; <あ>
- - - - - 0x03B461 24:B451: 23        .byte $23    ; <も>
- - - - - 0x03B462 24:B452: 01        .byte $01    ; <あ>
- - - - - 0x03B463 24:B453: 23        .byte $23    ; <も>
- - - - - 0x03B464 24:B454: 01        .byte $01    ; <あ>
- - - - - 0x03B465 24:B455: 23        .byte $23    ; <も>
- - - - - 0x03B466 24:B456: 01        .byte $01    ; <あ>
- - - - - 0x03B467 24:B457: 23        .byte $23    ; <も>
- - - - - 0x03B468 24:B458: 01        .byte $01    ; <あ>
- - - - - 0x03B469 24:B459: 23        .byte $23    ; <も>
- - - - - 0x03B46A 24:B45A: 01        .byte $01    ; <あ>
- - - - - 0x03B46B 24:B45B: 23        .byte $23    ; <も>
- - - - - 0x03B46C 24:B45C: 01        .byte $01    ; <あ>
- - - - - 0x03B46D 24:B45D: 23        .byte $23    ; <も>
; 
- - - - - 0x03B46E 24:B45E: 66        .byte $66    ; <ヨ>
- - - - - 0x03B46F 24:B45F: 55        .byte $55    ; <ナ>
- - - - - 0x03B470 24:B460: 22        .byte $22    ; <め>
- - - - - 0x03B471 24:B461: 43        .byte $43    ; <ウ>
- - - - - 0x03B472 24:B462: 62        .byte $62    ; <メ>
- D - I - 0x03B473 24:B463: 22        .byte $22    ; <め>
- D - I - 0x03B474 24:B464: 33        .byte $33    ; <0>
- D - I - 0x03B475 24:B465: 33        .byte $33    ; <0>
- D - I - 0x03B476 24:B466: 66        .byte $66    ; <ヨ>
- - - - - 0x03B477 24:B467: 53        .byte $53    ; <テ>
- - - - - 0x03B478 24:B468: 32        .byte $32    ; <ょ>
- D - I - 0x03B479 24:B469: 23        .byte $23    ; <も>
- D - I - 0x03B47A 24:B46A: 66        .byte $66    ; <ヨ>
- - - - - 0x03B47B 24:B46B: 55        .byte $55    ; <ナ>
- D - I - 0x03B47C 24:B46C: 33        .byte $33    ; <0>
- - - - - 0x03B47D 24:B46D: 23        .byte $23    ; <も>
- D - I - 0x03B47E 24:B46E: 22        .byte $22    ; <め>
- D - I - 0x03B47F 24:B46F: 22        .byte $22    ; <め>
- - - - - 0x03B480 24:B470: 23        .byte $23    ; <も>
- D - I - 0x03B481 24:B471: 33        .byte $33    ; <0>
- - - - - 0x03B482 24:B472: 33        .byte $33    ; <0>
- - - - - 0x03B483 24:B473: 33        .byte $33    ; <0>
- - - - - 0x03B484 24:B474: 22        .byte $22    ; <め>
- - - - - 0x03B485 24:B475: 22        .byte $22    ; <め>
- - - - - 0x03B486 24:B476: 01        .byte $01    ; <あ>
- - - - - 0x03B487 24:B477: 23        .byte $23    ; <も>
- - - - - 0x03B488 24:B478: 01        .byte $01    ; <あ>
- - - - - 0x03B489 24:B479: 23        .byte $23    ; <も>
- - - - - 0x03B48A 24:B47A: 01        .byte $01    ; <あ>
- - - - - 0x03B48B 24:B47B: 23        .byte $23    ; <も>
- - - - - 0x03B48C 24:B47C: 01        .byte $01    ; <あ>
- - - - - 0x03B48D 24:B47D: 23        .byte $23    ; <も>
- - - - - 0x03B48E 24:B47E: 01        .byte $01    ; <あ>
- - - - - 0x03B48F 24:B47F: 23        .byte $23    ; <も>
- - - - - 0x03B490 24:B480: 01        .byte $01    ; <あ>
- - - - - 0x03B491 24:B481: 23        .byte $23    ; <も>
- - - - - 0x03B492 24:B482: 01        .byte $01    ; <あ>
- - - - - 0x03B493 24:B483: 23        .byte $23    ; <も>
- - - - - 0x03B494 24:B484: 01        .byte $01    ; <あ>
- - - - - 0x03B495 24:B485: 23        .byte $23    ; <も>
- - - - - 0x03B496 24:B486: 01        .byte $01    ; <あ>
- - - - - 0x03B497 24:B487: 23        .byte $23    ; <も>
- - - - - 0x03B498 24:B488: 01        .byte $01    ; <あ>
- - - - - 0x03B499 24:B489: 23        .byte $23    ; <も>
- - - - - 0x03B49A 24:B48A: 01        .byte $01    ; <あ>
- - - - - 0x03B49B 24:B48B: 23        .byte $23    ; <も>
- - - - - 0x03B49C 24:B48C: 01        .byte $01    ; <あ>
- - - - - 0x03B49D 24:B48D: 23        .byte $23    ; <も>
; 
- - - - - 0x03B49E 24:B48E: 11        .byte $11    ; <ち>
- - - - - 0x03B49F 24:B48F: 11        .byte $11    ; <ち>
- - - - - 0x03B4A0 24:B490: 23        .byte $23    ; <も>
- - - - - 0x03B4A1 24:B491: 33        .byte $33    ; <0>
- D - I - 0x03B4A2 24:B492: 11        .byte $11    ; <ち>
- - - - - 0x03B4A3 24:B493: 11        .byte $11    ; <ち>
- D - I - 0x03B4A4 24:B494: 12        .byte $12    ; <つ>
- - - - - 0x03B4A5 24:B495: 33        .byte $33    ; <0>
- - - - - 0x03B4A6 24:B496: 11        .byte $11    ; <ち>
- - - - - 0x03B4A7 24:B497: 11        .byte $11    ; <ち>
- - - - - 0x03B4A8 24:B498: 11        .byte $11    ; <ち>
- D - I - 0x03B4A9 24:B499: 23        .byte $23    ; <も>
- - - - - 0x03B4AA 24:B49A: 11        .byte $11    ; <ち>
- - - - - 0x03B4AB 24:B49B: 11        .byte $11    ; <ち>
- - - - - 0x03B4AC 24:B49C: 11        .byte $11    ; <ち>
- - - - - 0x03B4AD 24:B49D: 13        .byte $13    ; <て>
- - - - - 0x03B4AE 24:B49E: 11        .byte $11    ; <ち>
- D - I - 0x03B4AF 24:B49F: 11        .byte $11    ; <ち>
- D - I - 0x03B4B0 24:B4A0: 22        .byte $22    ; <め>
- D - I - 0x03B4B1 24:B4A1: 33        .byte $33    ; <0>
- - - - - 0x03B4B2 24:B4A2: 22        .byte $22    ; <め>
- D - I - 0x03B4B3 24:B4A3: 22        .byte $22    ; <め>
- - - - - 0x03B4B4 24:B4A4: 22        .byte $22    ; <め>
- - - - - 0x03B4B5 24:B4A5: 34        .byte $34    ; <1>
- - - - - 0x03B4B6 24:B4A6: 01        .byte $01    ; <あ>
- - - - - 0x03B4B7 24:B4A7: 23        .byte $23    ; <も>
- - - - - 0x03B4B8 24:B4A8: 01        .byte $01    ; <あ>
- - - - - 0x03B4B9 24:B4A9: 23        .byte $23    ; <も>
- - - - - 0x03B4BA 24:B4AA: 01        .byte $01    ; <あ>
- - - - - 0x03B4BB 24:B4AB: 23        .byte $23    ; <も>
- - - - - 0x03B4BC 24:B4AC: 01        .byte $01    ; <あ>
- - - - - 0x03B4BD 24:B4AD: 23        .byte $23    ; <も>
- - - - - 0x03B4BE 24:B4AE: 01        .byte $01    ; <あ>
- - - - - 0x03B4BF 24:B4AF: 23        .byte $23    ; <も>
- - - - - 0x03B4C0 24:B4B0: 01        .byte $01    ; <あ>
- - - - - 0x03B4C1 24:B4B1: 23        .byte $23    ; <も>
- - - - - 0x03B4C2 24:B4B2: 01        .byte $01    ; <あ>
- - - - - 0x03B4C3 24:B4B3: 23        .byte $23    ; <も>
- - - - - 0x03B4C4 24:B4B4: 01        .byte $01    ; <あ>
- - - - - 0x03B4C5 24:B4B5: 23        .byte $23    ; <も>
- - - - - 0x03B4C6 24:B4B6: 01        .byte $01    ; <あ>
- - - - - 0x03B4C7 24:B4B7: 23        .byte $23    ; <も>
- - - - - 0x03B4C8 24:B4B8: 01        .byte $01    ; <あ>
- - - - - 0x03B4C9 24:B4B9: 23        .byte $23    ; <も>
- - - - - 0x03B4CA 24:B4BA: 01        .byte $01    ; <あ>
- - - - - 0x03B4CB 24:B4BB: 23        .byte $23    ; <も>
- - - - - 0x03B4CC 24:B4BC: 01        .byte $01    ; <あ>
- - - - - 0x03B4CD 24:B4BD: 23        .byte $23    ; <も>
; 
- - - - - 0x03B4CE 24:B4BE: 12        .byte $12    ; <つ>
- - - - - 0x03B4CF 24:B4BF: 23        .byte $23    ; <も>
- - - - - 0x03B4D0 24:B4C0: 33        .byte $33    ; <0>
- - - - - 0x03B4D1 24:B4C1: 43        .byte $43    ; <ウ>
- D - I - 0x03B4D2 24:B4C2: 31        .byte $31    ; <ゅ>
- D - I - 0x03B4D3 24:B4C3: 33        .byte $33    ; <0>
- D - I - 0x03B4D4 24:B4C4: 33        .byte $33    ; <0>
- D - I - 0x03B4D5 24:B4C5: 34        .byte $34    ; <1>
- D - I - 0x03B4D6 24:B4C6: 31        .byte $31    ; <ゅ>
- D - I - 0x03B4D7 24:B4C7: 33        .byte $33    ; <0>
- D - I - 0x03B4D8 24:B4C8: 33        .byte $33    ; <0>
- D - I - 0x03B4D9 24:B4C9: 43        .byte $43    ; <ウ>
- D - I - 0x03B4DA 24:B4CA: 31        .byte $31    ; <ゅ>
- D - I - 0x03B4DB 24:B4CB: 13        .byte $13    ; <て>
- D - I - 0x03B4DC 24:B4CC: 33        .byte $33    ; <0>
- D - I - 0x03B4DD 24:B4CD: 33        .byte $33    ; <0>
- D - I - 0x03B4DE 24:B4CE: 23        .byte $23    ; <も>
- D - I - 0x03B4DF 24:B4CF: 33        .byte $33    ; <0>
- D - I - 0x03B4E0 24:B4D0: 34        .byte $34    ; <1>
- D - I - 0x03B4E1 24:B4D1: 33        .byte $33    ; <0>
- - - - - 0x03B4E2 24:B4D2: 22        .byte $22    ; <め>
- - - - - 0x03B4E3 24:B4D3: 33        .byte $33    ; <0>
- D - I - 0x03B4E4 24:B4D4: 33        .byte $33    ; <0>
- - - - - 0x03B4E5 24:B4D5: 34        .byte $34    ; <1>
- - - - - 0x03B4E6 24:B4D6: 01        .byte $01    ; <あ>
- - - - - 0x03B4E7 24:B4D7: 23        .byte $23    ; <も>
- - - - - 0x03B4E8 24:B4D8: 01        .byte $01    ; <あ>
- - - - - 0x03B4E9 24:B4D9: 23        .byte $23    ; <も>
- - - - - 0x03B4EA 24:B4DA: 01        .byte $01    ; <あ>
- - - - - 0x03B4EB 24:B4DB: 23        .byte $23    ; <も>
- - - - - 0x03B4EC 24:B4DC: 01        .byte $01    ; <あ>
- - - - - 0x03B4ED 24:B4DD: 23        .byte $23    ; <も>
- - - - - 0x03B4EE 24:B4DE: 01        .byte $01    ; <あ>
- - - - - 0x03B4EF 24:B4DF: 23        .byte $23    ; <も>
- - - - - 0x03B4F0 24:B4E0: 01        .byte $01    ; <あ>
- - - - - 0x03B4F1 24:B4E1: 23        .byte $23    ; <も>
- - - - - 0x03B4F2 24:B4E2: 01        .byte $01    ; <あ>
- - - - - 0x03B4F3 24:B4E3: 23        .byte $23    ; <も>
- - - - - 0x03B4F4 24:B4E4: 01        .byte $01    ; <あ>
- - - - - 0x03B4F5 24:B4E5: 23        .byte $23    ; <も>
- - - - - 0x03B4F6 24:B4E6: 01        .byte $01    ; <あ>
- - - - - 0x03B4F7 24:B4E7: 23        .byte $23    ; <も>
- - - - - 0x03B4F8 24:B4E8: 01        .byte $01    ; <あ>
- - - - - 0x03B4F9 24:B4E9: 23        .byte $23    ; <も>
- - - - - 0x03B4FA 24:B4EA: 01        .byte $01    ; <あ>
- - - - - 0x03B4FB 24:B4EB: 23        .byte $23    ; <も>
- - - - - 0x03B4FC 24:B4EC: 01        .byte $01    ; <あ>
- - - - - 0x03B4FD 24:B4ED: 23        .byte $23    ; <も>
; 
- D - I - 0x03B4FE 24:B4EE: 22        .byte $22    ; <め>
- D - I - 0x03B4FF 24:B4EF: 22        .byte $22    ; <め>
- D - I - 0x03B500 24:B4F0: 22        .byte $22    ; <め>
- - - - - 0x03B501 24:B4F1: 43        .byte $43    ; <ウ>
- D - I - 0x03B502 24:B4F2: 22        .byte $22    ; <め>
- D - I - 0x03B503 24:B4F3: 22        .byte $22    ; <め>
- D - I - 0x03B504 24:B4F4: 13        .byte $13    ; <て>
- D - I - 0x03B505 24:B4F5: 32        .byte $32    ; <ょ>
- D - I - 0x03B506 24:B4F6: 11        .byte $11    ; <ち>
- D - I - 0x03B507 24:B4F7: 22        .byte $22    ; <め>
- D - I - 0x03B508 24:B4F8: 22        .byte $22    ; <め>
- D - I - 0x03B509 24:B4F9: 43        .byte $43    ; <ウ>
- D - I - 0x03B50A 24:B4FA: 11        .byte $11    ; <ち>
- - - - - 0x03B50B 24:B4FB: 13        .byte $13    ; <て>
- - - - - 0x03B50C 24:B4FC: 22        .byte $22    ; <め>
- D - I - 0x03B50D 24:B4FD: 23        .byte $23    ; <も>
- D - I - 0x03B50E 24:B4FE: 22        .byte $22    ; <め>
- D - I - 0x03B50F 24:B4FF: 22        .byte $22    ; <め>
- D - I - 0x03B510 24:B500: 23        .byte $23    ; <も>
- D - I - 0x03B511 24:B501: 23        .byte $23    ; <も>
- D - I - 0x03B512 24:B502: 22        .byte $22    ; <め>
- D - I - 0x03B513 24:B503: 22        .byte $22    ; <め>
- D - I - 0x03B514 24:B504: 22        .byte $22    ; <め>
- D - I - 0x03B515 24:B505: 32        .byte $32    ; <ょ>
- - - - - 0x03B516 24:B506: 01        .byte $01    ; <あ>
- - - - - 0x03B517 24:B507: 23        .byte $23    ; <も>
- - - - - 0x03B518 24:B508: 01        .byte $01    ; <あ>
- - - - - 0x03B519 24:B509: 23        .byte $23    ; <も>
- - - - - 0x03B51A 24:B50A: 01        .byte $01    ; <あ>
- - - - - 0x03B51B 24:B50B: 23        .byte $23    ; <も>
- - - - - 0x03B51C 24:B50C: 01        .byte $01    ; <あ>
- - - - - 0x03B51D 24:B50D: 23        .byte $23    ; <も>
- - - - - 0x03B51E 24:B50E: 01        .byte $01    ; <あ>
- - - - - 0x03B51F 24:B50F: 23        .byte $23    ; <も>
- - - - - 0x03B520 24:B510: 01        .byte $01    ; <あ>
- - - - - 0x03B521 24:B511: 23        .byte $23    ; <も>
- - - - - 0x03B522 24:B512: 01        .byte $01    ; <あ>
- - - - - 0x03B523 24:B513: 23        .byte $23    ; <も>
- - - - - 0x03B524 24:B514: 01        .byte $01    ; <あ>
- - - - - 0x03B525 24:B515: 23        .byte $23    ; <も>
- - - - - 0x03B526 24:B516: 01        .byte $01    ; <あ>
- - - - - 0x03B527 24:B517: 23        .byte $23    ; <も>
- - - - - 0x03B528 24:B518: 01        .byte $01    ; <あ>
- - - - - 0x03B529 24:B519: 23        .byte $23    ; <も>
- - - - - 0x03B52A 24:B51A: 01        .byte $01    ; <あ>
- - - - - 0x03B52B 24:B51B: 23        .byte $23    ; <も>
- - - - - 0x03B52C 24:B51C: 01        .byte $01    ; <あ>
- - - - - 0x03B52D 24:B51D: 23        .byte $23    ; <も>
; 
- - - - - 0x03B52E 24:B51E: 12        .byte $12    ; <つ>
- D - I - 0x03B52F 24:B51F: 22        .byte $22    ; <め>
- D - I - 0x03B530 24:B520: 22        .byte $22    ; <め>
- - - - - 0x03B531 24:B521: 43        .byte $43    ; <ウ>
- D - I - 0x03B532 24:B522: 11        .byte $11    ; <ち>
- D - I - 0x03B533 24:B523: 22        .byte $22    ; <め>
- D - I - 0x03B534 24:B524: 33        .byte $33    ; <0>
- D - I - 0x03B535 24:B525: 34        .byte $34    ; <1>
- D - I - 0x03B536 24:B526: 11        .byte $11    ; <ち>
- D - I - 0x03B537 24:B527: 13        .byte $13    ; <て>
- - - - - 0x03B538 24:B528: 22        .byte $22    ; <め>
- D - I - 0x03B539 24:B529: 43        .byte $43    ; <ウ>
- - - - - 0x03B53A 24:B52A: 11        .byte $11    ; <ち>
- - - - - 0x03B53B 24:B52B: 11        .byte $11    ; <ち>
- - - - - 0x03B53C 24:B52C: 32        .byte $32    ; <ょ>
- D - I - 0x03B53D 24:B52D: 23        .byte $23    ; <も>
- D - I - 0x03B53E 24:B52E: 22        .byte $22    ; <め>
- D - I - 0x03B53F 24:B52F: 23        .byte $23    ; <も>
- D - I - 0x03B540 24:B530: 33        .byte $33    ; <0>
- D - I - 0x03B541 24:B531: 43        .byte $43    ; <ウ>
- - - - - 0x03B542 24:B532: 22        .byte $22    ; <め>
- - - - - 0x03B543 24:B533: 22        .byte $22    ; <め>
- - - - - 0x03B544 24:B534: 33        .byte $33    ; <0>
- - - - - 0x03B545 24:B535: 34        .byte $34    ; <1>
- - - - - 0x03B546 24:B536: 01        .byte $01    ; <あ>
- - - - - 0x03B547 24:B537: 23        .byte $23    ; <も>
- - - - - 0x03B548 24:B538: 01        .byte $01    ; <あ>
- - - - - 0x03B549 24:B539: 23        .byte $23    ; <も>
- - - - - 0x03B54A 24:B53A: 01        .byte $01    ; <あ>
- - - - - 0x03B54B 24:B53B: 23        .byte $23    ; <も>
- - - - - 0x03B54C 24:B53C: 01        .byte $01    ; <あ>
- - - - - 0x03B54D 24:B53D: 23        .byte $23    ; <も>
- - - - - 0x03B54E 24:B53E: 01        .byte $01    ; <あ>
- - - - - 0x03B54F 24:B53F: 23        .byte $23    ; <も>
- - - - - 0x03B550 24:B540: 01        .byte $01    ; <あ>
- - - - - 0x03B551 24:B541: 23        .byte $23    ; <も>
- - - - - 0x03B552 24:B542: 01        .byte $01    ; <あ>
- - - - - 0x03B553 24:B543: 23        .byte $23    ; <も>
- - - - - 0x03B554 24:B544: 01        .byte $01    ; <あ>
- - - - - 0x03B555 24:B545: 23        .byte $23    ; <も>
- - - - - 0x03B556 24:B546: 01        .byte $01    ; <あ>
- - - - - 0x03B557 24:B547: 23        .byte $23    ; <も>
- - - - - 0x03B558 24:B548: 01        .byte $01    ; <あ>
- - - - - 0x03B559 24:B549: 23        .byte $23    ; <も>
- - - - - 0x03B55A 24:B54A: 01        .byte $01    ; <あ>
- - - - - 0x03B55B 24:B54B: 23        .byte $23    ; <も>
- - - - - 0x03B55C 24:B54C: 01        .byte $01    ; <あ>
- - - - - 0x03B55D 24:B54D: 23        .byte $23    ; <も>
; 
- - - - - 0x03B55E 24:B54E: 11        .byte $11    ; <ち>
- - - - - 0x03B55F 24:B54F: 22        .byte $22    ; <め>
- - - - - 0x03B560 24:B550: 23        .byte $23    ; <も>
- - - - - 0x03B561 24:B551: 43        .byte $43    ; <ウ>
- D - I - 0x03B562 24:B552: 13        .byte $13    ; <て>
- D - I - 0x03B563 24:B553: 33        .byte $33    ; <0>
- D - I - 0x03B564 24:B554: 33        .byte $33    ; <0>
- D - I - 0x03B565 24:B555: 33        .byte $33    ; <0>
- D - I - 0x03B566 24:B556: 11        .byte $11    ; <ち>
- D - I - 0x03B567 24:B557: 23        .byte $23    ; <も>
- D - I - 0x03B568 24:B558: 33        .byte $33    ; <0>
- - - - - 0x03B569 24:B559: 33        .byte $33    ; <0>
- D - I - 0x03B56A 24:B55A: 11        .byte $11    ; <ち>
- - - - - 0x03B56B 24:B55B: 13        .byte $13    ; <て>
- - - - - 0x03B56C 24:B55C: 33        .byte $33    ; <0>
- - - - - 0x03B56D 24:B55D: 33        .byte $33    ; <0>
- D - I - 0x03B56E 24:B55E: 33        .byte $33    ; <0>
- D - I - 0x03B56F 24:B55F: 33        .byte $33    ; <0>
- D - I - 0x03B570 24:B560: 33        .byte $33    ; <0>
- D - I - 0x03B571 24:B561: 33        .byte $33    ; <0>
- - - - - 0x03B572 24:B562: 33        .byte $33    ; <0>
- - - - - 0x03B573 24:B563: 33        .byte $33    ; <0>
- - - - - 0x03B574 24:B564: 33        .byte $33    ; <0>
- - - - - 0x03B575 24:B565: 33        .byte $33    ; <0>
- - - - - 0x03B576 24:B566: 01        .byte $01    ; <あ>
- - - - - 0x03B577 24:B567: 23        .byte $23    ; <も>
- - - - - 0x03B578 24:B568: 01        .byte $01    ; <あ>
- - - - - 0x03B579 24:B569: 23        .byte $23    ; <も>
- - - - - 0x03B57A 24:B56A: 01        .byte $01    ; <あ>
- - - - - 0x03B57B 24:B56B: 23        .byte $23    ; <も>
- - - - - 0x03B57C 24:B56C: 01        .byte $01    ; <あ>
- - - - - 0x03B57D 24:B56D: 23        .byte $23    ; <も>
- - - - - 0x03B57E 24:B56E: 01        .byte $01    ; <あ>
- - - - - 0x03B57F 24:B56F: 23        .byte $23    ; <も>
- - - - - 0x03B580 24:B570: 01        .byte $01    ; <あ>
- - - - - 0x03B581 24:B571: 23        .byte $23    ; <も>
- - - - - 0x03B582 24:B572: 01        .byte $01    ; <あ>
- - - - - 0x03B583 24:B573: 23        .byte $23    ; <も>
- - - - - 0x03B584 24:B574: 01        .byte $01    ; <あ>
- - - - - 0x03B585 24:B575: 23        .byte $23    ; <も>
- - - - - 0x03B586 24:B576: 01        .byte $01    ; <あ>
- - - - - 0x03B587 24:B577: 23        .byte $23    ; <も>
- - - - - 0x03B588 24:B578: 01        .byte $01    ; <あ>
- - - - - 0x03B589 24:B579: 23        .byte $23    ; <も>
- - - - - 0x03B58A 24:B57A: 01        .byte $01    ; <あ>
- - - - - 0x03B58B 24:B57B: 23        .byte $23    ; <も>
- - - - - 0x03B58C 24:B57C: 01        .byte $01    ; <あ>
- - - - - 0x03B58D 24:B57D: 23        .byte $23    ; <も>
; 
- - - - - 0x03B58E 24:B57E: 22        .byte $22    ; <め>
- - - - - 0x03B58F 24:B57F: 22        .byte $22    ; <め>
- D - I - 0x03B590 24:B580: 22        .byte $22    ; <め>
- D - I - 0x03B591 24:B581: 43        .byte $43    ; <ウ>
- - - - - 0x03B592 24:B582: 22        .byte $22    ; <め>
- D - I - 0x03B593 24:B583: 22        .byte $22    ; <め>
- D - I - 0x03B594 24:B584: 13        .byte $13    ; <て>
- D - I - 0x03B595 24:B585: 34        .byte $34    ; <1>
- D - I - 0x03B596 24:B586: 11        .byte $11    ; <ち>
- D - I - 0x03B597 24:B587: 22        .byte $22    ; <め>
- D - I - 0x03B598 24:B588: 22        .byte $22    ; <め>
- D - I - 0x03B599 24:B589: 43        .byte $43    ; <ウ>
- - - - - 0x03B59A 24:B58A: 11        .byte $11    ; <ち>
- - - - - 0x03B59B 24:B58B: 13        .byte $13    ; <て>
- - - - - 0x03B59C 24:B58C: 22        .byte $22    ; <め>
- - - - - 0x03B59D 24:B58D: 23        .byte $23    ; <も>
- D - I - 0x03B59E 24:B58E: 22        .byte $22    ; <め>
- D - I - 0x03B59F 24:B58F: 22        .byte $22    ; <め>
- D - I - 0x03B5A0 24:B590: 24        .byte $24    ; <や>
- D - I - 0x03B5A1 24:B591: 44        .byte $44    ; <エ>
- D - I - 0x03B5A2 24:B592: 22        .byte $22    ; <め>
- D - I - 0x03B5A3 24:B593: 22        .byte $22    ; <め>
- D - I - 0x03B5A4 24:B594: 22        .byte $22    ; <め>
- D - I - 0x03B5A5 24:B595: 44        .byte $44    ; <エ>
- - - - - 0x03B5A6 24:B596: 01        .byte $01    ; <あ>
- - - - - 0x03B5A7 24:B597: 23        .byte $23    ; <も>
- - - - - 0x03B5A8 24:B598: 01        .byte $01    ; <あ>
- - - - - 0x03B5A9 24:B599: 23        .byte $23    ; <も>
- - - - - 0x03B5AA 24:B59A: 01        .byte $01    ; <あ>
- - - - - 0x03B5AB 24:B59B: 23        .byte $23    ; <も>
- - - - - 0x03B5AC 24:B59C: 01        .byte $01    ; <あ>
- - - - - 0x03B5AD 24:B59D: 23        .byte $23    ; <も>
- - - - - 0x03B5AE 24:B59E: 01        .byte $01    ; <あ>
- - - - - 0x03B5AF 24:B59F: 23        .byte $23    ; <も>
- - - - - 0x03B5B0 24:B5A0: 01        .byte $01    ; <あ>
- - - - - 0x03B5B1 24:B5A1: 23        .byte $23    ; <も>
- - - - - 0x03B5B2 24:B5A2: 01        .byte $01    ; <あ>
- - - - - 0x03B5B3 24:B5A3: 23        .byte $23    ; <も>
- - - - - 0x03B5B4 24:B5A4: 01        .byte $01    ; <あ>
- - - - - 0x03B5B5 24:B5A5: 23        .byte $23    ; <も>
- - - - - 0x03B5B6 24:B5A6: 01        .byte $01    ; <あ>
- - - - - 0x03B5B7 24:B5A7: 23        .byte $23    ; <も>
- - - - - 0x03B5B8 24:B5A8: 01        .byte $01    ; <あ>
- - - - - 0x03B5B9 24:B5A9: 23        .byte $23    ; <も>
- - - - - 0x03B5BA 24:B5AA: 01        .byte $01    ; <あ>
- - - - - 0x03B5BB 24:B5AB: 23        .byte $23    ; <も>
- - - - - 0x03B5BC 24:B5AC: 01        .byte $01    ; <あ>
- - - - - 0x03B5BD 24:B5AD: 23        .byte $23    ; <も>
; 
- - - - - 0x03B5BE 24:B5AE: 12        .byte $12    ; <つ>
- - - - - 0x03B5BF 24:B5AF: 22        .byte $22    ; <め>
- - - - - 0x03B5C0 24:B5B0: 23        .byte $23    ; <も>
- - - - - 0x03B5C1 24:B5B1: 43        .byte $43    ; <ウ>
- D - I - 0x03B5C2 24:B5B2: 12        .byte $12    ; <つ>
- D - I - 0x03B5C3 24:B5B3: 33        .byte $33    ; <0>
- - - - - 0x03B5C4 24:B5B4: 33        .byte $33    ; <0>
- D - I - 0x03B5C5 24:B5B5: 84        .byte $84    ; <D>
- - - - - 0x03B5C6 24:B5B6: 11        .byte $11    ; <ち>
- - - - - 0x03B5C7 24:B5B7: 33        .byte $33    ; <0>
- - - - - 0x03B5C8 24:B5B8: 32        .byte $32    ; <ょ>
- - - - - 0x03B5C9 24:B5B9: 33        .byte $33    ; <0>
- - - - - 0x03B5CA 24:B5BA: 11        .byte $11    ; <ち>
- - - - - 0x03B5CB 24:B5BB: 13        .byte $13    ; <て>
- - - - - 0x03B5CC 24:B5BC: 33        .byte $33    ; <0>
- - - - - 0x03B5CD 24:B5BD: 33        .byte $33    ; <0>
- D - I - 0x03B5CE 24:B5BE: 23        .byte $23    ; <も>
- D - I - 0x03B5CF 24:B5BF: 33        .byte $33    ; <0>
- D - I - 0x03B5D0 24:B5C0: 82        .byte $82    ; <B>
- D - I - 0x03B5D1 24:B5C1: 84        .byte $84    ; <D>
- - - - - 0x03B5D2 24:B5C2: 22        .byte $22    ; <め>
- - - - - 0x03B5D3 24:B5C3: 33        .byte $33    ; <0>
- - - - - 0x03B5D4 24:B5C4: 88        .byte $88    ; <H>
- - - - - 0x03B5D5 24:B5C5: 84        .byte $84    ; <D>
- - - - - 0x03B5D6 24:B5C6: 01        .byte $01    ; <あ>
- - - - - 0x03B5D7 24:B5C7: 23        .byte $23    ; <も>
- - - - - 0x03B5D8 24:B5C8: 01        .byte $01    ; <あ>
- - - - - 0x03B5D9 24:B5C9: 23        .byte $23    ; <も>
- - - - - 0x03B5DA 24:B5CA: 01        .byte $01    ; <あ>
- - - - - 0x03B5DB 24:B5CB: 23        .byte $23    ; <も>
- - - - - 0x03B5DC 24:B5CC: 01        .byte $01    ; <あ>
- - - - - 0x03B5DD 24:B5CD: 23        .byte $23    ; <も>
- - - - - 0x03B5DE 24:B5CE: 01        .byte $01    ; <あ>
- - - - - 0x03B5DF 24:B5CF: 23        .byte $23    ; <も>
- - - - - 0x03B5E0 24:B5D0: 01        .byte $01    ; <あ>
- - - - - 0x03B5E1 24:B5D1: 23        .byte $23    ; <も>
- - - - - 0x03B5E2 24:B5D2: 01        .byte $01    ; <あ>
- - - - - 0x03B5E3 24:B5D3: 23        .byte $23    ; <も>
- - - - - 0x03B5E4 24:B5D4: 01        .byte $01    ; <あ>
- - - - - 0x03B5E5 24:B5D5: 23        .byte $23    ; <も>
- - - - - 0x03B5E6 24:B5D6: 01        .byte $01    ; <あ>
- - - - - 0x03B5E7 24:B5D7: 23        .byte $23    ; <も>
- - - - - 0x03B5E8 24:B5D8: 01        .byte $01    ; <あ>
- - - - - 0x03B5E9 24:B5D9: 23        .byte $23    ; <も>
- - - - - 0x03B5EA 24:B5DA: 01        .byte $01    ; <あ>
- - - - - 0x03B5EB 24:B5DB: 23        .byte $23    ; <も>
- - - - - 0x03B5EC 24:B5DC: 01        .byte $01    ; <あ>
- - - - - 0x03B5ED 24:B5DD: 23        .byte $23    ; <も>
; 
- - - - - 0x03B5EE 24:B5DE: 22        .byte $22    ; <め>
- - - - - 0x03B5EF 24:B5DF: 22        .byte $22    ; <め>
- - - - - 0x03B5F0 24:B5E0: 22        .byte $22    ; <め>
- - - - - 0x03B5F1 24:B5E1: 43        .byte $43    ; <ウ>
- - - - - 0x03B5F2 24:B5E2: 22        .byte $22    ; <め>
- - - - - 0x03B5F3 24:B5E3: 24        .byte $24    ; <や>
- - - - - 0x03B5F4 24:B5E4: 13        .byte $13    ; <て>
- D - I - 0x03B5F5 24:B5E5: 32        .byte $32    ; <ょ>
- - - - - 0x03B5F6 24:B5E6: 11        .byte $11    ; <ち>
- - - - - 0x03B5F7 24:B5E7: 22        .byte $22    ; <め>
- D - I - 0x03B5F8 24:B5E8: 22        .byte $22    ; <め>
- D - I - 0x03B5F9 24:B5E9: 33        .byte $33    ; <0>
- - - - - 0x03B5FA 24:B5EA: 11        .byte $11    ; <ち>
- - - - - 0x03B5FB 24:B5EB: 13        .byte $13    ; <て>
- - - - - 0x03B5FC 24:B5EC: 22        .byte $22    ; <め>
- - - - - 0x03B5FD 24:B5ED: 23        .byte $23    ; <も>
- D - I - 0x03B5FE 24:B5EE: 22        .byte $22    ; <め>
- D - I - 0x03B5FF 24:B5EF: 22        .byte $22    ; <め>
- D - I - 0x03B600 24:B5F0: 23        .byte $23    ; <も>
- D - I - 0x03B601 24:B5F1: 23        .byte $23    ; <も>
- - - - - 0x03B602 24:B5F2: 22        .byte $22    ; <め>
- - - - - 0x03B603 24:B5F3: 22        .byte $22    ; <め>
- - - - - 0x03B604 24:B5F4: 24        .byte $24    ; <や>
- - - - - 0x03B605 24:B5F5: 32        .byte $32    ; <ょ>
- - - - - 0x03B606 24:B5F6: 01        .byte $01    ; <あ>
- - - - - 0x03B607 24:B5F7: 23        .byte $23    ; <も>
- - - - - 0x03B608 24:B5F8: 01        .byte $01    ; <あ>
- - - - - 0x03B609 24:B5F9: 23        .byte $23    ; <も>
- - - - - 0x03B60A 24:B5FA: 01        .byte $01    ; <あ>
- - - - - 0x03B60B 24:B5FB: 23        .byte $23    ; <も>
- - - - - 0x03B60C 24:B5FC: 01        .byte $01    ; <あ>
- - - - - 0x03B60D 24:B5FD: 23        .byte $23    ; <も>
- - - - - 0x03B60E 24:B5FE: 01        .byte $01    ; <あ>
- - - - - 0x03B60F 24:B5FF: 23        .byte $23    ; <も>
- - - - - 0x03B610 24:B600: 01        .byte $01    ; <あ>
- - - - - 0x03B611 24:B601: 23        .byte $23    ; <も>
- - - - - 0x03B612 24:B602: 01        .byte $01    ; <あ>
- - - - - 0x03B613 24:B603: 23        .byte $23    ; <も>
- - - - - 0x03B614 24:B604: 01        .byte $01    ; <あ>
- - - - - 0x03B615 24:B605: 23        .byte $23    ; <も>
- - - - - 0x03B616 24:B606: 01        .byte $01    ; <あ>
- - - - - 0x03B617 24:B607: 23        .byte $23    ; <も>
- - - - - 0x03B618 24:B608: 01        .byte $01    ; <あ>
- - - - - 0x03B619 24:B609: 23        .byte $23    ; <も>
- - - - - 0x03B61A 24:B60A: 01        .byte $01    ; <あ>
- - - - - 0x03B61B 24:B60B: 23        .byte $23    ; <も>
- - - - - 0x03B61C 24:B60C: 01        .byte $01    ; <あ>
- - - - - 0x03B61D 24:B60D: 23        .byte $23    ; <も>
; 
- - - - - 0x03B61E 24:B60E: 12        .byte $12    ; <つ>
- - - - - 0x03B61F 24:B60F: 11        .byte $11    ; <ち>
- - - - - 0x03B620 24:B610: 32        .byte $32    ; <ょ>
- - - - - 0x03B621 24:B611: 33        .byte $33    ; <0>
- - - - - 0x03B622 24:B612: 11        .byte $11    ; <ち>
- - - - - 0x03B623 24:B613: 23        .byte $23    ; <も>
- - - - - 0x03B624 24:B614: 33        .byte $33    ; <0>
- - - - - 0x03B625 24:B615: 33        .byte $33    ; <0>
- - - - - 0x03B626 24:B616: 11        .byte $11    ; <ち>
- - - - - 0x03B627 24:B617: 13        .byte $13    ; <て>
- - - - - 0x03B628 24:B618: 32        .byte $32    ; <ょ>
- - - - - 0x03B629 24:B619: 33        .byte $33    ; <0>
- - - - - 0x03B62A 24:B61A: 11        .byte $11    ; <ち>
- - - - - 0x03B62B 24:B61B: 11        .byte $11    ; <ち>
- - - - - 0x03B62C 24:B61C: 33        .byte $33    ; <0>
- - - - - 0x03B62D 24:B61D: 33        .byte $33    ; <0>
- - - - - 0x03B62E 24:B61E: 33        .byte $33    ; <0>
- - - - - 0x03B62F 24:B61F: 33        .byte $33    ; <0>
- - - - - 0x03B630 24:B620: 32        .byte $32    ; <ょ>
- - - - - 0x03B631 24:B621: 23        .byte $23    ; <も>
- - - - - 0x03B632 24:B622: 33        .byte $33    ; <0>
- - - - - 0x03B633 24:B623: 33        .byte $33    ; <0>
- - - - - 0x03B634 24:B624: 22        .byte $22    ; <め>
- - - - - 0x03B635 24:B625: 24        .byte $24    ; <や>
- - - - - 0x03B636 24:B626: 01        .byte $01    ; <あ>
- - - - - 0x03B637 24:B627: 23        .byte $23    ; <も>
- - - - - 0x03B638 24:B628: 01        .byte $01    ; <あ>
- - - - - 0x03B639 24:B629: 23        .byte $23    ; <も>
- - - - - 0x03B63A 24:B62A: 01        .byte $01    ; <あ>
- - - - - 0x03B63B 24:B62B: 23        .byte $23    ; <も>
- - - - - 0x03B63C 24:B62C: 01        .byte $01    ; <あ>
- - - - - 0x03B63D 24:B62D: 23        .byte $23    ; <も>
- - - - - 0x03B63E 24:B62E: 01        .byte $01    ; <あ>
- - - - - 0x03B63F 24:B62F: 23        .byte $23    ; <も>
- - - - - 0x03B640 24:B630: 01        .byte $01    ; <あ>
- - - - - 0x03B641 24:B631: 23        .byte $23    ; <も>
- - - - - 0x03B642 24:B632: 01        .byte $01    ; <あ>
- - - - - 0x03B643 24:B633: 23        .byte $23    ; <も>
- - - - - 0x03B644 24:B634: 01        .byte $01    ; <あ>
- - - - - 0x03B645 24:B635: 23        .byte $23    ; <も>
- - - - - 0x03B646 24:B636: 01        .byte $01    ; <あ>
- - - - - 0x03B647 24:B637: 23        .byte $23    ; <も>
- - - - - 0x03B648 24:B638: 01        .byte $01    ; <あ>
- - - - - 0x03B649 24:B639: 23        .byte $23    ; <も>
- - - - - 0x03B64A 24:B63A: 01        .byte $01    ; <あ>
- - - - - 0x03B64B 24:B63B: 23        .byte $23    ; <も>
- - - - - 0x03B64C 24:B63C: 01        .byte $01    ; <あ>
- - - - - 0x03B64D 24:B63D: 23        .byte $23    ; <も>
; 
- - - - - 0x03B64E 24:B63E: 12        .byte $12    ; <つ>
- - - - - 0x03B64F 24:B63F: 11        .byte $11    ; <ち>
- - - - - 0x03B650 24:B640: 32        .byte $32    ; <ょ>
- - - - - 0x03B651 24:B641: 33        .byte $33    ; <0>
- D - I - 0x03B652 24:B642: 11        .byte $11    ; <ち>
- D - I - 0x03B653 24:B643: 23        .byte $23    ; <も>
- D - I - 0x03B654 24:B644: 33        .byte $33    ; <0>
- D - I - 0x03B655 24:B645: 33        .byte $33    ; <0>
- - - - - 0x03B656 24:B646: 11        .byte $11    ; <ち>
- - - - - 0x03B657 24:B647: 13        .byte $13    ; <て>
- - - - - 0x03B658 24:B648: 33        .byte $33    ; <0>
- - - - - 0x03B659 24:B649: 33        .byte $33    ; <0>
- - - - - 0x03B65A 24:B64A: 11        .byte $11    ; <ち>
- - - - - 0x03B65B 24:B64B: 11        .byte $11    ; <ち>
- - - - - 0x03B65C 24:B64C: 33        .byte $33    ; <0>
- - - - - 0x03B65D 24:B64D: 33        .byte $33    ; <0>
- D - I - 0x03B65E 24:B64E: 31        .byte $31    ; <ゅ>
- D - I - 0x03B65F 24:B64F: 33        .byte $33    ; <0>
- D - I - 0x03B660 24:B650: 33        .byte $33    ; <0>
- D - I - 0x03B661 24:B651: 23        .byte $23    ; <も>
- - - - - 0x03B662 24:B652: 33        .byte $33    ; <0>
- - - - - 0x03B663 24:B653: 33        .byte $33    ; <0>
- - - - - 0x03B664 24:B654: 22        .byte $22    ; <め>
- - - - - 0x03B665 24:B655: 24        .byte $24    ; <や>
- - - - - 0x03B666 24:B656: 01        .byte $01    ; <あ>
- - - - - 0x03B667 24:B657: 23        .byte $23    ; <も>
- - - - - 0x03B668 24:B658: 01        .byte $01    ; <あ>
- - - - - 0x03B669 24:B659: 23        .byte $23    ; <も>
- - - - - 0x03B66A 24:B65A: 01        .byte $01    ; <あ>
- - - - - 0x03B66B 24:B65B: 23        .byte $23    ; <も>
- - - - - 0x03B66C 24:B65C: 01        .byte $01    ; <あ>
- - - - - 0x03B66D 24:B65D: 23        .byte $23    ; <も>
- - - - - 0x03B66E 24:B65E: 01        .byte $01    ; <あ>
- - - - - 0x03B66F 24:B65F: 23        .byte $23    ; <も>
- - - - - 0x03B670 24:B660: 01        .byte $01    ; <あ>
- - - - - 0x03B671 24:B661: 23        .byte $23    ; <も>
- - - - - 0x03B672 24:B662: 01        .byte $01    ; <あ>
- - - - - 0x03B673 24:B663: 23        .byte $23    ; <も>
- - - - - 0x03B674 24:B664: 01        .byte $01    ; <あ>
- - - - - 0x03B675 24:B665: 23        .byte $23    ; <も>
- - - - - 0x03B676 24:B666: 01        .byte $01    ; <あ>
- - - - - 0x03B677 24:B667: 23        .byte $23    ; <も>
- - - - - 0x03B678 24:B668: 01        .byte $01    ; <あ>
- - - - - 0x03B679 24:B669: 23        .byte $23    ; <も>
- - - - - 0x03B67A 24:B66A: 01        .byte $01    ; <あ>
- - - - - 0x03B67B 24:B66B: 23        .byte $23    ; <も>
- - - - - 0x03B67C 24:B66C: 01        .byte $01    ; <あ>
- - - - - 0x03B67D 24:B66D: 23        .byte $23    ; <も>
; 
- - - - - 0x03B67E 24:B66E: 12        .byte $12    ; <つ>
- - - - - 0x03B67F 24:B66F: 11        .byte $11    ; <ち>
- - - - - 0x03B680 24:B670: 32        .byte $32    ; <ょ>
- - - - - 0x03B681 24:B671: 33        .byte $33    ; <0>
- D - I - 0x03B682 24:B672: 13        .byte $13    ; <て>
- D - I - 0x03B683 24:B673: 23        .byte $23    ; <も>
- - - - - 0x03B684 24:B674: 33        .byte $33    ; <0>
- D - I - 0x03B685 24:B675: 33        .byte $33    ; <0>
- D - I - 0x03B686 24:B676: 11        .byte $11    ; <ち>
- D - I - 0x03B687 24:B677: 13        .byte $13    ; <て>
- D - I - 0x03B688 24:B678: 33        .byte $33    ; <0>
- D - I - 0x03B689 24:B679: 33        .byte $33    ; <0>
- - - - - 0x03B68A 24:B67A: 11        .byte $11    ; <ち>
- - - - - 0x03B68B 24:B67B: 11        .byte $11    ; <ち>
- D - I - 0x03B68C 24:B67C: 33        .byte $33    ; <0>
- D - I - 0x03B68D 24:B67D: 33        .byte $33    ; <0>
- D - I - 0x03B68E 24:B67E: 33        .byte $33    ; <0>
- D - I - 0x03B68F 24:B67F: 33        .byte $33    ; <0>
- D - I - 0x03B690 24:B680: 33        .byte $33    ; <0>
- D - I - 0x03B691 24:B681: 33        .byte $33    ; <0>
- - - - - 0x03B692 24:B682: 33        .byte $33    ; <0>
- - - - - 0x03B693 24:B683: 33        .byte $33    ; <0>
- - - - - 0x03B694 24:B684: 32        .byte $32    ; <ょ>
- - - - - 0x03B695 24:B685: 24        .byte $24    ; <や>
- - - - - 0x03B696 24:B686: 01        .byte $01    ; <あ>
- - - - - 0x03B697 24:B687: 23        .byte $23    ; <も>
- - - - - 0x03B698 24:B688: 01        .byte $01    ; <あ>
- - - - - 0x03B699 24:B689: 23        .byte $23    ; <も>
- - - - - 0x03B69A 24:B68A: 01        .byte $01    ; <あ>
- - - - - 0x03B69B 24:B68B: 23        .byte $23    ; <も>
- - - - - 0x03B69C 24:B68C: 01        .byte $01    ; <あ>
- - - - - 0x03B69D 24:B68D: 23        .byte $23    ; <も>
- - - - - 0x03B69E 24:B68E: 01        .byte $01    ; <あ>
- - - - - 0x03B69F 24:B68F: 23        .byte $23    ; <も>
- - - - - 0x03B6A0 24:B690: 01        .byte $01    ; <あ>
- - - - - 0x03B6A1 24:B691: 23        .byte $23    ; <も>
- - - - - 0x03B6A2 24:B692: 01        .byte $01    ; <あ>
- - - - - 0x03B6A3 24:B693: 23        .byte $23    ; <も>
- - - - - 0x03B6A4 24:B694: 01        .byte $01    ; <あ>
- - - - - 0x03B6A5 24:B695: 23        .byte $23    ; <も>
- - - - - 0x03B6A6 24:B696: 01        .byte $01    ; <あ>
- - - - - 0x03B6A7 24:B697: 23        .byte $23    ; <も>
- - - - - 0x03B6A8 24:B698: 01        .byte $01    ; <あ>
- - - - - 0x03B6A9 24:B699: 23        .byte $23    ; <も>
- - - - - 0x03B6AA 24:B69A: 01        .byte $01    ; <あ>
- - - - - 0x03B6AB 24:B69B: 23        .byte $23    ; <も>
- - - - - 0x03B6AC 24:B69C: 01        .byte $01    ; <あ>
- - - - - 0x03B6AD 24:B69D: 23        .byte $23    ; <も>
; 
- - - - - 0x03B6AE 24:B69E: 22        .byte $22    ; <め>
- - - - - 0x03B6AF 24:B69F: 22        .byte $22    ; <め>
- - - - - 0x03B6B0 24:B6A0: 22        .byte $22    ; <め>
- - - - - 0x03B6B1 24:B6A1: 43        .byte $43    ; <ウ>
- D - I - 0x03B6B2 24:B6A2: 12        .byte $12    ; <つ>
- D - I - 0x03B6B3 24:B6A3: 23        .byte $23    ; <も>
- D - I - 0x03B6B4 24:B6A4: 33        .byte $33    ; <0>
- D - I - 0x03B6B5 24:B6A5: 43        .byte $43    ; <ウ>
- - - - - 0x03B6B6 24:B6A6: 11        .byte $11    ; <ち>
- D - I - 0x03B6B7 24:B6A7: 23        .byte $23    ; <も>
- - - - - 0x03B6B8 24:B6A8: 33        .byte $33    ; <0>
- - - - - 0x03B6B9 24:B6A9: 33        .byte $33    ; <0>
- - - - - 0x03B6BA 24:B6AA: 11        .byte $11    ; <ち>
- - - - - 0x03B6BB 24:B6AB: 13        .byte $13    ; <て>
- - - - - 0x03B6BC 24:B6AC: 33        .byte $33    ; <0>
- - - - - 0x03B6BD 24:B6AD: 33        .byte $33    ; <0>
- D - I - 0x03B6BE 24:B6AE: 33        .byte $33    ; <0>
- D - I - 0x03B6BF 24:B6AF: 32        .byte $32    ; <ょ>
- - - - - 0x03B6C0 24:B6B0: 33        .byte $33    ; <0>
- D - I - 0x03B6C1 24:B6B1: 23        .byte $23    ; <も>
- - - - - 0x03B6C2 24:B6B2: 33        .byte $33    ; <0>
- - - - - 0x03B6C3 24:B6B3: 33        .byte $33    ; <0>
- - - - - 0x03B6C4 24:B6B4: 32        .byte $32    ; <ょ>
- - - - - 0x03B6C5 24:B6B5: 24        .byte $24    ; <や>
- - - - - 0x03B6C6 24:B6B6: 01        .byte $01    ; <あ>
- - - - - 0x03B6C7 24:B6B7: 23        .byte $23    ; <も>
- - - - - 0x03B6C8 24:B6B8: 01        .byte $01    ; <あ>
- - - - - 0x03B6C9 24:B6B9: 23        .byte $23    ; <も>
- - - - - 0x03B6CA 24:B6BA: 01        .byte $01    ; <あ>
- - - - - 0x03B6CB 24:B6BB: 23        .byte $23    ; <も>
- - - - - 0x03B6CC 24:B6BC: 01        .byte $01    ; <あ>
- - - - - 0x03B6CD 24:B6BD: 23        .byte $23    ; <も>
- - - - - 0x03B6CE 24:B6BE: 01        .byte $01    ; <あ>
- - - - - 0x03B6CF 24:B6BF: 23        .byte $23    ; <も>
- - - - - 0x03B6D0 24:B6C0: 01        .byte $01    ; <あ>
- - - - - 0x03B6D1 24:B6C1: 23        .byte $23    ; <も>
- - - - - 0x03B6D2 24:B6C2: 01        .byte $01    ; <あ>
- - - - - 0x03B6D3 24:B6C3: 23        .byte $23    ; <も>
- - - - - 0x03B6D4 24:B6C4: 01        .byte $01    ; <あ>
- - - - - 0x03B6D5 24:B6C5: 23        .byte $23    ; <も>
- - - - - 0x03B6D6 24:B6C6: 01        .byte $01    ; <あ>
- - - - - 0x03B6D7 24:B6C7: 23        .byte $23    ; <も>
- - - - - 0x03B6D8 24:B6C8: 01        .byte $01    ; <あ>
- - - - - 0x03B6D9 24:B6C9: 23        .byte $23    ; <も>
- - - - - 0x03B6DA 24:B6CA: 01        .byte $01    ; <あ>
- - - - - 0x03B6DB 24:B6CB: 23        .byte $23    ; <も>
- - - - - 0x03B6DC 24:B6CC: 01        .byte $01    ; <あ>
- - - - - 0x03B6DD 24:B6CD: 23        .byte $23    ; <も>
; 
- D - I - 0x03B6DE 24:B6CE: 11        .byte $11    ; <ち>
- D - I - 0x03B6DF 24:B6CF: 11        .byte $11    ; <ち>
- D - I - 0x03B6E0 24:B6D0: 11        .byte $11    ; <ち>
- D - I - 0x03B6E1 24:B6D1: 22        .byte $22    ; <め>
- - - - - 0x03B6E2 24:B6D2: 01        .byte $01    ; <あ>
- - - - - 0x03B6E3 24:B6D3: 23        .byte $23    ; <も>
- - - - - 0x03B6E4 24:B6D4: 45        .byte $45    ; <オ>
- - - - - 0x03B6E5 24:B6D5: 67        .byte $67    ; <ラ>
- - - - - 0x03B6E6 24:B6D6: 01        .byte $01    ; <あ>
- - - - - 0x03B6E7 24:B6D7: 23        .byte $23    ; <も>
- - - - - 0x03B6E8 24:B6D8: 45        .byte $45    ; <オ>
- - - - - 0x03B6E9 24:B6D9: 67        .byte $67    ; <ラ>
- - - - - 0x03B6EA 24:B6DA: 01        .byte $01    ; <あ>
- - - - - 0x03B6EB 24:B6DB: 23        .byte $23    ; <も>
- - - - - 0x03B6EC 24:B6DC: 45        .byte $45    ; <オ>
- - - - - 0x03B6ED 24:B6DD: 67        .byte $67    ; <ラ>
- - - - - 0x03B6EE 24:B6DE: 01        .byte $01    ; <あ>
- - - - - 0x03B6EF 24:B6DF: 23        .byte $23    ; <も>
- - - - - 0x03B6F0 24:B6E0: 45        .byte $45    ; <オ>
- - - - - 0x03B6F1 24:B6E1: 67        .byte $67    ; <ラ>
- - - - - 0x03B6F2 24:B6E2: 01        .byte $01    ; <あ>
- - - - - 0x03B6F3 24:B6E3: 23        .byte $23    ; <も>
- - - - - 0x03B6F4 24:B6E4: 45        .byte $45    ; <オ>
- - - - - 0x03B6F5 24:B6E5: 67        .byte $67    ; <ラ>
- - - - - 0x03B6F6 24:B6E6: 01        .byte $01    ; <あ>
- - - - - 0x03B6F7 24:B6E7: 23        .byte $23    ; <も>
- - - - - 0x03B6F8 24:B6E8: 01        .byte $01    ; <あ>
- - - - - 0x03B6F9 24:B6E9: 23        .byte $23    ; <も>
- - - - - 0x03B6FA 24:B6EA: 01        .byte $01    ; <あ>
- - - - - 0x03B6FB 24:B6EB: 23        .byte $23    ; <も>
- - - - - 0x03B6FC 24:B6EC: 01        .byte $01    ; <あ>
- - - - - 0x03B6FD 24:B6ED: 23        .byte $23    ; <も>
- - - - - 0x03B6FE 24:B6EE: 01        .byte $01    ; <あ>
- - - - - 0x03B6FF 24:B6EF: 23        .byte $23    ; <も>
- - - - - 0x03B700 24:B6F0: 01        .byte $01    ; <あ>
- - - - - 0x03B701 24:B6F1: 23        .byte $23    ; <も>
- - - - - 0x03B702 24:B6F2: 01        .byte $01    ; <あ>
- - - - - 0x03B703 24:B6F3: 23        .byte $23    ; <も>
- - - - - 0x03B704 24:B6F4: 01        .byte $01    ; <あ>
- - - - - 0x03B705 24:B6F5: 23        .byte $23    ; <も>
- - - - - 0x03B706 24:B6F6: 01        .byte $01    ; <あ>
- - - - - 0x03B707 24:B6F7: 23        .byte $23    ; <も>
- - - - - 0x03B708 24:B6F8: 01        .byte $01    ; <あ>
- - - - - 0x03B709 24:B6F9: 23        .byte $23    ; <も>
- - - - - 0x03B70A 24:B6FA: 01        .byte $01    ; <あ>
- - - - - 0x03B70B 24:B6FB: 23        .byte $23    ; <も>
- - - - - 0x03B70C 24:B6FC: 01        .byte $01    ; <あ>
- - - - - 0x03B70D 24:B6FD: 23        .byte $23    ; <も>
- D - I - 0x03B70E 24:B6FE: 22        .byte $22    ; <め>
- D - I - 0x03B70F 24:B6FF: 21        .byte $21    ; <む>
- D - I - 0x03B710 24:B700: 22        .byte $22    ; <め>
- D - I - 0x03B711 24:B701: 22        .byte $22    ; <め>
- - - - - 0x03B712 24:B702: 01        .byte $01    ; <あ>
- - - - - 0x03B713 24:B703: 23        .byte $23    ; <も>
- - - - - 0x03B714 24:B704: 45        .byte $45    ; <オ>
- - - - - 0x03B715 24:B705: 67        .byte $67    ; <ラ>
- - - - - 0x03B716 24:B706: 01        .byte $01    ; <あ>
- - - - - 0x03B717 24:B707: 23        .byte $23    ; <も>
- - - - - 0x03B718 24:B708: 45        .byte $45    ; <オ>
- - - - - 0x03B719 24:B709: 67        .byte $67    ; <ラ>
- - - - - 0x03B71A 24:B70A: 01        .byte $01    ; <あ>
- - - - - 0x03B71B 24:B70B: 23        .byte $23    ; <も>
- - - - - 0x03B71C 24:B70C: 45        .byte $45    ; <オ>
- - - - - 0x03B71D 24:B70D: 67        .byte $67    ; <ラ>
- - - - - 0x03B71E 24:B70E: 01        .byte $01    ; <あ>
- - - - - 0x03B71F 24:B70F: 23        .byte $23    ; <も>
- - - - - 0x03B720 24:B710: 45        .byte $45    ; <オ>
- - - - - 0x03B721 24:B711: 67        .byte $67    ; <ラ>
- - - - - 0x03B722 24:B712: 01        .byte $01    ; <あ>
- - - - - 0x03B723 24:B713: 23        .byte $23    ; <も>
- - - - - 0x03B724 24:B714: 45        .byte $45    ; <オ>
- - - - - 0x03B725 24:B715: 67        .byte $67    ; <ラ>
- - - - - 0x03B726 24:B716: 01        .byte $01    ; <あ>
- - - - - 0x03B727 24:B717: 23        .byte $23    ; <も>
- - - - - 0x03B728 24:B718: 01        .byte $01    ; <あ>
- - - - - 0x03B729 24:B719: 23        .byte $23    ; <も>
- - - - - 0x03B72A 24:B71A: 01        .byte $01    ; <あ>
- - - - - 0x03B72B 24:B71B: 23        .byte $23    ; <も>
- - - - - 0x03B72C 24:B71C: 01        .byte $01    ; <あ>
- - - - - 0x03B72D 24:B71D: 23        .byte $23    ; <も>
- - - - - 0x03B72E 24:B71E: 01        .byte $01    ; <あ>
- - - - - 0x03B72F 24:B71F: 23        .byte $23    ; <も>
- - - - - 0x03B730 24:B720: 01        .byte $01    ; <あ>
- - - - - 0x03B731 24:B721: 23        .byte $23    ; <も>
- - - - - 0x03B732 24:B722: 01        .byte $01    ; <あ>
- - - - - 0x03B733 24:B723: 23        .byte $23    ; <も>
- - - - - 0x03B734 24:B724: 01        .byte $01    ; <あ>
- - - - - 0x03B735 24:B725: 23        .byte $23    ; <も>
- - - - - 0x03B736 24:B726: 01        .byte $01    ; <あ>
- - - - - 0x03B737 24:B727: 23        .byte $23    ; <も>
- - - - - 0x03B738 24:B728: 01        .byte $01    ; <あ>
- - - - - 0x03B739 24:B729: 23        .byte $23    ; <も>
- - - - - 0x03B73A 24:B72A: 01        .byte $01    ; <あ>
- - - - - 0x03B73B 24:B72B: 23        .byte $23    ; <も>
- - - - - 0x03B73C 24:B72C: 01        .byte $01    ; <あ>
- - - - - 0x03B73D 24:B72D: 23        .byte $23    ; <も>



tbl_B72E:
- D - I - 0x03B73E 24:B72E: 28        .byte $28    ; <り>
- D - I - 0x03B73F 24:B72F: 29        .byte $29    ; <る>
- D - I - 0x03B740 24:B730: 2C        .byte $2C    ; <わ>
- D - I - 0x03B741 24:B731: 18        .byte $18    ; <ね>
- D - I - 0x03B742 24:B732: 1C        .byte $1C    ; <ふ>
- D - I - 0x03B743 24:B733: 22        .byte $22    ; <め>
- D - I - 0x03B744 24:B734: 27        .byte $27    ; <ら>
- D - I - 0x03B745 24:B735: 3C        .byte $3C    ; <9>
- D - I - 0x03B746 24:B736: 24        .byte $24    ; <や>
- D - I - 0x03B747 24:B737: 25        .byte $25    ; <ゆ>
- D - I - 0x03B748 24:B738: 26        .byte $26    ; <よ>
- D - I - 0x03B749 24:B739: 2C        .byte $2C    ; <わ>
- D - I - 0x03B74A 24:B73A: 1C        .byte $1C    ; <ふ>
- D - I - 0x03B74B 24:B73B: 29        .byte $29    ; <る>
- D - I - 0x03B74C 24:B73C: 1B        .byte $1B    ; <ひ>
- D - I - 0x03B74D 24:B73D: 22        .byte $22    ; <め>
- D - I - 0x03B74E 24:B73E: 28        .byte $28    ; <り>
- D - I - 0x03B74F 24:B73F: 29        .byte $29    ; <る>
- D - I - 0x03B750 24:B740: 28        .byte $28    ; <り>
- D - I - 0x03B751 24:B741: 1E        .byte $1E    ; <ほ>
- D - I - 0x03B752 24:B742: 24        .byte $24    ; <や>
- - - - - 0x03B753 24:B743: 25        .byte $25    ; <ゆ>
- - - - - 0x03B754 24:B744: 26        .byte $26    ; <よ>
- - - - - 0x03B755 24:B745: 2F        .byte $2F    ; <っ>
- D - I - 0x03B756 24:B746: 2C        .byte $2C    ; <わ>
- D - I - 0x03B757 24:B747: 2D        .byte $2D    ; <を>
- D - I - 0x03B758 24:B748: 2C        .byte $2C    ; <わ>
- D - I - 0x03B759 24:B749: 18        .byte $18    ; <ね>
- D - I - 0x03B75A 24:B74A: 24        .byte $24    ; <や>
- D - I - 0x03B75B 24:B74B: 25        .byte $25    ; <ゆ>
- D - I - 0x03B75C 24:B74C: 26        .byte $26    ; <よ>
- - - - - 0x03B75D 24:B74D: 28        .byte $28    ; <り>
- - - - - 0x03B75E 24:B74E: 10        .byte $10    ; <た>
- D - I - 0x03B75F 24:B74F: 11        .byte $11    ; <ち>
- D - I - 0x03B760 24:B750: 3C        .byte $3C    ; <9>
- D - I - 0x03B761 24:B751: 12        .byte $12    ; <つ>
- D - I - 0x03B762 24:B752: 24        .byte $24    ; <や>
- D - I - 0x03B763 24:B753: 25        .byte $25    ; <ゆ>
- D - I - 0x03B764 24:B754: 24        .byte $24    ; <や>
- - - - - 0x03B765 24:B755: 1B        .byte $1B    ; <ひ>
- - - - - 0x03B766 24:B756: 24        .byte $24    ; <や>
- - - - - 0x03B767 24:B757: 25        .byte $25    ; <ゆ>
- - - - - 0x03B768 24:B758: 26        .byte $26    ; <よ>
- - - - - 0x03B769 24:B759: 12        .byte $12    ; <つ>
- - - - - 0x03B76A 24:B75A: 10        .byte $10    ; <た>
- - - - - 0x03B76B 24:B75B: 11        .byte $11    ; <ち>
- - - - - 0x03B76C 24:B75C: 2B        .byte $2B    ; <ろ>
- D - I - 0x03B76D 24:B75D: 21        .byte $21    ; <む>
- D - I - 0x03B76E 24:B75E: 3D        .byte $3D    ; <+>
- - - - - 0x03B76F 24:B75F: 18        .byte $18    ; <ね>
- D - I - 0x03B770 24:B760: 19        .byte $19    ; <の>
- D - I - 0x03B771 24:B761: 1A        .byte $1A    ; <は>
- - - - - 0x03B772 24:B762: 29        .byte $29    ; <る>
- - - - - 0x03B773 24:B763: 08        .byte $08    ; <く>
- - - - - 0x03B774 24:B764: 09        .byte $09    ; <け>
- - - - - 0x03B775 24:B765: 08        .byte $08    ; <く>
- D - I - 0x03B776 24:B766: 18        .byte $18    ; <ね>
- D - I - 0x03B777 24:B767: 28        .byte $28    ; <り>
- D - I - 0x03B778 24:B768: 29        .byte $29    ; <る>
- D - I - 0x03B779 24:B769: 2A        .byte $2A    ; <れ>
- - - - - 0x03B77A 24:B76A: 19        .byte $19    ; <の>
- D - I - 0x03B77B 24:B76B: 1A        .byte $1A    ; <は>
- - - - - 0x03B77C 24:B76C: 08        .byte $08    ; <く>
- - - - - 0x03B77D 24:B76D: 08        .byte $08    ; <く>
- D - I - 0x03B77E 24:B76E: 10        .byte $10    ; <た>
- D - I - 0x03B77F 24:B76F: 11        .byte $11    ; <ち>
- D - I - 0x03B780 24:B770: 10        .byte $10    ; <た>
- D - I - 0x03B781 24:B771: 3D        .byte $3D    ; <+>
- D - I - 0x03B782 24:B772: 10        .byte $10    ; <た>
- D - I - 0x03B783 24:B773: 25        .byte $25    ; <ゆ>
- - - - - 0x03B784 24:B774: 3E        .byte $3E    ; <Jr>
- D - I - 0x03B785 24:B775: 3D        .byte $3D    ; <+>
- D - I - 0x03B786 24:B776: 14        .byte $14    ; <と>
- D - I - 0x03B787 24:B777: 19        .byte $19    ; <の>
- D - I - 0x03B788 24:B778: 1C        .byte $1C    ; <ふ>
- - - - - 0x03B789 24:B779: 21        .byte $21    ; <む>
- - - - - 0x03B78A 24:B77A: 28        .byte $28    ; <り>
- D - I - 0x03B78B 24:B77B: 2B        .byte $2B    ; <ろ>
- - - - - 0x03B78C 24:B77C: 26        .byte $26    ; <よ>
- - - - - 0x03B78D 24:B77D: 2F        .byte $2F    ; <っ>
- - - - - 0x03B78E 24:B77E: 24        .byte $24    ; <や>
- D - I - 0x03B78F 24:B77F: 25        .byte $25    ; <ゆ>
- D - I - 0x03B790 24:B780: 2C        .byte $2C    ; <わ>
- D - I - 0x03B791 24:B781: 2D        .byte $2D    ; <を>
- - - - - 0x03B792 24:B782: 28        .byte $28    ; <り>
- D - I - 0x03B793 24:B783: 1D        .byte $1D    ; <へ>
- - - - - 0x03B794 24:B784: 18        .byte $18    ; <ね>
- - - - - 0x03B795 24:B785: 3E        .byte $3E    ; <Jr>
- D - I - 0x03B796 24:B786: 28        .byte $28    ; <り>
- D - I - 0x03B797 24:B787: 29        .byte $29    ; <る>
- D - I - 0x03B798 24:B788: 28        .byte $28    ; <り>
- D - I - 0x03B799 24:B789: 3D        .byte $3D    ; <+>
- D - I - 0x03B79A 24:B78A: 28        .byte $28    ; <り>
- D - I - 0x03B79B 24:B78B: 29        .byte $29    ; <る>
- D - I - 0x03B79C 24:B78C: 2A        .byte $2A    ; <れ>
- - - - - 0x03B79D 24:B78D: 3F        .byte $3F    ; <•>
- D - I - 0x03B79E 24:B78E: 1C        .byte $1C    ; <ふ>
- D - I - 0x03B79F 24:B78F: 1D        .byte $1D    ; <へ>
- D - I - 0x03B7A0 24:B790: 2C        .byte $2C    ; <わ>
- D - I - 0x03B7A1 24:B791: 2D        .byte $2D    ; <を>
- - - - - 0x03B7A2 24:B792: 21        .byte $21    ; <む>
- - - - - 0x03B7A3 24:B793: 19        .byte $19    ; <の>
- - - - - 0x03B7A4 24:B794: 26        .byte $26    ; <よ>
- - - - - 0x03B7A5 24:B795: 3F        .byte $3F    ; <•>
- D - I - 0x03B7A6 24:B796: 28        .byte $28    ; <り>
- D - I - 0x03B7A7 24:B797: 29        .byte $29    ; <る>
- D - I - 0x03B7A8 24:B798: 18        .byte $18    ; <ね>
- D - I - 0x03B7A9 24:B799: 2E        .byte $2E    ; <ん>
- D - I - 0x03B7AA 24:B79A: 28        .byte $28    ; <り>
- D - I - 0x03B7AB 24:B79B: 25        .byte $25    ; <ゆ>
- D - I - 0x03B7AC 24:B79C: 22        .byte $22    ; <め>
- D - I - 0x03B7AD 24:B79D: 1F        .byte $1F    ; <ま>
- D - I - 0x03B7AE 24:B79E: 18        .byte $18    ; <ね>
- D - I - 0x03B7AF 24:B79F: 19        .byte $19    ; <の>
- D - I - 0x03B7B0 24:B7A0: 18        .byte $18    ; <ね>
- D - I - 0x03B7B1 24:B7A1: 19        .byte $19    ; <の>
- D - I - 0x03B7B2 24:B7A2: 24        .byte $24    ; <や>
- D - I - 0x03B7B3 24:B7A3: 25        .byte $25    ; <ゆ>
- - - - - 0x03B7B4 24:B7A4: 29        .byte $29    ; <る>
- - - - - 0x03B7B5 24:B7A5: 3E        .byte $3E    ; <Jr>
- D - I - 0x03B7B6 24:B7A6: 24        .byte $24    ; <や>
- - - - - 0x03B7B7 24:B7A7: 25        .byte $25    ; <ゆ>
- D - I - 0x03B7B8 24:B7A8: 24        .byte $24    ; <や>
- - - - - 0x03B7B9 24:B7A9: 26        .byte $26    ; <よ>
- D - I - 0x03B7BA 24:B7AA: 18        .byte $18    ; <ね>
- - - - - 0x03B7BB 24:B7AB: 28        .byte $28    ; <り>
- D - I - 0x03B7BC 24:B7AC: 2A        .byte $2A    ; <れ>
- - - - - 0x03B7BD 24:B7AD: 3F        .byte $3F    ; <•>
- D - I - 0x03B7BE 24:B7AE: 09        .byte $09    ; <け>
- D - I - 0x03B7BF 24:B7AF: 0D        .byte $0D    ; <す>
- D - I - 0x03B7C0 24:B7B0: 10        .byte $10    ; <た>
- D - I - 0x03B7C1 24:B7B1: 14        .byte $14    ; <と>
- D - I - 0x03B7C2 24:B7B2: 24        .byte $24    ; <や>
- - - - - 0x03B7C3 24:B7B3: 25        .byte $25    ; <ゆ>
- - - - - 0x03B7C4 24:B7B4: 25        .byte $25    ; <ゆ>
- - - - - 0x03B7C5 24:B7B5: 24        .byte $24    ; <や>
- D - I - 0x03B7C6 24:B7B6: 18        .byte $18    ; <ね>
- D - I - 0x03B7C7 24:B7B7: 19        .byte $19    ; <の>
- D - I - 0x03B7C8 24:B7B8: 1A        .byte $1A    ; <は>
- - - - - 0x03B7C9 24:B7B9: 1B        .byte $1B    ; <ひ>
- - - - - 0x03B7CA 24:B7BA: 28        .byte $28    ; <り>
- D - I - 0x03B7CB 24:B7BB: 1D        .byte $1D    ; <へ>
- - - - - 0x03B7CC 24:B7BC: 3E        .byte $3E    ; <Jr>
- - - - - 0x03B7CD 24:B7BD: 3F        .byte $3F    ; <•>
- D - I - 0x03B7CE 24:B7BE: 28        .byte $28    ; <り>
- D - I - 0x03B7CF 24:B7BF: 1C        .byte $1C    ; <ふ>
- D - I - 0x03B7D0 24:B7C0: 1D        .byte $1D    ; <へ>
- - - - - 0x03B7D1 24:B7C1: 29        .byte $29    ; <る>
- - - - - 0x03B7D2 24:B7C2: 19        .byte $19    ; <の>
- - - - - 0x03B7D3 24:B7C3: 21        .byte $21    ; <む>
- - - - - 0x03B7D4 24:B7C4: 3E        .byte $3E    ; <Jr>
- - - - - 0x03B7D5 24:B7C5: 3F        .byte $3F    ; <•>
- D - I - 0x03B7D6 24:B7C6: 10        .byte $10    ; <た>
- - - - - 0x03B7D7 24:B7C7: 11        .byte $11    ; <ち>
- D - I - 0x03B7D8 24:B7C8: 24        .byte $24    ; <や>
- D - I - 0x03B7D9 24:B7C9: 25        .byte $25    ; <ゆ>
- D - I - 0x03B7DA 24:B7CA: 2C        .byte $2C    ; <わ>
- D - I - 0x03B7DB 24:B7CB: 2D        .byte $2D    ; <を>
- - - - - 0x03B7DC 24:B7CC: 1E        .byte $1E    ; <ほ>
- - - - - 0x03B7DD 24:B7CD: 3F        .byte $3F    ; <•>
- D - I - 0x03B7DE 24:B7CE: 14        .byte $14    ; <と>
- D - I - 0x03B7DF 24:B7CF: 08        .byte $08    ; <く>
- D - I - 0x03B7E0 24:B7D0: 0C        .byte $0C    ; <し>
- D - I - 0x03B7E1 24:B7D1: 25        .byte $25    ; <ゆ>
- D - I - 0x03B7E2 24:B7D2: 29        .byte $29    ; <る>
- D - I - 0x03B7E3 24:B7D3: 21        .byte $21    ; <む>
- - - - - 0x03B7E4 24:B7D4: 1D        .byte $1D    ; <へ>
- - - - - 0x03B7E5 24:B7D5: 2D        .byte $2D    ; <を>
- D - I - 0x03B7E6 24:B7D6: 29        .byte $29    ; <る>
- - - - - 0x03B7E7 24:B7D7: 29        .byte $29    ; <る>
- D - I - 0x03B7E8 24:B7D8: 29        .byte $29    ; <る>
- D - I - 0x03B7E9 24:B7D9: 2D        .byte $2D    ; <を>
- D - I - 0x03B7EA 24:B7DA: 21        .byte $21    ; <む>
- D - I - 0x03B7EB 24:B7DB: 24        .byte $24    ; <や>
- - - - - 0x03B7EC 24:B7DC: 1D        .byte $1D    ; <へ>
- - - - - 0x03B7ED 24:B7DD: 3D        .byte $3D    ; <+>
- D - I - 0x03B7EE 24:B7DE: 2C        .byte $2C    ; <わ>
- D - I - 0x03B7EF 24:B7DF: 2C        .byte $2C    ; <わ>
- D - I - 0x03B7F0 24:B7E0: 2C        .byte $2C    ; <わ>
- D - I - 0x03B7F1 24:B7E1: 2C        .byte $2C    ; <わ>
- D - I - 0x03B7F2 24:B7E2: 2D        .byte $2D    ; <を>
- D - I - 0x03B7F3 24:B7E3: 2D        .byte $2D    ; <を>
- D - I - 0x03B7F4 24:B7E4: 2D        .byte $2D    ; <を>
- - - - - 0x03B7F5 24:B7E5: 2E        .byte $2E    ; <ん>
- D - I - 0x03B7F6 24:B7E6: 24        .byte $24    ; <や>
- D - I - 0x03B7F7 24:B7E7: 25        .byte $25    ; <ゆ>
- D - I - 0x03B7F8 24:B7E8: 24        .byte $24    ; <や>
- D - I - 0x03B7F9 24:B7E9: 25        .byte $25    ; <ゆ>
- - - - - 0x03B7FA 24:B7EA: 24        .byte $24    ; <や>
- D - I - 0x03B7FB 24:B7EB: 1D        .byte $1D    ; <へ>
- - - - - 0x03B7FC 24:B7EC: 2D        .byte $2D    ; <を>
- - - - - 0x03B7FD 24:B7ED: 3E        .byte $3E    ; <Jr>
- D - I - 0x03B7FE 24:B7EE: 24        .byte $24    ; <や>
- D - I - 0x03B7FF 24:B7EF: 25        .byte $25    ; <ゆ>
- D - I - 0x03B800 24:B7F0: 24        .byte $24    ; <や>
- D - I - 0x03B801 24:B7F1: 25        .byte $25    ; <ゆ>
- D - I - 0x03B802 24:B7F2: 24        .byte $24    ; <や>
- D - I - 0x03B803 24:B7F3: 11        .byte $11    ; <ち>
- - - - - 0x03B804 24:B7F4: 10        .byte $10    ; <た>
- - - - - 0x03B805 24:B7F5: 3F        .byte $3F    ; <•>
- D - I - 0x03B806 24:B7F6: 28        .byte $28    ; <り>
- D - I - 0x03B807 24:B7F7: 28        .byte $28    ; <り>
- - - - - 0x03B808 24:B7F8: 20        .byte $20    ; <み>
- D - I - 0x03B809 24:B7F9: 21        .byte $21    ; <む>
- D - I - 0x03B80A 24:B7FA: 28        .byte $28    ; <り>
- D - I - 0x03B80B 24:B7FB: 25        .byte $25    ; <ゆ>
- D - I - 0x03B80C 24:B7FC: 2C        .byte $2C    ; <わ>
- D - I - 0x03B80D 24:B7FD: 11        .byte $11    ; <ち>
- - - - - 0x03B80E 24:B7FE: 28        .byte $28    ; <り>
- - - - - 0x03B80F 24:B7FF: 28        .byte $28    ; <り>
- D - I - 0x03B810 24:B800: 28        .byte $28    ; <り>
- - - - - 0x03B811 24:B801: 28        .byte $28    ; <り>
- D - I - 0x03B812 24:B802: 24        .byte $24    ; <や>
- - - - - 0x03B813 24:B803: 24        .byte $24    ; <や>
- - - - - 0x03B814 24:B804: 24        .byte $24    ; <や>
- - - - - 0x03B815 24:B805: 24        .byte $24    ; <や>
- D - I - 0x03B816 24:B806: 20        .byte $20    ; <み>
- - - - - 0x03B817 24:B807: 20        .byte $20    ; <み>
- - - - - 0x03B818 24:B808: 20        .byte $20    ; <み>
- - - - - 0x03B819 24:B809: 20        .byte $20    ; <み>
- - - - - 0x03B81A 24:B80A: 20        .byte $20    ; <み>
- D - I - 0x03B81B 24:B80B: 20        .byte $20    ; <み>
- - - - - 0x03B81C 24:B80C: 20        .byte $20    ; <み>
- - - - - 0x03B81D 24:B80D: 28        .byte $28    ; <り>
- D - I - 0x03B81E 24:B80E: 28        .byte $28    ; <り>
- D - I - 0x03B81F 24:B80F: 28        .byte $28    ; <り>
- - - - - 0x03B820 24:B810: 28        .byte $28    ; <り>
- - - - - 0x03B821 24:B811: 28        .byte $28    ; <り>
- D - I - 0x03B822 24:B812: 28        .byte $28    ; <り>
- - - - - 0x03B823 24:B813: 28        .byte $28    ; <り>
- - - - - 0x03B824 24:B814: 28        .byte $28    ; <り>
- - - - - 0x03B825 24:B815: 28        .byte $28    ; <り>
- D - I - 0x03B826 24:B816: 10        .byte $10    ; <た>
- - - - - 0x03B827 24:B817: 10        .byte $10    ; <た>
- - - - - 0x03B828 24:B818: 10        .byte $10    ; <た>
- - - - - 0x03B829 24:B819: 10        .byte $10    ; <た>
- D - I - 0x03B82A 24:B81A: 10        .byte $10    ; <た>
- - - - - 0x03B82B 24:B81B: 10        .byte $10    ; <た>
- - - - - 0x03B82C 24:B81C: 10        .byte $10    ; <た>
- D - I - 0x03B82D 24:B81D: 10        .byte $10    ; <た>
- D - I - 0x03B82E 24:B81E: 24        .byte $24    ; <や>
- D - I - 0x03B82F 24:B81F: 24        .byte $24    ; <や>
- D - I - 0x03B830 24:B820: 24        .byte $24    ; <や>
- - - - - 0x03B831 24:B821: 24        .byte $24    ; <や>
- D - I - 0x03B832 24:B822: 24        .byte $24    ; <や>
- D - I - 0x03B833 24:B823: 24        .byte $24    ; <や>
- - - - - 0x03B834 24:B824: 24        .byte $24    ; <や>
- D - I - 0x03B835 24:B825: 24        .byte $24    ; <や>
- D - I - 0x03B836 24:B826: 18        .byte $18    ; <ね>
- D - I - 0x03B837 24:B827: 1C        .byte $1C    ; <ふ>
- - - - - 0x03B838 24:B828: 20        .byte $20    ; <み>
- - - - - 0x03B839 24:B829: 24        .byte $24    ; <や>
- D - I - 0x03B83A 24:B82A: 24        .byte $24    ; <や>
- D - I - 0x03B83B 24:B82B: 28        .byte $28    ; <り>
- D - I - 0x03B83C 24:B82C: 28        .byte $28    ; <り>
- D - I - 0x03B83D 24:B82D: 2C        .byte $2C    ; <わ>
- D - I - 0x03B83E 24:B82E: 28        .byte $28    ; <り>
- D - I - 0x03B83F 24:B82F: 28        .byte $28    ; <り>
- D - I - 0x03B840 24:B830: 28        .byte $28    ; <り>
- - - - - 0x03B841 24:B831: 2D        .byte $2D    ; <を>
- - - - - 0x03B842 24:B832: 20        .byte $20    ; <み>
- - - - - 0x03B843 24:B833: 21        .byte $21    ; <む>
- - - - - 0x03B844 24:B834: 20        .byte $20    ; <み>
- - - - - 0x03B845 24:B835: 3F        .byte $3F    ; <•>
- D - I - 0x03B846 24:B836: 28        .byte $28    ; <り>
- D - I - 0x03B847 24:B837: 28        .byte $28    ; <り>
- - - - - 0x03B848 24:B838: 28        .byte $28    ; <り>
- D - I - 0x03B849 24:B839: 29        .byte $29    ; <る>
- - - - - 0x03B84A 24:B83A: 2C        .byte $2C    ; <わ>
- - - - - 0x03B84B 24:B83B: 25        .byte $25    ; <ゆ>
- - - - - 0x03B84C 24:B83C: 24        .byte $24    ; <や>
- - - - - 0x03B84D 24:B83D: 3F        .byte $3F    ; <•>
- D - I - 0x03B84E 24:B83E: 20        .byte $20    ; <み>
- - - - - 0x03B84F 24:B83F: 21        .byte $21    ; <む>
- - - - - 0x03B850 24:B840: 20        .byte $20    ; <み>
- - - - - 0x03B851 24:B841: 2D        .byte $2D    ; <を>
- - - - - 0x03B852 24:B842: 24        .byte $24    ; <や>
- D - I - 0x03B853 24:B843: 25        .byte $25    ; <ゆ>
- - - - - 0x03B854 24:B844: 2C        .byte $2C    ; <わ>
- - - - - 0x03B855 24:B845: 3F        .byte $3F    ; <•>
- - - - - 0x03B856 24:B846: 14        .byte $14    ; <と>
- - - - - 0x03B857 24:B847: 14        .byte $14    ; <と>
- - - - - 0x03B858 24:B848: 15        .byte $15    ; <な>
- - - - - 0x03B859 24:B849: 2C        .byte $2C    ; <わ>
- - - - - 0x03B85A 24:B84A: 2C        .byte $2C    ; <わ>
- - - - - 0x03B85B 24:B84B: 20        .byte $20    ; <み>
- - - - - 0x03B85C 24:B84C: 29        .byte $29    ; <る>
- - - - - 0x03B85D 24:B84D: 1C        .byte $1C    ; <ふ>
- - - - - 0x03B85E 24:B84E: 20        .byte $20    ; <み>
- - - - - 0x03B85F 24:B84F: 20        .byte $20    ; <み>
- D - I - 0x03B860 24:B850: 20        .byte $20    ; <み>
- - - - - 0x03B861 24:B851: 20        .byte $20    ; <み>
- - - - - 0x03B862 24:B852: 1C        .byte $1C    ; <ふ>
- - - - - 0x03B863 24:B853: 1C        .byte $1C    ; <ふ>
- D - I - 0x03B864 24:B854: 14        .byte $14    ; <と>
- - - - - 0x03B865 24:B855: 28        .byte $28    ; <り>
- - - - - 0x03B866 24:B856: 2C        .byte $2C    ; <わ>
- D - I - 0x03B867 24:B857: 2C        .byte $2C    ; <わ>
- D - I - 0x03B868 24:B858: 2C        .byte $2C    ; <わ>
- - - - - 0x03B869 24:B859: 2D        .byte $2D    ; <を>
- - - - - 0x03B86A 24:B85A: 20        .byte $20    ; <み>
- - - - - 0x03B86B 24:B85B: 21        .byte $21    ; <む>
- - - - - 0x03B86C 24:B85C: 29        .byte $29    ; <る>
- - - - - 0x03B86D 24:B85D: 1C        .byte $1C    ; <ふ>
- - - - - 0x03B86E 24:B85E: 2C        .byte $2C    ; <わ>
- - - - - 0x03B86F 24:B85F: 2C        .byte $2C    ; <わ>
- D - I - 0x03B870 24:B860: 2C        .byte $2C    ; <わ>
- - - - - 0x03B871 24:B861: 1C        .byte $1C    ; <ふ>
- - - - - 0x03B872 24:B862: 1C        .byte $1C    ; <ふ>
- - - - - 0x03B873 24:B863: 14        .byte $14    ; <と>
- - - - - 0x03B874 24:B864: 28        .byte $28    ; <り>
- - - - - 0x03B875 24:B865: 3F        .byte $3F    ; <•>
- - - - - 0x03B876 24:B866: 20        .byte $20    ; <み>
- - - - - 0x03B877 24:B867: 21        .byte $21    ; <む>
- D - I - 0x03B878 24:B868: 2C        .byte $2C    ; <わ>
- - - - - 0x03B879 24:B869: 15        .byte $15    ; <な>
- - - - - 0x03B87A 24:B86A: 14        .byte $14    ; <と>
- - - - - 0x03B87B 24:B86B: 1C        .byte $1C    ; <ふ>
- - - - - 0x03B87C 24:B86C: 2D        .byte $2D    ; <を>
- - - - - 0x03B87D 24:B86D: 3F        .byte $3F    ; <•>
- - - - - 0x03B87E 24:B86E: 14        .byte $14    ; <と>
- - - - - 0x03B87F 24:B86F: 14        .byte $14    ; <と>
- - - - - 0x03B880 24:B870: 14        .byte $14    ; <と>
- - - - - 0x03B881 24:B871: 14        .byte $14    ; <と>
- - - - - 0x03B882 24:B872: 14        .byte $14    ; <と>
- - - - - 0x03B883 24:B873: 14        .byte $14    ; <と>
- - - - - 0x03B884 24:B874: 14        .byte $14    ; <と>
- - - - - 0x03B885 24:B875: 14        .byte $14    ; <と>
- - - - - 0x03B886 24:B876: 18        .byte $18    ; <ね>
- - - - - 0x03B887 24:B877: 18        .byte $18    ; <ね>
- - - - - 0x03B888 24:B878: 19        .byte $19    ; <の>
- D - I - 0x03B889 24:B879: 2D        .byte $2D    ; <を>
- D - I - 0x03B88A 24:B87A: 2C        .byte $2C    ; <わ>
- D - I - 0x03B88B 24:B87B: 2D        .byte $2D    ; <を>
- - - - - 0x03B88C 24:B87C: 29        .byte $29    ; <る>
- D - I - 0x03B88D 24:B87D: 25        .byte $25    ; <ゆ>
- D - I - 0x03B88E 24:B87E: 28        .byte $28    ; <り>
- D - I - 0x03B88F 24:B87F: 28        .byte $28    ; <り>
- - - - - 0x03B890 24:B880: 29        .byte $29    ; <る>
- - - - - 0x03B891 24:B881: 24        .byte $24    ; <や>
- - - - - 0x03B892 24:B882: 25        .byte $25    ; <ゆ>
- - - - - 0x03B893 24:B883: 1C        .byte $1C    ; <ふ>
- D - I - 0x03B894 24:B884: 1D        .byte $1D    ; <へ>
- - - - - 0x03B895 24:B885: 09        .byte $09    ; <け>
- D - I - 0x03B896 24:B886: 28        .byte $28    ; <り>
- D - I - 0x03B897 24:B887: 28        .byte $28    ; <り>
- - - - - 0x03B898 24:B888: 29        .byte $29    ; <る>
- - - - - 0x03B899 24:B889: 24        .byte $24    ; <や>
- - - - - 0x03B89A 24:B88A: 25        .byte $25    ; <ゆ>
- - - - - 0x03B89B 24:B88B: 1C        .byte $1C    ; <ふ>
- - - - - 0x03B89C 24:B88C: 1D        .byte $1D    ; <へ>
- - - - - 0x03B89D 24:B88D: 2D        .byte $2D    ; <を>
- D - I - 0x03B89E 24:B88E: 24        .byte $24    ; <や>
- D - I - 0x03B89F 24:B88F: 24        .byte $24    ; <や>
- - - - - 0x03B8A0 24:B890: 25        .byte $25    ; <ゆ>
- D - I - 0x03B8A1 24:B891: 25        .byte $25    ; <ゆ>
- - - - - 0x03B8A2 24:B892: 1C        .byte $1C    ; <ふ>
- D - I - 0x03B8A3 24:B893: 1D        .byte $1D    ; <へ>
- - - - - 0x03B8A4 24:B894: 2D        .byte $2D    ; <を>
- D - I - 0x03B8A5 24:B895: 09        .byte $09    ; <け>
- - - - - 0x03B8A6 24:B896: 24        .byte $24    ; <や>
- - - - - 0x03B8A7 24:B897: 24        .byte $24    ; <や>
- - - - - 0x03B8A8 24:B898: 25        .byte $25    ; <ゆ>
- - - - - 0x03B8A9 24:B899: 28        .byte $28    ; <り>
- - - - - 0x03B8AA 24:B89A: 28        .byte $28    ; <り>
- - - - - 0x03B8AB 24:B89B: 29        .byte $29    ; <る>
- D - I - 0x03B8AC 24:B89C: 2D        .byte $2D    ; <を>
- - - - - 0x03B8AD 24:B89D: 21        .byte $21    ; <む>
- D - I - 0x03B8AE 24:B89E: 28        .byte $28    ; <り>
- - - - - 0x03B8AF 24:B89F: 28        .byte $28    ; <り>
- D - I - 0x03B8B0 24:B8A0: 29        .byte $29    ; <る>
- - - - - 0x03B8B1 24:B8A1: 29        .byte $29    ; <る>
- - - - - 0x03B8B2 24:B8A2: 1D        .byte $1D    ; <へ>
- - - - - 0x03B8B3 24:B8A3: 2D        .byte $2D    ; <を>
- - - - - 0x03B8B4 24:B8A4: 09        .byte $09    ; <け>
- - - - - 0x03B8B5 24:B8A5: 19        .byte $19    ; <の>
- - - - - 0x03B8B6 24:B8A6: 24        .byte $24    ; <や>
- - - - - 0x03B8B7 24:B8A7: 24        .byte $24    ; <や>
- D - I - 0x03B8B8 24:B8A8: 25        .byte $25    ; <ゆ>
- - - - - 0x03B8B9 24:B8A9: 1C        .byte $1C    ; <ふ>
- - - - - 0x03B8BA 24:B8AA: 1D        .byte $1D    ; <へ>
- - - - - 0x03B8BB 24:B8AB: 2D        .byte $2D    ; <を>
- - - - - 0x03B8BC 24:B8AC: 19        .byte $19    ; <の>
- - - - - 0x03B8BD 24:B8AD: 09        .byte $09    ; <け>



tbl_B8AE:
- D - I - 0x03B8BE 24:B8AE: 22        .byte $22    ; <め>
- D - I - 0x03B8BF 24:B8AF: 11        .byte $11    ; <ち>
- D - I - 0x03B8C0 24:B8B0: 11        .byte $11    ; <ち>
- D - I - 0x03B8C1 24:B8B1: 00        .byte $00
- D - I - 0x03B8C2 24:B8B2: 22        .byte $22    ; <め>
- D - I - 0x03B8C3 24:B8B3: 11        .byte $11    ; <ち>
- D - I - 0x03B8C4 24:B8B4: 00        .byte $00
- D - I - 0x03B8C5 24:B8B5: 00        .byte $00
- D - I - 0x03B8C6 24:B8B6: 12        .byte $12    ; <つ>
- D - I - 0x03B8C7 24:B8B7: 22        .byte $22    ; <め>
- D - I - 0x03B8C8 24:B8B8: 00        .byte $00
- D - I - 0x03B8C9 24:B8B9: 00        .byte $00
- D - I - 0x03B8CA 24:B8BA: 22        .byte $22    ; <め>
- D - I - 0x03B8CB 24:B8BB: 22        .byte $22    ; <め>
- D - I - 0x03B8CC 24:B8BC: 00        .byte $00
- D - I - 0x03B8CD 24:B8BD: 00        .byte $00
- D - I - 0x03B8CE 24:B8BE: 11        .byte $11    ; <ち>
- D - I - 0x03B8CF 24:B8BF: 12        .byte $12    ; <つ>
- D - I - 0x03B8D0 24:B8C0: 00        .byte $00
- D - I - 0x03B8D1 24:B8C1: 00        .byte $00
- D - I - 0x03B8D2 24:B8C2: 11        .byte $11    ; <ち>
- D - I - 0x03B8D3 24:B8C3: 10        .byte $10    ; <た>
- D - I - 0x03B8D4 24:B8C4: 00        .byte $00
- D - I - 0x03B8D5 24:B8C5: 00        .byte $00
- - - - - 0x03B8D6 24:B8C6: 22        .byte $22    ; <め>
- - - - - 0x03B8D7 24:B8C7: 21        .byte $21    ; <む>
- - - - - 0x03B8D8 24:B8C8: 11        .byte $11    ; <ち>
- - - - - 0x03B8D9 24:B8C9: 11        .byte $11    ; <ち>
- D - I - 0x03B8DA 24:B8CA: 22        .byte $22    ; <め>
- D - I - 0x03B8DB 24:B8CB: 22        .byte $22    ; <め>
- D - I - 0x03B8DC 24:B8CC: 11        .byte $11    ; <ち>
- D - I - 0x03B8DD 24:B8CD: 11        .byte $11    ; <ち>
- D - I - 0x03B8DE 24:B8CE: 22        .byte $22    ; <め>
- D - I - 0x03B8DF 24:B8CF: 11        .byte $11    ; <ち>
- - - - - 0x03B8E0 24:B8D0: 11        .byte $11    ; <ち>
- D - I - 0x03B8E1 24:B8D1: 11        .byte $11    ; <ち>
- D - I - 0x03B8E2 24:B8D2: 02        .byte $02    ; <い>
- - - - - 0x03B8E3 24:B8D3: 21        .byte $21    ; <む>
- D - I - 0x03B8E4 24:B8D4: 11        .byte $11    ; <ち>
- - - - - 0x03B8E5 24:B8D5: 11        .byte $11    ; <ち>
- D - I - 0x03B8E6 24:B8D6: 02        .byte $02    ; <い>
- D - I - 0x03B8E7 24:B8D7: 11        .byte $11    ; <ち>
- D - I - 0x03B8E8 24:B8D8: 11        .byte $11    ; <ち>
- D - I - 0x03B8E9 24:B8D9: 11        .byte $11    ; <ち>
- D - I - 0x03B8EA 24:B8DA: 02        .byte $02    ; <い>
- D - I - 0x03B8EB 24:B8DB: 11        .byte $11    ; <ち>
- D - I - 0x03B8EC 24:B8DC: 11        .byte $11    ; <ち>
- D - I - 0x03B8ED 24:B8DD: 11        .byte $11    ; <ち>
- - - - - 0x03B8EE 24:B8DE: 22        .byte $22    ; <め>
- D - I - 0x03B8EF 24:B8DF: 11        .byte $11    ; <ち>
- - - - - 0x03B8F0 24:B8E0: 00        .byte $00
- - - - - 0x03B8F1 24:B8E1: 00        .byte $00
- D - I - 0x03B8F2 24:B8E2: 22        .byte $22    ; <め>
- D - I - 0x03B8F3 24:B8E3: 10        .byte $10    ; <た>
- - - - - 0x03B8F4 24:B8E4: 00        .byte $00
- D - I - 0x03B8F5 24:B8E5: 00        .byte $00
- - - - - 0x03B8F6 24:B8E6: 12        .byte $12    ; <つ>
- D - I - 0x03B8F7 24:B8E7: 20        .byte $20    ; <み>
- D - I - 0x03B8F8 24:B8E8: 00        .byte $00
- D - I - 0x03B8F9 24:B8E9: 00        .byte $00
- D - I - 0x03B8FA 24:B8EA: 22        .byte $22    ; <め>
- - - - - 0x03B8FB 24:B8EB: 00        .byte $00
- - - - - 0x03B8FC 24:B8EC: 00        .byte $00
- D - I - 0x03B8FD 24:B8ED: 00        .byte $00
- D - I - 0x03B8FE 24:B8EE: 11        .byte $11    ; <ち>
- D - I - 0x03B8FF 24:B8EF: 10        .byte $10    ; <た>
- D - I - 0x03B900 24:B8F0: 00        .byte $00
- D - I - 0x03B901 24:B8F1: 00        .byte $00
- - - - - 0x03B902 24:B8F2: 11        .byte $11    ; <ち>
- D - I - 0x03B903 24:B8F3: 00        .byte $00
- - - - - 0x03B904 24:B8F4: 00        .byte $00
- - - - - 0x03B905 24:B8F5: 00        .byte $00
- - - - - 0x03B906 24:B8F6: 22        .byte $22    ; <め>
- - - - - 0x03B907 24:B8F7: 11        .byte $11    ; <ち>
- - - - - 0x03B908 24:B8F8: 11        .byte $11    ; <ち>
- - - - - 0x03B909 24:B8F9: 11        .byte $11    ; <ち>
- - - - - 0x03B90A 24:B8FA: 02        .byte $02    ; <い>
- D - I - 0x03B90B 24:B8FB: 21        .byte $21    ; <む>
- - - - - 0x03B90C 24:B8FC: 11        .byte $11    ; <ち>
- D - I - 0x03B90D 24:B8FD: 11        .byte $11    ; <ち>
- D - I - 0x03B90E 24:B8FE: 21        .byte $21    ; <む>
- D - I - 0x03B90F 24:B8FF: 11        .byte $11    ; <ち>
- - - - - 0x03B910 24:B900: 11        .byte $11    ; <ち>
- D - I - 0x03B911 24:B901: 11        .byte $11    ; <ち>
- - - - - 0x03B912 24:B902: 02        .byte $02    ; <い>
- - - - - 0x03B913 24:B903: 11        .byte $11    ; <ち>
- - - - - 0x03B914 24:B904: 11        .byte $11    ; <ち>
- - - - - 0x03B915 24:B905: 11        .byte $11    ; <ち>
- - - - - 0x03B916 24:B906: 02        .byte $02    ; <い>
- D - I - 0x03B917 24:B907: 11        .byte $11    ; <ち>
- D - I - 0x03B918 24:B908: 11        .byte $11    ; <ち>
- D - I - 0x03B919 24:B909: 11        .byte $11    ; <ち>
- D - I - 0x03B91A 24:B90A: 21        .byte $21    ; <む>
- D - I - 0x03B91B 24:B90B: 11        .byte $11    ; <ち>
- D - I - 0x03B91C 24:B90C: 11        .byte $11    ; <ち>
- - - - - 0x03B91D 24:B90D: 11        .byte $11    ; <ち>
- - - - - 0x03B91E 24:B90E: 00        .byte $00
- D - I - 0x03B91F 24:B90F: 00        .byte $00
- - - - - 0x03B920 24:B910: 00        .byte $00
- - - - - 0x03B921 24:B911: 22        .byte $22    ; <め>
- - - - - 0x03B922 24:B912: 00        .byte $00
- D - I - 0x03B923 24:B913: 00        .byte $00
- D - I - 0x03B924 24:B914: 02        .byte $02    ; <い>
- D - I - 0x03B925 24:B915: 22        .byte $22    ; <め>
- D - I - 0x03B926 24:B916: 00        .byte $00
- D - I - 0x03B927 24:B917: 00        .byte $00
- D - I - 0x03B928 24:B918: 02        .byte $02    ; <い>
- D - I - 0x03B929 24:B919: 22        .byte $22    ; <め>
- - - - - 0x03B92A 24:B91A: 00        .byte $00
- - - - - 0x03B92B 24:B91B: 00        .byte $00
- - - - - 0x03B92C 24:B91C: 22        .byte $22    ; <め>
- - - - - 0x03B92D 24:B91D: 22        .byte $22    ; <め>
- D - I - 0x03B92E 24:B91E: 00        .byte $00
- D - I - 0x03B92F 24:B91F: 00        .byte $00
- D - I - 0x03B930 24:B920: 00        .byte $00
- D - I - 0x03B931 24:B921: 22        .byte $22    ; <め>
- - - - - 0x03B932 24:B922: 00        .byte $00
- - - - - 0x03B933 24:B923: 00        .byte $00
- - - - - 0x03B934 24:B924: 00        .byte $00
- - - - - 0x03B935 24:B925: 00        .byte $00
- - - - - 0x03B936 24:B926: 22        .byte $22    ; <め>
- - - - - 0x03B937 24:B927: 33        .byte $33    ; <0>
- - - - - 0x03B938 24:B928: 33        .byte $33    ; <0>
- - - - - 0x03B939 24:B929: 33        .byte $33    ; <0>
- D - I - 0x03B93A 24:B92A: 02        .byte $02    ; <い>
- - - - - 0x03B93B 24:B92B: 23        .byte $23    ; <も>
- - - - - 0x03B93C 24:B92C: 33        .byte $33    ; <0>
- D - I - 0x03B93D 24:B92D: 33        .byte $33    ; <0>
- - - - - 0x03B93E 24:B92E: 23        .byte $23    ; <も>
- - - - - 0x03B93F 24:B92F: 33        .byte $33    ; <0>
- - - - - 0x03B940 24:B930: 33        .byte $33    ; <0>
- D - I - 0x03B941 24:B931: 33        .byte $33    ; <0>
- - - - - 0x03B942 24:B932: 22        .byte $22    ; <め>
- - - - - 0x03B943 24:B933: 33        .byte $33    ; <0>
- - - - - 0x03B944 24:B934: 33        .byte $33    ; <0>
- - - - - 0x03B945 24:B935: 33        .byte $33    ; <0>
- - - - - 0x03B946 24:B936: 32        .byte $32    ; <ょ>
- - - - - 0x03B947 24:B937: 33        .byte $33    ; <0>
- - - - - 0x03B948 24:B938: 33        .byte $33    ; <0>
- - - - - 0x03B949 24:B939: 33        .byte $33    ; <0>
- - - - - 0x03B94A 24:B93A: 23        .byte $23    ; <も>
- D - I - 0x03B94B 24:B93B: 33        .byte $33    ; <0>
- - - - - 0x03B94C 24:B93C: 33        .byte $33    ; <0>
- D - I - 0x03B94D 24:B93D: 33        .byte $33    ; <0>
- - - - - 0x03B94E 24:B93E: 00        .byte $00
- - - - - 0x03B94F 24:B93F: 00        .byte $00
- - - - - 0x03B950 24:B940: 00        .byte $00
- - - - - 0x03B951 24:B941: 00        .byte $00
- D - I - 0x03B952 24:B942: 00        .byte $00
- - - - - 0x03B953 24:B943: 00        .byte $00
- - - - - 0x03B954 24:B944: 00        .byte $00
- - - - - 0x03B955 24:B945: 00        .byte $00
- - - - - 0x03B956 24:B946: 00        .byte $00
- D - I - 0x03B957 24:B947: 00        .byte $00
- - - - - 0x03B958 24:B948: 00        .byte $00
- - - - - 0x03B959 24:B949: 00        .byte $00
- - - - - 0x03B95A 24:B94A: 00        .byte $00
- - - - - 0x03B95B 24:B94B: 00        .byte $00
- - - - - 0x03B95C 24:B94C: 00        .byte $00
- D - I - 0x03B95D 24:B94D: 00        .byte $00
- D - I - 0x03B95E 24:B94E: 00        .byte $00
- D - I - 0x03B95F 24:B94F: 00        .byte $00
- D - I - 0x03B960 24:B950: 00        .byte $00
- D - I - 0x03B961 24:B951: 00        .byte $00
- - - - - 0x03B962 24:B952: 00        .byte $00
- - - - - 0x03B963 24:B953: 00        .byte $00
- D - I - 0x03B964 24:B954: 00        .byte $00
- - - - - 0x03B965 24:B955: 00        .byte $00
- - - - - 0x03B966 24:B956: 11        .byte $11    ; <ち>
- - - - - 0x03B967 24:B957: 10        .byte $10    ; <た>
- - - - - 0x03B968 24:B958: 02        .byte $02    ; <い>
- - - - - 0x03B969 24:B959: 22        .byte $22    ; <め>
- - - - - 0x03B96A 24:B95A: 11        .byte $11    ; <ち>
- - - - - 0x03B96B 24:B95B: 10        .byte $10    ; <た>
- - - - - 0x03B96C 24:B95C: 22        .byte $22    ; <め>
- - - - - 0x03B96D 24:B95D: 22        .byte $22    ; <め>
- - - - - 0x03B96E 24:B95E: 11        .byte $11    ; <ち>
- - - - - 0x03B96F 24:B95F: 11        .byte $11    ; <ち>
- - - - - 0x03B970 24:B960: 10        .byte $10    ; <た>
- - - - - 0x03B971 24:B961: 22        .byte $22    ; <め>
- - - - - 0x03B972 24:B962: 11        .byte $11    ; <ち>
- - - - - 0x03B973 24:B963: 11        .byte $11    ; <ち>
- - - - - 0x03B974 24:B964: 02        .byte $02    ; <い>
- - - - - 0x03B975 24:B965: 22        .byte $22    ; <め>
- - - - - 0x03B976 24:B966: 11        .byte $11    ; <ち>
- - - - - 0x03B977 24:B967: 11        .byte $11    ; <ち>
- - - - - 0x03B978 24:B968: 00        .byte $00
- - - - - 0x03B979 24:B969: 22        .byte $22    ; <め>
- - - - - 0x03B97A 24:B96A: 11        .byte $11    ; <ち>
- - - - - 0x03B97B 24:B96B: 11        .byte $11    ; <ち>
- - - - - 0x03B97C 24:B96C: 10        .byte $10    ; <た>
- - - - - 0x03B97D 24:B96D: 02        .byte $02    ; <い>
- - - - - 0x03B97E 24:B96E: 22        .byte $22    ; <め>
- - - - - 0x03B97F 24:B96F: 00        .byte $00
- - - - - 0x03B980 24:B970: 00        .byte $00
- - - - - 0x03B981 24:B971: 00        .byte $00
- - - - - 0x03B982 24:B972: 22        .byte $22    ; <め>
- - - - - 0x03B983 24:B973: 00        .byte $00
- - - - - 0x03B984 24:B974: 00        .byte $00
- - - - - 0x03B985 24:B975: 00        .byte $00
- - - - - 0x03B986 24:B976: 22        .byte $22    ; <め>
- - - - - 0x03B987 24:B977: 20        .byte $20    ; <み>
- - - - - 0x03B988 24:B978: 00        .byte $00
- - - - - 0x03B989 24:B979: 00        .byte $00
- - - - - 0x03B98A 24:B97A: 22        .byte $22    ; <め>
- - - - - 0x03B98B 24:B97B: 22        .byte $22    ; <め>
- - - - - 0x03B98C 24:B97C: 00        .byte $00
- D - I - 0x03B98D 24:B97D: 00        .byte $00
- - - - - 0x03B98E 24:B97E: 20        .byte $20    ; <み>
- - - - - 0x03B98F 24:B97F: 00        .byte $00
- - - - - 0x03B990 24:B980: 00        .byte $00
- - - - - 0x03B991 24:B981: 00        .byte $00
- - - - - 0x03B992 24:B982: 20        .byte $20    ; <み>
- - - - - 0x03B993 24:B983: 00        .byte $00
- - - - - 0x03B994 24:B984: 00        .byte $00
- - - - - 0x03B995 24:B985: 00        .byte $00
- - - - - 0x03B996 24:B986: 00        .byte $00
- - - - - 0x03B997 24:B987: 00        .byte $00
- - - - - 0x03B998 24:B988: 00        .byte $00
- - - - - 0x03B999 24:B989: 00        .byte $00
- - - - - 0x03B99A 24:B98A: 00        .byte $00
- - - - - 0x03B99B 24:B98B: 00        .byte $00
- - - - - 0x03B99C 24:B98C: 00        .byte $00
- - - - - 0x03B99D 24:B98D: 00        .byte $00
- - - - - 0x03B99E 24:B98E: 00        .byte $00
- - - - - 0x03B99F 24:B98F: 00        .byte $00
- - - - - 0x03B9A0 24:B990: 00        .byte $00
- - - - - 0x03B9A1 24:B991: 00        .byte $00
- - - - - 0x03B9A2 24:B992: 00        .byte $00
- - - - - 0x03B9A3 24:B993: 00        .byte $00
- - - - - 0x03B9A4 24:B994: 00        .byte $00
- - - - - 0x03B9A5 24:B995: 00        .byte $00
- - - - - 0x03B9A6 24:B996: 00        .byte $00
- - - - - 0x03B9A7 24:B997: 00        .byte $00
- - - - - 0x03B9A8 24:B998: 00        .byte $00
- - - - - 0x03B9A9 24:B999: 00        .byte $00
- - - - - 0x03B9AA 24:B99A: 00        .byte $00
- - - - - 0x03B9AB 24:B99B: 00        .byte $00
- - - - - 0x03B9AC 24:B99C: 00        .byte $00
- - - - - 0x03B9AD 24:B99D: 00        .byte $00
- - - - - 0x03B9AE 24:B99E: 22        .byte $22    ; <め>
- - - - - 0x03B9AF 24:B99F: 22        .byte $22    ; <め>
- - - - - 0x03B9B0 24:B9A0: 00        .byte $00
- - - - - 0x03B9B1 24:B9A1: 00        .byte $00
- - - - - 0x03B9B2 24:B9A2: 22        .byte $22    ; <め>
- - - - - 0x03B9B3 24:B9A3: 22        .byte $22    ; <め>
- - - - - 0x03B9B4 24:B9A4: 00        .byte $00
- - - - - 0x03B9B5 24:B9A5: 00        .byte $00
- - - - - 0x03B9B6 24:B9A6: 22        .byte $22    ; <め>
- D - I - 0x03B9B7 24:B9A7: 22        .byte $22    ; <め>
- D - I - 0x03B9B8 24:B9A8: 22        .byte $22    ; <め>
- - - - - 0x03B9B9 24:B9A9: 20        .byte $20    ; <み>
- - - - - 0x03B9BA 24:B9AA: 22        .byte $22    ; <め>
- - - - - 0x03B9BB 24:B9AB: 22        .byte $22    ; <め>
- - - - - 0x03B9BC 24:B9AC: 22        .byte $22    ; <め>
- - - - - 0x03B9BD 24:B9AD: 22        .byte $22    ; <め>
- - - - - 0x03B9BE 24:B9AE: 22        .byte $22    ; <め>
- - - - - 0x03B9BF 24:B9AF: 00        .byte $00
- - - - - 0x03B9C0 24:B9B0: 00        .byte $00
- - - - - 0x03B9C1 24:B9B1: 00        .byte $00
- - - - - 0x03B9C2 24:B9B2: 20        .byte $20    ; <み>
- - - - - 0x03B9C3 24:B9B3: 00        .byte $00
- - - - - 0x03B9C4 24:B9B4: 00        .byte $00
- - - - - 0x03B9C5 24:B9B5: 00        .byte $00
- - - - - 0x03B9C6 24:B9B6: 11        .byte $11    ; <ち>
- - - - - 0x03B9C7 24:B9B7: 10        .byte $10    ; <た>
- - - - - 0x03B9C8 24:B9B8: 02        .byte $02    ; <い>
- - - - - 0x03B9C9 24:B9B9: 22        .byte $22    ; <め>
- - - - - 0x03B9CA 24:B9BA: 11        .byte $11    ; <ち>
- - - - - 0x03B9CB 24:B9BB: 10        .byte $10    ; <た>
- - - - - 0x03B9CC 24:B9BC: 22        .byte $22    ; <め>
- - - - - 0x03B9CD 24:B9BD: 22        .byte $22    ; <め>
- - - - - 0x03B9CE 24:B9BE: 11        .byte $11    ; <ち>
- - - - - 0x03B9CF 24:B9BF: 11        .byte $11    ; <ち>
- - - - - 0x03B9D0 24:B9C0: 10        .byte $10    ; <た>
- - - - - 0x03B9D1 24:B9C1: 22        .byte $22    ; <め>
- - - - - 0x03B9D2 24:B9C2: 11        .byte $11    ; <ち>
- - - - - 0x03B9D3 24:B9C3: 11        .byte $11    ; <ち>
- - - - - 0x03B9D4 24:B9C4: 02        .byte $02    ; <い>
- - - - - 0x03B9D5 24:B9C5: 22        .byte $22    ; <め>
- - - - - 0x03B9D6 24:B9C6: 11        .byte $11    ; <ち>
- - - - - 0x03B9D7 24:B9C7: 11        .byte $11    ; <ち>
- - - - - 0x03B9D8 24:B9C8: 00        .byte $00
- - - - - 0x03B9D9 24:B9C9: 22        .byte $22    ; <め>
- - - - - 0x03B9DA 24:B9CA: 11        .byte $11    ; <ち>
- - - - - 0x03B9DB 24:B9CB: 11        .byte $11    ; <ち>
- - - - - 0x03B9DC 24:B9CC: 10        .byte $10    ; <た>
- - - - - 0x03B9DD 24:B9CD: 02        .byte $02    ; <い>
- - - - - 0x03B9DE 24:B9CE: 33        .byte $33    ; <0>
- - - - - 0x03B9DF 24:B9CF: 33        .byte $33    ; <0>
- - - - - 0x03B9E0 24:B9D0: 33        .byte $33    ; <0>
- - - - - 0x03B9E1 24:B9D1: 33        .byte $33    ; <0>
- D - I - 0x03B9E2 24:B9D2: 33        .byte $33    ; <0>
- D - I - 0x03B9E3 24:B9D3: 33        .byte $33    ; <0>
- D - I - 0x03B9E4 24:B9D4: 33        .byte $33    ; <0>
- D - I - 0x03B9E5 24:B9D5: 33        .byte $33    ; <0>
- D - I - 0x03B9E6 24:B9D6: 33        .byte $33    ; <0>
- - - - - 0x03B9E7 24:B9D7: 33        .byte $33    ; <0>
- - - - - 0x03B9E8 24:B9D8: 33        .byte $33    ; <0>
- D - I - 0x03B9E9 24:B9D9: 33        .byte $33    ; <0>
- - - - - 0x03B9EA 24:B9DA: 33        .byte $33    ; <0>
- - - - - 0x03B9EB 24:B9DB: 33        .byte $33    ; <0>
- - - - - 0x03B9EC 24:B9DC: 33        .byte $33    ; <0>
- - - - - 0x03B9ED 24:B9DD: 33        .byte $33    ; <0>
- D - I - 0x03B9EE 24:B9DE: 33        .byte $33    ; <0>
- D - I - 0x03B9EF 24:B9DF: 33        .byte $33    ; <0>
- D - I - 0x03B9F0 24:B9E0: 33        .byte $33    ; <0>
- D - I - 0x03B9F1 24:B9E1: 33        .byte $33    ; <0>
- - - - - 0x03B9F2 24:B9E2: 33        .byte $33    ; <0>
- D - I - 0x03B9F3 24:B9E3: 33        .byte $33    ; <0>
- - - - - 0x03B9F4 24:B9E4: 33        .byte $33    ; <0>
- D - I - 0x03B9F5 24:B9E5: 33        .byte $33    ; <0>
- - - - - 0x03B9F6 24:B9E6: 11        .byte $11    ; <ち>
- - - - - 0x03B9F7 24:B9E7: 10        .byte $10    ; <た>
- - - - - 0x03B9F8 24:B9E8: 02        .byte $02    ; <い>
- - - - - 0x03B9F9 24:B9E9: 22        .byte $22    ; <め>
- - - - - 0x03B9FA 24:B9EA: 11        .byte $11    ; <ち>
- - - - - 0x03B9FB 24:B9EB: 10        .byte $10    ; <た>
- - - - - 0x03B9FC 24:B9EC: 22        .byte $22    ; <め>
- - - - - 0x03B9FD 24:B9ED: 22        .byte $22    ; <め>
- - - - - 0x03B9FE 24:B9EE: 11        .byte $11    ; <ち>
- - - - - 0x03B9FF 24:B9EF: 11        .byte $11    ; <ち>
- - - - - 0x03BA00 24:B9F0: 10        .byte $10    ; <た>
- - - - - 0x03BA01 24:B9F1: 22        .byte $22    ; <め>
- - - - - 0x03BA02 24:B9F2: 11        .byte $11    ; <ち>
- - - - - 0x03BA03 24:B9F3: 11        .byte $11    ; <ち>
- - - - - 0x03BA04 24:B9F4: 02        .byte $02    ; <い>
- - - - - 0x03BA05 24:B9F5: 22        .byte $22    ; <め>
- - - - - 0x03BA06 24:B9F6: 11        .byte $11    ; <ち>
- - - - - 0x03BA07 24:B9F7: 11        .byte $11    ; <ち>
- - - - - 0x03BA08 24:B9F8: 00        .byte $00
- - - - - 0x03BA09 24:B9F9: 22        .byte $22    ; <め>
- - - - - 0x03BA0A 24:B9FA: 11        .byte $11    ; <ち>
- - - - - 0x03BA0B 24:B9FB: 11        .byte $11    ; <ち>
- - - - - 0x03BA0C 24:B9FC: 10        .byte $10    ; <た>
- - - - - 0x03BA0D 24:B9FD: 02        .byte $02    ; <い>
- - - - - 0x03BA0E 24:B9FE: 22        .byte $22    ; <め>
- - - - - 0x03BA0F 24:B9FF: 00        .byte $00
- - - - - 0x03BA10 24:BA00: 11        .byte $11    ; <ち>
- - - - - 0x03BA11 24:BA01: 11        .byte $11    ; <ち>
- - - - - 0x03BA12 24:BA02: 22        .byte $22    ; <め>
- - - - - 0x03BA13 24:BA03: 20        .byte $20    ; <み>
- - - - - 0x03BA14 24:BA04: 00        .byte $00
- - - - - 0x03BA15 24:BA05: 11        .byte $11    ; <ち>
- - - - - 0x03BA16 24:BA06: 22        .byte $22    ; <め>
- - - - - 0x03BA17 24:BA07: 22        .byte $22    ; <め>
- - - - - 0x03BA18 24:BA08: 00        .byte $00
- - - - - 0x03BA19 24:BA09: 11        .byte $11    ; <ち>
- - - - - 0x03BA1A 24:BA0A: 22        .byte $22    ; <め>
- - - - - 0x03BA1B 24:BA0B: 22        .byte $22    ; <め>
- - - - - 0x03BA1C 24:BA0C: 20        .byte $20    ; <み>
- - - - - 0x03BA1D 24:BA0D: 01        .byte $01    ; <あ>
- - - - - 0x03BA1E 24:BA0E: 22        .byte $22    ; <め>
- - - - - 0x03BA1F 24:BA0F: 00        .byte $00
- - - - - 0x03BA20 24:BA10: 01        .byte $01    ; <あ>
- - - - - 0x03BA21 24:BA11: 11        .byte $11    ; <ち>
- - - - - 0x03BA22 24:BA12: 22        .byte $22    ; <め>
- - - - - 0x03BA23 24:BA13: 22        .byte $22    ; <め>
- - - - - 0x03BA24 24:BA14: 00        .byte $00
- - - - - 0x03BA25 24:BA15: 01        .byte $01    ; <あ>
- - - - - 0x03BA26 24:BA16: 11        .byte $11    ; <ち>
- - - - - 0x03BA27 24:BA17: 10        .byte $10    ; <た>
- - - - - 0x03BA28 24:BA18: 02        .byte $02    ; <い>
- - - - - 0x03BA29 24:BA19: 22        .byte $22    ; <め>
- - - - - 0x03BA2A 24:BA1A: 11        .byte $11    ; <ち>
- - - - - 0x03BA2B 24:BA1B: 10        .byte $10    ; <た>
- - - - - 0x03BA2C 24:BA1C: 22        .byte $22    ; <め>
- - - - - 0x03BA2D 24:BA1D: 22        .byte $22    ; <め>
- - - - - 0x03BA2E 24:BA1E: 11        .byte $11    ; <ち>
- - - - - 0x03BA2F 24:BA1F: 11        .byte $11    ; <ち>
- - - - - 0x03BA30 24:BA20: 10        .byte $10    ; <た>
- - - - - 0x03BA31 24:BA21: 22        .byte $22    ; <め>
- - - - - 0x03BA32 24:BA22: 11        .byte $11    ; <ち>
- - - - - 0x03BA33 24:BA23: 11        .byte $11    ; <ち>
- - - - - 0x03BA34 24:BA24: 02        .byte $02    ; <い>
- - - - - 0x03BA35 24:BA25: 22        .byte $22    ; <め>
- - - - - 0x03BA36 24:BA26: 11        .byte $11    ; <ち>
- - - - - 0x03BA37 24:BA27: 11        .byte $11    ; <ち>
- - - - - 0x03BA38 24:BA28: 00        .byte $00
- - - - - 0x03BA39 24:BA29: 22        .byte $22    ; <め>
- - - - - 0x03BA3A 24:BA2A: 11        .byte $11    ; <ち>
- - - - - 0x03BA3B 24:BA2B: 11        .byte $11    ; <ち>
- - - - - 0x03BA3C 24:BA2C: 10        .byte $10    ; <た>
- - - - - 0x03BA3D 24:BA2D: 02        .byte $02    ; <い>



tbl_BA2E:
- D - I - 0x03BA3E 24:BA2E: 11        .byte $11    ; <ち>
- D - I - 0x03BA3F 24:BA2F: 11        .byte $11    ; <ち>
- D - I - 0x03BA40 24:BA30: 10        .byte $10    ; <た>
- D - I - 0x03BA41 24:BA31: 00        .byte $00
- D - I - 0x03BA42 24:BA32: 33        .byte $33    ; <0>
- D - I - 0x03BA43 24:BA33: 33        .byte $33    ; <0>
- D - I - 0x03BA44 24:BA34: 33        .byte $33    ; <0>
- D - I - 0x03BA45 24:BA35: 44        .byte $44    ; <エ>
- D - I - 0x03BA46 24:BA36: 55        .byte $55    ; <ナ>
- D - I - 0x03BA47 24:BA37: 55        .byte $55    ; <ナ>
- D - I - 0x03BA48 24:BA38: 66        .byte $66    ; <ヨ>
- D - I - 0x03BA49 24:BA39: 66        .byte $66    ; <ヨ>
- D - I - 0x03BA4A 24:BA3A: 11        .byte $11    ; <ち>
- D - I - 0x03BA4B 24:BA3B: 11        .byte $11    ; <ち>
- D - I - 0x03BA4C 24:BA3C: 11        .byte $11    ; <ち>
- D - I - 0x03BA4D 24:BA3D: 00        .byte $00
- D - I - 0x03BA4E 24:BA3E: 33        .byte $33    ; <0>
- D - I - 0x03BA4F 24:BA3F: 33        .byte $33    ; <0>
- D - I - 0x03BA50 24:BA40: 33        .byte $33    ; <0>
- D - I - 0x03BA51 24:BA41: 34        .byte $34    ; <1>
- - - - - 0x03BA52 24:BA42: 66        .byte $66    ; <ヨ>
- - - - - 0x03BA53 24:BA43: 66        .byte $66    ; <ヨ>
- - - - - 0x03BA54 24:BA44: 66        .byte $66    ; <ヨ>
- - - - - 0x03BA55 24:BA45: 55        .byte $55    ; <ナ>
- - - - - 0x03BA56 24:BA46: 11        .byte $11    ; <ち>
- - - - - 0x03BA57 24:BA47: 00        .byte $00
- - - - - 0x03BA58 24:BA48: 00        .byte $00
- - - - - 0x03BA59 24:BA49: 00        .byte $00
- D - I - 0x03BA5A 24:BA4A: 33        .byte $33    ; <0>
- D - I - 0x03BA5B 24:BA4B: 44        .byte $44    ; <エ>
- D - I - 0x03BA5C 24:BA4C: 44        .byte $44    ; <エ>
- D - I - 0x03BA5D 24:BA4D: 44        .byte $44    ; <エ>
- - - - - 0x03BA5E 24:BA4E: 66        .byte $66    ; <ヨ>
- - - - - 0x03BA5F 24:BA4F: 55        .byte $55    ; <ナ>
- - - - - 0x03BA60 24:BA50: 55        .byte $55    ; <ナ>
- - - - - 0x03BA61 24:BA51: 55        .byte $55    ; <ナ>
- D - I - 0x03BA62 24:BA52: 11        .byte $11    ; <ち>
- D - I - 0x03BA63 24:BA53: 11        .byte $11    ; <ち>
- D - I - 0x03BA64 24:BA54: 11        .byte $11    ; <ち>
- D - I - 0x03BA65 24:BA55: 11        .byte $11    ; <ち>
- D - I - 0x03BA66 24:BA56: 44        .byte $44    ; <エ>
- - - - - 0x03BA67 24:BA57: 44        .byte $44    ; <エ>
- D - I - 0x03BA68 24:BA58: 44        .byte $44    ; <エ>
- - - - - 0x03BA69 24:BA59: 44        .byte $44    ; <エ>
- - - - - 0x03BA6A 24:BA5A: 66        .byte $66    ; <ヨ>
- - - - - 0x03BA6B 24:BA5B: 65        .byte $65    ; <ユ>
- - - - - 0x03BA6C 24:BA5C: 55        .byte $55    ; <ナ>
- - - - - 0x03BA6D 24:BA5D: 55        .byte $55    ; <ナ>
- D - I - 0x03BA6E 24:BA5E: 22        .byte $22    ; <め>
- D - I - 0x03BA6F 24:BA5F: 22        .byte $22    ; <め>
- D - I - 0x03BA70 24:BA60: 11        .byte $11    ; <ち>
- D - I - 0x03BA71 24:BA61: 11        .byte $11    ; <ち>
- - - - - 0x03BA72 24:BA62: 33        .byte $33    ; <0>
- D - I - 0x03BA73 24:BA63: 33        .byte $33    ; <0>
- - - - - 0x03BA74 24:BA64: 33        .byte $33    ; <0>
- D - I - 0x03BA75 24:BA65: 33        .byte $33    ; <0>
- - - - - 0x03BA76 24:BA66: 66        .byte $66    ; <ヨ>
- - - - - 0x03BA77 24:BA67: 66        .byte $66    ; <ヨ>
- - - - - 0x03BA78 24:BA68: 55        .byte $55    ; <ナ>
- - - - - 0x03BA79 24:BA69: 55        .byte $55    ; <ナ>
- D - I - 0x03BA7A 24:BA6A: 00        .byte $00
- D - I - 0x03BA7B 24:BA6B: 00        .byte $00
- D - I - 0x03BA7C 24:BA6C: 00        .byte $00
- D - I - 0x03BA7D 24:BA6D: 00        .byte $00
- - - - - 0x03BA7E 24:BA6E: 33        .byte $33    ; <0>
- - - - - 0x03BA7F 24:BA6F: 33        .byte $33    ; <0>
- - - - - 0x03BA80 24:BA70: 34        .byte $34    ; <1>
- - - - - 0x03BA81 24:BA71: 44        .byte $44    ; <エ>
- - - - - 0x03BA82 24:BA72: 66        .byte $66    ; <ヨ>
- - - - - 0x03BA83 24:BA73: 66        .byte $66    ; <ヨ>
- - - - - 0x03BA84 24:BA74: 55        .byte $55    ; <ナ>
- - - - - 0x03BA85 24:BA75: 55        .byte $55    ; <ナ>
- - - - - 0x03BA86 24:BA76: 11        .byte $11    ; <ち>
- - - - - 0x03BA87 24:BA77: 11        .byte $11    ; <ち>
- - - - - 0x03BA88 24:BA78: 10        .byte $10    ; <た>
- - - - - 0x03BA89 24:BA79: 00        .byte $00
- - - - - 0x03BA8A 24:BA7A: 33        .byte $33    ; <0>
- - - - - 0x03BA8B 24:BA7B: 33        .byte $33    ; <0>
- - - - - 0x03BA8C 24:BA7C: 34        .byte $34    ; <1>
- - - - - 0x03BA8D 24:BA7D: 44        .byte $44    ; <エ>
- - - - - 0x03BA8E 24:BA7E: 66        .byte $66    ; <ヨ>
- - - - - 0x03BA8F 24:BA7F: 66        .byte $66    ; <ヨ>
- - - - - 0x03BA90 24:BA80: 55        .byte $55    ; <ナ>
- - - - - 0x03BA91 24:BA81: 55        .byte $55    ; <ナ>
- - - - - 0x03BA92 24:BA82: 11        .byte $11    ; <ち>
- - - - - 0x03BA93 24:BA83: 11        .byte $11    ; <ち>
- - - - - 0x03BA94 24:BA84: 10        .byte $10    ; <た>
- - - - - 0x03BA95 24:BA85: 00        .byte $00
- - - - - 0x03BA96 24:BA86: 33        .byte $33    ; <0>
- - - - - 0x03BA97 24:BA87: 33        .byte $33    ; <0>
- - - - - 0x03BA98 24:BA88: 34        .byte $34    ; <1>
- - - - - 0x03BA99 24:BA89: 44        .byte $44    ; <エ>
- - - - - 0x03BA9A 24:BA8A: 66        .byte $66    ; <ヨ>
- - - - - 0x03BA9B 24:BA8B: 66        .byte $66    ; <ヨ>
- - - - - 0x03BA9C 24:BA8C: 55        .byte $55    ; <ナ>
- - - - - 0x03BA9D 24:BA8D: 55        .byte $55    ; <ナ>
- - - - - 0x03BA9E 24:BA8E: 11        .byte $11    ; <ち>
- - - - - 0x03BA9F 24:BA8F: 11        .byte $11    ; <ち>
- - - - - 0x03BAA0 24:BA90: 10        .byte $10    ; <た>
- - - - - 0x03BAA1 24:BA91: 00        .byte $00
- - - - - 0x03BAA2 24:BA92: 33        .byte $33    ; <0>
- - - - - 0x03BAA3 24:BA93: 33        .byte $33    ; <0>
- - - - - 0x03BAA4 24:BA94: 34        .byte $34    ; <1>
- - - - - 0x03BAA5 24:BA95: 44        .byte $44    ; <エ>
- - - - - 0x03BAA6 24:BA96: 66        .byte $66    ; <ヨ>
- - - - - 0x03BAA7 24:BA97: 66        .byte $66    ; <ヨ>
- - - - - 0x03BAA8 24:BA98: 55        .byte $55    ; <ナ>
- - - - - 0x03BAA9 24:BA99: 55        .byte $55    ; <ナ>
- - - - - 0x03BAAA 24:BA9A: 11        .byte $11    ; <ち>
- - - - - 0x03BAAB 24:BA9B: 11        .byte $11    ; <ち>
- - - - - 0x03BAAC 24:BA9C: 10        .byte $10    ; <た>
- - - - - 0x03BAAD 24:BA9D: 00        .byte $00
- - - - - 0x03BAAE 24:BA9E: 33        .byte $33    ; <0>
- - - - - 0x03BAAF 24:BA9F: 33        .byte $33    ; <0>
- - - - - 0x03BAB0 24:BAA0: 34        .byte $34    ; <1>
- - - - - 0x03BAB1 24:BAA1: 44        .byte $44    ; <エ>
- - - - - 0x03BAB2 24:BAA2: 66        .byte $66    ; <ヨ>
- - - - - 0x03BAB3 24:BAA3: 66        .byte $66    ; <ヨ>
- - - - - 0x03BAB4 24:BAA4: 55        .byte $55    ; <ナ>
- - - - - 0x03BAB5 24:BAA5: 55        .byte $55    ; <ナ>
- - - - - 0x03BAB6 24:BAA6: 11        .byte $11    ; <ち>
- - - - - 0x03BAB7 24:BAA7: 11        .byte $11    ; <ち>
- - - - - 0x03BAB8 24:BAA8: 10        .byte $10    ; <た>
- - - - - 0x03BAB9 24:BAA9: 00        .byte $00
- - - - - 0x03BABA 24:BAAA: 33        .byte $33    ; <0>
- - - - - 0x03BABB 24:BAAB: 33        .byte $33    ; <0>
- - - - - 0x03BABC 24:BAAC: 34        .byte $34    ; <1>
- - - - - 0x03BABD 24:BAAD: 44        .byte $44    ; <エ>
- - - - - 0x03BABE 24:BAAE: 66        .byte $66    ; <ヨ>
- - - - - 0x03BABF 24:BAAF: 66        .byte $66    ; <ヨ>
- - - - - 0x03BAC0 24:BAB0: 55        .byte $55    ; <ナ>
- - - - - 0x03BAC1 24:BAB1: 55        .byte $55    ; <ナ>



tbl_BAB2_параметры_команды_соперников:
    .word off_BAF6_00_Fluminense
    .word off_BB00_01_Corinthians
    .word off_BB0E_02_Gremio
    .word off_BB1C_03_Palmeiras
    .word off_BB2A_04_Santos
    .word off_BB38_05_Flamengo
    .word off_BB48_06_Kunimi
    .word off_BB56_07_Akita
    .word off_BB64_08_Tatsunami
    .word off_BB72_09_Musashi
    .word off_BB7C_0A_Furano
    .word off_BB88_0B_Toho
    .word off_BB9A_0C_AS_Roma
    .word off_BBA6_0D_Uruguay
    .word off_BBB4_0E_Hamburger_SV
    .word off_BBC6_0F_Japan
    .word off_BBE6_10_Syria
    .word off_BBF0_11_China
    .word off_BBFE_12_Iran
    .word off_BC08_13_North_Korea
    .word off_BC12_14_Saudi_Arabia
    .word off_BC1C_15_South_Korea
    .word off_BC2A_16_Turkey
    .word off_BC34_17_Poland
    .word off_BC42_18_England
    .word off_BC50_19_Soviet_Union
    .word off_BC5E_1A_France
    .word off_BC6C_1B_Mexico
    .word off_BC78_1C_Italy
    .word off_BC86_1D_Netherlands
    .word off_BC94_1E_Argentina
    .word off_BCA8_1F_West_Germany
    .word off_BCC0_20_Brazil

con_закончить       = $FF
con_formation       = $00
con_defense         = $00

off_BAF6_00_Fluminense:
- D - I - 0x03BB06 24:BAF6: 00        .byte con_formation + $00
- - - - - 0x03BB07 24:BAF7: 00        .byte con_defense + $00
- D - I - 0x03BB08 24:BAF8: 76        .byte $76     ; 02 GK 0x038A7F 0x03805A
- D - I - 0x03BB09 24:BAF9: 77        .byte $77     ; 03 DF 0x038A7F 0x03805A
- D - I - 0x03BB0A 24:BAFA: 77        .byte $77     ; 04 MF 0x038A7F 0x03805A
- D - I - 0x03BB0B 24:BAFB: 78        .byte $78     ; 05 FW 0x038A7F 0x03805A
- D - I - 0x03BB0C 24:BAFC: A0        .byte $A0     ; 06 0x03853E
- D - I - 0x03BB0D 24:BAFD: 1F        .byte $1F     ; 07 0x03855B
- D - I - 0x03BB0E 24:BAFE: 1F        .byte $1F     ; 08 0x038593

    .byte con_закончить



off_BB00_01_Corinthians:
- D - I - 0x03BB10 24:BB00: 03        .byte con_formation + $03
- - - - - 0x03BB11 24:BB01: 00        .byte con_defense + $00
- D - I - 0x03BB12 24:BB02: 79        .byte $79     ; 02 GK
- D - I - 0x03BB13 24:BB03: 7A        .byte $7A     ; 03 DF
- D - I - 0x03BB14 24:BB04: 7A        .byte $7A     ; 04 MF
- D - I - 0x03BB15 24:BB05: 7B        .byte $7B     ; 05 FW
- D - I - 0x03BB16 24:BB06: A0        .byte $A0     ; 06 
- D - I - 0x03BB17 24:BB07: 1E        .byte $1E     ; 07 
- D - I - 0x03BB18 24:BB08: 1E        .byte $1E     ; 08 

    .byte $0A
    .byte $24
    
    .byte $09
    .byte $23
    
    .byte con_закончить



off_BB0E_02_Gremio:
- D - I - 0x03BB1E 24:BB0E: 21        .byte con_formation + $01
- - - - - 0x03BB1F 24:BB0F: 00        .byte con_defense + $02
- - - - - 0x03BB20 24:BB10: 76        .byte $76     ; 02 GK
- D - I - 0x03BB21 24:BB11: 7C        .byte $7C     ; 03 DF
- D - I - 0x03BB22 24:BB12: 7D        .byte $7D     ; 04 MF
- D - I - 0x03BB23 24:BB13: 7D        .byte $7D     ; 05 FW
- - - - - 0x03BB24 24:BB14: A0        .byte $A0     ; 06 
- - - - - 0x03BB25 24:BB15: 1F        .byte $1F     ; 07 
- - - - - 0x03BB26 24:BB16: 1E        .byte $1E     ; 08 

    .byte $09
    .byte $25
    
    .byte $01
    .byte $26
    
    .byte con_закончить



off_BB1C_03_Palmeiras:
- D - I - 0x03BB2C 24:BB1C: 20        .byte con_formation + $00
- - - - - 0x03BB2D 24:BB1D: 00        .byte con_defense + $02
- D - I - 0x03BB2E 24:BB1E: 7E        .byte $7E     ; 02 GK
- D - I - 0x03BB2F 24:BB1F: 7F        .byte $7F     ; 03 DF
- D - I - 0x03BB30 24:BB20: 80        .byte $80     ; 04 MF
- D - I - 0x03BB31 24:BB21: 80        .byte $80     ; 05 FW
- - - - - 0x03BB32 24:BB22: B0        .byte $B0     ; 06 
- - - - - 0x03BB33 24:BB23: 1F        .byte $1F     ; 07 
- - - - - 0x03BB34 24:BB24: 1E        .byte $1E     ; 08 

    .byte $09
    .byte $27
    
    .byte $0B
    .byte $28
    
    .byte con_закончить



off_BB2A_04_Santos:
- D - I - 0x03BB3A 24:BB2A: 21        .byte con_formation + $01
- - - - - 0x03BB3B 24:BB2B: 00        .byte con_defense + $02
- D - I - 0x03BB3C 24:BB2C: 81        .byte $81     ; 02 GK
- D - I - 0x03BB3D 24:BB2D: 82        .byte $82     ; 03 DF
- D - I - 0x03BB3E 24:BB2E: 83        .byte $83     ; 04 MF
- D - I - 0x03BB3F 24:BB2F: 83        .byte $83     ; 05 FW
- - - - - 0x03BB40 24:BB30: 91        .byte $91     ; 06 
- - - - - 0x03BB41 24:BB31: 1F        .byte $1F     ; 07 
- - - - - 0x03BB42 24:BB32: 1D        .byte $1D     ; 08 

    .byte $09
    .byte $29
    
    .byte $04
    .byte $2A
    
    .byte con_закончить



off_BB38_05_Flamengo:
- D - I - 0x03BB48 24:BB38: 03        .byte con_formation + $03
- - - - - 0x03BB49 24:BB39: 00        .byte con_defense + $00
- D - I - 0x03BB4A 24:BB3A: 84        .byte $84     ; 02 GK
- D - I - 0x03BB4B 24:BB3B: 85        .byte $85     ; 03 DF
- D - I - 0x03BB4C 24:BB3C: 86        .byte $86     ; 04 MF
- D - I - 0x03BB4D 24:BB3D: 86        .byte $86     ; 05 FW
- D - I - 0x03BB4E 24:BB3E: 60        .byte $60     ; 06 
- D - I - 0x03BB4F 24:BB3F: 1E        .byte $1E     ; 07 
- D - I - 0x03BB50 24:BB40: 1F        .byte $1F     ; 08 

    .byte $0A
    .byte $2B
    
    .byte $06
    .byte $2C
    
    .byte $02
    .byte $2D
    
    .byte con_закончить



off_BB48_06_Kunimi:
- D - I - 0x03BB58 24:BB48: 00        .byte con_formation + $00
- - - - - 0x03BB59 24:BB49: 00        .byte con_defense + $00
- D - I - 0x03BB5A 24:BB4A: 87        .byte $87     ; 02 GK
- D - I - 0x03BB5B 24:BB4B: 88        .byte $88     ; 03 DF
- D - I - 0x03BB5C 24:BB4C: 89        .byte $89     ; 04 MF
- D - I - 0x03BB5D 24:BB4D: 89        .byte $89     ; 05 FW
- D - I - 0x03BB5E 24:BB4E: 91        .byte $91     ; 06 
- D - I - 0x03BB5F 24:BB4F: 1F        .byte $1F     ; 07 
- D - I - 0x03BB60 24:BB50: 1D        .byte $1D     ; 08 

    .byte $04
    .byte $2E
    
    .byte $09
    .byte $2F
    
    .byte con_закончить



off_BB56_07_Akita:
- D - I - 0x03BB66 24:BB56: 21        .byte con_formation + $01
- - - - - 0x03BB67 24:BB57: 00        .byte con_defense + $02
- D - I - 0x03BB68 24:BB58: 8A        .byte $8A     ; 02 GK
- D - I - 0x03BB69 24:BB59: 8B        .byte $8B     ; 03 DF
- D - I - 0x03BB6A 24:BB5A: 8C        .byte $8C     ; 04 MF
- D - I - 0x03BB6B 24:BB5B: 8C        .byte $8C     ; 05 FW
- - - - - 0x03BB6C 24:BB5C: A0        .byte $A0     ; 06 
- - - - - 0x03BB6D 24:BB5D: 1F        .byte $1F     ; 07 
- - - - - 0x03BB6E 24:BB5E: 1E        .byte $1E     ; 08 

    .byte $09
    .byte $30
    
    .byte $0B
    .byte $31
    
    .byte con_закончить



off_BB64_08_Tatsunami:
- D - I - 0x03BB74 24:BB64: 01        .byte con_formation + $01
- - - - - 0x03BB75 24:BB65: 00        .byte con_defense + $00
- - - - - 0x03BB76 24:BB66: 76        .byte $76     ; 02 GK
- D - I - 0x03BB77 24:BB67: 8D        .byte $8D     ; 03 DF
- D - I - 0x03BB78 24:BB68: 8D        .byte $8D     ; 04 MF
- D - I - 0x03BB79 24:BB69: 8E        .byte $8E     ; 05 FW
- D - I - 0x03BB7A 24:BB6A: 40        .byte $40     ; 06 
- D - I - 0x03BB7B 24:BB6B: 1E        .byte $1E     ; 07 
- - - - - 0x03BB7C 24:BB6C: 1E        .byte $1E     ; 08 

    .byte $04
    .byte $32
    
    .byte $01
    .byte $33
    
    .byte con_закончить



off_BB72_09_Musashi:
- D - I - 0x03BB82 24:BB72: 02        .byte con_formation + $02
- - - - - 0x03BB83 24:BB73: 00        .byte con_defense + $00
- D - I - 0x03BB84 24:BB74: 8F        .byte $8F     ; 02 GK
- D - I - 0x03BB85 24:BB75: 90        .byte $90     ; 03 DF
- D - I - 0x03BB86 24:BB76: 91        .byte $91     ; 04 MF
- D - I - 0x03BB87 24:BB77: 91        .byte $91     ; 05 FW
- - - - - 0x03BB88 24:BB78: 70        .byte $70     ; 06 
- - - - - 0x03BB89 24:BB79: 1F        .byte $1F     ; 07 
- - - - - 0x03BB8A 24:BB7A: 1C        .byte $1C     ; 08 

    .byte con_закончить



off_BB7C_0A_Furano:
- D - I - 0x03BB8C 24:BB7C: 00        .byte con_formation + $00
- - - - - 0x03BB8D 24:BB7D: 00        .byte con_defense + $00
- D - I - 0x03BB8E 24:BB7E: 92        .byte $92     ; 02 GK
- D - I - 0x03BB8F 24:BB7F: 93        .byte $93     ; 03 DF
- D - I - 0x03BB90 24:BB80: 94        .byte $94     ; 04 MF
- D - I - 0x03BB91 24:BB81: 94        .byte $94     ; 05 FW
- D - I - 0x03BB92 24:BB82: 70        .byte $70     ; 06 
- D - I - 0x03BB93 24:BB83: 1F        .byte $1F     ; 07 
- - - - - 0x03BB94 24:BB84: 1F        .byte $1F     ; 08 

    .byte $0A
    .byte $35
    
    .byte con_закончить



off_BB88_0B_Toho:
- D - I - 0x03BB98 24:BB88: 03        .byte con_formation + $03
- - - - - 0x03BB99 24:BB89: 00        .byte con_defense + $00
- - - - - 0x03BB9A 24:BB8A: 76        .byte $76     ; 02 GK
- D - I - 0x03BB9B 24:BB8B: 95        .byte $95     ; 03 DF
- D - I - 0x03BB9C 24:BB8C: 96        .byte $96     ; 04 MF
- D - I - 0x03BB9D 24:BB8D: 96        .byte $96     ; 05 FW
- D - I - 0x03BB9E 24:BB8E: 60        .byte $60     ; 06 
- D - I - 0x03BB9F 24:BB8F: 1F        .byte $1F     ; 07 
- D - I - 0x03BBA0 24:BB90: 1E        .byte $1E     ; 08 

    .byte $09
    .byte $36
    
    .byte $0A
    .byte $37
    
    .byte $06
    .byte $38
    
    .byte $01
    .byte $39
    
    .byte con_закончить



off_BB9A_0C_AS_Roma:
- D - I - 0x03BBAA 24:BB9A: 20        .byte con_formation + $00
- - - - - 0x03BBAB 24:BB9B: 00        .byte con_defense + $02
- D - I - 0x03BBAC 24:BB9C: 97        .byte $97     ; 02 GK
- D - I - 0x03BBAD 24:BB9D: 98        .byte $98     ; 03 DF
- D - I - 0x03BBAE 24:BB9E: 99        .byte $99     ; 04 MF
- D - I - 0x03BBAF 24:BB9F: 99        .byte $99     ; 05 FW
- - - - - 0x03BBB0 24:BBA0: A0        .byte $A0     ; 06 
- - - - - 0x03BBB1 24:BBA1: 1F        .byte $1F     ; 07 
- - - - - 0x03BBB2 24:BBA2: 1E        .byte $1E     ; 08 

    .byte $09
    .byte $3A
    
    .byte con_закончить



off_BBA6_0D_Uruguay:
- D - I - 0x03BBB6 24:BBA6: 01        .byte con_formation + $01
- - - - - 0x03BBB7 24:BBA7: 00        .byte con_defense + $00
- D - I - 0x03BBB8 24:BBA8: 9A        .byte $9A     ; 02 GK
- D - I - 0x03BBB9 24:BBA9: 9B        .byte $9B     ; 03 DF
- D - I - 0x03BBBA 24:BBAA: 9C        .byte $9C     ; 04 MF
- D - I - 0x03BBBB 24:BBAB: 9C        .byte $9C     ; 05 FW
- D - I - 0x03BBBC 24:BBAC: A0        .byte $A0     ; 06 
- D - I - 0x03BBBD 24:BBAD: 1F        .byte $1F     ; 07 
- D - I - 0x03BBBE 24:BBAE: 1F        .byte $1F     ; 08 

    .byte $0B
    .byte $3B
    
    .byte $09
    .byte $3C
    
    .byte con_закончить



off_BBB4_0E_Hamburger_SV:
- D - I - 0x03BBC4 24:BBB4: 03        .byte con_formation + $03
- - - - - 0x03BBC5 24:BBB5: 00        .byte con_defense + $00
- - - - - 0x03BBC6 24:BBB6: 76        .byte $76     ; 02 GK
- D - I - 0x03BBC7 24:BBB7: 9D        .byte $9D     ; 03 DF
- D - I - 0x03BBC8 24:BBB8: 9E        .byte $9E     ; 04 MF
- D - I - 0x03BBC9 24:BBB9: 9E        .byte $9E     ; 05 FW
- D - I - 0x03BBCA 24:BBBA: 70        .byte $70     ; 06 
- D - I - 0x03BBCB 24:BBBB: 1E        .byte $1E     ; 07 
- - - - - 0x03BBCC 24:BBBC: 1E        .byte $1E     ; 08 

    .byte $07
    .byte $3D
    
    .byte $0A
    .byte $3E
    
    .byte $06
    .byte $3F
    
    .byte $01
    .byte $40
    
    .byte con_закончить



off_BBC6_0F_Japan:
- D - I - 0x03BBD6 24:BBC6: 01        .byte con_formation + $01
- - - - - 0x03BBD7 24:BBC7: 00        .byte con_defense + $00
- - - - - 0x03BBD8 24:BBC8: 76        .byte $76     ; 02 GK
- - - - - 0x03BBD9 24:BBC9: 77        .byte $77     ; 03 DF
- - - - - 0x03BBDA 24:BBCA: 78        .byte $78     ; 04 MF
- - - - - 0x03BBDB 24:BBCB: 79        .byte $79     ; 05 FW
- D - I - 0x03BBDC 24:BBCC: 30        .byte $30     ; 06 
- D - I - 0x03BBDD 24:BBCD: 1F        .byte $1F     ; 07 
- D - I - 0x03BBDE 24:BBCE: 1B        .byte $1B     ; 08 

    .byte $09
    .byte $41
    
    .byte $0B
    .byte $42
    
    .byte $06
    .byte $43
    
    .byte $0A
    .byte $44
    
    .byte $08
    .byte $46
    
    .byte $07
    .byte $47
    
    .byte $02
    .byte $48
    
    .byte $04
    .byte $49
    
    .byte $03
    .byte $4A
    
    .byte $05
    .byte $4B
    
    .byte $01
    .byte $4C
    
    .byte con_закончить



off_BBE6_10_Syria:
- D - I - 0x03BBF6 24:BBE6: 23        .byte con_formation + $03
- - - - - 0x03BBF7 24:BBE7: 00        .byte con_defense + $02
- D - I - 0x03BBF8 24:BBE8: 9F        .byte $9F     ; 02 GK
- D - I - 0x03BBF9 24:BBE9: A0        .byte $A0     ; 03 DF
- D - I - 0x03BBFA 24:BBEA: A0        .byte $A0     ; 04 MF
- D - I - 0x03BBFB 24:BBEB: A1        .byte $A1     ; 05 FW
- D - I - 0x03BBFC 24:BBEC: A0        .byte $A0     ; 06 
- D - I - 0x03BBFD 24:BBED: 1F        .byte $1F     ; 07 
- D - I - 0x03BBFE 24:BBEE: 1F        .byte $1F     ; 08 

    .byte con_закончить



off_BBF0_11_China:
- D - I - 0x03BC00 24:BBF0: 01        .byte con_formation + $01
- - - - - 0x03BC01 24:BBF1: 00        .byte con_defense + $00
- D - I - 0x03BC02 24:BBF2: A2        .byte $A2     ; 02 GK
- D - I - 0x03BC03 24:BBF3: A3        .byte $A3     ; 03 DF
- D - I - 0x03BC04 24:BBF4: A4        .byte $A4     ; 04 MF
- D - I - 0x03BC05 24:BBF5: A4        .byte $A4     ; 05 FW
- D - I - 0x03BC06 24:BBF6: A0        .byte $A0     ; 06 
- D - I - 0x03BC07 24:BBF7: 1F        .byte $1F     ; 07 
- D - I - 0x03BC08 24:BBF8: 1E        .byte $1E     ; 08 

    .byte $0B
    .byte $4D
    
    .byte $09
    .byte $4E
    
    .byte con_закончить



off_BBFE_12_Iran:
- D - I - 0x03BC0E 24:BBFE: 00        .byte con_formation + $00
- D - I - 0x03BC0F 24:BBFF: 00        .byte con_defense + $00
- D - I - 0x03BC10 24:BC00: A5        .byte $A5     ; 02 GK
- D - I - 0x03BC11 24:BC01: A6        .byte $A6     ; 03 DF
- D - I - 0x03BC12 24:BC02: A7        .byte $A7     ; 04 MF
- D - I - 0x03BC13 24:BC03: A7        .byte $A7     ; 05 FW
- D - I - 0x03BC14 24:BC04: A1        .byte $A1     ; 06 
- D - I - 0x03BC15 24:BC05: 1F        .byte $1F     ; 07 
- - - - - 0x03BC16 24:BC06: 1D        .byte $1D     ; 08 

    .byte con_закончить



off_BC08_13_North_Korea:
- D - I - 0x03BC18 24:BC08: 02        .byte con_formation + $02
- - - - - 0x03BC19 24:BC09: 00        .byte con_defense + $00
- D - I - 0x03BC1A 24:BC0A: A8        .byte $A8     ; 02 GK
- D - I - 0x03BC1B 24:BC0B: A9        .byte $A9     ; 03 DF
- D - I - 0x03BC1C 24:BC0C: AA        .byte $AA     ; 04 MF
- D - I - 0x03BC1D 24:BC0D: AA        .byte $AA     ; 05 FW
- D - I - 0x03BC1E 24:BC0E: A0        .byte $A0     ; 06 
- D - I - 0x03BC1F 24:BC0F: 00        .byte $00     ; 07 
- D - I - 0x03BC20 24:BC10: 00        .byte $00     ; 08 

    .byte con_закончить



off_BC12_14_Saudi_Arabia:
- D - I - 0x03BC22 24:BC12: 13        .byte con_formation + $03
- - - - - 0x03BC23 24:BC13: 00        .byte con_defense + $01
- D - I - 0x03BC24 24:BC14: AB        .byte $AB     ; 02 GK
- D - I - 0x03BC25 24:BC15: AC        .byte $AC     ; 03 DF
- D - I - 0x03BC26 24:BC16: AD        .byte $AD     ; 04 MF
- D - I - 0x03BC27 24:BC17: AD        .byte $AD     ; 05 FW
- D - I - 0x03BC28 24:BC18: A0        .byte $A0     ; 06 
- D - I - 0x03BC29 24:BC19: 1F        .byte $1F     ; 07 
- D - I - 0x03BC2A 24:BC1A: 1F        .byte $1F     ; 08 

    .byte con_закончить



off_BC1C_15_South_Korea:
- D - I - 0x03BC2C 24:BC1C: 00        .byte con_formation + $00
- - - - - 0x03BC2D 24:BC1D: 00        .byte con_defense + $00
- D - I - 0x03BC2E 24:BC1E: AE        .byte $AE     ; 02 GK
- D - I - 0x03BC2F 24:BC1F: AF        .byte $AF     ; 03 DF
- D - I - 0x03BC30 24:BC20: B0        .byte $B0     ; 04 MF
- D - I - 0x03BC31 24:BC21: B0        .byte $B0     ; 05 FW
- D - I - 0x03BC32 24:BC22: 70        .byte $70     ; 06 
- D - I - 0x03BC33 24:BC23: 1F        .byte $1F     ; 07 
- D - I - 0x03BC34 24:BC24: 1C        .byte $1C     ; 08 

    .byte $09
    .byte $4F
    
    .byte $0A
    .byte $50
    
    .byte con_закончить



off_BC2A_16_Turkey:
- D - I - 0x03BC3A 24:BC2A: 23        .byte con_formation + $03
- - - - - 0x03BC3B 24:BC2B: 00        .byte con_defense + $02
- D - I - 0x03BC3C 24:BC2C: B1        .byte $B1     ; 02 GK
- D - I - 0x03BC3D 24:BC2D: B2        .byte $B2     ; 03 DF
- D - I - 0x03BC3E 24:BC2E: B2        .byte $B2     ; 04 MF
- D - I - 0x03BC3F 24:BC2F: B2        .byte $B2     ; 05 FW
- - - - - 0x03BC40 24:BC30: A0        .byte $A0     ; 06 
- D - I - 0x03BC41 24:BC31: 1F        .byte $1F     ; 07 
- - - - - 0x03BC42 24:BC32: 1F        .byte $1F     ; 08 

    .byte con_закончить



off_BC34_17_Poland:
- D - I - 0x03BC44 24:BC34: 21        .byte con_formation + $01
- - - - - 0x03BC45 24:BC35: 00        .byte con_defense + $02
- - - - - 0x03BC46 24:BC36: 76        .byte $76     ; 02 GK
- D - I - 0x03BC47 24:BC37: B3        .byte $B3     ; 03 DF
- D - I - 0x03BC48 24:BC38: B4        .byte $B4     ; 04 MF
- D - I - 0x03BC49 24:BC39: B4        .byte $B4     ; 05 FW
- - - - - 0x03BC4A 24:BC3A: A0        .byte $A0     ; 06 
- - - - - 0x03BC4B 24:BC3B: 1F        .byte $1F     ; 07 
- - - - - 0x03BC4C 24:BC3C: 1F        .byte $1F     ; 08 

    .byte $0B
    .byte $51
    
    .byte $01
    .byte $52
    
    .byte con_закончить



off_BC42_18_England:
- D - I - 0x03BC52 24:BC42: 00        .byte con_formation + $00
- - - - - 0x03BC53 24:BC43: 00        .byte con_defense + $00
- D - I - 0x03BC54 24:BC44: B5        .byte $B5     ; 02 GK
- D - I - 0x03BC55 24:BC45: B6        .byte $B6     ; 03 DF
- D - I - 0x03BC56 24:BC46: B7        .byte $B7     ; 04 MF
- D - I - 0x03BC57 24:BC47: B7        .byte $B7     ; 05 FW
- D - I - 0x03BC58 24:BC48: A1        .byte $A1     ; 06 
- D - I - 0x03BC59 24:BC49: 1F        .byte $1F     ; 07 
- D - I - 0x03BC5A 24:BC4A: 1D        .byte $1D     ; 08 

    .byte $09
    .byte $53
    
    .byte $04
    .byte $54
    
    .byte con_закончить



off_BC50_19_Soviet_Union:
- D - I - 0x03BC60 24:BC50: 12        .byte con_formation + $02
- - - - - 0x03BC61 24:BC51: 00        .byte con_defense + $01
- - - - - 0x03BC62 24:BC52: 76        .byte $76     ; 02 GK
- D - I - 0x03BC63 24:BC53: B8        .byte $B8     ; 03 DF
- D - I - 0x03BC64 24:BC54: B9        .byte $B9     ; 04 MF
- D - I - 0x03BC65 24:BC55: B9        .byte $B9     ; 05 FW
- D - I - 0x03BC66 24:BC56: A0        .byte $A0     ; 06 
- D - I - 0x03BC67 24:BC57: 1F        .byte $1F     ; 07 
- D - I - 0x03BC68 24:BC58: 1E        .byte $1E     ; 08 

    .byte $09
    .byte $55
    
    .byte $01
    .byte $56
    
    .byte con_закончить



off_BC5E_1A_France:
- D - I - 0x03BC6E 24:BC5E: 11        .byte con_formation + $01
- - - - - 0x03BC6F 24:BC5F: 00        .byte con_defense + $01
- D - I - 0x03BC70 24:BC60: BA        .byte $BA     ; 02 GK
- D - I - 0x03BC71 24:BC61: BB        .byte $BB     ; 03 DF
- D - I - 0x03BC72 24:BC62: BC        .byte $BC     ; 04 MF
- D - I - 0x03BC73 24:BC63: BC        .byte $BC     ; 05 FW
- - - - - 0x03BC74 24:BC64: 70        .byte $70     ; 06 
- - - - - 0x03BC75 24:BC65: 1F        .byte $1F     ; 07 
- - - - - 0x03BC76 24:BC66: 1E        .byte $1E     ; 08 

    .byte $09
    .byte $57
    
    .byte $0A
    .byte $58
    
    .byte con_закончить



off_BC6C_1B_Mexico:
- D - I - 0x03BC7C 24:BC6C: 20        .byte con_formation + $00
- - - - - 0x03BC7D 24:BC6D: 00        .byte con_defense + $02
- D - I - 0x03BC7E 24:BC6E: BD        .byte $BD     ; 02 GK
- D - I - 0x03BC7F 24:BC6F: BE        .byte $BE     ; 03 DF
- D - I - 0x03BC80 24:BC70: BF        .byte $BF     ; 04 MF
- D - I - 0x03BC81 24:BC71: BF        .byte $BF     ; 05 FW
- D - I - 0x03BC82 24:BC72: 70        .byte $70     ; 06 
- D - I - 0x03BC83 24:BC73: 1F        .byte $1F     ; 07 
- D - I - 0x03BC84 24:BC74: 1C        .byte $1C     ; 08 

    .byte $0A
    .byte $59
    
    .byte con_закончить



off_BC78_1C_Italy:
- D - I - 0x03BC88 24:BC78: 21        .byte con_formation + $01
- - - - - 0x03BC89 24:BC79: 00        .byte con_defense + $02
- - - - - 0x03BC8A 24:BC7A: 76        .byte $76     ; 02 GK
- D - I - 0x03BC8B 24:BC7B: C0        .byte $C0     ; 03 DF
- D - I - 0x03BC8C 24:BC7C: C1        .byte $C1     ; 04 MF
- D - I - 0x03BC8D 24:BC7D: C1        .byte $C1     ; 05 FW
- - - - - 0x03BC8E 24:BC7E: A0        .byte $A0     ; 06 
- - - - - 0x03BC8F 24:BC7F: 1F        .byte $1F     ; 07 
- - - - - 0x03BC90 24:BC80: 1E        .byte $1E     ; 08 

    .byte $09
    .byte $5A
    
    .byte $01
    .byte $5B
    
    .byte con_закончить



off_BC86_1D_Netherlands:
- D - I - 0x03BC96 24:BC86: 10        .byte con_formation + $00
- - - - - 0x03BC97 24:BC87: 00        .byte con_defense + $01
- D - I - 0x03BC98 24:BC88: C2        .byte $C2     ; 02 GK
- D - I - 0x03BC99 24:BC89: C3        .byte $C3     ; 03 DF
- D - I - 0x03BC9A 24:BC8A: C4        .byte $C4     ; 04 MF
- D - I - 0x03BC9B 24:BC8B: C4        .byte $C4     ; 05 FW
- - - - - 0x03BC9C 24:BC8C: 71        .byte $71     ; 06 
- - - - - 0x03BC9D 24:BC8D: 1F        .byte $1F     ; 07 
- - - - - 0x03BC9E 24:BC8E: 1D        .byte $1D     ; 08 

    .byte $09
    .byte $5C
    
    .byte $04
    .byte $5D
    
    .byte con_закончить



off_BC94_1E_Argentina:
- D - I - 0x03BCA4 24:BC94: 02        .byte con_formation + $02
- - - - - 0x03BCA5 24:BC95: 00        .byte con_defense + $00
- D - I - 0x03BCA6 24:BC96: C5        .byte $C5     ; 02 GK
- D - I - 0x03BCA7 24:BC97: C6        .byte $C6     ; 03 DF
- D - I - 0x03BCA8 24:BC98: C6        .byte $C6     ; 04 MF
- D - I - 0x03BCA9 24:BC99: C6        .byte $C6     ; 05 FW
- D - I - 0x03BCAA 24:BC9A: B0        .byte $B0     ; 06 
- D - I - 0x03BCAB 24:BC9B: 1F        .byte $1F     ; 07 
- D - I - 0x03BCAC 24:BC9C: 1A        .byte $1A     ; 08 

    .byte $0B
    .byte $5E
    
    .byte $09
    .byte $5F
    
    .byte $0A
    .byte $60
    
    .byte $08
    .byte $61
    
    .byte $04
    .byte $62
    
    .byte con_закончить



off_BCA8_1F_West_Germany:
- D - I - 0x03BCB8 24:BCA8: 02        .byte con_formation + $02
- - - - - 0x03BCB9 24:BCA9: 00        .byte con_defense + $00
- - - - - 0x03BCBA 24:BCAA: 76        .byte $76     ; 02 GK
- D - I - 0x03BCBB 24:BCAB: C7        .byte $C7     ; 03 DF
- D - I - 0x03BCBC 24:BCAC: C7        .byte $C7     ; 04 MF
- - - - - 0x03BCBD 24:BCAD: C7        .byte $C7     ; 05 FW
- D - I - 0x03BCBE 24:BCAE: 70        .byte $70     ; 06 
- D - I - 0x03BCBF 24:BCAF: 1E        .byte $1E     ; 07 
- - - - - 0x03BCC0 24:BCB0: 1F        .byte $1F     ; 08 

    .byte $0B
    .byte $63
    
    .byte $09
    .byte $64
    
    .byte $08
    .byte $65
    
    .byte $05
    .byte $66
    
    .byte $0A
    .byte $67
    
    .byte $07
    .byte $68
    
    .byte $01
    .byte $69
    
    .byte con_закончить



off_BCC0_20_Brazil:
- D - I - 0x03BCD0 24:BCC0: 03        .byte con_formation + $03
- - - - - 0x03BCD1 24:BCC1: 00        .byte con_defense + $00
- - - - - 0x03BCD2 24:BCC2: 76        .byte $76     ; 02 GK
- - - - - 0x03BCD3 24:BCC3: 77        .byte $77     ; 03 DF
- - - - - 0x03BCD4 24:BCC4: 78        .byte $78     ; 04 MF
- - - - - 0x03BCD5 24:BCC5: 79        .byte $79     ; 05 FW
- D - I - 0x03BCD6 24:BCC6: 61        .byte $61     ; 06 
- D - I - 0x03BCD7 24:BCC7: 1E        .byte $1E     ; 07 
- - - - - 0x03BCD8 24:BCC8: 28        .byte $28     ; 08 

    .byte $09
    .byte $6A
    
    .byte $07
    .byte $6B
    
    .byte $0A
    .byte $6C
    
    .byte $0B
    .byte $6D
    
    .byte $06
    .byte $6E
    
    .byte $08
    .byte $6F
    
    .byte $03
    .byte $70
    
    .byte $04
    .byte $71
    
    .byte $05
    .byte $72
    
    .byte $02
    .byte $73
    
    .byte $01
    .byte $74
    
    .byte con_закончить
