;User inputs tco-ordinates and an initial pattern. Program will then return this pattern and blink the selected LED.
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
y			DWORD	0

.code
	main:nop

		invoke version

		invoke readInteger
		mov y, eax  ;ROW WE WANT
		invoke readInteger
		mov x, eax  ;SPECIFIC ELEMENT IN ROW

		invoke readInteger
		invoke setPattern, eax ;pattern sorted

		sleepy:
			invoke readRow, y  ; row now in eax
			mov ebx, 1
			mov ecx, x
			shl ebx, CL


			xor eax, ebx
			invoke writeRow, y, eax
			invoke Sleep, 500
			jmp sleepy

		


		invoke ExitProcess,0

	end main
