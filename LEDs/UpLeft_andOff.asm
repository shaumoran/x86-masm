;Prompts the user to enter a pattern. The moves this pattern up and left until all the LEDs are off.
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
x			DWORD	0
yplus1		DWORD	1
y			DWORD   0




.code
	main:nop

		invoke version
		invoke readInteger
		invoke setPattern, eax   ;PATTERN SET

		loop1:
			invoke Sleep, 500
			mov eax, x
			cmp eax, 32
			je exit

			mov y, 0
			mov yplus1, 1
			inc	x
			jmp loop2

		loop2:
			invoke readRow, yplus1
			mov ecx, x
			shl eax, CL
			invoke writeRow, y, eax
			
			inc y
			inc yplus1

			mov eax, y
			cmp eax, 32

			je loop1
			jmp loop2


		exit:
			invoke ExitProcess,0

	end main
