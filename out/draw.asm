;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module draw
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _VPD_CommandSetupR36
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
	.globl _Draw_Line
	.globl _Draw_LineH
	.globl _Draw_LineV
	.globl _Draw_Box
	.globl _Draw_FillBox
	.globl _Draw_Circle
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
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:14: void Draw_Line(UX x1, UY y1, UX x2, UY y2, u8 color, u8 op)
;	---------------------------------
; Function Draw_Line
; ---------------------------------
_Draw_Line::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-9
	add	iy, sp
	ld	sp, iy
	ld	-1 (ix), a
	ld	-2 (ix), l
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:23: dx = x1 - x2 /*+ 1*/;
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	a, 4 (ix)
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:20: if(x1 > x2)
	ld	a, 4 (ix)
	sub	a, -1 (ix)
	jr	NC, 00102$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:22: arg |= VDP_ARG_DIX_LEFT;
	ld	e, #0x04
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:23: dx = x1 - x2 /*+ 1*/;
	ld	a, c
	sub	a, -6 (ix)
	ld	c, a
	ld	a, b
	sbc	a, -5 (ix)
	ld	-4 (ix), c
	ld	-3 (ix), a
	jp	00103$
00102$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:27: arg |= VDP_ARG_DIX_RIGHT;
	ld	e, #0x00
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:28: dx = x2 - x1 /*+ 1*/;
	ld	a, -6 (ix)
	sub	a, c
	ld	-4 (ix), a
	ld	a, -5 (ix)
	sbc	a, b
	ld	-3 (ix), a
00103$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:33: dy = y1 - y2 /*+ 1*/;
	ld	c, -2 (ix)
	ld	b, #0x00
	ld	l, 5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:30: if(y1 > y2)
	ld	a, 5 (ix)
	sub	a, -2 (ix)
	jr	NC, 00105$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:32: arg |= VDP_ARG_DIY_UP;
	set	3, e
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:33: dy = y1 - y2 /*+ 1*/;
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
	jp	00106$
00105$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:38: dy = y2 - y1 /*+ 1*/;
	cp	a, a
	sbc	hl, bc
	ld	c, l
	ld	b, h
00106$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:40: if(dx > dy)
	ld	a, c
	sub	a, -4 (ix)
	ld	a, b
	sbc	a, -3 (ix)
	jr	NC, 00108$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:43: nx = dx;
	ld	a, -4 (ix)
	ld	-9 (ix), a
	ld	a, -3 (ix)
	ld	-8 (ix), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:44: ny = dy;
	jp	00109$
00108$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:48: arg |= VDP_ARG_MAJ_V;
	set	0, e
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:49: nx = dy;
	inc	sp
	inc	sp
	push	bc
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:50: ny = dx;
	ld	c, -4 (ix)
	ld	b, -3 (ix)
00109$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:53: VDP_CommandLINE(x1, y1, nx, ny, color, arg, op);	
	ld	a, 7 (ix)
	ld	-7 (ix), a
	ld	d, 6 (ix)
	ld	a, -2 (ix)
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	a, -1 (ix)
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:338: g_VDP_Command.DX = dx;
	ld	hl, #(_g_VDP_Command + 4)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:339: g_VDP_Command.DY = dy;
	ld	hl, #(_g_VDP_Command + 6)
	ld	a, -6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -5 (ix)
	ld	(hl), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:340: g_VDP_Command.NX = nx;
	ld	hl, #(_g_VDP_Command + 8)
	ld	a, -9 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -8 (ix)
	ld	(hl), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:341: g_VDP_Command.NY = ny;
	ld	((_g_VDP_Command + 10)), bc
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:342: g_VDP_Command.CLR = col;
	ld	hl, #(_g_VDP_Command + 12)
	ld	(hl), d
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:343: g_VDP_Command.ARG = arg;
	ld	hl, #(_g_VDP_Command + 13)
	ld	(hl), e
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:344: g_VDP_Command.CMD = VDP_CMD_LINE + op;
	ld	a, -7 (ix)
	add	a, #0x70
	ld	(#(_g_VDP_Command + 14)),a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:345: VPD_CommandSetupR36();
	call	_VPD_CommandSetupR36
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:53: VDP_CommandLINE(x1, y1, nx, ny, color, arg, op);	
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:54: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	pop	af
	jp	(hl)
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
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:58: void Draw_LineH(UX x1, UX x2, UY y, u8 color, u8 op)
;	---------------------------------
; Function Draw_LineH
; ---------------------------------
_Draw_LineH::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-10
	add	iy, sp
	ld	sp, iy
	ld	-1 (ix), a
	ld	-2 (ix), l
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:64: nx = x1 - x2 + 1;
	ld	a, -1 (ix)
	ld	-10 (ix), a
	ld	-9 (ix), #0x00
	ld	a, -2 (ix)
	ld	-8 (ix), a
	ld	-7 (ix), #0x00
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:61: if(x1 > x2)
	ld	a, -2 (ix)
	sub	a, -1 (ix)
	jr	NC, 00102$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:63: dx = x2;
	ld	a, -2 (ix)
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:64: nx = x1 - x2 + 1;
	ld	a, -10 (ix)
	sub	a, -8 (ix)
	ld	-4 (ix), a
	ld	a, -9 (ix)
	sbc	a, -7 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	add	a, #0x01
	ld	-8 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
	ld	a, -8 (ix)
	ld	-4 (ix), a
	ld	a, -7 (ix)
	ld	-3 (ix), a
	jp	00103$
00102$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:68: dx = x1;
	ld	a, -1 (ix)
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:69: nx = x2 - x1 + 1;
	ld	a, -8 (ix)
	sub	a, -10 (ix)
	ld	c, a
	ld	a, -7 (ix)
	sbc	a, -9 (ix)
	ld	b, a
	inc	bc
	ld	-4 (ix), c
	ld	-3 (ix), b
00103$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:71: VDP_CommandLMMV(dx, y, nx, 1, color, op);	
	ld	a, 6 (ix)
	ld	-7 (ix), a
	ld	c, 5 (ix)
	ld	e, 4 (ix)
	ld	d, #0x00
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:298: g_VDP_Command.DX = dx; 
	ld	hl, #(_g_VDP_Command + 4)
	ld	a, -6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -5 (ix)
	ld	(hl), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:299: g_VDP_Command.DY = dy; 
	ld	((_g_VDP_Command + 6)), de
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:300: g_VDP_Command.NX = nx; 
	ld	hl, #(_g_VDP_Command + 8)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:301: g_VDP_Command.NY = ny; 
	ld	hl, #0x0001
	ld	((_g_VDP_Command + 10)), hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:302: g_VDP_Command.CLR = col; 
	ld	hl, #(_g_VDP_Command + 12)
	ld	(hl), c
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:303: g_VDP_Command.ARG = arg; 
	ld	hl, #(_g_VDP_Command + 13)
	ld	(hl), #0x00
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:304: g_VDP_Command.CMD = VDP_CMD_LMMV + op;
	ld	a, -7 (ix)
	add	a, #0x80
	ld	(#(_g_VDP_Command + 14)),a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:305: VPD_CommandSetupR36();
	call	_VPD_CommandSetupR36
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:71: VDP_CommandLMMV(dx, y, nx, 1, color, op);	
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:72: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	inc	sp
	jp	(hl)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:76: void Draw_LineV(UX x, UY y1, UY y2, u8 color, u8 op)
;	---------------------------------
; Function Draw_LineV
; ---------------------------------
_Draw_LineV::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-10
	add	iy, sp
	ld	sp, iy
	ld	-1 (ix), a
	ld	-2 (ix), l
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:82: ny = y2 - y1 + 1;
	ld	a, 4 (ix)
	ld	-10 (ix), a
	ld	-9 (ix), #0x00
	ld	a, -2 (ix)
	ld	-8 (ix), a
	ld	-7 (ix), #0x00
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:79: if(y1 < y2)
	ld	a, -2 (ix)
	sub	a, 4 (ix)
	jr	NC, 00102$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:81: dy = y1;
	ld	a, -2 (ix)
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:82: ny = y2 - y1 + 1;
	ld	a, -10 (ix)
	sub	a, -8 (ix)
	ld	-4 (ix), a
	ld	a, -9 (ix)
	sbc	a, -7 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	add	a, #0x01
	ld	-8 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
	ld	a, -8 (ix)
	ld	-4 (ix), a
	ld	a, -7 (ix)
	ld	-3 (ix), a
	jp	00103$
00102$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:86: dy = y2;
	ld	a, 4 (ix)
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:87: ny = y1 - y2 + 1;
	ld	a, -8 (ix)
	sub	a, -10 (ix)
	ld	c, a
	ld	a, -7 (ix)
	sbc	a, -9 (ix)
	ld	b, a
	inc	bc
	ld	-4 (ix), c
	ld	-3 (ix), b
00103$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:89: VDP_CommandLMMV(x, dy, 1, ny, color, op);	
	ld	a, 6 (ix)
	ld	-7 (ix), a
	ld	c, 5 (ix)
	ld	e, -1 (ix)
	ld	d, #0x00
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:298: g_VDP_Command.DX = dx; 
	ld	((_g_VDP_Command + 4)), de
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:299: g_VDP_Command.DY = dy; 
	ld	hl, #(_g_VDP_Command + 6)
	ld	a, -6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -5 (ix)
	ld	(hl), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:300: g_VDP_Command.NX = nx; 
	ld	hl, #0x0001
	ld	((_g_VDP_Command + 8)), hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:301: g_VDP_Command.NY = ny; 
	ld	hl, #(_g_VDP_Command + 10)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:302: g_VDP_Command.CLR = col; 
	ld	hl, #(_g_VDP_Command + 12)
	ld	(hl), c
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:303: g_VDP_Command.ARG = arg; 
	ld	hl, #(_g_VDP_Command + 13)
	ld	(hl), #0x00
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:304: g_VDP_Command.CMD = VDP_CMD_LMMV + op;
	ld	a, -7 (ix)
	add	a, #0x80
	ld	(#(_g_VDP_Command + 14)),a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:305: VPD_CommandSetupR36();
	call	_VPD_CommandSetupR36
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:89: VDP_CommandLMMV(x, dy, 1, ny, color, op);	
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:90: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	inc	sp
	jp	(hl)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:94: void Draw_Box(UX x1, UY y1, UX x2, UY y2, u8 color, u8 op)
;	---------------------------------
; Function Draw_Box
; ---------------------------------
_Draw_Box::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, a
	ld	b, l
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:96: Draw_LineH(x1, x2, y1, color, op);
	push	bc
	ld	h, 7 (ix)
	ld	l, 6 (ix)
	push	hl
	push	bc
	inc	sp
	ld	l, 4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_Draw_LineH
	pop	bc
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:97: Draw_LineH(x1, x2, y2, color, op);
	push	bc
	ld	h, 7 (ix)
	ld	l, 6 (ix)
	push	hl
	ld	a, 5 (ix)
	push	af
	inc	sp
	ld	l, 4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_Draw_LineH
	pop	bc
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:98: Draw_LineV(x1, y1, y2, color, op);
	push	bc
	ld	h, 7 (ix)
	ld	l, 6 (ix)
	push	hl
	ld	a, 5 (ix)
	push	af
	inc	sp
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_Draw_LineV
	pop	bc
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:99: Draw_LineV(x2, y1, y2, color, op);
	ld	h, 7 (ix)
	ld	l, 6 (ix)
	push	hl
	ld	a, 5 (ix)
	push	af
	inc	sp
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, 4 (ix)
	call	_Draw_LineV
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:100: }
	pop	ix
	pop	hl
	pop	af
	pop	af
	jp	(hl)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:104: void Draw_FillBox(UX x1, UY y1, UX x2, UY y2, u8 color, u8 op)
;	---------------------------------
; Function Draw_FillBox
; ---------------------------------
_Draw_FillBox::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	push	af
	ld	e, a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:106: VDP_CommandLMMV(x1, y1, x2 - x1 + 1, y2 - y1 + 1, color, op);	
	ld	a, 7 (ix)
	ld	-6 (ix), a
	ld	a, 6 (ix)
	ld	-5 (ix), a
	ld	c, 5 (ix)
	ld	b, #0x00
	ld	-2 (ix), l
	ld	-1 (ix), #0x00
	ld	a, c
	sub	a, -2 (ix)
	ld	c, a
	ld	a, b
	sbc	a, -1 (ix)
	ld	b, a
	inc	bc
	ld	-4 (ix), c
	ld	-3 (ix), b
	ld	c, 4 (ix)
	ld	b, #0x00
	ld	-2 (ix), e
	ld	-1 (ix), #0x00
	ld	a, c
	sub	a, -2 (ix)
	ld	c, a
	ld	a, b
	sbc	a, -1 (ix)
	ld	b, a
	inc	bc
	ld	-2 (ix), l
	ld	-1 (ix), #0x00
	ld	d, #0x00
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:298: g_VDP_Command.DX = dx; 
	ld	((_g_VDP_Command + 4)), de
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:299: g_VDP_Command.DY = dy; 
	ld	hl, #(_g_VDP_Command + 6)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:300: g_VDP_Command.NX = nx; 
	ld	((_g_VDP_Command + 8)), bc
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:301: g_VDP_Command.NY = ny; 
	ld	hl, #(_g_VDP_Command + 10)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:302: g_VDP_Command.CLR = col; 
	ld	hl, #(_g_VDP_Command + 12)
	ld	a, -5 (ix)
	ld	(hl), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:303: g_VDP_Command.ARG = arg; 
	ld	hl, #(_g_VDP_Command + 13)
	ld	(hl), #0x00
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:304: g_VDP_Command.CMD = VDP_CMD_LMMV + op;
	ld	bc, #_g_VDP_Command + 14
	ld	a, -6 (ix)
	add	a, #0x80
	ld	(bc), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/vdp_inl.h:305: VPD_CommandSetupR36();
	call	_VPD_CommandSetupR36
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:106: VDP_CommandLMMV(x1, y1, x2 - x1 + 1, y2 - y1 + 1, color, op);	
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:107: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	pop	af
	jp	(hl)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:112: void Draw_Circle(UX dx, UY dy, u8 radius, u8 color, u8 op)
;	---------------------------------
; Function Draw_Circle
; ---------------------------------
_Draw_Circle::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-13
	add	iy, sp
	ld	sp, iy
	ld	-4 (ix), a
	ld	-5 (ix), l
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:114: USX x = radius;
	ld	a, 4 (ix)
	ld	-3 (ix), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:116: USX e = 0;
	ld	-2 (ix), #0x00
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:118: while(1)
	ld	-1 (ix), #0x00
00106$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:121: g_VDP_Command.DX = dx + x;
	ld	a, -4 (ix)
	ld	-13 (ix), a
	ld	-12 (ix), #0x00
	ld	a, -3 (ix)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	pop	hl
	push	hl
	add	hl, bc
	ex	de, hl
	ld	((_g_VDP_Command + 4)), de
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:122: g_VDP_Command.DY = dy + y;
	ld	a, -5 (ix)
	ld	-11 (ix), a
	ld	-10 (ix), #0x00
	ld	a, -1 (ix)
	ld	-9 (ix), a
	rlca
	sbc	a, a
	ld	-8 (ix), a
	ld	a, -11 (ix)
	add	a, -9 (ix)
	ld	e, a
	ld	a, -10 (ix)
	adc	a, -8 (ix)
	ld	d, a
	ld	-7 (ix), e
	ld	-6 (ix), d
	ld	hl, #(_g_VDP_Command + 6)
	ld	a, -7 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -6 (ix)
	ld	(hl), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:123: g_VDP_Command.CLR = color;
	ld	hl, #(_g_VDP_Command + 12)
	ld	a, 5 (ix)
	ld	(hl), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:124: g_VDP_Command.ARG = 0;
	ld	hl, #(_g_VDP_Command + 13)
	ld	(hl), #0x00
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:125: g_VDP_Command.CMD = VDP_CMD_PSET + op;
	ld	de, #_g_VDP_Command + 14
	ld	a, 6 (ix)
	add	a, #0x50
	ld	(de), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:126: VPD_CommandSetupR36();
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:128: g_VDP_Command.DY = dy - y;
	ld	a, -11 (ix)
	sub	a, -9 (ix)
	ld	e, a
	ld	a, -10 (ix)
	sbc	a, -8 (ix)
	ld	d, a
	ld	((_g_VDP_Command + 6)), de
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:129: VPD_CommandSetupR36();
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:131: g_VDP_Command.DX = dx - x;
	ld	a, -13 (ix)
	sub	a, c
	ld	e, a
	ld	a, -12 (ix)
	sbc	a, b
	ld	d, a
	ld	((_g_VDP_Command + 4)), de
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:132: VPD_CommandSetupR36();
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:134: g_VDP_Command.DY = dy + y;
	ld	hl, #(_g_VDP_Command + 6)
	ld	a, -7 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -6 (ix)
	ld	(hl), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:135: VPD_CommandSetupR36();
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:137: g_VDP_Command.DX = dx + y;
	ld	a, -13 (ix)
	add	a, -9 (ix)
	ld	e, a
	ld	a, -12 (ix)
	adc	a, -8 (ix)
	ld	d, a
	ld	((_g_VDP_Command + 4)), de
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:138: g_VDP_Command.DY = dy + x;
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	add	hl, bc
	ex	de, hl
	ld	((_g_VDP_Command + 6)), de
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:139: VPD_CommandSetupR36();
	push	bc
	push	de
	call	_VPD_CommandSetupR36
	pop	de
	pop	bc
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:141: g_VDP_Command.DY = dy - x;
	ld	a, -11 (ix)
	sub	a, c
	ld	c, a
	ld	a, -10 (ix)
	sbc	a, b
	ld	b, a
	ld	((_g_VDP_Command + 6)), bc
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:142: VPD_CommandSetupR36();
	push	de
	call	_VPD_CommandSetupR36
	pop	de
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:144: g_VDP_Command.DX = dx - y;
	ld	a, -13 (ix)
	sub	a, -9 (ix)
	ld	c, a
	ld	a, -12 (ix)
	sbc	a, -8 (ix)
	ld	b, a
	ld	((_g_VDP_Command + 4)), bc
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:145: VPD_CommandSetupR36();
	push	de
	call	_VPD_CommandSetupR36
	pop	de
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:147: g_VDP_Command.DY = dy + x;
	ld	((_g_VDP_Command + 6)), de
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:148: VPD_CommandSetupR36();
	call	_VPD_CommandSetupR36
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:150: if (x <= y)
	ld	a, -1 (ix)
	sub	a, -3 (ix)
	jp	PO, 00126$
	xor	a, #0x80
00126$:
	jp	P, 00108$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:152: e += (2 * y) + 1;
	ld	a, -1 (ix)
	add	a, a
	inc	a
	add	a, -2 (ix)
	ld	-2 (ix), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:153: y++;
	inc	-1 (ix)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:154: if (e > x)
	ld	a, -3 (ix)
	sub	a, -2 (ix)
	jp	PO, 00127$
	xor	a, #0x80
00127$:
	jp	P, 00106$
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:156: e += 1 - (2 * x);
	ld	a, -3 (ix)
	add	a, a
	ld	c, a
	ld	a, #0x01
	sub	a, c
	add	a, -2 (ix)
	ld	-2 (ix), a
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:157: x--;
	dec	-3 (ix)
	jp	00106$
00108$:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/draw.c:160: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	inc	sp
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
