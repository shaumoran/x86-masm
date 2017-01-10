;Prompts the user to select a pattern. Sets the LEDs to this pattern. Then turns on the LEDs which are off on and the ones which are on off.
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
y			DWORD	0 ;cause this my y axis

.code
	main:nop

		invoke version
		invoke readInteger
		invoke setPattern, eax

		loopahaon:
			mov eax, y
			cmp eax, 32
			je exit

			invoke readRow, y

			not eax

			invoke writeRow, y, eax
			inc y

			jmp loopahaon

		exit:
			invoke ExitProcess,0

	end main
