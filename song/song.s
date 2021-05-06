.import __INST_START__, __INST_LAST__
.import __SEQ_START__, __SEQ_LAST__
.import SONG_NUMBER

.include "macros.inc"

.segment "INST_HEADER"

	.word	__INST_LAST__ - __INST_START__
	.word	__INST_START__

.segment "SEQ_HEADER"

	.word	__SEQ_LAST__ - __SEQ_START__
	.word	__SEQ_START__

.segment "FOOTER"

	.word	0
	.word	SONG_NUMBER
