;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module game_menu
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Menu_DisplayItem
	.globl _Menu_DefaultEventCB
	.globl _Menu_DefaultDrawCB
	.globl _Menu_DefaultInputCB
	.globl _Keyboard_IsKeyPressed
	.globl _Print_DrawInt
	.globl _Print_DrawText
	.globl _Print_DrawChar
	.globl _VDP_FillVRAM_16K
	.globl _g_MenuScrWidth
	.globl _g_MenuInputPrev
	.globl _g_MenuFlag
	.globl _g_MenuPageIdx
	.globl _g_MenuEventCB
	.globl _g_MenuDrawCB
	.globl _g_MenuInputCB
	.globl _g_MenuItem
	.globl _g_MenuPage
	.globl _g_MenuTable
	.globl _g_SLTSL
	.globl _g_GRPACY
	.globl _g_GRPACX
	.globl _g_LOGOPR
	.globl _g_CMASK
	.globl _g_CLOC
	.globl _g_FNKSTR
	.globl _g_ATRBYT
	.globl _g_BDRCLR
	.globl _g_BAKCLR
	.globl _g_FORCLR
	.globl _g_CSRX
	.globl _g_CSRY
	.globl _g_CLIKSW
	.globl _g_MLTPAT
	.globl _g_MLTATR
	.globl _g_MLTCGP
	.globl _g_MLTCOL
	.globl _g_MLTNAM
	.globl _g_GRPPAT
	.globl _g_GRPATR
	.globl _g_GRPCGP
	.globl _g_GRPCOL
	.globl _g_GRPNAM
	.globl _g_T32PAT
	.globl _g_T32ATR
	.globl _g_T32CGP
	.globl _g_T32COL
	.globl _g_T32NAM
	.globl _g_TXTPAT
	.globl _g_TXTATR
	.globl _g_TXTCGP
	.globl _g_TXTCOL
	.globl _g_TXTNAM
	.globl _g_CLMLST
	.globl _g_CRTCNT
	.globl _g_LINLEN
	.globl _g_LINL32
	.globl _g_LINL40
	.globl _g_SVFFFD
	.globl _g_RG27SAV
	.globl _g_RG26SAV
	.globl _g_RG25SAV
	.globl _g_SVFFF8
	.globl _g_MINROM
	.globl _g_RG23SAV
	.globl _g_RG22SAV
	.globl _g_RG21SAV
	.globl _g_RG20SAV
	.globl _g_RG19SAV
	.globl _g_RG18SAV
	.globl _g_RG17SAV
	.globl _g_RG16SAV
	.globl _g_RG15SAV
	.globl _g_RG14SAV
	.globl _g_RG13SAV
	.globl _g_RG12SAV
	.globl _g_RG11SAV
	.globl _g_RG10SAV
	.globl _g_RG09SAV
	.globl _g_RG08SAV
	.globl _g_PROCNM
	.globl _g_SLTWRK
	.globl _g_SLTATR
	.globl _g_SLTTBL
	.globl _g_EXPTBL
	.globl _g_MNROM
	.globl _g_DRWANG
	.globl _g_DRWSCL
	.globl _g_DRWFLG
	.globl _g_GYPOS
	.globl _g_GXPOS
	.globl _g_BRDATR
	.globl _g_CASPRV
	.globl _g_OLDSCR
	.globl _g_SCRMOD
	.globl _g_FLBMEM
	.globl _g_KANAMD
	.globl _g_KANAST
	.globl _g_CAPST
	.globl _g_CSTYLE
	.globl _g_CSRSW
	.globl _g_INSFLG
	.globl _g_ESCCNT
	.globl _g_GRPHED
	.globl _g_WINWID
	.globl _g_LOWLIM
	.globl _g_INTCNT
	.globl _g_INTVAL
	.globl _g_JIFFY
	.globl _g_PADX
	.globl _g_PADY
	.globl _g_INTFLG
	.globl _g_RTYCNT
	.globl _g_TRPTBL
	.globl _g_HIMEM
	.globl _g_BOTTOM
	.globl _g_PATWRK
	.globl _g_LINWRK
	.globl _g_KEYBUF
	.globl _g_NEWKEY
	.globl _g_OLDKEY
	.globl _g_CLIKFL
	.globl _g_ONGSBF
	.globl _g_FNKFLG
	.globl _g_FNKSWI
	.globl _g_CODSAV
	.globl _g_FSTPOS
	.globl _g_LINTTB
	.globl _g_BASROM
	.globl _g_ENSTOP
	.globl _g_VCBC
	.globl _g_VCBB
	.globl _g_VCBA
	.globl _g_PLYCNT
	.globl _g_MUSICF
	.globl _g_QUEUEN
	.globl _g_MCLPTR
	.globl _g_MCLLEN
	.globl _g_SAVVOL
	.globl _g_VOICEN
	.globl _g_SAVSP
	.globl _g_PRSCNT
	.globl _g_LSTMOD
	.globl _g_LSTCOM
	.globl _g_COMMSK
	.globl _g_ESTBLS
	.globl _g_FLAGS
	.globl _g_ERRORS
	.globl _g_DATCNT
	.globl _g_DEVNUM
	.globl _g_OLDINT
	.globl _g_OLDSTT
	.globl _g_MEXBIh
	.globl _g_RSIQLN
	.globl _g_RSFCB
	.globl _g_TOCNT
	.globl _g_RSTMP
	.globl _g_YSAVE
	.globl _g_XSAVE
	.globl _g_NORUSE
	.globl _g_MODE
	.globl _g_ROMA
	.globl _g_CHRCNT
	.globl _g_EXBRSA
	.globl _g_AVCSAV
	.globl _g_ACPAGE
	.globl _g_DPPAGE
	.globl _g_RS2IQ
	.globl _g_VOICCQ
	.globl _g_VOICBQ
	.globl _g_VOICAQ
	.globl _g_QUEBAK
	.globl _g_QUETAB
	.globl _g_ASPCT2
	.globl _g_ASPCT1
	.globl _g_HEADER
	.globl _g_HIGH
	.globl _g_LOW
	.globl _g_CS240
	.globl _g_CS120
	.globl _g_GETPNT
	.globl _g_PUTPNT
	.globl _g_REPCNT
	.globl _g_SCNCNT
	.globl _g_FRCNEW
	.globl _g_QUEUES
	.globl _g_MINUPD
	.globl _g_MAXUPD
	.globl _g_TRGFLG
	.globl _g_STATFL
	.globl _g_RG7SAV
	.globl _g_RG6SAV
	.globl _g_RG5SAV
	.globl _g_RG4SAV
	.globl _g_RG3SAV
	.globl _g_RG2SAV
	.globl _g_RG1SAV
	.globl _g_RG0SAV
	.globl _g_CNSDFG
	.globl _g_USRTAB
	.globl _g_CLPRIM
	.globl _g_WRPRIM
	.globl _g_RDPRIM
	.globl _Menu_Initialize
	.globl _Menu_DrawPage
	.globl _Menu_Update
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_g_LINL40	=	0xf3ae
_g_LINL32	=	0xf3af
_g_LINLEN	=	0xf3b0
_g_CRTCNT	=	0xf3b1
_g_CLMLST	=	0xf3b2
_g_TXTNAM	=	0xf3b3
_g_TXTCOL	=	0xf3b5
_g_TXTCGP	=	0xf3b7
_g_TXTATR	=	0xf3b9
_g_TXTPAT	=	0xf3bb
_g_T32NAM	=	0xf3bd
_g_T32COL	=	0xf3bf
_g_T32CGP	=	0xf3c1
_g_T32ATR	=	0xf3c3
_g_T32PAT	=	0xf3c5
_g_GRPNAM	=	0xf3c7
_g_GRPCOL	=	0xf3c9
_g_GRPCGP	=	0xf3cb
_g_GRPATR	=	0xf3cd
_g_GRPPAT	=	0xf3cf
_g_MLTNAM	=	0xf3d1
_g_MLTCOL	=	0xf3d3
_g_MLTCGP	=	0xf3d5
_g_MLTATR	=	0xf3d7
_g_MLTPAT	=	0xf3d9
_g_CLIKSW	=	0xf3db
_g_CSRY	=	0xf3dc
_g_CSRX	=	0xf3dd
_g_FORCLR	=	0xf3e9
_g_BAKCLR	=	0xf3ea
_g_BDRCLR	=	0xf3eb
_g_ATRBYT	=	0xf3f2
_g_FNKSTR	=	0xf87f
_g_CLOC	=	0xf92a
_g_CMASK	=	0xf92c
_g_LOGOPR	=	0xfb02
_g_GRPACX	=	0xfcb7
_g_GRPACY	=	0xfcb9
_g_SLTSL	=	0xffff
_g_MenuTable::
	.ds 2
_g_MenuPage::
	.ds 2
_g_MenuItem::
	.ds 1
_g_MenuInputCB::
	.ds 2
_g_MenuDrawCB::
	.ds 2
_g_MenuEventCB::
	.ds 2
_g_MenuPageIdx::
	.ds 1
_g_MenuFlag::
	.ds 1
_g_MenuInputPrev::
	.ds 1
_g_MenuScrWidth::
	.ds 1
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
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:61: u8 Menu_DefaultInputCB()
;	---------------------------------
; Function Menu_DefaultInputCB
; ---------------------------------
_Menu_DefaultInputCB::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:63: u8 new = 0;
	ld	c, #0x00
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:64: if(Keyboard_IsKeyPressed(KEY_UP))    new |= MENU_INPUT_UP;
	push	bc
	ld	a, #0x58
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00102$
	ld	c, #0x01
00102$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:65: if(Keyboard_IsKeyPressed(KEY_DOWN))  new |= MENU_INPUT_DOWN;
	push	bc
	ld	a, #0x68
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00104$
	set	1, c
00104$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:66: if(Keyboard_IsKeyPressed(KEY_LEFT))  new |= MENU_INPUT_LEFT;
	push	bc
	ld	a, #0x48
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00106$
	set	2, c
00106$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:67: if(Keyboard_IsKeyPressed(KEY_RIGHT)) new |= MENU_INPUT_RIGHT;
	push	bc
	ld	a, #0x78
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00108$
	set	3, c
00108$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:68: if(Keyboard_IsKeyPressed(KEY_SPACE)) new |= MENU_INPUT_TRIGGER;
	push	bc
	ld	a, #0x08
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00110$
	set	4, c
00110$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:70: u8 ret = (new & g_MenuInputPrev) ^ new;
	ld	a, c
	ld	iy, #_g_MenuInputPrev
	and	a, 0 (iy)
	xor	a, c
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:71: g_MenuInputPrev = new;
	ld	0 (iy), c
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:73: return ret;
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:74: }
	ret
_g_RDPRIM	=	0xf380
_g_WRPRIM	=	0xf385
_g_CLPRIM	=	0xf38c
_g_USRTAB	=	0xf39a
_g_CNSDFG	=	0xf3de
_g_RG0SAV	=	0xf3df
_g_RG1SAV	=	0xf3e0
_g_RG2SAV	=	0xf3e1
_g_RG3SAV	=	0xf3e2
_g_RG4SAV	=	0xf3e3
_g_RG5SAV	=	0xf3e4
_g_RG6SAV	=	0xf3e5
_g_RG7SAV	=	0xf3e6
_g_STATFL	=	0xf3e7
_g_TRGFLG	=	0xf3e8
_g_MAXUPD	=	0xf3ec
_g_MINUPD	=	0xf3ef
_g_QUEUES	=	0xf3f3
_g_FRCNEW	=	0xf3f5
_g_SCNCNT	=	0xf3f6
_g_REPCNT	=	0xf3f7
_g_PUTPNT	=	0xf3f8
_g_GETPNT	=	0xf3fa
_g_CS120	=	0xf3fc
_g_CS240	=	0xf401
_g_LOW	=	0xf406
_g_HIGH	=	0xf408
_g_HEADER	=	0xf40a
_g_ASPCT1	=	0xf40b
_g_ASPCT2	=	0xf40d
_g_QUETAB	=	0xf959
_g_QUEBAK	=	0xf971
_g_VOICAQ	=	0xf975
_g_VOICBQ	=	0xf9f5
_g_VOICCQ	=	0xfa75
_g_RS2IQ	=	0xfaf5
_g_DPPAGE	=	0xfaf5
_g_ACPAGE	=	0xfaf6
_g_AVCSAV	=	0xfaf7
_g_EXBRSA	=	0xfaf8
_g_CHRCNT	=	0xfaf9
_g_ROMA	=	0xfafa
_g_MODE	=	0xfafc
_g_NORUSE	=	0xfafd
_g_XSAVE	=	0xfafe
_g_YSAVE	=	0xfb00
_g_RSTMP	=	0xfb03
_g_TOCNT	=	0xfb03
_g_RSFCB	=	0xfb04
_g_RSIQLN	=	0xfb06
_g_MEXBIh	=	0xfb07
_g_OLDSTT	=	0xfb0c
_g_OLDINT	=	0xfb0c
_g_DEVNUM	=	0xfb16
_g_DATCNT	=	0xfb17
_g_ERRORS	=	0xfb1a
_g_FLAGS	=	0xfb1b
_g_ESTBLS	=	0xfb1c
_g_COMMSK	=	0xfb1d
_g_LSTCOM	=	0xfb1e
_g_LSTMOD	=	0xfb1f
_g_PRSCNT	=	0xfb35
_g_SAVSP	=	0xfb36
_g_VOICEN	=	0xfb38
_g_SAVVOL	=	0xfb39
_g_MCLLEN	=	0xfb3b
_g_MCLPTR	=	0xfb3c
_g_QUEUEN	=	0xfb3e
_g_MUSICF	=	0xfb3f
_g_PLYCNT	=	0xfb40
_g_VCBA	=	0xfb41
_g_VCBB	=	0xfb66
_g_VCBC	=	0xfb8b
_g_ENSTOP	=	0xfbb0
_g_BASROM	=	0xfbb1
_g_LINTTB	=	0xfbb2
_g_FSTPOS	=	0xfbca
_g_CODSAV	=	0xfbcc
_g_FNKSWI	=	0xfbcd
_g_FNKFLG	=	0xfbce
_g_ONGSBF	=	0xfbd8
_g_CLIKFL	=	0xfbd9
_g_OLDKEY	=	0xfbda
_g_NEWKEY	=	0xfbe5
_g_KEYBUF	=	0xfbf0
_g_LINWRK	=	0xfc18
_g_PATWRK	=	0xfc40
_g_BOTTOM	=	0xfc48
_g_HIMEM	=	0xfc4a
_g_TRPTBL	=	0xfc4c
_g_RTYCNT	=	0xfc9a
_g_INTFLG	=	0xfc9b
_g_PADY	=	0xfc9c
_g_PADX	=	0xfc9d
_g_JIFFY	=	0xfc9e
_g_INTVAL	=	0xfca0
_g_INTCNT	=	0xfca2
_g_LOWLIM	=	0xfca4
_g_WINWID	=	0xfca5
_g_GRPHED	=	0xfca6
_g_ESCCNT	=	0xfca7
_g_INSFLG	=	0xfca8
_g_CSRSW	=	0xfca9
_g_CSTYLE	=	0xfcaa
_g_CAPST	=	0xfcab
_g_KANAST	=	0xfcac
_g_KANAMD	=	0xfcad
_g_FLBMEM	=	0xfcae
_g_SCRMOD	=	0xfcaf
_g_OLDSCR	=	0xfcb0
_g_CASPRV	=	0xfcb1
_g_BRDATR	=	0xfcb2
_g_GXPOS	=	0xfcb3
_g_GYPOS	=	0xfcb5
_g_DRWFLG	=	0xfcbb
_g_DRWSCL	=	0xfcbc
_g_DRWANG	=	0xfcbd
_g_MNROM	=	0xfcc1
_g_EXPTBL	=	0xfcc1
_g_SLTTBL	=	0xfcc5
_g_SLTATR	=	0xfcc9
_g_SLTWRK	=	0xfd09
_g_PROCNM	=	0xfd89
_g_RG08SAV	=	0xffe7
_g_RG09SAV	=	0xffe8
_g_RG10SAV	=	0xffe9
_g_RG11SAV	=	0xffea
_g_RG12SAV	=	0xffeb
_g_RG13SAV	=	0xffec
_g_RG14SAV	=	0xffed
_g_RG15SAV	=	0xffee
_g_RG16SAV	=	0xffef
_g_RG17SAV	=	0xfff0
_g_RG18SAV	=	0xfff1
_g_RG19SAV	=	0xfff2
_g_RG20SAV	=	0xfff3
_g_RG21SAV	=	0xfff4
_g_RG22SAV	=	0xfff5
_g_RG23SAV	=	0xfff6
_g_MINROM	=	0xfff7
_g_SVFFF8	=	0xfff8
_g_RG25SAV	=	0xfffa
_g_RG26SAV	=	0xfffb
_g_RG27SAV	=	0xfffc
_g_SVFFFD	=	0xfffd
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:78: void Menu_DefaultDrawCB(u8 x, u8 y, u8 type, const void* text)
;	---------------------------------
; Function Menu_DefaultDrawCB
; ---------------------------------
_Menu_DefaultDrawCB::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:83: text;
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:84: }
	pop	hl
	pop	af
	inc	sp
	jp	(hl)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:88: void Menu_DefaultEventCB(u8 event)
;	---------------------------------
; Function Menu_DefaultEventCB
; ---------------------------------
_Menu_DefaultEventCB::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:90: event;
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:91: }
	ret
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:101: void Menu_Initialize(const Menu* menus)
;	---------------------------------
; Function Menu_Initialize
; ---------------------------------
_Menu_Initialize::
	ld	(_g_MenuTable), hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:104: g_MenuFlag = 0;
	ld	iy, #_g_MenuFlag
	ld	0 (iy), #0x00
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:106: g_MenuInputPrev = 0xFF;
	ld	iy, #_g_MenuInputPrev
	ld	0 (iy), #0xff
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:107: g_MenuInputCB = Menu_DefaultInputCB;
	ld	iy, #_g_MenuInputCB
	ld	0 (iy), #<(_Menu_DefaultInputCB)
	ld	1 (iy), #>(_Menu_DefaultInputCB)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:108: g_MenuDrawCB = Menu_DefaultDrawCB;
	ld	iy, #_g_MenuDrawCB
	ld	0 (iy), #<(_Menu_DefaultDrawCB)
	ld	1 (iy), #>(_Menu_DefaultDrawCB)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:109: g_MenuEventCB = Menu_DefaultEventCB;
	ld	iy, #_g_MenuEventCB
	ld	0 (iy), #<(_Menu_DefaultEventCB)
	ld	1 (iy), #>(_Menu_DefaultEventCB)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:115: }
	ret
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:119: void Menu_DisplayItem(u8 item)
;	---------------------------------
; Function Menu_DisplayItem
; ---------------------------------
_Menu_DisplayItem::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-13
	add	hl, sp
	ld	sp, hl
	ld	-1 (ix), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:121: MenuItem* pCurItem = &g_MenuPage->Items[item];
	ld	hl, (_g_MenuPage)
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, bc
	ex	(sp), hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:122: u8 type = pCurItem->Type & MENU_ITEM_MASK;
	ld	a, -13 (ix)
	add	a, #0x02
	ld	-11 (ix), a
	ld	a, -12 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	a, (hl)
	and	a, #0x0f
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:123: if(type >= MENU_ITEM_EMPTY)
	ld	-9 (ix), a
	sub	a, #0x05
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:124: return;
	jp	NC,00152$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:127: u8 y = MENU_ITEM_Y + item;
	ld	a, -1 (ix)
	add	a, #0x08
	ld	-8 (ix), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:129: u16 dst = g_ScreenLayoutLow + MENU_FRAME_X + (y * MENU_GET_SCREEN_WIDTH());
	ld	a, (#_g_MenuScrWidth + 0)
	ld	e, a
	ld	h, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00268$:
	add	hl, hl
	jr	NC, 00269$
	add	hl, de
00269$:
	djnz	00268$
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	hl, (_g_ScreenLayoutLow)
	ld	-7 (ix), l
	ld	-6 (ix), h
	ld	a, -3 (ix)
	ld	-5 (ix), a
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -7 (ix)
	add	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, -6 (ix)
	adc	a, -4 (ix)
	ld	-2 (ix), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:130: VDP_FillVRAM(MENU_CHAR_CLEAR, dst, g_ScreenLayoutHigh, MENU_FRAME_WIDTH);
	ld	hl, #0x0020
	push	hl
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	xor	a, a
	call	_VDP_FillVRAM_16K
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:134: if(type == MENU_ITEM_GOTO)
	ld	a, -9 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00271$
	xor	a, a
00271$:
	ld	c, a
	or	a, a
	jr	Z, 00104$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:135: x = MENU_ITEM_X_GOTO;
	ld	-2 (ix), #0x06
	jp	00105$
00104$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:137: x = MENU_ITEM_X;
	ld	-2 (ix), #0x06
00105$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:138: if(type == MENU_ITEM_TEXT)
	ld	a, -9 (ix)
	sub	a, #0x04
	jr	NZ, 00107$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:139: x += pCurItem->Value;
	pop	de
	push	de
	ld	hl, #5
	add	hl, de
	ld	a, (hl)
	ld	b, -2 (ix)
	add	a, b
	ld	-2 (ix), a
00107$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:141: u8 align = pCurItem->Type & MENU_ITEM_ALIGN_MASK;
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	a, (hl)
	and	a, #0x30
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:142: if(align == MENU_ITEM_ALIGN_DEFAULT)
	ld	-3 (ix), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:144: if(type == MENU_ITEM_GOTO)
	or	a,a
	jr	NZ, 00112$
	or	a,c
	jr	Z, 00109$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:145: align = MENU_ITEM_ALIGN_GOTO;
	ld	-3 (ix), #0x10
	jp	00112$
00109$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:147: align = MENU_ITEM_ALIGN;
	ld	-3 (ix), #0x10
00112$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:150: if(align != MENU_ITEM_ALIGN_LEFT)
	ld	a, -3 (ix)
	sub	a, #0x10
	jr	Z, 00117$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:152: u8 len = String_Length(pCurItem->Text);
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	e, #0x00
00141$:
	ld	a, (bc)
	inc	bc
	or	a, a
	jr	Z, 00143$
	inc	e
	jp	00141$
00143$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:153: if(align == MENU_ITEM_ALIGN_RIGHT)
	ld	a, -3 (ix)
	sub	a, #0x30
	jr	NZ, 00114$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:154: x -= len;
	ld	a, -2 (ix)
	sub	a, e
	ld	-2 (ix), a
	jp	00117$
00114$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:156: x -= len / 2;
	ld	d, #0x00
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	bit	7, d
	jr	Z, 00154$
	ex	de, hl
	inc	hl
00154$:
	sra	h
	rr	l
	ld	a, -2 (ix)
	sub	a, l
	ld	-2 (ix), a
00117$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:161: if(g_MenuItem == item)
	ld	a, (_g_MenuItem+0)
	sub	a, -1 (ix)
	jr	NZ, 00119$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:163: Print_SetPosition(x + MENU_CURSOR_OFFSET, y);
	ld	a, -2 (ix)
	dec	a
	ld	c, a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), c
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	a, -8 (ix)
	ld	(hl), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:164: Print_DrawChar(MENU_CHAR_CURSOR);
	ld	a, #0xcf
	call	_Print_DrawChar
00119$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:169: Print_DrawTextAt(x, y, pCurItem->Text);
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	de, #_g_PrintData + 5
	ld	a, -2 (ix)
	ld	(de), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	a, -8 (ix)
	ld	(hl), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/print.h:491: Print_DrawText(str);
	push	de
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_Print_DrawText
	pop	de
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	a, #0x0e
	ld	(de), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	a, -8 (ix)
	ld	(hl), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:173: switch(type)
	ld	a, -9 (ix)
	or	a, a
	jr	Z, 00120$
	ld	a, -9 (ix)
	sub	a, #0x02
	jr	Z, 00128$
	ld	a, -9 (ix)
	sub	a, #0x03
	jp	Z,00134$
	jp	00152$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:175: case MENU_ITEM_ACTION:
00120$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:177: Menu_ActionCB cb = (Menu_ActionCB)pCurItem->Action;
	pop	hl
	push	hl
	inc	hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:178: const c8* str = cb(MENU_ACTION_GET, pCurItem->Value);
	pop	hl
	push	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
	push	de
	ld	a, #0x01
	push	bc
	pop	iy
	call	___sdcc_call_iy
	ex	de, hl
	pop	de
	ld	c, l
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:179: if(str)
	ld	a,h
	ld	b,a
	or	a, l
	jp	Z, 00152$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:181: if(g_MenuItem == item)
	ld	a, (_g_MenuItem+0)
	sub	a, -1 (ix)
	jr	NZ, 00122$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:182: Print_DrawChar(MENU_CHAR_LEFT);
	push	bc
	ld	a, #0x3c
	call	_Print_DrawChar
	pop	bc
	jp	00123$
00122$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/print.h:422: inline void Print_Space() { g_PrintData.CursorX += PRINT_W(g_PrintData.UnitX); }
	ld	a, (de)
	inc	a
	ld	(de), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:184: Print_Space();
00123$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:185: Print_DrawText(str);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_Print_DrawText
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:186: if(g_MenuItem == item)
	ld	a, (_g_MenuItem+0)
	sub	a, -1 (ix)
	jr	NZ, 00152$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:187: Print_DrawChar(MENU_CHAR_RIGHT);
	ld	a, #0x3e
	call	_Print_DrawChar
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:189: break;
	jp	00152$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:191: case MENU_ITEM_INT:
00128$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:193: if(g_MenuItem == item)
	ld	a, (_g_MenuItem+0)
	sub	a, -1 (ix)
	jr	NZ, 00130$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:194: Print_DrawChar(MENU_CHAR_LEFT);
	ld	a, #0x3c
	call	_Print_DrawChar
	jp	00131$
00130$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/print.h:422: inline void Print_Space() { g_PrintData.CursorX += PRINT_W(g_PrintData.UnitX); }
	ld	a, (de)
	inc	a
	ld	(de), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:196: Print_Space();
00131$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:197: i8* data = (i8*)pCurItem->Action;
	pop	hl
	push	hl
	inc	hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:198: Print_DrawInt(*data);
	ld	a, (bc)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	call	_Print_DrawInt
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:199: if(g_MenuItem == item)
	ld	a, (_g_MenuItem+0)
	sub	a, -1 (ix)
	jr	NZ, 00152$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:200: Print_DrawChar(MENU_CHAR_RIGHT);
	ld	a, #0x3e
	call	_Print_DrawChar
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:201: break;
	jp	00152$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:203: case MENU_ITEM_BOOL:
00134$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:205: u8* data = (u8*)pCurItem->Action;
	pop	hl
	push	hl
	inc	hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:206: if(g_MenuItem == item)
	ld	a, (_g_MenuItem+0)
	sub	a, -1 (ix)
	jr	NZ, 00136$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:207: Print_DrawChar(MENU_CHAR_LEFT);
	push	bc
	ld	a, #0x3c
	call	_Print_DrawChar
	pop	bc
	jp	00137$
00136$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/print.h:422: inline void Print_Space() { g_PrintData.CursorX += PRINT_W(g_PrintData.UnitX); }
	ld	a, (de)
	inc	a
	ld	(de), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:209: Print_Space();
00137$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:210: Print_DrawChar(*data ? MENU_CHAR_TRUE : MENU_CHAR_FALSE);
	ld	a, (bc)
	or	a, a
	jr	Z, 00155$
	ld	bc, #0x004f
	jp	00156$
00155$:
	ld	bc, #0x0058
00156$:
	ld	a, c
	call	_Print_DrawChar
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:211: if(g_MenuItem == item)
	ld	a, (_g_MenuItem+0)
	sub	a, -1 (ix)
	jr	NZ, 00152$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:212: Print_DrawChar(MENU_CHAR_RIGHT);
	ld	a, #0x3e
	call	_Print_DrawChar
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:215: };
00152$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:216: }
	ld	sp, ix
	pop	ix
	ret
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:220: void Menu_DrawPage(u8 page)
;	---------------------------------
; Function Menu_DrawPage
; ---------------------------------
_Menu_DrawPage::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ld	c, a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:223: g_MenuPageIdx = page;
	ld	hl, #_g_MenuPageIdx
	ld	(hl), c
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:224: g_MenuPage = &g_MenuTable[page];
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ex	de, hl
	ld	hl, #_g_MenuPage
	ld	a, (_g_MenuTable+0)
	add	a, e
	ld	(hl), a
	inc	hl
	ld	a, (_g_MenuTable+1)
	adc	a, d
	ld	(hl), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:226: if(g_MenuPage->Callback)
	ld	iy, (_g_MenuPage)
	ld	l, 5 (iy)
;	spillPairReg hl
	ld	h, 6 (iy)
;	spillPairReg hl
	ld	a, h
	or	a, l
	jr	Z, 00102$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:227: g_MenuPage->Callback();
	call	___sdcc_call_hl
00102$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:229: g_MenuItem = 0;
	xor	a, a
	ld	(#_g_MenuItem), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:230: while(g_MenuItem < g_MenuPage->ItemNum)
00105$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:226: if(g_MenuPage->Callback)
	ld	de, (_g_MenuPage)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:230: while(g_MenuItem < g_MenuPage->ItemNum)
	push	de
	pop	iy
	ld	c, 4 (iy)
	ld	a, (_g_MenuItem+0)
	sub	a, c
	jr	NC, 00107$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:232: if(g_MenuPage->Items[g_MenuItem].Type < MENU_ITEM_TEXT)
	ex	de, hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	de, (_g_MenuItem)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, bc
	inc	hl
	inc	hl
	ld	a, (hl)
	sub	a, #0x04
	jr	C, 00107$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:234: g_MenuItem++;
	ld	iy, #_g_MenuItem
	inc	0 (iy)
	jp	00105$
00107$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:238: u16 dst = g_ScreenLayoutLow + MENU_FRAME_X + (MENU_FRAME_Y * MENU_GET_SCREEN_WIDTH());
	ld	a, (_g_MenuScrWidth+0)
	ld	c, a
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ex	de, hl
	ld	hl, (_g_ScreenLayoutLow)
	add	hl, de
	ex	(sp), hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:239: for(u8 i = MENU_FRAME_Y; i < MENU_FRAME_Y + MENU_FRAME_HEIGHT; ++i)
	ld	-1 (ix), #0x06
00115$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jr	NC, 00108$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:241: VDP_FillVRAM(MENU_CHAR_CLEAR, dst, g_ScreenLayoutHigh, MENU_FRAME_WIDTH);
	ld	hl, #0x0020
	push	hl
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	xor	a, a
	call	_VDP_FillVRAM_16K
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:242: dst += MENU_GET_SCREEN_WIDTH();
	ld	a, (_g_MenuScrWidth+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	pop	bc
	push	bc
	add	hl, bc
	ex	(sp), hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:239: for(u8 i = MENU_FRAME_Y; i < MENU_FRAME_Y + MENU_FRAME_HEIGHT; ++i)
	inc	-1 (ix)
	jp	00115$
00108$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:226: if(g_MenuPage->Callback)
	ld	hl, (_g_MenuPage)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:246: if (g_MenuPage->Title)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, d
	or	a, e
	jr	Z, 00130$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:248: Print_DrawTextAt(MENU_TITLE_X, MENU_TITLE_Y, g_MenuPage->Title);
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x04
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x06
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/print.h:491: Print_DrawText(str);
	ex	de, hl
	call	_Print_DrawText
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:252: for(u8 item = 0; item < g_MenuPage->ItemNum; ++item)
00130$:
	ld	c, #0x00
00118$:
	ld	hl, (_g_MenuPage)
	ld	de, #0x0004
	add	hl, de
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	NC, 00120$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:254: Menu_DisplayItem(item);
	push	bc
	ld	a, c
	call	_Menu_DisplayItem
	pop	bc
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:252: for(u8 item = 0; item < g_MenuPage->ItemNum; ++item)
	inc	c
	jp	00118$
00120$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:256: }
	ld	sp, ix
	pop	ix
	ret
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:260: void Menu_Update()
;	---------------------------------
; Function Menu_Update
; ---------------------------------
_Menu_Update::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-6
	add	hl, sp
	ld	sp, hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:263: if(g_MenuFlag & MENU_FLAG_DIRTY)
	ld	a, (_g_MenuFlag+0)
	rrca
	jr	NC, 00169$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:265: Menu_DrawPage(g_MenuPageIdx);
	ld	a, (_g_MenuPageIdx+0)
	call	_Menu_DrawPage
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:266: g_MenuFlag &= ~MENU_FLAG_DIRTY; // Remove 'dirty' flag
	ld	a, (_g_MenuFlag+0)
	and	a, #0xfe
	ld	(_g_MenuFlag+0), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:270: for(u8 item = 0; item < g_MenuPage->ItemNum; ++item)
00169$:
	ld	c, #0x00
00161$:
	ld	hl, (_g_MenuPage)
	ld	-2 (ix), l
	ld	-1 (ix), h
	ex	de,hl
	ld	hl, #4
	add	hl, de
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jp	NC, 00107$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:272: MenuItem* pCurItem = &g_MenuPage->Items[item];
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, de
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:273: if(pCurItem->Type == MENU_ITEM_UPDATE)
	ld	-2 (ix), l
	ld	-1 (ix), h
	inc	hl
	inc	hl
	ex	de,hl
	ld	a, (de)
	sub	a, #0x06
	jr	NZ, 00162$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:275: Menu_ActionCB cb = (Menu_ActionCB)pCurItem->Action;
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:276: const c8* str = cb(MENU_ACTION_UPDATE, pCurItem->Value);
	ld	a, -2 (ix)
	add	a, #0x05
	ld	-4 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	ld	a, #0x04
	push	de
	pop	iy
	call	___sdcc_call_iy
	pop	bc
	ld	-2 (ix), e
	ld	-1 (ix), d
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:277: if(str)
	ld	a, d
	or	a, e
	jr	Z, 00162$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:279: u8 y = MENU_FRAME_Y + item;
	ld	a, c
	add	a, #0x06
	ld	b, a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:281: u16 dst = g_ScreenLayoutLow + MENU_FRAME_X + (y * MENU_GET_SCREEN_WIDTH());
	push	bc
	ld	a, (#_g_MenuScrWidth + 0)
	ld	e, a
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00314$:
	add	hl, hl
	jr	NC, 00315$
	add	hl, de
00315$:
	djnz	00314$
	pop	bc
	ex	de, hl
	ld	hl, (_g_ScreenLayoutLow)
	add	hl, de
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:282: VDP_FillVRAM(MENU_CHAR_CLEAR, dst, g_ScreenLayoutHigh, MENU_FRAME_WIDTH);
	push	bc
	ex	de, hl
	ld	hl, #0x0020
	push	hl
	xor	a, a
	call	_VDP_FillVRAM_16K
	pop	bc
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:284: Print_SetPosition(MENU_ITEM_X + pCurItem->Value, y);
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, (hl)
	add	a, #0x06
	ld	e, a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), e
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), b
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:285: Print_DrawText(str);
	push	bc
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Print_DrawText
	pop	bc
00162$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:270: for(u8 item = 0; item < g_MenuPage->ItemNum; ++item)
	inc	c
	jp	00161$
00107$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:291: u8 input = g_MenuInputCB();
	ld	hl, (_g_MenuInputCB)
	call	___sdcc_call_hl
	ld	-6 (ix), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:292: MenuItem* pCurItem = &g_MenuPage->Items[g_MenuItem];
	ld	hl, (_g_MenuPage)
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	de, (_g_MenuItem)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, bc
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:293: u8 type = pCurItem->Type & MENU_ITEM_MASK;
	ld	-3 (ix), l
	ld	-2 (ix), h
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ld	a, (bc)
	and	a, #0x0f
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:294: switch(type)
	ld	-1 (ix), a
	or	a, a
	jr	Z, 00108$
	ld	a, -1 (ix)
	dec	a
	jr	Z, 00119$
	ld	a, -1 (ix)
	sub	a, #0x02
	jp	Z,00122$
	ld	a, -1 (ix)
	sub	a, #0x03
	jp	Z,00140$
	jp	00143$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:296: case MENU_ITEM_ACTION:
00108$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:298: u8 act = MENU_ACTION_INVALID;
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:299: u8 event = 0xFF;
	ld	bc, #0xffff
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:300: if(input & MENU_INPUT_TRIGGER)
	bit	4, -6 (ix)
	jr	Z, 00115$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:302: act = MENU_ACTION_SET;
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:303: event = MENU_EVENT_SET;
	ld	bc, #0x2
	jp	00116$
00115$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:305: else if(input & MENU_INPUT_LEFT)
	bit	2, -6 (ix)
	jr	Z, 00112$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:307: act = MENU_ACTION_DEC;
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:308: event = MENU_EVENT_DEC;
	ld	bc, #0x304
	jp	00116$
00112$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:310: else if(input & MENU_INPUT_RIGHT)
	bit	3, -6 (ix)
	jr	Z, 00116$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:312: act = MENU_ACTION_INC;
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:313: event = MENU_EVENT_INC;
	ld	bc, #0x203
00116$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:315: if(act != MENU_ACTION_INVALID)
	ld	a, b
	inc	a
	jp	Z,00143$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:317: Menu_ActionCB cb = (Menu_ActionCB)pCurItem->Action;
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:318: cb(act, pCurItem->Value);
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	ld	a, b
	push	de
	pop	iy
	call	___sdcc_call_iy
	ld	a, (_g_MenuItem+0)
	call	_Menu_DisplayItem
	pop	bc
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:320: g_MenuEventCB(event);
	ld	a, c
	ld	hl, (_g_MenuEventCB)
	call	___sdcc_call_hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:322: break;
	jp	00143$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:324: case MENU_ITEM_GOTO:
00119$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:326: if(input & (MENU_INPUT_TRIGGER | MENU_INPUT_RIGHT| MENU_INPUT_LEFT))
	ld	a, -6 (ix)
	and	a, #0x1c
	jp	Z,00143$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:328: Menu_DrawPage(pCurItem->Value);
	ld	c, -3 (ix)
	ld	b, -2 (ix)
	ld	hl, #5
	add	hl, bc
	ld	a, (hl)
	call	_Menu_DrawPage
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:329: g_MenuEventCB(MENU_EVENT_SET);
	ld	a, #0x02
	ld	hl, (_g_MenuEventCB)
	call	___sdcc_call_hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:330: return;
	jp	00163$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:334: case MENU_ITEM_INT:
00122$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:336: if(input & (MENU_INPUT_TRIGGER | MENU_INPUT_RIGHT))
	ld	a, -6 (ix)
	and	a, #0x18
	jp	Z,00138$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:338: i8* data = (i8*)pCurItem->Action;
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:339: if(pCurItem->Value != NULL)
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	ld	hl, #5
	add	hl, de
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:342: if((*data) + param->Step > param->Max)
	ld	a, (bc)
	ld	e, a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:339: if(pCurItem->Value != NULL)
	ld	a, -1 (ix)
	or	a, -2 (ix)
	jr	Z, 00127$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:341: MenuItemMinMax* param = (MenuItemMinMax*)pCurItem->Value;
	ld	a, -2 (ix)
	ld	-5 (ix), a
	ld	a, -1 (ix)
	ld	-4 (ix), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:342: if((*data) + param->Step > param->Max)
	ld	a, e
	push	af
	rlca
	sbc	a, a
	ld	d, a
	pop	af
	ld	l, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	push	af
	ld	a, (hl)
	ld	-3 (ix), a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	add	a, l
	ld	-2 (ix), a
	ld	a, d
	adc	a, h
	ld	-1 (ix), a
	ld	l, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	d, (hl)
	ld	a, d
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, l
	sub	a, -2 (ix)
	ld	a, h
	sbc	a, -1 (ix)
	jp	PO, 00326$
	xor	a, #0x80
00326$:
	jp	P, 00124$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:343: (*data) = param->Max;
	ld	a, d
	ld	(bc), a
	jp	00128$
00124$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:345: (*data) += param->Step;
	ld	a, e
	add	a, -3 (ix)
	ld	(bc), a
	jp	00128$
00127$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:348: (*data)++;
	ld	a, e
	inc	a
	ld	(bc), a
00128$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:349: Menu_DisplayItem(g_MenuItem);
	ld	a, (_g_MenuItem+0)
	call	_Menu_DisplayItem
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:350: g_MenuEventCB(MENU_EVENT_INC);
	ld	a, #0x03
	ld	hl, (_g_MenuEventCB)
	call	___sdcc_call_hl
	jp	00143$
00138$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:352: else if(input & MENU_INPUT_LEFT)
	bit	2, -6 (ix)
	jp	Z,00143$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:354: i8* data = (i8*)pCurItem->Action;
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:355: if(pCurItem->Value != NULL)
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	ld	hl, #5
	add	hl, de
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:358: if((*data) < param->Min + param->Step)
	ld	a, (bc)
	ld	e, a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:355: if(pCurItem->Value != NULL)
	ld	a, -1 (ix)
	or	a, -2 (ix)
	jr	Z, 00133$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:357: MenuItemMinMax* param = (MenuItemMinMax*)pCurItem->Value;
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:358: if((*data) < param->Min + param->Step)
	ld	a, (hl)
	ld	-3 (ix), a
	ld	-2 (ix), a
	rlca
	sbc	a, a
	ld	-1 (ix), a
	inc	hl
	inc	hl
	ld	d, (hl)
	ld	a, d
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, l
	add	a, -2 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, -1 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	ld	-2 (ix), a
	rlca
	sbc	a, a
	ld	-1 (ix), a
	ld	a, -2 (ix)
	sub	a, l
	ld	a, -1 (ix)
	sbc	a, h
	jp	PO, 00328$
	xor	a, #0x80
00328$:
	jp	P, 00130$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:359: (*data) = param->Min;
	ld	a, -3 (ix)
	ld	(bc), a
	jp	00134$
00130$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:361: (*data) -= param->Step;
	ld	a, e
	sub	a, d
	ld	(bc), a
	jp	00134$
00133$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:364: (*data)--;
	ld	a, e
	dec	a
	ld	(bc), a
00134$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:365: Menu_DisplayItem(g_MenuItem);
	ld	a, (_g_MenuItem+0)
	call	_Menu_DisplayItem
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:366: g_MenuEventCB(MENU_EVENT_DEC);
	ld	a, #0x04
	ld	hl, (_g_MenuEventCB)
	call	___sdcc_call_hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:368: break;
	jp	00143$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:370: case MENU_ITEM_BOOL:
00140$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:372: if(input & (MENU_INPUT_TRIGGER | MENU_INPUT_RIGHT | MENU_INPUT_LEFT))
	ld	a, -6 (ix)
	and	a, #0x1c
	jr	Z, 00143$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:374: u8* data = (u8*)pCurItem->Action;
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:375: *data = 1 - *data;
	ld	a, (bc)
	ld	e, a
	ld	a, #0x01
	sub	a, e
	ld	(bc), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:376: Menu_DisplayItem(g_MenuItem);
	ld	a, (_g_MenuItem+0)
	call	_Menu_DisplayItem
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:377: g_MenuEventCB(MENU_EVENT_SET);
	ld	a, #0x02
	ld	hl, (_g_MenuEventCB)
	call	___sdcc_call_hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:381: }
00143$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:384: if(input & MENU_INPUT_UP)
	bit	0, -6 (ix)
	jr	Z, 00157$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:386: u8 i = g_MenuItem;
	ld	a, (_g_MenuItem+0)
	ld	-1 (ix), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:387: while(i > 0)
00146$:
	ld	a, -1 (ix)
	or	a, a
	jp	Z, 00163$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:389: i--;
	dec	-1 (ix)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:390: if((g_MenuPage->Items[i].Type & ~MENU_ITEM_ALIGN_MASK) < MENU_ITEM_TEXT)
	ld	hl, (_g_MenuPage)
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, bc
	inc	hl
	inc	hl
	ld	c, (hl)
	ld	b, #0x00
	ld	a, c
	and	a, #0xcf
	sub	a, #0x04
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00146$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:392: u8 prev = g_MenuItem;
	ld	a, (_g_MenuItem+0)
	ld	c, a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:393: g_MenuItem = i;
	ld	a, -1 (ix)
	ld	(_g_MenuItem+0), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:394: Menu_DisplayItem(prev);
	ld	a, c
	call	_Menu_DisplayItem
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:395: Menu_DisplayItem(g_MenuItem);
	ld	a, (_g_MenuItem+0)
	call	_Menu_DisplayItem
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:396: g_MenuEventCB(MENU_EVENT_UP);
	xor	a, a
	ld	hl, (_g_MenuEventCB)
	call	___sdcc_call_hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:397: break;
	jp	00163$
00157$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:401: else if(input & MENU_INPUT_DOWN)
	bit	1, -6 (ix)
	jr	Z, 00163$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:403: u8 i = g_MenuItem;
	ld	a, (_g_MenuItem+0)
	ld	-1 (ix), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:404: while(i < g_MenuPage->ItemNum-1)
00151$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:270: for(u8 item = 0; item < g_MenuPage->ItemNum; ++item)
	ld	de, (_g_MenuPage)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:404: while(i < g_MenuPage->ItemNum-1)
	ld	c, e
	ld	b, d
	ld	hl, #4
	add	hl, bc
	ld	c, (hl)
	ld	b, #0x00
	dec	bc
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	jp	PO, 00332$
	xor	a, #0x80
00332$:
	jp	P, 00163$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:406: i++;
	inc	-1 (ix)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:407: if((g_MenuPage->Items[i].Type & ~MENU_ITEM_ALIGN_MASK) < MENU_ITEM_TEXT)
	ex	de, hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, bc
	inc	hl
	inc	hl
	ld	c, (hl)
	ld	b, #0x00
	ld	a, c
	and	a, #0xcf
	sub	a, #0x04
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00151$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:409: u8 prev = g_MenuItem;
	ld	a, (_g_MenuItem+0)
	ld	c, a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:410: g_MenuItem = i;
	ld	a, -1 (ix)
	ld	(_g_MenuItem+0), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:411: Menu_DisplayItem(prev);
	ld	a, c
	call	_Menu_DisplayItem
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:412: Menu_DisplayItem(g_MenuItem);
	ld	a, (_g_MenuItem+0)
	call	_Menu_DisplayItem
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:413: g_MenuEventCB(MENU_EVENT_DOWN);
	ld	a, #0x01
	ld	hl, (_g_MenuEventCB)
	call	___sdcc_call_hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:414: break;
00163$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/game_menu.c:418: }
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
