;Prompts the user to enter a pattern. Then moves this pattern left and off the screen until all LEDs are off.
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
x			DWORD	0 ;<----
y			DWORD   0 ;what row we on


.code
	main:nop

		invoke version
		invoke readInteger
		invoke setPattern, eax


		firstloop:
			invoke Sleep, 500
			mov eax, x
			cmp x, 32
			je exit
			inc x
			mov y, 0
			jmp secondloop

		secondloop:
			invoke readRow, y
			mov ecx, x
			shl eax, CL

			invoke writeRow, y, eax
			inc y
			mov eax, y
			cmp eax, 32
			je firstloop
			jmp secondloop

		exit:
			invoke ExitProcess,0

	end main
