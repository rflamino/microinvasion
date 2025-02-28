;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module sprite_fx
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
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
	.globl _g_SpriteMaskR
	.globl _g_SpriteMaskL
	.globl _g_BDOS
	.globl _g_MASTER
	.globl _g_RAMAD3
	.globl _g_RAMAD2
	.globl _g_RAMAD1
	.globl _g_RAMAD0
	.globl _g_BREAKV
	.globl _g_DISKVE
	.globl _g_KANJTABLE
	.globl _g_STRSRC
	.globl _g_SUBRID
	.globl _g_CHAR_16
	.globl _g_MSXMID
	.globl _g_MSXVER
	.globl _g_ROMVersion
	.globl _g_BASRVN
	.globl _g_VDP_DW
	.globl _g_VDP_DR
	.globl _g_CGTABL
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
	.globl _SpriteFX_CropLeft8
	.globl _SpriteFX_CropLeft16
	.globl _SpriteFX_CropRight8
	.globl _SpriteFX_CropRight16
	.globl _SpriteFX_CropTop8
	.globl _SpriteFX_CropTop16
	.globl _SpriteFX_CropBottom8
	.globl _SpriteFX_CropBottom16
	.globl _SpriteFX_FlipVertical8
	.globl _SpriteFX_FlipVertical16
	.globl _SpriteFX_FlipHorizontal8
	.globl _SpriteFX_FlipHorizontal16
	.globl _SpriteFX_Mask8
	.globl _SpriteFX_Mask16
	.globl _SpriteFX_RotateRight8
	.globl _SpriteFX_RotateRight16
	.globl _SpriteFX_RotateLeft8
	.globl _SpriteFX_RotateLeft16
	.globl _SpriteFX_RotateHalfTurn8
	.globl _SpriteFX_RotateHalfTurn16
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_g_PortPrimarySlot	=	0x00a8
_g_PortReadKeyboard	=	0x00a9
_g_PortAccessKeyboard	=	0x00aa
_g_PortControl	=	0x00ab
_g_VDP_DataPort	=	0x0098
_g_VDP_RegPort	=	0x0099
_g_VDP_AddrPort	=	0x0099
_g_VDP_StatPort	=	0x0099
_g_VDP_PalPort	=	0x009a
_g_VDP_IRegPort	=	0x009b
_g_PSG_RegPort	=	0x00a0
_g_PSG_DataPort	=	0x00a1
_g_PSG_StatPort	=	0x00a2
_g_PSG_Ext_RegPort	=	0x0010
_g_PSG_Ext_DataPort	=	0x0011
_g_PSG_Ext_StatPort	=	0x0012
_g_MSXMusic_IndexPort	=	0x007c
_g_MSXMusic_DataPort	=	0x007d
_g_MSXAudio_IndexPort	=	0x00c0
_g_MSXAudio_DataPort	=	0x00c1
_g_MSXAudio_IndexPort2	=	0x00c2
_g_MSXAudio_DataPort2	=	0x00c3
_g_RTC_AddrPort	=	0x00b4
_g_RTC_DataPort	=	0x00b5
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
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:59: void SpriteFX_CropLeft8(const u8* src, u8* dest, u8 offset)
;	---------------------------------
; Function SpriteFX_CropLeft8
; ---------------------------------
_SpriteFX_CropLeft8::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:87: __endasm;
	ld	iy, #2
	add	iy, sp
	ld	c, 0(iy)
	ld	b, #0
	ld	iy, #_g_SpriteMaskL
	add	iy, bc
	ld	c, 0(iy)
	ld	b, #8
	 loopCropL8:
	ld	a, (hl)
	inc	hl
	and	c
	ld	(de), a
	inc	de
	djnz	loopCropL8
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:88: }
	pop	hl
	inc	sp
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
_g_CGTABL	=	0x0004
_g_VDP_DR	=	0x0006
_g_VDP_DW	=	0x0007
_g_BASRVN	=	0x002b
_g_ROMVersion	=	0x002b
_g_MSXVER	=	0x002d
_g_MSXMID	=	0x002e
_g_CHAR_16	=	0x0034
_g_SUBRID	=	0x0000
_g_STRSRC	=	0x0002
_g_KANJTABLE	=	0xf30f
_g_DISKVE	=	0xf323
_g_BREAKV	=	0xf325
_g_RAMAD0	=	0xf341
_g_RAMAD1	=	0xf342
_g_RAMAD2	=	0xf343
_g_RAMAD3	=	0xf344
_g_MASTER	=	0xf348
_g_BDOS	=	0xf37d
_g_SpriteMaskL:
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
_g_SpriteMaskR:
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x00	; 0
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:94: void SpriteFX_CropLeft16(const u8* src, u8* dest, u8 offset)
;	---------------------------------
; Function SpriteFX_CropLeft16
; ---------------------------------
_SpriteFX_CropLeft16::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:171: __endasm;
	ld	iy, #2
	add	iy, sp
	ld	a, 0(iy)
	cp	#8
	jp	nc, greaterCropL16
	ld	b, #0
	ld	c, a
	ld	iy, #_g_SpriteMaskL
	add	iy, bc
	ld	c, 0(iy)
	ld	b, #16
	 loopCropL16_1:
	ld	a, (hl)
	inc	hl
	and	c
	ld	(de), a
	inc	de
	djnz	loopCropL16_1
	ld	bc, #16
	ldir
	jp	endCropL16
	 greaterCropL16:
	sub	#8
	ld	c, a
	xor	a
	ld	b, #16
	 loopCropL16_2:
	inc	hl
	ld	(de), a
	inc	de
	djnz	loopCropL16_2
	ld	iy, #_g_SpriteMaskL
	add	iy, bc
	ld	c, 0(iy)
	ld	b, #16
	 loopCropL16_3:
	ld	a, (hl)
	inc	hl
	and	c
	ld	(de), a
	inc	de
	djnz	loopCropL16_3
	 endCropL16:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:172: }
	pop	hl
	inc	sp
	jp	(hl)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:178: void SpriteFX_CropRight8(const u8* src, u8* dest, u8 offset)
;	---------------------------------
; Function SpriteFX_CropRight8
; ---------------------------------
_SpriteFX_CropRight8::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:206: __endasm;
	ld	iy, #2
	add	iy, sp
	ld	c, 0(iy)
	ld	b, #0
	ld	iy, #_g_SpriteMaskR
	add	iy, bc
	ld	c, 0(iy)
	ld	b, #8
	 loopCropR8:
	ld	a, (hl)
	inc	hl
	and	c
	ld	(de), a
	inc	de
	djnz	loopCropR8
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:207: }
	pop	hl
	inc	sp
	jp	(hl)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:213: void SpriteFX_CropRight16(const u8* src, u8* dest, u8 offset)
;	---------------------------------
; Function SpriteFX_CropRight16
; ---------------------------------
_SpriteFX_CropRight16::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:286: __endasm;
	ld	iy, #2
	add	iy, sp
	ld	a, 0(iy)
	cp	#8
	jp	nc, greaterCropR16
	ld	bc, #16
	ldir
	ld	c, a
	ld	iy, #_g_SpriteMaskR
	add	iy, bc
	ld	c, 0(iy)
	ld	b, #16
	 loopCropR16_1:
	ld	a, (hl)
	inc	hl
	and	c
	ld	(de), a
	inc	de
	djnz	loopCropR16_1
	jp	endCropR16
	 greaterCropR16:
	sub	#8
	ld	c, a
	ld	b, #0
	ld	iy, #_g_SpriteMaskR
	add	iy, bc
	ld	c, 0(iy)
	ld	b, #16
	 loopCropR16_2:
	ld	a, (hl)
	inc	hl
	and	c
	ld	(de), a
	inc	de
	djnz	loopCropR16_2
	xor	a
	ld	b, #16
	 loopCropR16_3:
	ld	(de), a
	inc	de
	djnz	loopCropR16_3
	 endCropR16:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:287: }
	pop	hl
	inc	sp
	jp	(hl)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:293: void SpriteFX_CropTop8(const u8* src, u8* dest, u8 offset)
;	---------------------------------
; Function SpriteFX_CropTop8
; ---------------------------------
_SpriteFX_CropTop8::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:330: __endasm;
	ld	iy, #2
	add	iy, sp
	ld	c, 0(iy)
	inc	c
	xor	a
	ld	b, c
	 loopCropT8:
	ld	(de), a
	inc	hl
	inc	de
	djnz	loopCropT8
	ld	a, c
	neg
	add	a, #8
	jp	z, skipCropT8
	ld	c, a
	ldir
	 skipCropT8:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:331: }
	pop	hl
	inc	sp
	jp	(hl)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:337: void SpriteFX_CropTop16(const u8* src, u8* dest, u8 offset) // can be optimized?
;	---------------------------------
; Function SpriteFX_CropTop16
; ---------------------------------
_SpriteFX_CropTop16::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:400: __endasm;
	ld	iy, #2
	add	iy, sp
	ld	a, 0(iy)
	inc	a
	.db	0xFD, 0x6F
	ld	b, a
	xor	a
	 loopCropT16_1:
	inc	hl
	ld	(de), a
	inc	de
	djnz	loopCropT16_1
	.db	0xFD, 0x7D
	neg
	add	a, #16
	jp	z, skipCropT16_1
	ld	c, a
	ldir
	 skipCropT16_1:
	.db	0xFD, 0x7D
	ld	b, a
	xor	a
	 loopCropT16_2:
	inc	hl
	ld	(de), a
	inc	de
	djnz	loopCropT16_2
	.db	0xFD, 0x7D
	neg
	add	a, #16
	jp	z, skipCropT16_2
	ld	c, a
	ldir
	 skipCropT16_2:
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:401: }
	pop	hl
	inc	sp
	jp	(hl)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:407: void SpriteFX_CropBottom8(const u8* src, u8* dest, u8 offset)
;	---------------------------------
; Function SpriteFX_CropBottom8
; ---------------------------------
_SpriteFX_CropBottom8::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:440: __endasm;		
	ld	iy, #2
	add	iy, sp
	ld	a, 0(iy)
	neg
	add	#7
	jp	z, skipCropB8
	ld	c, a
	ld	b, #0
	ldir
	neg
	 skipCropB8:
	add	a, #8
	ld	b, a
	xor	a
	 loopCropB8:
	ld	(de), a
	inc	de
	djnz	loopCropB8
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:441: }
	pop	hl
	inc	sp
	jp	(hl)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:447: void SpriteFX_CropBottom16(const u8* src, u8* dest, u8 offset)
;	---------------------------------
; Function SpriteFX_CropBottom16
; ---------------------------------
_SpriteFX_CropBottom16::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:506: __endasm;
	ld	iy, #2
	add	iy, sp
	ld	a, 0(iy)
	neg
	add	#15
	.db	0xFD, 0x6F
	jp	z, skipCropB16_1
	ld	c, a
	ld	b, #0
	ldir
	neg
	 skipCropB16_1:
	add	a, #16
	ld	b, a
	xor	a
	 loopCropB16_1:
	inc	hl
	ld	(de), a
	inc	de
	djnz	loopCropB16_1
	.db	0xFD, 0x7D
	or	a
	jp	z, skipCropB16_2
	ld	c, a
	ldir
	neg
	 skipCropB16_2:
	add	a, #16
	ld	b, a
	xor	a
	 loopCropB16_2:
	ld	(de), a
	inc	de
	djnz	loopCropB16_2
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:507: }
	pop	hl
	inc	sp
	jp	(hl)
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:520: void SpriteFX_FlipVertical8(const u8* src, u8* dest) __PRESERVES(iyl, iyh)
;	---------------------------------
; Function SpriteFX_FlipVertical8
; ---------------------------------
_SpriteFX_FlipVertical8::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:535: __endasm;
	ld	bc, #7
	add	hl, bc
	ld	b, #8
	 flipLoopV:
	ld	a, (hl)
	dec	hl
	ld	(de), a
	inc	de
	djnz	flipLoopV
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:536: }
	ret
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:542: void SpriteFX_FlipVertical16(const u8* src, u8* dest) __PRESERVES(iyl, iyh)
;	---------------------------------
; Function SpriteFX_FlipVertical16
; ---------------------------------
_SpriteFX_FlipVertical16::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:568: __endasm;
	ld	bc, #15
	add	hl, bc
	ld	b, #16
	 flipLoopV1:
	ld	a, (hl)
	dec	hl
	ld	(de), a
	inc	de
	djnz	flipLoopV1
	ld	c, #32
	add	hl, bc
	ld	b, #16
	 flipLoopV2:
	ld	a, (hl)
	dec	hl
	ld	(de), a
	inc	de
	djnz	flipLoopV2
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:569: }
	ret
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:575: void SpriteFX_FlipHorizontal8(const u8* src, u8* dest) __PRESERVES(iyl, iyh)
;	---------------------------------
; Function SpriteFX_FlipHorizontal8
; ---------------------------------
_SpriteFX_FlipHorizontal8::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:607: __endasm;
	ld	b, #8
	 flipLoopH:
	ld	a, (hl)
	inc	hl
	ld	c, a
	rlca
	rlca
	xor	c
	and	#0xAA
	xor	c
	ld	c, a
	rlca
	rlca
	rlca
	rrc	c
	xor	c
	and	#0x66
	xor	c
	ld	(de), a
	inc	de
	djnz	flipLoopH
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:608: }
	ret
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:614: void SpriteFX_FlipHorizontal16(const u8* src, u8* dest) __PRESERVES(iyl, iyh)
;	---------------------------------
; Function SpriteFX_FlipHorizontal16
; ---------------------------------
_SpriteFX_FlipHorizontal16::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:669: __endasm;
	ld	bc, #16
	add	hl, bc
	ld	b, #16
	 flipLoopH1:
	ld	a, (hl)
	inc	hl
	ld	c, a
	rlca
	rlca
	xor	c
	and	#0xAA
	xor	c
	ld	c, a
	rlca
	rlca
	rlca
	rrc	c
	xor	c
	and	#0x66
	xor	c
	ld	(de), a
	inc	de
	djnz	flipLoopH1
	ld	bc, #-32
	add	hl, bc
	ld	b, #16
	 flipLoopH2:
	ld	a, (hl)
	inc	hl
	ld	c, a
	rlca
	rlca
	xor	c
	and	#0xAA
	xor	c
	ld	c, a
	rlca
	rlca
	rlca
	rrc	c
	xor	c
	and	#0x66
	xor	c
	ld	(de), a
	inc	de
	djnz	flipLoopH2
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:670: }
	ret
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:683: void SpriteFX_Mask8(const u8* src, u8* dest, const u8* mask) __NAKED
;	---------------------------------
; Function SpriteFX_Mask8
; ---------------------------------
_SpriteFX_Mask8::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:705: __endasm;
	pop	bc
	pop	iy
	push	bc
	ld	b, #8
	 maskLoop8:
	ld	a, (hl)
	inc	hl
	and	0(iy)
	inc	iy
	ld	(de), a
	inc	de
	djnz	maskLoop8
	ret
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:706: }
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:712: void SpriteFX_Mask16(const u8* src, u8* dest, const u8* mask) __NAKED
;	---------------------------------
; Function SpriteFX_Mask16
; ---------------------------------
_SpriteFX_Mask16::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:734: __endasm;
	pop	bc
	pop	iy
	push	bc
	ld	b, #32
	 maskLoop16:
	ld	a, (hl)
	and	0(iy)
	ld	(de), a
	inc	hl
	inc	de
	inc	iy
	djnz	maskLoop16
	ret
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:735: }
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:747: void SpriteFX_RotateRight8(const u8* src, u8* dest) __PRESERVES(iyl, iyh)
;	---------------------------------
; Function SpriteFX_RotateRight8
; ---------------------------------
_SpriteFX_RotateRight8::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:768: __endasm;
	ex	de, hl
	ld	c, #8
	 rotOuterLoopR:
	ld	a, (de)
	inc	de
	push	hl
	ld	b, #8
	 rotInnerLoopR:
	rla
	rr	(hl)
	inc	hl
	djnz	rotInnerLoopR
	pop	hl
	dec	c
	jp	nz, rotOuterLoopR
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:769: }
	ret
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:774: void SpriteFX_RotateRight16(const u8* src, u8* dest)
;	---------------------------------
; Function SpriteFX_RotateRight16
; ---------------------------------
_SpriteFX_RotateRight16::
	ld	c, l
	ld	b, h
	ex	de, hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:776: SpriteFX_RotateRight8(src,      dest + 16);
	ld	a, l
	add	a, #0x10
	ld	e, a
	ld	a, h
	adc	a, #0x00
	ld	d, a
	push	hl
	push	bc
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_SpriteFX_RotateRight8
	pop	bc
	pop	hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:777: SpriteFX_RotateRight8(src + 8,  dest);
	ld	iy, #0x0008
	add	iy, bc
	push	hl
	push	bc
	push	iy
	ex	de, hl
	pop	hl
	call	_SpriteFX_RotateRight8
	pop	bc
	pop	hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:778: SpriteFX_RotateRight8(src + 16, dest + 24);
	ld	a, l
	add	a, #0x18
	ld	e, a
	ld	a, h
	adc	a, #0x00
	ld	d, a
	ld	iy, #0x0010
	add	iy, bc
	push	hl
	push	bc
	push	iy
	pop	hl
	call	_SpriteFX_RotateRight8
	pop	bc
	pop	hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:779: SpriteFX_RotateRight8(src + 24, dest + 8);
	ld	de, #0x8
	add	hl, de
	ld	e, l
	ld	a,h
	ld	d,a
	ld	hl, #0x0018
	add	hl, bc
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:780: }
	jp	_SpriteFX_RotateRight8
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:785: void SpriteFX_RotateLeft8(const u8* src, u8* dest) __PRESERVES(iyl, iyh)
;	---------------------------------
; Function SpriteFX_RotateLeft8
; ---------------------------------
_SpriteFX_RotateLeft8::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:806: __endasm;
	ex	de, hl
	ld	c, #8
	 rotOuterloopL:
	ld	a, (de)
	inc	de
	push	hl
	ld	b, #8
	 rotInnerLoopL:
	rra
	rl	(hl)
	inc	hl
	djnz	rotInnerLoopL
	pop	hl
	dec	c
	jp	nz, rotOuterloopL
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:807: }
	ret
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:812: void SpriteFX_RotateLeft16(const u8* src, u8* dest)
;	---------------------------------
; Function SpriteFX_RotateLeft16
; ---------------------------------
_SpriteFX_RotateLeft16::
	ld	c, l
	ld	b, h
	ex	de, hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:814: SpriteFX_RotateLeft8(src,      dest + 8);
	ld	a, l
	add	a, #0x08
	ld	e, a
	ld	a, h
	adc	a, #0x00
	ld	d, a
	push	hl
	push	bc
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_SpriteFX_RotateLeft8
	pop	bc
	pop	hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:815: SpriteFX_RotateLeft8(src + 8,  dest + 24);
	ld	a, l
	add	a, #0x18
	ld	e, a
	ld	a, h
	adc	a, #0x00
	ld	d, a
	ld	iy, #0x0008
	add	iy, bc
	push	hl
	push	bc
	push	iy
	pop	hl
	call	_SpriteFX_RotateLeft8
	pop	bc
	pop	hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:816: SpriteFX_RotateLeft8(src + 16, dest);
	ld	iy, #0x0010
	add	iy, bc
	push	hl
	push	bc
	push	iy
	ex	de, hl
	pop	hl
	call	_SpriteFX_RotateLeft8
	pop	bc
	pop	hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:817: SpriteFX_RotateLeft8(src + 24, dest + 16);
	ld	de, #0x10
	add	hl, de
	ld	e, l
	ld	a,h
	ld	d,a
	ld	hl, #0x0018
	add	hl, bc
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:818: }
	jp	_SpriteFX_RotateLeft8
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:823: void SpriteFX_RotateHalfTurn8(const u8* src, u8* dest) __PRESERVES(iyl, iyh)
;	---------------------------------
; Function SpriteFX_RotateHalfTurn8
; ---------------------------------
_SpriteFX_RotateHalfTurn8::
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:853: __endasm;
	ld	bc, #7
	add	hl, bc
	ld	b, #8
	 rotLoop180:
	ld	a, (hl)
	dec	hl
	ld	c, a
	rlca
	rlca
	xor	c
	and	#0xAA
	xor	c
	ld	c, a
	rlca
	rlca
	rlca
	rrc	c
	xor	c
	and	#0x66
	xor	c
	ld	(de), a
	inc	de
	djnz	rotLoop180
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:854: }
	ret
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:859: void SpriteFX_RotateHalfTurn16(const u8* src, u8* dest)
;	---------------------------------
; Function SpriteFX_RotateHalfTurn16
; ---------------------------------
_SpriteFX_RotateHalfTurn16::
	ld	c, l
	ld	b, h
	ex	de, hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:861: SpriteFX_RotateHalfTurn8(src,      dest + 24);
	ld	a, l
	add	a, #0x18
	ld	e, a
	ld	a, h
	adc	a, #0x00
	ld	d, a
	push	hl
	push	bc
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_SpriteFX_RotateHalfTurn8
	pop	bc
	pop	hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:862: SpriteFX_RotateHalfTurn8(src + 8,  dest + 16);
	ld	a, l
	add	a, #0x10
	ld	e, a
	ld	a, h
	adc	a, #0x00
	ld	d, a
	ld	iy, #0x0008
	add	iy, bc
	push	hl
	push	bc
	push	iy
	pop	hl
	call	_SpriteFX_RotateHalfTurn8
	pop	bc
	pop	hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:863: SpriteFX_RotateHalfTurn8(src + 16, dest + 8);
	ld	a, l
	add	a, #0x08
	ld	e, a
	ld	a, h
	adc	a, #0x00
	ld	d, a
	ld	iy, #0x0010
	add	iy, bc
	push	hl
	push	bc
	push	iy
	pop	hl
	call	_SpriteFX_RotateHalfTurn8
	pop	bc
	pop	hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:864: SpriteFX_RotateHalfTurn8(src + 24, dest);
	ld	a, c
	add	a, #0x18
	ld	c, a
	jr	NC, 00103$
	inc	b
00103$:
	ex	de, hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
;C:\Users\reina\OneDrive\Documentos\MSXgl\engine/src/sprite_fx.c:865: }
	jp	_SpriteFX_RotateHalfTurn8
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
