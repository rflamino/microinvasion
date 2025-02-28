;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module memory
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_StackAddress
	.globl _Mem_GetStackAddress
	.globl _Mem_HeapAlloc
	.globl _Mem_HeapFree
	.globl _Mem_Set_16b
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_g_StackAddress::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/memory.c:24: u16 Mem_GetStackAddress()
;	---------------------------------
; Function Mem_GetStackAddress
; ---------------------------------
_Mem_GetStackAddress::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/memory.c:29: __endasm;
	ld	(_g_StackAddress), sp
	ld	de, (_g_StackAddress)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/memory.c:30: }
	ret
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/memory.c:34: void* Mem_HeapAlloc(u16 size)
;	---------------------------------
; Function Mem_HeapAlloc
; ---------------------------------
_Mem_HeapAlloc::
	ld	c, l
	ld	b, h
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/memory.c:36: u16 addr = g_HeapStartAddress;
	ld	de, (_g_HeapStartAddress)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/memory.c:37: g_HeapStartAddress += size;
	ld	hl, #_g_HeapStartAddress
	ld	a, (hl)
	add	a, c
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/memory.c:38: return (void*)addr;
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/memory.c:39: }
	ret
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/memory.c:43: void Mem_HeapFree(u16 size)
;	---------------------------------
; Function Mem_HeapFree
; ---------------------------------
_Mem_HeapFree::
	ex	de, hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/memory.c:45: g_HeapStartAddress -= size;	
	ld	hl, #_g_HeapStartAddress
	ld	a, (hl)
	sub	a, e
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	sbc	a, d
	ld	(hl), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/memory.c:46: }
	ret
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/memory.c:157: void Mem_Set_16b(u16 val, void* dest, u16 size)
;	---------------------------------
; Function Mem_Set_16b
; ---------------------------------
_Mem_Set_16b::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/memory.c:191: __endasm;
	push	de
	ex	de, hl
	ld	(hl), d
	inc	hl
	ld	(hl), e
	inc	hl
	ex	de, hl
	pop	hl
	pop	iy
	pop	bc
	dec	bc
	dec	bc
	ldir
	 mem_fill16_end:
	jp	(iy)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/memory.c:192: }
	pop	hl
	pop	af
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
