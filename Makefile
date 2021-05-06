ASFLAGS = --cpu 65816

ROM = patched.sfc
ROM_OBJS = original.o patch.o
ROM_LINKCFG = link.cfg

SEQ = song/song.bin
SEQ_OBJS = song/inst.o song/seq.o song/song.o
SEQ_LINKCFG = song/link.cfg

.SUFFIXES:
.PHONY: rom seq clean

all: rom seq

clean:
	rm -f "$(ROM)" "$(SEQ)" *.o **/*.o

rom: $(ROM)

$(ROM): $(ROM_OBJS) $(ROM_LINKCFG)
	ld65 -C "$(ROM_LINKCFG)" -o "$@" $(ROM_OBJS)

seq: $(SEQ)

$(SEQ): $(SEQ_OBJS) $(SEQ_LINKCFG)
	ld65 -C "$(SEQ_LINKCFG)" -o "$@" $(SEQ_OBJS)

%.o: %.s
	ca65 $(ASFLAGS) -o $@ $<

patch.o: seq
