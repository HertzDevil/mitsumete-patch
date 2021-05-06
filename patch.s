.segment "SONG3E"
SONG3E:
	.incbin	"song/song.bin"

.segment "SONG3E_PTR"
	.faraddr	SONG3E



.segment "SPC_BGM_SETTINGS3E"
	.byte	133 ; bpm
	.byte	160 ; master volume



.segment "SAMPLE_LOAD_LIST3E"
SAMPLE_LOAD_LIST3E:
	.byte	$18, $0D
	.byte	$19, $55
	.byte	$1A, $12
	.byte	$1B, $5E
	.byte	$1C, $0F
	.byte	$1D, $19
	.byte	$1E, $14
	.byte	$1F, $60
	.byte	$20, $0E
	.byte	$FD

.segment "SAMPLE_LOAD_LIST3E_PTR"
	.addr	SAMPLE_LOAD_LIST3E



.segment "ROBOT_BGM_LIST"
ROBOT_BGM_LIST:
	.byte	$84, $99, $97, $96
	.byte	$86, $85, $91, $8C
	.byte	$8B, $8F, $88, $98
	.byte	$90, $87, $89, $8E

	.byte	$9C, $92, $80 | $3E, $81
	.byte	$81, $81, $81, $81
	.byte	$81, $81, $81, $81
ROBOT_BGM_LIST_ENEMY:
	.byte	$AA, $83, $81, $81

.segment "ROBOT_BGM_PATCH00A"
	.byte	$A0 | $12

.segment "ROBOT_BGM_PATCH08C"
	.byte	$20 | $12

.segment "ROBOT_BGM_PATCH08D"
	.byte	$20 | $12

;.segment "ROBOT_BGM_PATCH08E"
;	.byte	$40 | $12

.segment "ROBOT_BGM_PATCH0E2"
	.byte	$E0 | $12

.segment "ROBOT_BGM_PATCH056"
	.byte	$C0 | $1C

.segment "ROBOT_BGM_PATCH08E"
	.byte	$40 | $1D

.segment "ROBOT_BGM_PATCH0A5"
	.byte	$40 | $1D

.segment "ROBOT_BGM_PATCH0A6"
	.byte	$60 | $1D

.segment "ROBOT_BGM_PATCH0A7"
	.byte	$60 | $1D

.segment "ROBOT_BGM_PATCH0A8"
	.byte	$60 | $1D

.segment "ROBOT_BGM_PATCH0A9"
	.byte	$40 | $1D

.segment "ROBOT_BGM_PATCH0E8"
	.byte	$60 | $1D

.segment "ROBOT_BGM_PATCH0E9"
	.byte	$40 | $1D

.segment "ROBOT_BGM_PATCH0EA"
	.byte	$40 | $1D

.segment "ROBOT_BGM_PATCH0EB"
	.byte	$40 | $1D

.segment "ROBOT_BGM_RELOC1"
	cmp	#(ROBOT_BGM_LIST_ENEMY - ROBOT_BGM_LIST) ; >= this value: enemy BGM+explosion



.segment "SONG_NAME3E"
SONG_NAME3E: ; "君を見つめて"
	.byte	$F1, $5B, $8E, $F1, $76, $63, $80, $65, $FF

.segment "SONG_NAME3E_PTR"
	.addr	SONG_NAME3E



.segment "SOUND_TEST_BGM_LIST"
	.byte	$FF
SOUND_TEST_BGM_LIST:
	.byte	$24, $1C, $04, $17, $16, $3E, $19, $05, $06, $10
	.byte	$0B, $18, $08, $09, $0A, $07, $0C, $0E, $0F, $13
	.byte	$11, $12, $1B, $1D, $1E, $1F, $20, $21, $22, $23
	.byte	$25, $26
	.byte	$FF

.segment "SOUND_TEST_BGM_LIST_RELOC1"
	lda	f:SOUND_TEST_BGM_LIST,x

.segment "SOUND_TEST_BGM_LIST_RELOC2"
	lda	f:SOUND_TEST_BGM_LIST,x

.segment "SOUND_TEST_BGM_LIST_RELOC3"
	lda	f:SOUND_TEST_BGM_LIST,x

.segment "SOUND_TEST_BGM_LIST_RELOC4"
	lda	f:SOUND_TEST_BGM_LIST,x



.segment "KARAOKE_BGM_LIST"
KARAOKE_BGM_LIST:
	.byte	$05, $06, $09, $08, $07, $0B, $0C, $11, $0F, $12
	.byte	$18, $10, $3E
KARAOKE_BGM_LIST_end:

.segment "KARAOKE_BGM_COUNT"
	.byte	KARAOKE_BGM_LIST_end - KARAOKE_BGM_LIST



.segment "KARAOKE_SEQ3E"
KARAOKE_SEQ3E:
	.byte	$C3, $73, $E4, $74, $73, $74
	.byte	$C5, $75, $EC, $76, $75, $76
	.byte	$C4, $77, $E7, $78, $77, $78
	.byte	$C4, $79, $E5, $7A, $79, $7A
	.byte	$C4, $7B, $E6, $7C, $7B, $7C
	.byte	$FF

.segment "KARAOKE_SEQ3E_PTR"
	.addr	KARAOKE_SEQ3E



.segment "KARAOKE_CUE3E"
KARAOKE_CUE3E:
	.word	0
	.word	@end - * - 2

	.byte	$F0, $F0, $F0, $F0, $F0, $F0, $F0, $F1, 3 ; 192 * 8 + 120 + 32 = 240 * 7 + 3 + 5

	.byte	48, 72, 48, 72, 24, 72, 24, 48 ; "暗闇に走る君は　"
	.byte	24, 72, 24, 72, 24, 24, 120 ; "自分を傷つけ\n"

	.byte	48, 24, 96, 24, 24, 24, 96, 24, 24 ; "帰る家さえ見失う　"
	.byte	72, 48, 48, 24, 48, 24, 120 ; "私の胸で眠れ　"
	.byte	72, 48, 48, 24, 48, 72, 72 ; "私の胸で眠れ\n\n"

	.byte	24, 24, 24, 96, 48, 24, 24, 72, 24, 48 ; "もしも今この世界が　"
	.byte	24, 24, 48, 48, 60, 12, 48, 48, 24, 24 ; "消えてもきっと君は\n"

	.byte	72, 48, 24, 60, 36, 24, 72, 24, 72 ; "戦いが正義と信じ　"
	.byte	72, 24, 72, 24, 120, 96 ; "走り続ける\n\n"

	.byte	12, 12, 120, 24, 24, 28, 44, 24, 96 ; "ああ　このままで　"
	.byte	48, 24, 24, 48, 24, 24, 120 ; "明日を探そう\n"

	.byte	24, 24, 48, 48, 52, 44, 24, 48, 48, 24, 72 ; "振り返る事などないさ　"
	.byte	24, 48, 120, 48, 24, 48, 24, 24, 24, $F1, 192, 168; "自分を傷つけないで\n\n"

	.byte	2, 2, 8, 2, 2, 2, 6, 2, 2, 20, 2, 2, 2, 2, 40, 2, 2, 2, 42 ; "ＹＯＵⅤＲＥ　ＬＯＯＫＩＮⅤ　ＦＯＲ\n"
	.byte	2, 2, 2, 18, 2, 2, 2, 2, 16, 2, 2, 2, 2, 184 ; "ＨＯＷ　ＴＨＥＹ　ＬＩＶＥ　"
	.byte	12, 12, 48, 24, 24, 24, 24, 24, 48, 72, 72 ; "その痛みを分かちあい\n\n"

	.byte	2, 2, 8, 2, 2, 2, 6, 2, 2, 2, 18, 2, 2, 2, 2, 2, 38, 2, 2, 2, 42 ; "ＹＯＵⅤＲＥ　ＳＥＡＲＣＨＩＮⅤ　ＦＯＲ\n"
	.byte	2, 2, 2, 18, 2, 2, 2, 2, 16, 2, 2, 2, 2, 184 ; "ＨＯＷ　ＴＨＥＹ　ＬＩＶＥ　"
	.byte	24, 24, 24, 24, 48, 24, 24, 24, $F1, 192, $F1, 168 ; "激しさに震えれば\n"

	.byte	$FF
@end:

.segment "KARAOKE_CUE3E_PTR"
	.faraddr	KARAOKE_CUE3E



.segment "LYRICS3E"
LYRICS73: ; "暗闇に走る君は　自分を傷つけ"
	.byte	$F0, $A0, $F3, $4E, $6A, $F3, $15, $8A, $F1, $5B, $6E, $00, $F2, $36, $F0, $BD, $8E, $F3, $5E, $63, $50, $FF

LYRICS74: ; "帰る家さえ見失う　私の胸で眠れ　私の胸で眠れ"
	.byte	$F1, $FF, $8A, $F1, $D8, $54, $47, $F1, $76, $F1, $2D, $45, $00, $F1, $AD, $6D, $F3, $A5, $66, $F3, $2C, $8B, $00, $F1, $AD, $6D, $F3, $A5, $66, $F3, $2C, $8B, $FF

LYRICS75: ; "もしも今この世界が　消えてもきっと君は"
	.byte	$81, $56, $81, $F1, $2F, $52, $6D, $F0, $85, $F0, $64, $4B, $00, $F0, $C8, $47, $65, $81, $4C, $62, $67, $F1, $5B, $6E, $FF

LYRICS76: ; "戦いが正義と信じ　走り続ける"
	.byte	$F0, $52, $43, $4B, $F0, $7F, $F1, $65, $67, $F1, $9A, $57, $00, $F3, $15, $89, $F2, $16, $50, $8A, $FF

LYRICS77: ; "ああ　このままで　明日を探そう"
	.byte	$41, $41, $00, $52, $6D, $7D, $7D, $66, $00, $F0, $33, $F0, $34, $8E, $F3, $3F, $5C, $45, $FF

LYRICS78: ; "振り返る事などないさ　自分を傷つけないで"
	.byte	$F2, $51, $89, $F2, $15, $8A, $F0, $A6, $69, $68, $69, $43, $54, $00, $F2, $36, $F0, $BD, $8E, $F3, $5E, $63, $50, $69, $43, $66, $FF

LYRICS79: ; "ＹＯＵⅤＲＥ　ＬＯＯＫＩＮⅤ　ＦＯＲ"
	.byte	$2E, $24, $2A, $0C, $27, $1A, $00, $21, $24, $24, $20, $1E, $23, $0C, $00, $1B, $24, $27, $FF

LYRICS7A: ; "ＨＯＷ　ＴＨＥＹ　ＬＩＶＥ　その痛みを分かちあい"
	.byte	$1D, $24, $2C, $00, $29, $1D, $1A, $2E, $00, $21, $1E, $2B, $1A, $F2, $FF, $5C, $6D, $F3, $87, $7E, $8E, $F0, $BD, $4A, $60, $41, $43, $FF

LYRICS7B: ; "ＹＯＵⅤＲＥ　ＳＥＡＲＣＨＩＮⅤ　ＦＯＲ"
	.byte	$2E, $24, $2A, $0C, $27, $1A, $00, $28, $1A, $16, $27, $18, $1D, $1E, $23, $0C, $00, $1B, $24, $27, $FF

LYRICS7C: ; "ＹＯＵ　ＳＨＯＵＬＤ　ＢＥ　激しさに震えれば"
	.byte	$2E, $24, $2A, $00, $28, $1D, $24, $2A, $21, $19, $00, $17, $1A, $F2, $FF, $F0, $CD, $56, $54, $6A, $F3, $6E, $47, $8B, $6F, $FF

.segment "LYRICS3E_PTR"
	.addr	LYRICS73, LYRICS74
	.addr	LYRICS75, LYRICS76
	.addr	LYRICS77, LYRICS78
	.addr	LYRICS79, LYRICS7A
	.addr	LYRICS7B, LYRICS7C



.segment "APOSTROPHE" ; replaces Ⅴ
	.byte	%00000000
	.byte	%00000000
	.byte	%00110000
	.byte	%00110000
	.byte	%00010000
	.byte	%00100000
	.byte	%00000000
	.byte	%00000000
	.byte	%00000000
	.byte	%00000000
	.byte	%00000000
	.byte	%00000000
	.byte	%00000000
	.byte	%00000000
	.byte	%00000000
	.byte	%00000000



.segment "KARAOKE_COMBATS3E"
KARAOKE_COMBATS3E:
	; guntank (r44) vs berga giros
	.byte	$78, $00, $43, $00, $20, $20, $00, $00
	.byte	$80, $01, $01
	.word	$0011, $0037, 930
	.byte	$00
	.byte	$80, $01, $01
	.word	$008D, $0008, 1700
	.byte	$00
	.byte	$03, $34, $3F, $CB

	; f91 vs geara doga
	.byte	$78, $00, $1E, $1C, $20, $00, $00, $00
	.byte	$80, $01, $01
	.word	$000A, $0008, 1350
	.byte	$00
	.byte	$80, $01, $01
	.word	$0086, $0181, 0
	.byte	$00
	.byte	$03, $34, $3F, $CB

	; jegan vs bug
	.byte	$78, $01, $2D, $16, $28, $00, $02, $00
	.byte	$80, $01, $01
	.word	$00E2, $018B, 2200
	.byte	$00
	.byte	$80, $01, $01
	.word	$0015, $0001, 0
	.byte	$00
	.byte	$03, $34, $3F, $CB

	; f91 vs berga giros
	.byte	$78, $00, $25, $24, $20, $20, $02, $02
	.byte	$80, $01, $01
	.word	$000A, $002C, 810
	.byte	$00
	.byte	$80, $01, $01
	.word	$008D, $0188, 650
	.byte	$00
	.byte	$03, $34, $3F, $CB

	; vigna ghina vs rafflesia
	.byte	$78, $00, $24, $24, $24, $28, $00, $00
	.byte	$80, $01, $01
	.word	$008C, $000F, 0
	.byte	$00
	.byte	$80, $01, $01
	.word	$008E, $0189, 2600
	.byte	$00
	.byte	$03, $34, $3F, $CB

	; f91 vs rafflesia
	.byte	$78, $01, $26, $26, $01, $38, $00, $00
	.byte	$80, $01, $01
	.word	$008E, $01FD, $0000
	.byte	$00
	.byte	$80, $01, $01
	.word	$000A, $002D, 34000
	.byte	$00
	.byte	$03, $34, $3F, $CB

.segment "KARAOKE_COMBATS3E_PTR"
	.addr	KARAOKE_COMBATS3E
