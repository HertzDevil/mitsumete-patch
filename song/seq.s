.include "macros.inc"

.export SONG_NUMBER : abs = $3E

.segment "SEQ"

; 君を見つめて -The time I'm seeing you-

track0_start:
	dsp	SPC_COEF0, $7F
	dsp	SPC_COEF1, $00
	dsp	SPC_COEF2, $00
	dsp	SPC_COEF3, $00
	dsp	SPC_COEF4, $00
	dsp	SPC_COEF5, $00
	dsp	SPC_COEF6, $00
	dsp	SPC_COEF7, $00
	dsp	SPC_MVOLL, $00
	dsp	SPC_MVOLR, $00
	dsp	SPC_ESA, $D9
	dsp	SPC_EDL, $03
	w_len	16
	dsp	SPC_FLG, $00
	w_len	16
	dsp	SPC_MVOLL, $7F
	dsp	SPC_MVOLR, $7F
	echo	%11111111, 108, 22, 22

	track	1, track1_start
	track	2, track2_start
	track	3, track3_start
	track	4, track4_start
	track	5, track5_start
	track	6, track6_start
	track	7, track7_start



	inst	8
	vol	96
	pan	0

	loop	; global

	loop
		note	B_3, 64, 22, 24
		note	B_4
	loopend	7

	note	A_3
	note	A_4

	note	G_3
	note	G_4
	note	G_3
	note	G_4
	note	A_3
	note	A_4
	note	A_3
	note	A_4

	loop
		note	B_3
		note	B_4
	loopend	3

	note	Fs3
	note	A_3

	loop
		note	B_3, 64, 22, 24
		note	B_4
	loopend	7

	note	A_3
	note	A_4

	note	G_3
	note	G_4
	note	G_3
	note	G_4
	note	A_3
	note	E_4
	note	A_4

	note	F_3, 64, 190, 192
	note	F_4, 64, 10, 12
	note	G_4
	note	F_4, 64, 142, 192

	pat	track0_pat1
	note	D_3
	note	A_3, 64, 10, 12
	note	D_4

	pat	track0_pat2

	note	G_3
	note	G_4
	note	G_3
	note	G_4
	note	A_3
	note	E_4
	note	A_4
	note	B_3, 64, 46, 48
	note	B_4, 64, 22, 24
	note	B_3
	note	B_4
	note	A_3
	note	A_4
	note	A_3
	note	A_4

	note	G_3, 64, 94, 96
	note	A_3, 64, 70, 72
	note	B_3, 64, 142, 216

	pat	track0_pat1
	note	D_3, 64, 10, 12
	note	D_4
	note	A_3
	note	D_4

	pat	track0_pat2

	note	G_3
	note	D_4
	note	G_4
	note	G_3
	note	A_3
	note	E_4
	note	A_4
	note	B_3, 64, 46, 48
	note	B_4, 64, 22, 24
	note	B_3
	note	B_4
	note	B_3
	note	Fs4
	note	B_4
	note	B_3

	loop
		note	A_3, 64, 22, 24
	loopend	8
	loop
		note	D_4
	loopend	8

	note	G_3
	note	G_3
	note	G_3
	note	G_3
	note	A_3
	note	A_3
	note	A_3
	note	A_3
	note	D_4
	note	D_4
	note	D_4
	note	D_4
	note	D_4, 64, 6, 12
	n_gate	D_4, 10
	note	D_4, 64, 22, 24
	note	D_4
	note	D_4

	note	G_3
	note	G_3
	note	G_3
	note	G_3
	note	A_3
	note	A_3
	note	A_3
	note	A_3
	note	D_4
	note	D_4
	note	Cs4
	note	Cs4
	note	B_3
	note	B_3
	note	A_3
	note	B_3

	loop
		note	C_4
	loopend	8
	loop
		note	D_4
	loopend	8

	note	Fs3
	note	Fs3
	note	Fs3
	note	Fs3
	note	Fs3, 64, 6, 12
	n_gate	Fs3, 10
	note	Fs3, 64, 22, 24
	note	Fs3
	note	E_3

	note	Ds3
	note	Ds3, 64, 70, 168

	loop
		pat	track0_pat3
		note	Fs3, 64, 22, 24
		note	Fs4, 64, 10, 12
		note	Fs4
	loopend	2

	pat	track0_pat3
	note	Ds3, 64, 22, 24
	note	Ds4, 64, 10, 12
	note	Ds4

	loop
		note	E_3, 64, 22, 24
		note	E_4, 64, 10, 12
		note	E_4
	loopend	2
	note	Fs3, 64, 22, 24
	note	Fs4, 64, 10, 12
	note	Fs4
	note	Fs3, 64, 22, 24
	note	E_3, 64, 214, 216

	note	Fs3, 64, 118, 144
	note	Fs4, 64, $FF, 12
	n_gate	Gs4, 10
	note	Cs4
	note	Fs3

	loopend	0 ; global
	end



track0_pat1:
	note	G_3, 64, 22, 24
	note	G_4
	note	G_3
	note	G_4
	note	A_3
	note	A_4
	note	A_3
	note	A_4
	loop
		note	B_3
		note	B_4
	loopend	4

	note	G_3
	note	G_4
	note	G_3
	note	G_4
	note	A_3
	note	A_4
	note	A_3
	note	A_4
	loop
		note	D_3
		note	D_4
	loopend	3
	endpat



track0_pat2:
	note	G_3, 64, 22, 24
	note	G_4
	note	G_3
	note	G_4
	note	A_3
	note	A_4
	note	A_3
	note	A_4
	loop
		note	B_3
		note	B_4
	loopend	3
	note	A_3
	note	A_4

	endpat



track0_pat3:
	loop
		note	Gs3, 64, 22, 24
		note	Gs4, 64, 10, 12
		note	Gs4
	loopend	2
	loop
		note	Fs3, 64, 22, 24
		note	Fs4, 64, 10, 12
		note	Fs4
	loopend	2
	loop
		note	E_3, 64, 22, 24
		note	E_4, 64, 10, 12
		note	E_4
	loopend	3
	endpat



track1_start:
	loop	; global

	rest	192
	rest	96

	inst	9
	vol	116
	pan	16

	note	B_4, 64, 22, 24
	note	Cs5
	note	D_5
	note	A_5, 64, 70, 72
	note	B_5, 64, 22, 24
	note	E_5, 64, 70, 72
	note	A_5, 64, 22, 24
	note	Fs5, 64, 214, 216

	note	B_5, 24, $FF, 144
	n_gate	B_5, 142

	note	B_4, 64, 22, 24
	note	Cs5
	note	D_5
	note	A_5, 64, 46, 48
	note	G_5, 64, 22, 24
	note	Fs5
	note	D_5
	note	E_5
	note	Cs5
	note	A_4
	note	D_5, 64, $FF, 216
	note	D_5, 56, 142, 192

	inst	9
	vol	32
	pan	32

	note	Fs5, 64, 94, 96
	note	E_5
	note	Fs5, 64, 190, 192

	note	Fs5, 64, 94, 96
	note	E_5
	note	E_5
	note	Fs5

	note	Fs5, 64, 94, 96
	note	E_5
	note	Fs5, 64, 190, 192

	note	D_5, 64, 94, 96
	note	E_5, 64, 70, 72

	note	D_6, 64, $FF, 24
	n_vel	D_6, 69
	n_vel	D_6, 74
	n_vel	D_6, 79
	n_vel	D_6, 84
	note	D_6, 88, 46, 48
	note	Cs6

	inst	17
	vol	88
	pan	32
	vib	4
	vibspd	70

	note	B_5, 64, 94, 96
	note	Cs6, 64, 70, 72
	note	D_6, 64, 214, 216

	inst	9
	vol	32
	pan	32

	note	Fs5, 64, 94, 96
	note	E_5
	note	Fs5, 64, 190, 192

	note	Fs5, 64, 94, 96
	note	E_5
	note	E_5
	note	Fs5

	note	Fs5, 64, 94, 96
	note	E_5
	note	Fs5, 64, 190, 192

	note	Fs5, 88, 94, 96
	note	E_5, 88, 70, 72
	note	Fs5, 88, 214, 216

	inst	20
	vol	64
	pan	32
	vib	3
	vibspd	40

	note	E_5, 34, $FF, 24
	n_vel	E_5, 44
	n_vel	E_5, 54
	note	E_5, 64, 118, 120

	note	Fs5, 34, $FF, 24
	n_vel	Fs5, 44
	n_vel	Fs5, 54
	note	Fs5, 64, 118, 120

	note	D_5, 34, $FF, 24
	n_vel	D_5, 44
	n_vel	D_5, 54
	note	D_5, 64, 22, 24
	note	E_5, 34, $FF, 24
	n_vel	E_5, 44
	n_vel	E_5, 54
	note	E_5, 64, 22, 24

	note	Fs5, 34, $FF, 24
	n_vel	Fs5, 44
	n_vel	Fs5, 54
	note	Fs5, 64, 118, 120

	inst	9
	vol	32
	pan	32

	note	D_5, 64, 94, 96
	note	E_5
	note	Fs5, 64, 46, 48
	note	E_5
	note	D_5, 64, 94, 96

	inst	20
	vol	64
	pan	32
	vib	3
	vibspd	40

	note	E_5, 34, $FF, 24
	n_vel	E_5, 44
	n_vel	E_5, 54
	note	E_5, 64, 118, 120

	note	Fs5, 34, $FF, 24
	n_vel	Fs5, 44
	n_vel	Fs5, 54
	note	Fs5, 64, 118, 120

	note	Fs5, 34, $FF, 24
	n_vel	Fs5, 44
	n_vel	Fs5, 54
	note	Fs5, 64, 118, 120

	rest	192

	inst	16
	vol	68

	loop
		pat	track1_pat1
		pan	-32
		n_vel	Fs5, 96
		pan	32
		n_vel	Fs5, 60
		n_vel	Fs5, 46
		n_vel	Fs5, 24
	loopend	2

	pat	track1_pat1
	pan	-32
	n_vel	Ds5, 96
	pan	32
	n_vel	Ds5, 60
	n_vel	Ds5, 46
	n_vel	Ds5, 24

	rest	24
	pan	-32
	note	E_5, 96, 9, 12
	pan	32
	n_vel	E_5, 60
	pan	-32
	n_vel	E_5, 96
	pan	32
	n_vel	E_5, 60
	n_vel	E_5, 46
	n_vel	E_5, 24
	loop
		pan	-32
		n_vel	Fs5, 96
		pan	32
		n_vel	Fs5, 60
		n_vel	Fs5, 46
	loopend	2

	inst	9
	vol	32
	pan	32

	note	B_4, 64, 214, 216
	note	Cs5, 64, 190, 192

	loopend	0 ; global
	end



track1_pat1:
	rest	24
	pan	-32
	note	Gs5, 96, 9, 12
	pan	32
	n_vel	Gs5, 60
	pan	-32
	n_vel	Gs5, 96
	pan	32
	n_vel	Gs5, 60
	n_vel	Gs5, 46
	n_vel	Gs5, 24
	loop
		pan	-32
		n_vel	Fs5, 96
		pan	32
		n_vel	Fs5, 60
		n_vel	Fs5, 46
	loopend	2
	pan	-32
	n_vel	Fs5, 96
	pan	32
	n_vel	Fs5, 60

	n_vel	Fs5, 46
	n_vel	Fs5, 24
	pan	-32
	n_vel	E_5, 96
	pan	32
	n_vel	E_5, 60
	loop
		pan	-32
		n_vel	E_5, 96
		pan	32
		n_vel	E_5, 60
		n_vel	E_5, 46
		n_vel	E_5, 24
	loopend	2
	endpat



track2_start:
	loop	; global

	inst	11
	vol	44
	pan	0
	vib	10
	vibspd	50

	note	A_4, 64, $FF, 12
	note	B_4, 64, $FF, 186
	note	B_4
	note	B_4, 64, 178, 216

	note	F_5, 64, $FF, 8
	n_len	Fs5, 28
	note	A_5, 64, 10, 12
	note	E_5
	note	D_5

	note	F_5, 64, $FF, 12
	n_len	Fs5, 60
	n_len	E_5, 12
	n_gate	D_5, 10

	note	B_4, 64, $FF, 192
	note	B_4
	note	B_4, 64, 94, 96
	note	A_5, 64, $FF, 28
	bend	-70
	note	A_5, 40, 14, 20
	bend	0
	note	Gs5, 64, $FF, 6
	note	A_5, 64, 16, 18
	note	C_6, 64, $FF, 120
	note	C_6, 56, $FF, 96
	note	C_6, 50, 142, 192

	inst	9
	vol	32
	pan	-32

	loop
		note	D_5, 64, 94, 96
		note	Cs5
		note	D_5, 64, 190, 192
	loopend	3

	note	B_4, 64, 94, 96
	note	Cs5, 64, 70, 72

	note	B_5, 64, $FF, 24
	n_vel	B_5, 69
	n_vel	B_5, 74
	n_vel	B_5, 79
	n_vel	B_5, 84
	note	B_5, 88, 46, 48
	note	A_5

	inst	17
	vol	88
	pan	-32
	vib	4
	vibspd	70

	note	G_5, 64, 94, 96
	note	A_5, 64, 70, 72
	note	A_5, 64, 214, 216

	inst	9
	vol	32
	pan	-32

	loop
		note	D_5, 64, 94, 96
		note	Cs5
		note	D_5, 64, 190, 192
	loopend	3

	note	D_5, 64, 94, 96
	note	Cs5, 64, 70, 72
	note	D_5, 64, 214, 216

	inst	20
	vol	56
	pan	0
	vib	3
	vibspd	40

	note	Cs5, 34, $FF, 24
	n_vel	Cs5, 44
	n_vel	Cs5, 54
	note	Cs5, 64, 118, 120

	note	D_5, 34, $FF, 24
	n_vel	D_5, 44
	n_vel	D_5, 54
	note	D_5, 64, 118, 120

	note	B_4, 34, $FF, 24
	n_vel	B_4, 44
	n_vel	B_4, 54
	note	B_4, 64, 22, 24
	note	Cs5, 34, $FF, 24
	n_vel	Cs5, 44
	n_vel	Cs5, 54
	note	Cs5, 64, 22, 24

	note	D_5, 34, $FF, 24
	n_vel	D_5, 44
	n_vel	D_5, 54
	note	D_5, 64, 118, 120

	inst	9
	vol	32
	pan	-32

	note	B_4, 64, 94, 96
	note	Cs5
	note	D_5, 64, 46, 48
	note	Cs5
	note	A_4, 64, 94, 96

	inst	20
	vol	56
	pan	0
	vib	3
	vibspd	40

	note	C_5, 34, $FF, 24
	n_vel	C_5, 44
	n_vel	C_5, 54
	note	C_5, 64, 118, 120

	note	D_5, 34, $FF, 24
	n_vel	D_5, 44
	n_vel	D_5, 54
	note	D_5, 64, 118, 120

	note	Cs5, 34, $FF, 24
	n_vel	Cs5, 44
	n_vel	Cs5, 54
	note	Cs5, 64, 118, 120

	rest	192

	inst	16
	vol	50
	trsp	$EF

	loop
		pat	track1_pat1
		pan	-32
		n_vel	Fs5, 96
		pan	32
		n_vel	Fs5, 60
		n_vel	Fs5, 46
		n_vel	Fs5, 24
	loopend	2

	pat	track1_pat1
	pan	-32
	n_vel	Ds5, 96
	pan	32
	n_vel	Ds5, 60
	n_vel	Ds5, 46
	n_vel	Ds5, 24

	rest	24
	pan	-32
	note	E_5, 96, 9, 12
	pan	32
	n_vel	E_5, 60
	pan	-32
	n_vel	E_5, 96
	pan	32
	n_vel	E_5, 60
	n_vel	E_5, 46
	n_vel	E_5, 24
	loop
		pan	-32
		n_vel	Fs5, 96
		pan	32
		n_vel	Fs5, 60
		n_vel	Fs5, 46
	loopend	2

	inst	9
	vol	32
	pan	-32

	note	Gs4, 64, 214, 216
	note	As4, 64, 190, 192

	loopend	0 ; global
	end



track3_start:
	loop	; global

	inst	10
	vol	108
	pan	32
	vib	6
	vibspd	84

	note	D_6, 64, 70, 72
	note	Cs6, 64, 46, 48
	note	D_6, 64, 22, 24
	note	E_6
	note	D_6, 64, 46, 48
	note	Cs6, 64, 22, 24
	note	B_5
	note	A_5, 64, 118, 120

	note	D_6, 64, 94, 96
	note	E_6
	note	Fs6, 64, 190, 192

	note	D_6, 64, 70, 72
	note	Cs6, 64, 46, 48
	note	D_6, 64, 22, 24
	note	E_6
	note	D_6, 64, 46, 48
	note	Cs6, 64, 22, 24
	note	B_5
	note	A_5, 64, 118, 120

	note	D_6, 64, 94, 96
	note	E_6, 64, 70, 72
	note	G_6, 64, 214, 216
	rest	192

	inst	9
	vol	32
	pan	0

	note	B_4, 64, 94, 96
	note	A_4
	note	B_4, 64, 190, 192

	note	B_4, 64, 94, 96
	note	A_4
	note	A_4, 64, 190, 192

	note	B_4, 64, 94, 96
	note	A_4
	note	B_4, 64, 190, 192

	note	G_4, 64, 94, 96
	note	A_4, 64, 70, 72

	note	Fs5, 64, $FF, 24
	n_vel	Fs5, 69
	n_vel	Fs5, 74
	n_vel	Fs5, 79
	n_vel	Fs5, 84
	note	Fs5, 88, 46, 48
	note	E_5

	inst	17
	vol	88
	pan	0
	vib	4
	vibspd	70

	note	D_5, 52, 94, 96
	note	E_5, 52, 70, 72
	note	Fs5, 52, 214, 216

	inst	18
	vol	125
	pan	48

	note	B_6, 96, 94, 96
	note	A_6
	note	B_6, 96, 190, 192

	note	Fs7, 96, 94, 96
	note	E_7, 96, 70, 72
	note	Fs7, 96, 214, 216

	note	B_6, 96, 94, 96
	n_gate	Cs7, $FF
	note	Cs7, 64, 46, 48
	n_vel	D_7, 96
	note	Cs7
	note	A_6

	note	B_6, 96, 94, 96
	note	A_6, 96, 70, 72
	note	B_6, 96, 214, 216

	inst	20
	vol	64
	pan	-32
	vib	3
	vibspd	40

	note	B_4, 34, $FF, 24
	n_vel	B_4, 44
	n_vel	B_4, 54
	note	B_4, 64, 118, 120

	note	A_4, 34, $FF, 24
	n_vel	A_4, 44
	n_vel	A_4, 54
	note	A_4, 64, 118, 120

	inst	15
	vol	48
	pan	16

	note	D_5, 64, 16, 48
	note	D_6, 64, 22, 24
	n_gate	D_6, 14
	n_gate	Cs6, 22
	n_gate	D_6, 14
	n_gate	Cs6, 22
	note	A_5, 64, 94, 216
	rest	192
	rest	192

	inst	20
	vol	64
	pan	-32
	vib	3
	vibspd	40

	note	G_4, 34, $FF, 24
	n_vel	G_4, 44
	n_vel	G_4, 54
	note	G_4, 64, 118, 120

	note	A_4, 34, $FF, 24
	n_vel	A_4, 44
	n_vel	A_4, 54
	note	A_4, 64, 118, 120

	note	As4, 34, $FF, 24
	n_vel	As4, 44
	n_vel	As4, 54
	note	As4, 64, 118, 120

	rest	192

	inst	15
	vol	50
	pan	48
	vib	8
	vibspd	18
	trsp	$DC
	pat	track3_pat1

	inst	9
	vol	26
	pan	32
	note	Ds5, 64, 94, 96
	note	Cs5
	note	B_4, 64, 142, 144
	note	Cs5, 64, 46, 48

	inst	15
	vol	50
	pan	48
	vib	8
	vibspd	18
	trsp	$DC
	pat	track3_pat2

	inst	9
	vol	26
	pan	32
	note	B_4, 64, 94, 96
	note	Cs5, 64, 70, 80

	inst	15
	vol	50
	pan	48
	vib	8
	vibspd	18
	note	E_5, 64, $FF, 16
	vib	8
	n_len	E_5, 192
	vib	14
	note	E_5, 56, 142, 192

	loopend	0 ; global
	end



track3_pat1:
	note	Ds6, 64, 14, 24
	note	Ds6, 64, 34, 48
	n_gate	Cs6, 46
	note	B_5, 64, 22, 24
	note	As5
	note	B_5, 64, 154, 216

	endpat



track3_pat2:
	note	Ds6, 64, 14, 24
	note	Ds6, 64, 34, 48
	n_gate	Cs6, 46
	note	B_5, 64, 14, 24
	note	As5
	note	B_5, 64, 154, 216

	endpat



track4_start:
	loop	; global

	inst	10
	vol	84
	pan	-32
	vib	6
	vibspd	84

	note	B_5, 64, 70, 72
	note	A_5, 64, 46, 48
	note	B_5, 64, 22, 24
	note	Cs6
	note	B_5, 64, 46, 48
	note	A_5, 64, 22, 24
	note	Fs5
	note	E_5, 64, 118, 120

	note	B_5, 64, 94, 96
	note	Cs6
	note	D_6, 64, 190, 192

	note	B_5, 64, 70, 72
	note	A_5, 64, 46, 48
	note	B_5, 64, 22, 24
	note	Cs6
	note	B_5, 64, 46, 48
	note	A_5, 64, 22, 24
	note	Fs5
	note	E_5, 64, 118, 120

	note	B_5, 64, 94, 96
	note	Cs6, 64, 70, 72
	note	D_6, 64, 214, 216
	rest	192

	inst	16
	vol	70
	pan	16

	pat	track4_pat1

	note	G_3, 48, 8, 24
	n_len	G_3, 12
	note	G_3
	n_len	G_3, 24
	n_len	G_3, 12
	note	G_3
	n_len	A_3, 24
	n_len	A_3, 12
	note	A_3
	note	A_4, 48, $FF, 22
	bend	20
	note	A_4, 48, $FF, 6
	bend	0
	note	B_4, 48, 18, 20

	note	D_4, 48, 8, 24
	n_len	D_4, 12
	note	D_4
	n_len	D_4, 24
	note	E_4, 48, 10, 12
	note	Fs4
	note	A_4, 48, 22, 24
	note	A_4, 48, 46, 48
	note	G_4, 48, 22, 24

	pat	track4_pat1

	note	G_4, 48, 22, 24
	note	B_4
	note	D_5
	note	G_4
	note	A_4
	note	Cs5
	note	E_5
	n_len	B_3, 48

	note	B_3, 48, 8, 12
	note	B_3
	n_len	B_3, 24
	n_len	B_3, 12
	note	B_3
	n_len	A_3, 24

	inst	15
	vol	48
	pan	16
	vib	7
	vibspd	32

	bend	20
	note	Cs5, 64, $FF, 6
	bend	0
	note	D_5, 64, 10, 18
	note	D_5, 64, 22, 24
	note	E_5

	note	Fs5, 64, 46, 48
	note	Fs5, 64, 22, 24
	note	G_5
	bend	20
	note	D_5, 64, $FF, 6
	bend	0
	note	E_5, 64, 16, 18
	note	D_5, 64, 22, 24
	note	Cs5
	note	D_5, 64, $FF, 24
	note	D_5, 64, 70, 192

	inst	19
	vol	125
	pan	-48

	rest	6
	note	B_6, 96, 94, 96
	note	A_6
	note	B_6, 96, 190, 192

	note	Fs7, 96, 94, 96
	note	E_7, 96, 70, 72
	note	Fs7, 96, 214, 216

	note	B_6, 96, 94, 96
	n_gate	Cs7, $FF
	note	Cs7, 64, 46, 48
	n_vel	D_7, 96
	note	Cs7
	note	A_6, 96, 43, 45

	note	B_7, 96, 94, 96
	note	A_7, 96, 70, 72
	note	B_7, 96, 211, 213

	pan	-56

	rest	24
	note	A_5, 112, 9, 12
	n_vel	A_5, 68
	n_vel	B_6, 112
	n_vel	B_6, 68
	n_vel	A_5, 112
	n_vel	A_5, 68
	loop
		n_vel	A_6, 112
		n_vel	A_6, 68
		n_vel	A_5, 112
		n_vel	A_5, 68
		n_vel	B_6, 112
		n_vel	B_6, 68
		n_vel	A_5, 112
		n_vel	A_5, 68
	loopend	7

	inst	11
	vol	32
	pan	0
	vib	10
	vibspd	50

	note	G_4, 64, 94, 96
	note	A_4
	note	D_5, 64, 46, 48
	note	Cs5
	note	B_4
	note	A_4

	note	C_5, 78, 190, 192
	note	D_5
	note	Fs4

	note	Ds5, 100, 22, 24
	note	Ds5
	n_vel	Ds5, 44
	n_vel	Ds5, 72
	n_vel	Ds5, 44
	n_vel	Ds5, 72
	note	Ds5, 44, 22, 48

	inst	15
	vol	48
	pan	16
	pat	track3_pat1

	inst	9
	vol	26
	pan	-32
	note	B_4, 64, 94, 96
	note	As4
	note	Gs4, 64, 142, 144
	note	As4, 64, 46, 48

	inst	15
	vol	48
	pan	16
	pat	track3_pat2

	inst	9
	vol	26
	pan	-32
	note	Gs4, 64, 94, 96
	note	As4, 64, 70, 80

	inst	15
	vol	48
	pan	16
	note	B_5, 64, $FF, 16
	vib	8
	n_len	B_5, 192
	vib	14
	note	B_5, 56, 142, 192

	loopend	0 ; global
	end



track4_pat1:
	note	G_3, 48, 8, 24
	n_len	G_3, 12
	note	G_3
	n_len	G_3, 24
	n_len	G_3, 12
	note	G_3
	n_len	A_3, 24
	n_len	A_3, 12
	note	A_3
	n_len	A_3, 24
	n_len	A_3, 12
	note	A_3

	n_len	B_3, 24
	n_len	B_3, 12
	note	B_3
	n_len	B_3, 24
	note	E_4, 48, 10, 12
	note	Fs4
	note	A_4, 48, 22, 24
	note	A_4, 48, 46, 48
	note	G_4, 48, 22, 24

	endpat



track5_start:
	loop	; global

	inst	10
	vol	78
	pan	0
	vib	6
	vibspd	84

	note	Fs5, 64, 70, 72
	note	E_5, 64, 46, 48
	note	Fs5, 64, 22, 24
	note	A_5
	note	Fs5, 64, 46, 48
	note	E_5, 64, 22, 24
	note	D_5
	note	Cs5, 64, 118, 120

	note	G_5, 64, 94, 96
	note	A_5
	note	B_5, 64, 106, 108

	inst	9
	vol	72
	pan	-16

	note	D_7, 64, 10, 12
	note	Cs7
	note	A_6
	note	Fs6
	note	D_6
	note	Cs6
	note	A_5

	inst	10
	vol	84
	pan	0
	vib	4
	vibspd	84

	note	Fs5, 64, 70, 72
	note	E_5, 64, 46, 48
	note	Fs5, 64, 22, 24
	note	A_5
	note	Fs5, 64, 46, 48
	note	E_5, 64, 22, 24
	note	D_5
	note	Cs5, 64, 118, 120

	note	G_5, 64, 94, 96
	note	A_5, 64, 70, 72
	note	A_5, 64, 214, 216
	rest	120

	inst	15
	vol	104
	pan	-16
	vibspd	20

	note	B_4, 64, 22, 24
	note	D_5
	note	E_5

	note	Fs5, 64, $FF, 24
	bend	-50
	note	Fs5, 50, $FF, 8
	bend	0
	note	D_5, 50, 14, 16
	note	D_5, 64, 46, 48
	bend	6
	note	Ds5, 64, $FF, 12
	bend	0
	note	E_5, 64, 34, 36
	note	Cs5, 64, 22, 24
	n_gate	D_5, 14

	note	C_5, 64, $FF, 4
	note	Cs5, 64, 18, 20
	note	B_4, 64, 46, 48
	note	A_4, 64, 46, 72
	note	D_5, 64, 22, 24
	note	E_5

	note	Fs5, 64, $FF, 24
	bend	-100
	note	Fs5, 50, $FF, 6
	bend	0
	note	B_4, 50, 14, 18
	note	B_4, 64, 14, 24
	note	B_4
	note	A_5, 64, 38, 48
	note	B_5, 64, 14, 24
	note	E_5, 64, $FF, 21
	bend	30
	note	E_5, 64, $FF, 6
	bend	0
	vib	5
	note	Fs5, 64, 91, 117
	vib	0

	note	B_4, 64, 22, 24
	note	D_5
	note	E_5

	note	Fs5, 64, $FF, 24
	bend	-50
	note	Fs5, 50, $FF, 8
	bend	0
	note	D_5, 50, 14, 16
	note	D_5, 64, 34, 48
	note	E_5, 64, $FF, 24
	bend	-50
	note	E_5, 64, $FF, 8
	bend	0
	note	Cs5, 64, 14, 16
	note	Cs5, 64, 22, 24
	note	D_5

	note	C_5, 64, $FF, 4
	note	Cs5, 64, 18, 20
	note	B_4, 64, 46, 48
	n_gate	A_4, 22

	loop
		bend	20
		note	A_4, 64, $FF, 6
		bend	0
		note	B_4, 64, 10, 18
		note	B_4, 64, 22, 24
		note	Cs5

		note	D_5, 64, 46, 48
		note	D_5, 64, 22, 24
		note	E_5
		bend	20
		note	B_4, 64, $FF, 6
		bend	0
		note	Cs5, 64, 16, 18
		note	B_4, 64, 22, 24
		note	A_4
		note	B_4, 64, $FF, 24
		vib	3
		note	B_4, 64, 70, 120
		vib	0
	loopend	2

	note	B_4, 64, 14, 24
	n_gate	D_5, 22
	note	E_5

	note	Fs5, 64, $FF, 24
	bend	-90
	note	Fs5, 50, $FF, 6
	bend	0
	note	D_5, 50, 16, 18
	note	D_5, 64, 34, 48
	note	E_5, 64, 46, 48
	note	Cs5, 64, 22, 24
	note	D_5

	note	Cs5, 64, $FF, 24
	bend	-20
	n_len	Cs5, 4
	bend	0
	note	B_4, 64, 42, 44
	note	A_4, 64, 46, 72
	note	D_5, 64, 22, 24
	note	E_5

	note	Fs5, 64, $FF, 36
	bend	-90
	note	Fs5, 50, $FF, 5
	bend	0
	note	B_4, 50, 5, 7
	note	B_4, 64, 46, 48
	note	A_5
	note	B_5, 64, 14, 24
	note	Fs5, 64, 46, 48
	note	E_5, 64, 22, 24
	note	D_5
	note	Fs5, 64, 22, 48
	note	Fs5, 64, 20, 24
	n_gate	Fs5, 14
	n_gate	A_5, 22

	note	B_5, 64, $FF, 24
	bend	-80
	n_len	B_5, 6
	bend	0
	note	Fs5, 64, 16, 18
	note	Fs5, 64, 14, 24
	n_gate	Fs5, 22
	note	E_5, 64, 34, 36
	note	E_5
	note	Fs5, 64, 22, 24

	note	C_5, 64, $FF, 4
	bend	35
	note	C_5
	bend	0
	n_len	D_5, 16
	bend	-50
	n_len	D_5, 4
	bend	0
	note	B_4, 64, 42, 44
	note	A_4, 64, 46, 96

	bend	12
	note	C_5, 64, $FF, 12
	bend	0
	note	D_5, 64, 22, 36
	n_len	D_5, 24
	n_gate	D_5, 14
	n_gate	Fs5, 22
	note	E_5, 64, $FF, 36
	bend	-40
	note	E_5, 50, 10, 12
	bend	0
	note	A_4, 64, 22, 24
	n_gate	B_4, $FF
	vib	3
	note	B_4, 64, 94, 192
	vib	0

	note	D_5, 64, $FF, 12
	bend	24
	n_len	D_5, 8
	bend	0
	vib	5
	note	E_5, 64, 86, 124
	vib	0
	note	D_5, 64, 22, 24
	note	E_5

	note	Fs5, 64, 25, 28
	note	A_5, 64, $FF, 20
	vib	11
	note	A_5, 64, 22, 24
	vib	0
	n_gate	Fs5, $FF
	vib	9
	note	Fs5, 64, 46, 96
	vib	0

	note	B_4, 64, 16, 48
	note	B_5, 64, 22, 24
	n_gate	B_5, 14
	n_gate	A_5, 22
	n_gate	B_5, 14
	n_gate	A_5, 22
	n_gate	Fs5, $FF
	vib	9
	note	Fs5, 64, 70, 120
	vib	0
	note	Fs5, 64, 22, 24
	n_gate	Fs5, 14
	note	A_5

	n_gate	B_5, 22
	n_len	B_5, 48
	note	B_5, 64, 14, 24
	note	A_5, 64, 26, 28
	note	A_5, 64, 42, 44
	note	B_5, 64, 22, 24

	note	Fs5, 64, 46, 48
	note	E_5
	bend	7
	note	D_5, 64, $FF, 5
	bend	-5
	n_len	D_5, 10
	bend	5
	note	D_5
	bend	-5
	note	D_5
	bend	5
	note	D_5, 64, 11, 61
	bend	0

	note	Ds5, 64, $FF, 4
	note	E_5, 64, 18, 20
	note	D_5, 64, 14, 24
	n_gate	C_5, 22
	note	E_5, 64, $FF, 12
	vib	9
	note	E_5, 64, 58, 108

	bend	50
	note	G_5, 64, $FF, 6
	bend	0
	note	A_5, 64, 16, 18
	note	G_5, 64, 22, 24
	n_gate	Fs5, 14
	note	A_5, 64, 46, 48
	note	Fs5, 64, 22, 24
	note	A_5
	note	A_5, 64, $FF, 22
	bend	40
	n_len	A_5, 4
	bend	0
	vib	40
	n_len	As5, 190
	vib	80
	note	As5, 64, 70, 168
	vib	0
	note	Ds5, 64, 22, 24

	bend	60
	note	Gs5, 64, $FF, 4
	bend	0
	note	B_5, 64, 10, 20
	note	B_5, 64, 34, 48
	n_gate	As5, 46
	note	Gs5, 64, 22, 24
	note	Fs5
	note	Gs5, 64, $FF, 24
	vib	10
	note	Gs5, 64, 130, 168
	vib	0
	note	Ds5, 64, 10, 12
	note	Ds5

	note	B_5, 64, 14, 24
	n_gate	B_5, 22
	note	B_5
	note	Cs6
	n_gate	As5, 14
	note	Gs5
	note	Fs5
	note	As5, 64, $FF, 46
	bend	-20
	n_len	As5, 6
	bend	0
	n_len	Gs5, 20
	vib	10
	note	Gs5, 64, 82, 120
	vib	0
	note	Ds5, 64, 22, 24

	bend	60
	note	Gs5, 64, $FF, 4
	bend	0
	note	B_5, 64, 10, 20
	note	B_5, 64, 34, 48
	n_gate	As5, 46
	note	Gs5, 64, 14, 24
	note	Fs5
	note	Gs5, 64, $FF, 24
	vib	10
	note	Gs5, 64, 130, 168
	vib	0
	note	Ds5, 64, 10, 12
	note	Ds5

	note	As5, 64, $FF, 4
	note	B_5, 64, 10, 20
	note	B_5, 64, 22, 24
	n_gate	B_5, 14
	n_gate	Cs6, 22
	note	A_5, 64, $FF, 9
	bend	20
	n_len	A_5, 3
	bend	0
	note	As5, 64, 10, 12
	note	Gs5, 64, 22, 24
	note	Fs5
	note	Gs5, 64, $FF, 24

	vib	8
	n_len	Gs5, 192
	vib	14
	note	Gs5, 56, 142, 192

	loopend	0 ; global
	end



track6_start:
	perc

	loop	; global

	note	6, 78, 47, 48
	loop
		note	4, 64, 23, 24
		note	4, 64, 11, 12
		note	4
	loopend	15

	note	6, 78, 47, 48
	loop
		note	4, 64, 23, 24
		note	4, 64, 11, 12
		note	4
	loopend	10

	note	4, 64, 23, 24
	note	5, 64, 167, 168

	note	4, 64, 7, 8
	note	4
	note	4
	note	4, 64, 11, 12
	note	5

	perc
	inst	13
	vol	64
	note	$46, 80, 10, 12
	n_len	$46, 36
	perc
	note	14, 64, 95, 96
	note	14, 36, 47, 48

	pat	track6_pat1
	note	5, 64, 23, 24

	note	6, 78, 95, 96
	note	6, 78, 71, 72
	note	6, 78, 167, 168
	note	14, 36, 47, 48

	pat	track6_pat1
	note	14, 64, 23, 24

	note	6, 78, 47, 48
	pat	track6_pat2

	loop
		perc
		inst	6
		vol	64
		note	$30, 78, 22, 24
		perc
		note	4, 84, 23, 24
		pat	track6_pat2
	loopend	4

	perc
	inst	6
	vol	64
	note	$30, 78, 22, 24
	perc
	note	4, 84, 23, 24
	note	5, 64, 35, 36
	note	4, 64, 11, 12
	note	5
	note	4, 64, 35, 36
	note	14, 64, 23, 24
	note	14

	loop
		perc
		inst	6
		vol	64
		note	$30, 78, 22, 24
		perc
		note	4, 84, 23, 24
		pat	track6_pat2
	loopend	3

	note	14, 64, 23, 24
	note	14, 64, 23, 24
	perc
	inst	6
	vol	125
	bend	-46
	pan	-63
	note	$2E, 92, 47, 48
	pan	64
	note	$2E
	bend	0
	perc
	note	6, 78, 47, 48

	note	6, 78, 47, 48
	loop
		note	4, 64, 23, 24
		note	4, 64, 11, 12
		note	4
	loopend	14
	note	14, 36, 47, 48

	note	6, 78, 47, 48
	loop
		note	4, 64, 23, 24
		note	4, 64, 11, 12
		note	4
	loopend	10
	note	4, 64, 23, 24
	note	14, 36, 215, 216

	rest	144
	note	5, 64, 35, 36
	note	4, 64, 11, 12

	loopend	0 ; global
	end



track6_pat1:
	note	6, 78, 47, 48
	loop
		note	4, 64, 23, 24
		note	4, 64, 11, 12
		note	4
	loopend	15

	note	6, 78, 47, 48
	loop
		note	4, 64, 23, 24
		note	4, 64, 11, 12
		note	4
	loopend	10
	note	4, 64, 23, 24
	note	14, 64, 47, 48

	note	4, 64, 11, 12
	note	4
	note	4, 64, 23, 24
	note	4, 64, 11, 12
	note	4
	perc
	inst	13
	vol	64
	note	$46, 80, 10, 12
	note	$46
	note	$46
	perc
	note	4, 64, 11, 12
	note	4
	note	4
	endpat



track6_pat2:
	note	5, 64, 35, 36
	note	4, 64, 11, 12
	note	5
	note	4, 64, 35, 36
	note	5, 64, 23, 24
	note	4

	endpat



track7_start:
	perc

	loop	; global

	loop
		pat	track7_pat1
	loopend	3

	note	0, 92, 23, 24
	n_vel	0, 50
	n_vel	7, 92
	n_vel	0, 50
	note	0, 92, 47, 48
	note	7, 92, 11, 12
	note	0, 50, 23, 24
	note	0, 50, 11, 12

	loop
		pat	track7_pat1
	loopend	2

	note	0, 92, 23, 24
	note	7, 92, 11, 12
	note	7
	note	7
	note	1
	note	2
	note	3
	note	12, 92, 23, 24
	n_vel	0, 92
	note	7, 92, 11, 12
	note	7
	note	7, 92, 215, 216

	note	0, 92, 47, 48
	note	0, 92, 95, 96
	note	7, 92, 11, 12
	note	7
	note	7
	note	7

	loop
		pat	track7_pat1
	loopend	3

	pat	track7_pat2

	loop
		pat	track7_pat1
	loopend	2

	pat	track7_pat3

	note	0, 50, 11, 12
	note	0
	note	7, 92, 23, 24
	n_vel	0, 50
	note	0, 92, 11, 12
	n_vel	0, 50
	note	0, 50, 23, 24
	n_vel	7, 92
	note	0, 50, 11, 12
	note	0

	note	0, 92, 95, 96
	note	0, 92, 47, 48
	note	7, 92, 23, 24
	note	0, 92, 143, 144

	note	0, 78, 11, 12
	note	0
	note	7, 92, 23, 24
	note	0, 50, 11, 12
	note	0

	loop
		pat	track7_pat1
	loopend	3

	pat	track7_pat2

	loop
		pat	track7_pat1
	loopend	2

	pat	track7_pat3

	note	0, 50, 11, 12
	note	0
	note	7, 92, 23, 24
	n_vel	0, 50
	note	0, 92, 11, 12
	n_vel	0, 50
	note	0, 50, 23, 24
	note	7, 92, 11, 12
	note	7
	note	7
	note	7

	loop
		pat	track7_pat4
		n_vel	7, 92
		note	0
	loopend	5

	pat	track7_pat4
	n_vel	3, 92
	note	3

	loop
		pat	track7_pat4
		n_vel	7, 92
		note	0
	loopend	3

	note	7
	note	7
	pan	-64
	loop
		note	22, 50, 7, 8
	loopend	6
	pan	64
	loop
		note	23, 50, 7, 8
	loopend	6
	note	7, 92, 47, 48

	loop
		pat	track7_pat1
	loopend	3

	note	0, 92, 35, 36
	note	0, 50, 11, 12
	note	7, 92, 23, 24
	n_vel	0, 50
	note	1, 92, 11, 12
	note	2
	note	3
	note	12
	note	7, 92, 47, 48

	loop
		pat	track7_pat1
	loopend	2

	note	0, 92, 35, 36
	note	0, 50, 11, 12
	note	7, 92, 23, 24
	note	1, 92, 11, 12
	note	1
	note	2
	note	2
	note	3
	note	3
	note	12
	note	12
	note	7, 92, 215, 216

	rest	120
	note	0, 78, 11, 12
	note	0
	note	7, 92, 23, 24
	note	0, 50, 11, 12
	note	0

	loopend	0 ; global
	end



track7_pat1:
	note	0, 92, 35, 36
	note	0, 50, 11, 12
	note	7, 92, 23, 24
	n_vel	0, 50
	note	0, 92, 11, 12
	n_vel	0, 50
	note	0, 50, 23, 24
	n_vel	7, 92
	n_vel	0, 50

	endpat



track7_pat2:
	note	0, 92, 11, 12
	n_vel	0, 50
	note	0, 50, 23, 24
	n_vel	7, 92
	n_vel	0, 50
	note	0, 92, 11, 12
	n_vel	0, 50
	note	0, 50, 23, 24
	note	7, 92, 35, 36
	note	0, 50, 11, 12

	endpat



track7_pat3:
	note	0, 92, 35, 36
	note	0, 50, 11, 12
	note	7, 92, 23, 24
	n_vel	0, 50
	note	0, 92, 11, 12
	note	7, 92, 23, 24
	note	0, 92, 11, 12
	note	7, 92, 23, 24
	note	0, 92, 47, 48
	endpat



track7_pat4:
	note	0, 92, 23, 24
	note	0
	note	7
	note	0, 50, 11, 12
	note	21
	note	0
	note	21
	note	0, 50, 23, 24
	endpat
