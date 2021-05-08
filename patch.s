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
