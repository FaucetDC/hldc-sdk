COMMENT %
       ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
       บ                      Fire! Routine 1.01                    วฤฟ
       วฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤถ ณ
       บ Well, here's the second demo program in the tutorial       บ ณ
       บ series.  Exams delayed this a bit, but all in all it took  บ ณ
       บ me about a day - (11AM -> 8PM) - to do.  Yes, I spent      บ ณ
       บ quite a while fine tuning this.                            บ ณ
       บ                                                            บ ณ
       บ You are free to modify and use this code in your programs, บ ณ
       บ just don't put your name on it and redistribute it - okay? บ ณ
       บ The program can also be improved upon greatly, so if you   บ ณ
       บ make something good from this - send it to me.  I like to  บ ณ
       บ see what people have done with my work.                    บ ณ
       บ                                                            บ ณ
       บ                        28th June 1996                      บ ณ
       บ                                                            บ ณ
       บ Contact Adam Hyde at:                                      บ ณ
       บ    þ http://www.faroc.com.au/~blackcat                     บ ณ
       บ    þ blackcat@faroc.com.au                                 บ ณ
       บ                                                            บ ณ
       บ                    (C) 1996 Adam Hyde.                     บ ณ
       ศัอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ ณ
        ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
%

   .MODEL SMALL   ; Data segment < 64K, code segment < 64K
   .STACK 200H    ; Set up 512 bytes of stack space
   .386

; ===========================================================================
  .DATA

CR        EQU 13
LF        EQU 10

BufferX   EQU 320                       ; Width of screen buffer
BufferY   EQU 104                       ; Height of screen buffer

AllDone   DB CR, LF, "That was:"
          DB CR, LF
          DB CR, LF, "         FFFFFFFFF    IIIIIII     RRRRRRRRR        EEEEEEEEE         !  "
          DB CR, LF, "          FFF           III        RRR   RRR        EEE             !!! "
          DB CR, LF, "          FFF           III        RRR   RRR        EEE            !!!!!"
          DB CR, LF, "          FFF           III        RRRRRRRR         EEE            !!!!!"
          DB CR, LF, "          FFFFFFF       III        RRRRRRRR         EEEEEEEE       !!!!!"
          DB CR, LF, "          FFF           III        RRR  RRR         EEE             !!! "
          DB CR, LF, "          FFF           III        RRR   RRR        EEE                 "
          DB CR, LF, "          FFF           III        RRR    RRR       EEE             !!! "
          DB CR, LF, "         FFFFF        IIIIIII     RRRR    RRRR     EEEEEEEEE        !!! "
          DB CR, LF
          DB CR, LF
          DB CR, LF, "   The demo program from Assembler Tutorial 8.  You can get in touch with the"
          DB CR, LF, "   author, Adam Hyde, at:", CR, LF
          DB CR, LF, "     þ blackcat@faroc.com.au"
          DB CR, LF, "     þ http://www.faroc.com.au/~blackcat", CR, LF, "$"

Buffer    DB BufferX * BufferY DUP (?) ; The screen buffer

Seed      DW 3749h                     ; The seed value, and half of my
                                       ; phone number - not in hex though. :)

INCLUDE PALETTE.DAT                    ; The palette, generated with
                                       ; Autodesk Animator, and a simple
                                       ; Pascal program.

; ===========================================================================
   .CODE

InitializeMCGA   PROC
   MOV   AX, 0A000h
   MOV   ES, AX                        ; ES now points to the VGA

   MOV   AH, 00H                       ; Set video mode
   MOV   AL, 13H                       ; Mode 13h
   INT   10H                           ; We are now in 320x200x256
   RET            
InitializeMCGA   ENDP

; ---------------------------------------------------------------------------

SetUpPalette     PROC
   MOV   SI, OFFSET Palette            ; SI now points to the palette
   MOV   CX, 768                       ; Prepare for 768 OUTs
   MOV   DX, 03C8H                     ; Palette WRITE register
   XOR   AL, AL                        ; Start at color 0
   CLI                                 ; Disable interrupts
   OUT   DX, AL                        ; Send value
   CLD                                 ; Forward direction
   INC   DX                            ; Now use palette DATA register
   REP   OUTSB                         ; 768 multiple OUTs
   STI                                 ; Enable interrupts
   RET
SetupPalette     ENDP

; ---------------------------------------------------------------------------

; This procedure was picked up from comp.lang.asm.x86 - many thanks to the
; unknown author.

Random           PROC
   MOV   AX, Seed                      ; Move the seed value into AX
   MOV   DX, 8405H                     ; Move 8405H into DX
   MUL   DX                            ; Put 8405H x Seed into DX:AX
   INC   AX                            ; Increment AX
   MOV   Seed, AX                      ; We have a new seed
   RET
Random           ENDP

; ---------------------------------------------------------------------------

DrawScreen       PROC
   MOV   SI, OFFSET Buffer             ; Point SI to the start of the buffer
   XOR   DI, DI                        ; Start drawing at 0, 0
   MOV   BX, BufferY - 4               ; Miss the last four lines from the
                                       ; buffer.  These lines will not look
                                       ; fire-like at all
Row:
   MOV   CX, BufferX SHR 1             ; 160 WORDS
   REP   MOVSW                         ; Move them
   SUB   SI, 320                       ; Go back to the start of the array row
   MOV   CX, BufferX SHR 1             ; 160 WORDS
   REP   MOVSW                         ; Move them
   DEC   BX                            ; Decrease the number of VGA rows left
   JNZ   Row                           ; Are we finished?
   RET
DrawScreen       ENDP

; ---------------------------------------------------------------------------

AveragePixels    PROC
   MOV   CX, BufferX * BufferY - BufferX * 2  ; Alter all of the buffer,
                                              ; except for the first row and
                                              ; last row
   MOV   SI, OFFSET Buffer + 320              ; Start from the second row

Alter:
   XOR   AX, AX                        ; Zero out AX
   MOV   AL, DS:[SI]                   ; Get the value of the current pixel
   ADD   AL, DS:[SI+1]                 ; Get the value of pixel to the right
   ADC   AH, 0
   ADD   AL, DS:[SI-1]                 ; Get the value of pixel to the left
   ADC   AH, 0
   ADD   AL, DS:[SI+BufferX]           ; Get the value of the pixel underneath
   ADC   AH, 0
   SHR   AX, 2                         ; Divide the total by four

   JZ    NextPixel                     ; Is the result zero?
   DEC   AX                            ; No, so decrement it by one

NextPixel:
   MOV   DS:[SI-BufferX], AL           ; Put the new value into the array
   INC   SI                            ; Next pixel
   DEC   CX                            ; One less to do
   JNZ   Alter                         ; Have we done them all?
   RET
AveragePixels    ENDP

; ---------------------------------------------------------------------------

TextMode         PROC
   MOV   AH, 00H                       ; Set video mode
   MOV   AL, 03H                       ; Mode 03h
   INT   10H                           ; Enter 80x25x16 mode

   MOV   DX, OFFSET AllDone            ; DS:DX points to the ending message
   MOV   AH, 09H
   INT   21H                           ; Display the ending message
   RET
TextMode         ENDP

; ---------------------------------------------------------------------------

Start:
   MOV   AX, @DATA
   MOV   DS, AX                        ; DS now points to the data segment.

   CALL  InitializeMCGA
   CALL  SetUpPalette

MainLoop:
   CALL  AveragePixels

   MOV   SI, OFFSET Buffer + BufferX * BufferY - BufferX SHL 1
   ; SI now points to the start of the second last row
   MOV   CX, BufferX SHL 1             ; Prepare to get BufferX x 2 random #s

BottomLine:
   CALL   Random                       ; Get a random number
   MOV    DS:[SI], DL                  ; Use only the low byte of DX - ie,
   INC    SI                           ; the number will be 0 --> 255
   DEC    CX                           ; One less pixel to do
   JNZ    BottomLine                   ; Are we done yet?

   CALL  DrawScreen                    ; Copy the buffer to the VGA

   MOV   AH, 01H                       ; Check for keypress
   INT   16H                           ; Is a key waiting in the buffer?
   JZ    MainLoop                      ; No, keep on going

   MOV   AH, 00H                       ; Yes, so get the key
   INT   16H

   CALL  TextMode
   MOV   AH, 4CH
   MOV   AL, 00H
   INT   21H                           ; Return to DOS
END Start
