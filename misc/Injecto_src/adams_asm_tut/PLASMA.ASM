COMMENT %
       ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
       º                      Plasma Routine 1.01                   ÇÄ¿
       ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶ ³
       º It's been so long since I released a tutorial lately, and  º ³
       º feeling quite guilty I've decide to release a third demo   º ³
       º program.  This doesn't fit in with the theme of Tutorial   º ³
       º 9, but call it revision on tutorial 8 huh?                 º ³
       º                                                            º ³
       º Anyway, a friend of mine just made a plasma and so feeling º ³
       º insanely jealous I decided I had to do something.  Thanks  º ³
       º for the inspiration Clive. ;)                              º ³
       º                                                            º ³
       º You are free to do whatever you want with this code, just  º ³
       º don't redistribute it with your name on top..okay?  If you º ³
       º make something from this, then send it on to me -- I like  º ³
       º to see what people have done with my work.                 º ³
       º                                                            º ³
       º                     12th December 1996                     º ³
       º                                                            º ³
       º Contact Adam Hyde at:                                      º ³
       º    ş http://www.faroc.com.au/~blackcat                     º ³
       º    ş blackcat@faroc.com.au                                 º ³
       º                                                            º ³
       º                     (C) 1996 Adam Hyde.                    º ³
       ÈÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼ ³
        ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%

   .MODEL SMALL   ; Data segment < 64K, code segment < 64K
   .STACK 200H    ; Set up 512 bytes of stack space
   .386

; ===========================================================================
   .DATA


   CR     EQU 13
   LF     EQU 10


   Done   DB CR, LF
          DB CR, LF, "  ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß   "
          DB CR, LF, "                      You've just seen the PLASMA effect  "
          DB CR, LF
          DB CR, LF, "         from Assembler Tutorial 9.  If you don't have the source for"
          DB CR, LF, "         this program, or wish to obtain the tutorial, you can grab"
          DB CR, LF, "         them both at:  http://www.faroc.com.au/~blackcat"
          DB CR, LF
          DB CR, LF, "         Alternatively, you may reach the author by mailing:"
          DB CR, LF
          DB CR, LF, "         ş blackcat@faroc.com.au"
          DB CR, LF
          DB CR, LF, "                              (C) 1996 Adam Hyde"
          DB CR, LF, "  ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ   "
          DB CR, LF
          DB CR, LF, "$"


   INCLUDE SINTABLE.DAT                ; Include the table containing the
                                       ; sine values

   INCLUDE PLASMA.DAT                  ; Include the palette for the demo

; ===========================================================================
   .CODE

Start:
   MOV   AX, @DATA
   MOV   DS, AX                        ; Point DS to the data segment

   MOV   AH, 00H                       ; Set video mode
   MOV   AL, 13H                       ; Mode 13H
   INT   10H

   MOV   AX, 0A000H
   MOV   ES, AX                        ; Set ES to point to the VGA

   MOV   SI, OFFSET Palette            ; SI now points to the palette
   MOV   CX, 768                       ; 768 color values to store
   MOV   DX, 03C8H                     ; Palette WRITE register
   XOR   AL, AL                        ; Start at color 0
   CLI                                 ; Disable interrupts
   OUT   DX, AL                        ; Send value
   CLD                                 ; Work forwards
   INC   DX                            ; Now use palette DATA register
   REP   OUTSB                         ; 768 multiple OUTs
   STI                                 ; Enable interrupts


MainLoop:


   PUSH  DX                            ; Temp values 1 + 2 will be in DX
                                       ; after control has looped back here
                                       ; so make sure we save them

   MOV   DX, 03DAH                     ; Check for retrace
                                       ; If bit 4 of the VGA status register
                                       ; is set, a retrace is happening.
                                       ; Becuase we don't know how far into
                                       ; a retrace it is -- we then wait for
                                       ; a new one to start

Retrace_1:
   IN    AL, DX
   AND   AL, 08H                       ; Check bit 4
   JNZ   Retrace_1                     ; Is a retrace in progress?

                                       ; Retrace is now done... wait for a
                                       ; new one to start
Retrace_2:
   IN    AL, DX
   AND   AL, 08H
   JZ    Retrace_2                     ; Has one begun?

   POP   DX                            ; Yes!  Let's go.

   XOR   CH, CH                        ; Zero out temp value 4
   SUB   CL, 2                         ; Decrement temp value 3
   MOV   AX, 199                       ; 200 Rows

Y_Loop:

   PUSH  AX                            ; Store current row number while
   MOV   DI, AX                        ; the offset of the current row is
   SHL   AX, 8                         ; worked out
   SHL   DI, 6
   ADD   DI, AX
   POP   AX                            ; Restore current row number

   INC   CH                            ; Increment temp value 4

   MOV   SI, AX                        ; SI = current row
   MOV   BL, CL
   XOR   BH, BH                        ; BX = temp value 3
   ADD   SI, BX                        ; SI = current row + temp value 3
   MOV   DL, [SinTable + SI]           ; Temp value 1 = Sintable[Y + Temp3]

   MOV   BL, CH                        ; BL = temp value 4
   XOR   BH, BH                        ; BX = temp value 4
   MOV   DH, [SinTable + BX]           ; Temp value 2 = SinTable[Temp4];
   
   PUSH  CX                            ; Save temp values 3 and 4 because
                                       ; CX gets used as a temporary register

   MOV   BX, 159                       ; 160 Columns -- double up horizontal
                                       ; pixels to save some time
X_Loop:

   PUSH  BX                            ; Save the current column
   MOV   BL, DL
   XOR   BH, BH                        ; BX = temp value 1
   MOV   SI, BX                        ; SI = BX
   MOV   BL, DH
   XOR   BH, BH                        ; BX = temp value 2
   ADD   SI, BX                        ; SI = temp value 1 + temp value 2
   MOV   CL, [SinTable + SI]           ; CL = SinTable[Temp1 + Temp2]

   MOV   SI, AX                        ; SI = current row number
   MOV   BL, DH
   XOR   BH, BH                        ; BX = temp value 2
   ADD   SI, BX                        ; SI = current row + temp value 2
   ADD   CL, [SinTable + SI]

   ; CL now equals:  SinTable[Temp1 + Temp2] + SinTable[Y + Temp2]
   ; (CL is the color we'll be plotting)

   MOV   CH, CL                        ; We'll be storing a word so make
   MOV   ES:[DI], CX                   ; sure CH = CL
   INC   DL                            ; Increment temp value 1
   INC   DH                            ; Increment temp value 2
   ADD   DI, 2                         ; Move two pixels along -- we're only
                                       ; working out every other pixel

   POP   BX                            ; Restore the current column
   DEC   BX                            ; Decrease the number of horizontal
                                       ; pixel values to work out

   JNZ   X_Loop                        ; Have we done them all?

   POP   CX                            ; Restore temp values 3 + 4
   DEC   AX                            ; Decrease the nuber of rows
   JNZ   Y_Loop                        ; Have we done all the rows?

   MOV   AH, 01H                       ; Yes, so check for a keypress
   INT   16H                           ; Is a key waiting in the buffer?
   JZ    MainLoop                      ; No, loop right back to the start

   MOV   AH, 00H                       ; Yes, so get the key
   INT   16H

   MOV   AH, 00H                       ; Set video mode
   MOV   AL, 03H                       ; Mode 03H
   INT   10H
   MOV   DX, OFFSET Done               ; DS:DX points to the ending message
   MOV   AH, 09H
   INT   21H                           ; Display the ending message

   MOV   AH, 4CH                       ; Return to DOS
   MOV   AL, 00H
   INT   21H

END Start

; ---------------------------------------------------------------------------
;
; For those who are wondering why I did a:
;
; XOR regH, regH
;
; after a move into that register's low byte, the answer is pretty simple.
;
;
; Let's take the following example:
;
;  MOV   BL, CH                        ; BL = temp value 4
;  XOR   BH, BH                        ; BX = temp value 4
;  MOV   DH, [SinTable + BX]           ; Temp value 2 = SinTable[Temp4]
;
;
; It is not possible for me to just say  MOV   DH, [SinTable + CH]  because
; CH is an 8-bit register.  YOU MUST USE A 16-BIT REGISTER.  So, I decided
; to use BX.  However, I couldn't just move CH into BX, so I decided to move
; CH into BL.
;
; Now, because CH will only hold a byte -- we want BX to only be a byte.
;
; Therefore, we MUST zero out BH to ensure that only the low byte of BX is
; being used.  If BH contained a value other than zero, BX would NOT equal CH!
;
; I hope you understand what I'm trying to explain.
;