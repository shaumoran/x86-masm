;recursively reduces a number to zero

;main.asm

; Data & Code
;

EXTERNDEF		reduce:NEAR

.data
x			DWORD		10

.code
	main:nop

		invoke version

		push x

		call reduce

		invoke writeInteger, eax

		invoke ExitProcess,0

	end main

;reduce.asm

.586
.model flat,stdcall
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


EXTERNDEF		reduce:NEAR

.code

	reduce:
		push ebp
		mov ebp, esp

		mov eax, [ebp + 8]
		cmp eax, 0
		je exit
		dec eax
		push eax
		call reduce

	exit:
		
		pop ebp
		ret 4



	end
