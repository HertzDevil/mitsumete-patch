# Winkysoft Music Format

This article explains the structure of the sound data used in several SNES games developed by Winkysoft, for example [*Super Robot Wars 4*](https://superfamicom.org/info/dai-4-ji-super-robot-taisen).

## Transfer Block Format

Each transfer block consists of multiple chunks laid out contiguously, having the following format: (all integers are little-endian, unless otherwise noted)

```
$0000:      xxxx        # size of chunk 1
$0002:      yyyy        # SPC start address of chunk 1
$0004:      .. .. ..    # chunk 1's xxxx bytes follow
$0004+xxxx: xxxx        # size of chunk 2
$0006+xxxx: yyyy        # SPC start address of chunk 2
$0008+xxxx: .. .. ..    # chunk 2's xxxx bytes follow
                        # ...
         ?: 0000        # transfer ends when xxxx == $0000
       ?+2: zzzz        # BGMs only; zzzz must be the song ID
```

As a special case, a transfer block that begins with `00 00` contains no chunks.

The SPC main program and all BGMs use this transfer format. BRR samples use a different format and have no separate chunks:

```
$0000: xxxx             # loop point relative to start of sample, in bytes
$0002: yyyy             # length of the sample, in bytes
$0004: .. .. ..         # yyyy bytes follow
```

## Instrument Definition

Each instrument consists of 8 bytes:

```
$00: uu         # sample slot number
$01: vvvv       # controls the ADSR envelope, but doesn't seem to map directly to DSP register values?
$03: wwww       # *big-endian* sample pitch
$05: xx         # instrument volume, $FF = highest
$06: yy         # pan, $40 = center, $00 = right, $7F = left
$07: zz         # transpose, $00 = none, $0C = +1 octave, $E8 = -2 octaves
```

Instrument definitions are laid out contiguously.

## Sequence Data Format

There is no header for sequence data; track 1's data immediately starts from the beginning of the sequence data area. Tracks 2 - 8 must be initialized using command `$6E`. A typical "header" looks like:

```
$5200: 69 0F 0C         # set up the FIR filter coefficients
$5203: 69 1F 21
$5206: 69 2F 2B
$5209: 69 3F 2B
$520C: 69 4F 13
$520F: 69 5F FE
$5212: 69 6F F3
$5215: 69 7F F9

$5218: 69 0C 00         # silence everything
$521B: 69 1C 00

$521E: 69 6D D9         # set up echo
$5221: 69 7D 03
$5224: 7F 22            # wait for a while to clear the echo buffer
$5226: 69 6C 00
$5229: 7F 22
$522B: 69 0C 7F         # reset SPC master volume
$522E: 69 1C 7F
$5231: 6D FF 5F 2C 2C   # toggle echo on selected channels, set feedback and echo levels

$5236: 6E 01 9C 53      # start tracks 2 - 8
$523A: 6E 02 C1 54      # e.g. track 3's sequence data begins at $54C1
$523E: 6E 07 18 56
$5242: 6E 04 DA 57
$5246: 6E 06 7C 59
$524A: 6E 05 38 5A
$524E: 6E 03 2E 5B

$5251: 74               # sequence data for track 1 follows
```

### Sequence Commands

| Command   | Description                         | Arguments |
|:----------|:------------------------------------|:----------|
| `$00-$66` | [Note](#note)                       | `none \| (7D xx) \| (7E yy) \| (7F tt) \| ([80-FE] yy tt)` |
| `$67`     | [Pan Envelope](#pan-envelope)       | `pppp` |
| `$68`     | ???                                 | `xx` |
| `$69`     | [DSP Write](#dsp-write)             | `xx yy` |
| `$6A`     | [Vibrato](#vibrato) Rate            | `xx` |
| `$6B`     | [Noise Config](#noise-config)       | `xx` |
| `$6C`     | [Pitch Bend](#pitch-bend) Depth     | `xx` |
| `$6D`     | [Echo Config](#echo-config)         | `xx yy ll rr` |
| `$6E`     | [New Track](#new-track)             | `xx pppp` |
| `$6F`     | [Percussion Mode](#percussion-mode) | `none` |
| `$70`     | [Detune](#detune)                   | `([80-FF] tt [80-FF]*)? [00-7F] tt` |
| `$71`     | [Vibrato](#vibrato) Depth           | `([80-FF] tt [80-FF]*)? [00-7F] tt` |
| `$72`     | [Track Volume](#track-volume)       | `([80-FF] tt [80-FF]*)? [00-7F] tt` |
| `$73`     | [Pan](#pan)                         | `xx` |
| `$74`     | [Loop](#loop) Start                 | `none` |
| `$75`     | [Loop](#loop) End                   | `xx` |
| `$76`     | Call [Pattern](#pattern)            | `pppp` |
| `$77`     | End of [Pattern](#pattern)          | `none` |
| `$78`     | [End of Track](#end-of-track)       | `none` |
| `$79`     | [Tempo](#tempo)                     | `xx yy` |
| `$7A`     | [Transpose](#transpose)             | `xx` |
| `$7B`     | [Instrument](#instrument)           | `xx` |
| `$7C`     | [Rest](#rest)                       | `tt` |
| `$7D`     | [Note](#note) velocity suffix       | `xx` |
| `$7E`     | [Note](#note) length suffix         | `yy` |
| `$7F`     | [Note](#note) wait time suffix      | `tt` |

### New Track

Spawns a track at the given pointer and starts playing it immediately. The track number ranges from `$00` to `$07`; SFXs also use `$08` and `$09`. (There is no need to use track number `$00` because all tracks are spawned from track 1.)

```
$0000: 6E 03 CD AB      # point track 4 at $ABCD
$0004: 01

$ABCD: 02

# plays `01` and `02` simultaneously
```

### End of Track

Stops the current track from reading new sequence data. All tracks should end with this command even if there is an infinite loop.

```
78      # end of track
```

### Loop

Repeats all commands within the loop range for a given number of times. Up to 8 levels of nested loops are supported. A loop can also be made to repeat indefinitely by specifying a loop count of 0.

```
$0000: 74       # start loop 1
$0001: 74       #   start loop 2
$0002: 0A
$0003: 74       #     start loop 3
$0004: 0B
$0005: 75 02    #     end loop 3
$0007: 0C
$0008: 75 03    #   end loop 2
$000A: 0D
$000B: 75 00    # end loop 1

# the above repeats `0A 0B 0B 0C 0A 0B 0B 0C 0A 0B 0B 0C 0D` indefinitely
```

### Pattern

Calls a pattern; the track pointer continues from the given address until the end-of-pattern marker is found, then control returns to the point just after the pattern call. There are no nested patterns; calling a pattern inside another pattern will crash the sound engine.

```
$0000: 76 CD AB # call pattern at $ABCD
$0003: 03

$ABCD: 01
$ABCE: 02
$ABCF: 77       # end of pattern

# the above is equivalent to `01 02 03`
```

### Note

Plays a note. The command byte gives the note pitch in the number of semitones (unless [percussion mode](#percussion-mode) is enabled), but there isn't a unique middle C because each instrument might be tuned differently; usually `$3C` is customarily chosen as middle C. The full form takes 3 arguments, and specifies the velocity (+ `$80`, default is `$C0`), note length (in ticks, `$C0` = whole note), and wait time (also in ticks) all at once:

```
$0000: 3C C0 16 18      # C-5, velocity 64, 22 ticks, 8th note
$0004: 3F E4 5D 60      # Eb5, velocity 100, 93 ticks, half note
```

If the second byte is `$7D`, `$7E`, or `$7F`, then the next byte changes only the velocity (without the + `$80`), note length, or wait time of subsequent notes respectively:

```
$0008: 30 7D 50         # C-4, velocity 80, 93 ticks, half note
$000B: 35 7E 2E         # F-4, velocity 80, 46 ticks, half note
$000E: 3A 7F 30         # Bb4, velocity 80, 46 ticks, quarter note
```

Otherwise, the second byte must be either another new note or a sequence command. In this case all these settings are copied from previous notes:

```
$0012: 39               # A-4, velocity 80, 46 ticks, quarter note
$0013: 40               # E-5, velocity 80, 46 ticks, quarter note
```

Normally the note length must be shorter than the wait time, so that the current note is cut before a new one is played. To suppress this, a note length of `$FF` should be used, which indicates the note should never be cut, producing a tie or a legato depending on the next note. This is useful for e.g. having notes longer than `$FF` ticks or changing the volume in the middle of a note:

```
$0014: 3C C0 FF C0      # C-5, velocity 64, tie, whole note
$0018: 3C 7D B0         # C-5, velocity 48, tie, whole note
$001B: 3C 7E BE         # C-5, velocity 48, 190 ticks, whole note

# plays a single note for 3 full measures, with a lower velocity in the last 2
```

`7F tt` alone is occasionally used to represent rests, but this is only valid if no notes have been played.

### Rest

Plays nothing for the given number of ticks.

```
7C 30   # quarter note rest
```

### Percussion Mode

Toggles percussion mode on or off. The following apply while percussion mode is on:

* The channel's pitch is always exactly the pitch value given in the active instrument, so all pitch effects are disabled.
* Each new note's command byte selects the instrument for that ID, instead of representing a pitch value.

```
$0000: 6F               # turn on percussion mode
$0001: 01 C0 2E 30      # play instrument $01 at a fixed pitch
$0005: 6F               # turn off percussion mode
$0006: 01               # play the C#0 note
```

### Instrument

Selects the instrument with the given ID. Resets the [pan](#pan) and [transpose](#transpose) commands.

```
7B 13   # select instrument $13
```

### Pan

Sets the channel pan position. `$7F` is left, `$00` is right, and `$40` is the center. This modifies the pan setting of the active instrument directly.

```
73 20   # set pan to 50% right
73 50   # set pan to 25% left
```

### Transpose

Transposes all following notes on the current track by the given (signed) number of semitones. This modifies the transpose setting of the active instrument directly, so `00` will not always reset the transpose.

```
7A 04   # set instrument transpose to +4 semitones
7A E8   # set instrument transpose to -2 octaves
```

### Pan Envelope

Applies a pan envelope starting at the given address that runs independently of new notes. The pan envelope has the following interpretation: `$F0` is right, `$FF` is left, `$F8` is the center, `$01-$EF` are wait times, and `$00` stops the envelope. (These wait times seem to desync from notes quite easily.)

```
$0000: 67 CD AB         # play pan envelope at $ABCD

$ABCD: F0 14            # pan 100% right for 20 ticks
$ABCF: FC 28            # pan 50% left for 40 ticks
$ABD1: 00               # end pan envelope
```

### Pitch Bend

Applies a linear bend to the frequencies of all subsequent notes by the given signed depth.

```
6C 05   # bend upwards slowly
6C F1   # bend downwards, 3x as fast as above
6C 00   # disable pitch bend
```

### Detune

Applies a detune multiplier. All notes' frequency are multiplied by `xx / $40`, the maximum value for `xx` being `$7F`. The last argument is a wait time, measured in ticks.

```
70 60 00        # multiply all note frequencies by 150%
70 30 18        # multiply all note frequencies by 75%, then wait for an 8th note
```

If the multiplier is greater than `$7F`, that value minus `$80` is the actual detune value used, and a detune envelope is produced. Multiple envelope values greater than `$7F` may follow, all having the same wait time, until the last non-envelope value is found (this multiplier value has its own required wait time argument).

```
70 FD 09        # multiplier 125, wait for 9 ticks
   F8           # multiplier 120, wait for 9 ticks
   EE           # multiplier 110, wait for 9 ticks
   E4           # multiplier 100, wait for 9 ticks
   5A 12        # multiplier 90, wait for 18 ticks, end of envelope
```

### Vibrato

Causes the current track to oscillate in pitch. The vibrato depth and rate are controlled by commands `$71` and `$6A` respectively, the former of which supports envelopes like the [detune](#detune) command.

```
71 08 00        # moderate vibrato
71 32 00        # strong vibrato
6A 01           # extremely slow vibrato
6A 50           # fast vibrato
```

### Track Volume

Changes the current track's volume. Default is `$40`. Supports envelopes like the [detune](#detune) command.

```
72 50 00        # set track volume to 80
```

### Tempo

Sets the tempo to the given BPM (beats per minute). Some BPM values may cause tracks to desync.

```
79 96 00        # set tempo to 150 BPM
```

The second argument controls the rate of the BPM change. A value of 0 represents an instant change, 1 represents a slow change, and higher values produce a faster change.

```
79 64 02        # change tempo to 100 BPM slowly
```

### DSP Write

Writes the given value to the given SPC DSP register.

```
69 0F 7F        # write $7F to register $0F (COEF0, filter coefficient 0)
69 1C 64        # write $64 to register $1C (MVOL (R), right master volume)
```

### Echo Config

Changes several echo parameters at once: enabled tracks (`EON`), feedback level (`EFB`), left echo volume (`EVOL (L)`), right echo volume (`EVOL (R)`), in that order given.

```
6D FF 5F 2C 2C  # enable echo on all tracks, set feedback to +95, set echo volume to 44
```

### Noise Config

If the given argument is within `$00-$1F`, enables white noise on the current track with that given pitch (`$1F` being the highest), otherwise disables noise output.

```
6B 1D   # enable noise
6B FF   # disable noise
```

## Game-Specific Notes

### *Super Robot Wars 4* (第４次スーパーロボット大戦)

The main SPC program is referred from `$E20000` (file offset `$220000`). It has 3 chunks:

* `ROM:$E20304-$E20583` -> `SPC:$0380-$05FF`: Instrument definitions for ID `$30-$7F`, probably all for sound effects.
* `ROM:$E20588-$E21942` -> `SPC:$07F8-$1BB2`: 4 unknown pointers, followed by a 64-entry table of tempo and master volume values for each BGM. The rest of the chunk appears to be for sound effects.
* `ROM:$E21947-$E224A0` -> `SPC:$F180-$FCD9`: The sound driver code.

Some of the tempo and master volume values are as follows:

```
                                  # ...
ROM:$220596, SPC:$0806: AA 96     # BGM $03: 170 BPM, 150 master volume (Valsion)
ROM:$220598, SPC:$0808: 92 E9     # BGM $04: 146 BPM, 249 master volume (Gallant Char)
ROM:$22059A, SPC:$080A: B3 A0     # BGM $05: 179 BPM, 160 master volume (Mazinger Z)
                                  # ...
```

BGMs `$00-$3F` are referred from the far pointer table at `$E28000-$E280BF`. Some song IDs are unused; these BGMs have no chunks, but nonetheless contain `00 00 xx 00` as their data where `xx` is the song ID. The remaining used BGMs each use 2 chunks. The first chunk is mapped to `$0200` and contains custom instruments; all IDs within `$00-$2F` are available. The second chunk is mapped to `$5200` and contains the sequence data. Custom samples immediately follow the sequence data so there is usually no need to worry about running out of space.

The far pointer table at `$E20003-$E202FF` refers to samples `$01-$FF`. A separate near pointer table at `$E30000-$E301FF`, indexed by the song ID, controls which samples are loaded into which slots for every BGM and SFX. The actual load table has the following format:

```
$0000: aa xx    # load sample xx into slot number aa
$0002: bb yy    # load sample yy into slot number bb
                # ...
    ?: FD       # end of BGM load table (SFX load tables end with FF instead)
```

BGM `$01` loads the sample data for slots `$00-$10`; these samples are shared across all BGMs and SFXs. Songs are free to use the slot range `$18-$20` (and probably higher slot numbers too, provided the samples don't overlap with the echo buffer).

All SPC transfers are complete at `$808404`; SPC files can be readily dumped if a breakpoint is placed there.

#### Karaoke Mode

The bytes at `$CDEF41-$CDEF4E` contain the song IDs for the BGMs available in karaoke mode. Lyrics are accessed through the near pointer table at `$CB667C-$CB678B`, which in turn is referred from `$C9010B`.

The cue points for the lyrics are stored as if they were a BRR chunk with a loop point of 0 and an ID of the BGM's ID + `$C0`. For example, the cue points for Mazinger Z (song ID `$05`, cue ID `$C5`) look like:

```
$E22531: 00 00  # must be 0
$E22533: 80 00  # length of the following chunk (i.e. $E225B4 - $E22535 + 1)

# note that 8 measures total 192 * 8 = 1536 ticks, so the lyrics are slightly ahead of the actual song
$E22535: F0 F0 F0 F0 F0 F0 F1 56                                        # wait for 240 * 6 + 86 = 1526 ticks

$E2253D: 48 78 18 18 18 18 48 30 18 18 18 30 30 C0                      # 空にそびえる  くろがねの城
$E2254B: 18 30 18 60 18 18 18 18 60 18 18 18 0C 3C 30 C0                # スーパーロボット  マジンガーＺ

$E2255B: 18 30 18 48 0C 0C 18 18 18 18 18 30 18 C0 F1 C0                # 無敵の力は  ぼくらのために
$E2256B: 30 18 18 48 18 18 18 18 18 18 48 02 02 BC C0                   # 正義の心を  パイルダーオン！

$E2257A: 18 30 18 60 0C 3C 0C 0C 48 18 F1 18 18 18 18 18 30 18 C0       # とばせ  てっけん  ロケットパンチ
$E2258D: 18 30 18 60 18 18 18 18 60 18 18 18 18 0C 0C 30 18 C0 C0       # いまだ  だすんだ  ブレストファイヤー

$E225A0: 18 0C 24 0C 60 0C 18 0C 24 0C 60 0C                            # マジンゴー  マジンゴー
$E225AC: F1 30 30 30 30 0C B4 C0                                        # マジンガーＺ

$E225B4: FF                                                             # end of cue points
```

A value lower than `$F0` advances the lyrics by one character and then waits for that number of ticks; all spaces and end-of-string markers also count as characters. `$F0` and `$F1 xx` wait for exactly 240 or `xx` ticks respectively, without consuming a character, and `$F2` to `$FF` all finish the cue points (only `$FF` is used).

Displaying the lyrics during the karaoke sequence is done with the near pointer table at `$D25E80-$D25E9F`, indexed by song list order. Again, using Mazinger Z as an example:

```
$D25EA0: C6 00 EB 01 00 01      # display lyrics $00-$01, offsetted by 5 and 10 tiles respectively
$D25EA6: C6 02 EB 03 02 03
$D25EAC: C6 04 EB 05 04 05
$D25EB2: C6 06 F0 07 06 07      # lower line ("マジンガーＺ") is offsetted by 15 tiles here
$D25EB8: FF
```

The different commands are as follows:

* `$00-$BF`: Steps through the lyrics of that given line.
* `$C0-$DF xx`: Clears both lines, then displays lyrics `xx` on the upper line, offsetted by (command byte - `$C1`) tiles.
* `$E0-$FE xx`: Clears the lower line, then displays lyrics `xx` on it, offsetted by (command byte - `$E1`) tiles.
* `$FF`: Finishes the karaoke sequence.

All the karaoke sequences in the game have the form of `[C0-DF] xx [E0-FE] yy xx yy` or `[C0-DF] xx xx`.

### *Super Robot Wars 3* (第３次スーパーロボット大戦)

The main SPC program is referred from `$288000` (file offset `$140000`). It has 5 chunks:

* `ROM:$1400EE-$140454` -> `SPC:$F180-$F4E6`: Presumably contains the tempo and master volume values for each track.
* `ROM:$140459-$140460` -> `SPC:$23F8-$23FF`: 4 unknown pointers.
* `ROM:$140465-$1405B4` -> `SPC:$04B0-$05FF`: Instrument definitions for ID `$5A-$7F`, probably all for sound effects.
* `ROM:$1405B9-$14103E` -> `SPC:$1770-$21F5`: Probably sequence data for sound effects.
* `ROM:$141043-$14190E` -> `SPC:$F500-$FDCB`: The sound driver code.

Instrument definitions are mapped to `$0200` as above. Sequence data is mapped to `$0600` instead, which means only `$1170` bytes are available.

The BRR table is located at `$288003-$2880E6`, the BGM table at `$298000-$298071`, and the sample load table at `$2A8000-$2A80FF`. The sample load entries appear to use a slightly different format than *SRW4*.

This earlier revision of the sound driver does not support commands `$67` and `$68`, so these become note commands.

### *Super Robot Wars EX* (スーパーロボット大戦ＥＸ)

The main SPC program is referred from `$298000` (file offset `$148000`). The data layout resembles *SRW3*.

Instrument definitions are mapped to `$0200`. Sequence data is mapped to `$0600`.

The BRR table is located at `$298003-$2980EF`, the BGM table at `$2A8000-$2A8071`, and the sample load table at `$2B8000-$2B8109`. The same caveats for *SRW3* should also apply here.

### *Super Robot Wars Gaiden: Masoukishin – The Lord Of Elemental* (スーパーロボット大戦外伝 魔装機神)

The main SPC program is referred from `$E30000` (file offset `$230000`). The data layout resembles *SRW4*.

Instrument definitions are mapped to `$0200`. Sequence data is mapped to `$3C00`.

The BRR table is located at `$E30003-$E302FF`, the BGM table at `$E38000-$E380BF`, and the sample load table at `$E40000-$E401FF`.

### *Battle Robot Retsuden* (バトルロボット烈伝)

The main SPC program is referred from `$D80000` (file offset `$180000`). The data layout resembles *SRW4*.

Instrument definitions are mapped to `$0200`. Sequence data is mapped to `$7400`.

The BRR table is located at `$D80003-$D802FF`, the BGM table at `$D88000-$D880BF`, and the sample load table at `$D90000-$D901FF`.

## About

This article is authored by HertzDevil. The most up-to-date revision can be found [here](https://github.com/HertzDevil/mitsumete-patch/blob/main/winkysoft-music-format.md).
