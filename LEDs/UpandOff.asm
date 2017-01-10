;Prompts the user to select a pattern. Then moves this pattern up one row at a time until all the LEDs are off.
; CA296 Console Template
; Version 1
;

;
; Preamble
;

.586
.model flat,stdcall
.stack 4096
option casemap:none

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

includelib p:\masm32\lib\ca296.lib
includelib kernel32.lib
includelib user32.lib
includelib msvcrt.lib


;
; Data & Code
;

.data
y			DWORD	1
upy			DWORD	0
i			DWORD   32


.code
	main:nop

		invoke version

		invoke readInteger
		invoke setPattern, eax

		;get number of loops sorted first

		loopdatloop:
			invoke Sleep, 500
			mov eax, i
			cmp eax, 0
			je exit
			mov upy,0
			mov y, 1
			dec i
			jmp movingpattern

		movingpattern:
			
			invoke readRow, y
			;top of board
			invoke writeRow, upy, eax
			;invoke Sleep, 500
			inc y
			inc upy
			mov eax, upy
			cmp eax, 32
			je loopdatloop
			jmp movingpattern

		exit:

		invoke ExitProcess,0

	end main
