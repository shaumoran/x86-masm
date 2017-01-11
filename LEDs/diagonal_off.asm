;User selects the pattern, prgram then turns off all LEDs one by one starting from top left to bottom right.
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
x			DWORD	31
y			DWORD	0
ycontents	DWORD	0


.code
	main:nop

		invoke version
		invoke readInteger
		invoke setPattern, eax


		loopy:

			invoke Sleep, 50

			mov eax, y
			cmp eax, 32
			jg exit

			mov eax, x
			cmp eax, 0
			jl exit

			invoke readRow, y ;row we are at will inc each loop
			mov ycontents, eax

			mov ebx, 1
			mov ecx, x
			shl ebx , CL

			not ebx

			and ycontents, ebx

			invoke writeRow, y, ycontents

			dec x
			inc y
			jmp loopy

		exit:
			invoke ExitProcess,0

	end main
