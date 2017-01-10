;The program sets the LEDs to pattern 7 and prompts the user to select a row. It then switches off the LEDs in this row one-by-one
starting at the lefthand side.

; CA296 Console Template
; Version 1

; Preamble

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

; Data & Code

.data
x			DWORD	32
y			DWORD   0
rowcontents	DWORD   0


.code
	main:nop

		invoke version
		invoke setPattern, 7

		invoke readInteger
		mov y, eax
		invoke readRow, eax
		mov rowcontents, eax

		loopy1:
			invoke Sleep, 65
			mov eax, x
			cmp x, 0
			je exit
			dec x


			mov ebx, 1
			mov ecx, x
			shl ebx, CL

			not ebx
			and rowcontents, ebx

			invoke writeRow, y, rowcontents
			je loopy1

		exit:
			invoke ExitProcess,0

	end main
