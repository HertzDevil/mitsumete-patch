.include "macros.inc"

.segment "INST"

; sample number, adsr1, adsr2, pitch hi, pitch lo, volume (00-FF), pan, transpose
	.byte	$00, $FF, $E0, $08, $00, $A0, $40, $E8 ; 0 (kick)
	.byte	$19, $FF, $E0, $15, $00, $96, $60, $E8 ; 1 (elec tom hi)
	.byte	$19, $FF, $E0, $11, $00, $96, $48, $E8 ; 2 (elec tom mid 1)
	.byte	$19, $FF, $E0, $0D, $00, $96, $38, $E8 ; 3 (elec tom lo)

	.byte	$02, $FF, $E0, $10, $00, $64, $30, $E8 ; 4 (closed hi-hat)
	.byte	$03, $FF, $F0, $08, $00, $6E, $38, $E8 ; 5 (open hi-hat)
	.byte	$04, $FF, $F0, $09, $00, $BE, $60, $E8 ; 6 (crash cymbal)
	.byte	$18, $FF, $E0, $07, $80, $AA, $40, $E8 ; 7 (snare)

	.byte	$06, $8F, $45, $04, $00, $B4, $40, $E8 ; 8 (fretless bass)
	.byte	$05, $CC, $E0, $00, $F2, $FA, $40, $F4 ; 9 (string)
	.byte	$1A, $8D, $EE, $03, $00, $64, $40, $E8 ; 10 (bell)
	.byte	$1B, $9F, $E0, $03, $D0, $C8, $40, $E8 ; 11 (ensemble)

	.byte	$19, $FF, $E0, $0A, $00, $96, $20, $E8 ; 12 (elec tom mid 2)
	.byte	$09, $FF, $E0, $01, $80, $5A, $40, $E8 ; 13 (weard noise)
	.byte	$04, $FF, $F0, $08, $00, $BE, $20, $E8 ; 14 (crash cymbal 2)
	.byte	$1C, $9F, $80, $03, $00, $B4, $40, $E8 ; 15 (trombone)

	.byte	$1D, $FF, $EA, $03, $D2, $FA, $40, $F4 ; 16 (brass ensemble)
	.byte	$1E, $FF, $E0, $07, $04, $2D, $40, $E8 ; 17 (organ)
	.byte	$07, $CE, $8D, $03, $04, $FA, $40, $E8 ; 18 (bell 2a)
	.byte	$07, $CE, $8D, $02, $FC, $FA, $40, $E8 ; 19 (bell 2b)

	.byte	$1F, $F9, $E0, $03, $C0, $B4, $40, $E8 ; 20 (choir aah)
	.byte	$20, $FE, $EE, $11, $00, $FA, $48, $E8 ; 21 (acoustic snare)
	.byte	$19, $FF, $E0, $07, $00, $96, $7F, $E8 ; 22 (elec tom floor l)
	.byte	$19, $FF, $E0, $07, $00, $96, $00, $E8 ; 23 (elec tom floor r)
