;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module mi
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _WaitVBlank
	.globl _VBlankHook
	.globl _Pletter_UnpackToRAM
	.globl _AKG_Decode
	.globl _AKG_Stop
	.globl _AKG_Init
	.globl _SpriteFX_RotateLeft8
	.globl _SpriteFX_RotateRight8
	.globl _Menu_Update
	.globl _Menu_DrawPage
	.globl _Menu_Initialize
	.globl _PSG_Apply
	.globl _PSG_EnableEnvelope
	.globl _PSG_EnableNoise
	.globl _PSG_EnableTone
	.globl _PSG_SetShape
	.globl _PSG_SetEnvelope
	.globl _PSG_SetVolume
	.globl _PSG_SetMixer
	.globl _PSG_SetNoise
	.globl _PSG_SetTone
	.globl _Math_GetRandom16
	.globl _Print_DrawLineH
	.globl _Print_SetColor
	.globl _Print_DrawText
	.globl _Print_DrawChar
	.globl _Print_SetTextFont
	.globl _VDP_SetSpriteColorSM1
	.globl _VDP_SetSpritePattern
	.globl _VDP_SetSpritePosition
	.globl _VDP_LoadSpritePattern
	.globl _VDP_RegWriteBakMask
	.globl _VDP_RegWrite
	.globl _VDP_SetMode
	.globl _VDP_ClearVRAM
	.globl _Bios_Exit
	.globl _Keyboard_IsKeyPressed
	.globl _Joystick_Read
	.globl _Bios_SetHookCallback
	.globl _g_StartGame
	.globl _g_Exit
	.globl _g_VBlank
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
	.globl _g_Menus
	.globl _g_MenuMain
	.globl _g_teste
	.globl _g_Font_MI
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
	.globl _StartStarfieldEntranceFX
	.globl _UpdateStarfieldEntranceFX
	.globl _MenuAction_GameStart
	.globl _MenuAction_About
	.globl _Menu_Input_CB
	.globl _InitIntroMusic
	.globl _UpdateIntroMusic
	.globl _CutFx
	.globl _StartExplosion
	.globl _UpdateExplosion
	.globl _UpdateBulletAnimation
	.globl _initPsg
	.globl _hideAllSprites
	.globl _printGameOver
	.globl _getHiScore
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
_g_EnemyX:
	.ds 12
_g_EnemyY:
	.ds 12
_g_EnemyAlive:
	.ds 12
_g_EnemyDir:
	.ds 1
_g_EnemyMoveCount:
	.ds 1
_g_PlayerX:
	.ds 1
_g_BulletX:
	.ds 1
_g_BulletY:
	.ds 1
_g_EBActive:
	.ds 3
_g_EBX:
	.ds 3
_g_EBY:
	.ds 3
_g_Score:
	.ds 2
_g_Running:
	.ds 1
_g_Wave:
	.ds 1
_g_PowerUpX:
	.ds 1
_g_PowerUpY:
	.ds 1
_UpdatePowerUp_s_PowerUpDelayCounter_65536_980:
	.ds 1
_RunWave_fire_fx_cnt_65536_991:
	.ds 1
_RunWave_fire_tone_65536_991:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_g_VBlank::
	.ds 1
_g_SlowDownActive:
	.ds 1
_g_SlowDownTimer:
	.ds 2
_g_SpritePatternBullet:
	.ds 8
_g_HiScore:
	.ds 2
_g_PowerUpActive:
	.ds 1
_g_WallWalkActive:
	.ds 1
_g_WallWalkTimer:
	.ds 2
_g_PlayerY:
	.ds 1
_g_PowerUpType:
	.ds 1
_g_BulletSideways:
	.ds 1
_g_BulletHorizontalRight:
	.ds 1
_g_BulletGravityActive:
	.ds 1
_g_BulletGravityTimer:
	.ds 2
_g_BulletY_f:
	.ds 4
_g_BulletVelY:
	.ds 4
_s_IntroMusicIndex:
	.ds 1
_s_IntroMusicTimer:
	.ds 1
_g_PowerUpSoundActive:
	.ds 1
_g_PowerUpSoundTimer:
	.ds 1
_g_Exit::
	.ds 1
_g_StartGame::
	.ds 1
_s_MusicIndex:
	.ds 1
_s_MusicTimer:
	.ds 1
_g_ExplosionActive:
	.ds 1
_g_ExplosionPhase:
	.ds 1
_g_ExplosionStep:
	.ds 1
_s_StarfieldFXIndex:
	.ds 1
_s_StarfieldFXTimer:
	.ds 1
_s_StarfieldFXActive:
	.ds 1
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
;./mi.c:914: static u8 s_PowerUpDelayCounter = 0;
	ld	iy, #_UpdatePowerUp_s_PowerUpDelayCounter_65536_980
	ld	0 (iy), #0x00
;./mi.c:994: static u8 fire_fx_cnt = 0;
	ld	iy, #_RunWave_fire_fx_cnt_65536_991
	ld	0 (iy), #0x00
;./mi.c:995: static u8 fire_tone = 0x20;
	ld	iy, #_RunWave_fire_tone_65536_991
	ld	0 (iy), #0x20
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;./mi.c:7: static void PlayPowerUpSound(void)
;	---------------------------------
; Function PlayPowerUpSound
; ---------------------------------
_PlayPowerUpSound:
;./mi.c:9: g_PowerUpSoundActive = true;
	ld	hl, #_g_PowerUpSoundActive
	ld	(hl), #0x01
;./mi.c:10: g_PowerUpSoundTimer = 10;  // effect lasts for 10 frames
	ld	hl, #_g_PowerUpSoundTimer
	ld	(hl), #0x0a
;./mi.c:12: PSG_EnableTone(1, 1);
;	spillPairReg hl
;	spillPairReg hl
	ld	a,#0x01
	ld	l,a
	call	_PSG_EnableTone
;./mi.c:13: PSG_SetTone(1, NOTE_C5);   // starting frequency
	ld	de, #0x00d6
	ld	a, #0x01
	call	_PSG_SetTone
;./mi.c:14: PSG_SetVolume(1, 15);
	ld	l, #0x0f
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_PSG_SetVolume
;./mi.c:17: PSG_SetEnvelope(0x1800);  // now only one parameter
	ld	hl, #0x1800
	call	_PSG_SetEnvelope
;./mi.c:18: PSG_SetShape(0x09);       // now only one parameter
	ld	a, #0x09
	call	_PSG_SetShape
;./mi.c:19: PSG_EnableEnvelope(1, 1);
;	spillPairReg hl
;	spillPairReg hl
	ld	a,#0x01
	ld	l,a
	call	_PSG_EnableEnvelope
;./mi.c:21: PSG_Apply();
;./mi.c:22: }
	jp	_PSG_Apply
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
_g_Font_MI:
	.db #0x88	; 136
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0xa5	; 165
	.db #0xa5	; 165
	.db #0xc3	; 195
	.db #0xbd	; 189
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0xdb	; 219
	.db #0xdb	; 219
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x6c	; 108	'l'
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0xd6	; 214
	.db #0xfe	; 254
	.db #0xd6	; 214
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0xd6	; 214
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0xc3	; 195
	.db #0xbd	; 189
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0x0e	; 14
	.db #0x06	; 6
	.db #0x0a	; 10
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0xe4	; 228
	.db #0xdc	; 220
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0xaa	; 170
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x78	; 120	'x'
	.db #0x48	; 72	'H'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0xd6	; 214
	.db #0x82	; 130
	.db #0xd6	; 214
	.db #0x82	; 130
	.db #0xd6	; 214
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x6e	; 110	'n'
	.db #0xc2	; 194
	.db #0xae	; 174
	.db #0xc6	; 198
	.db #0xea	; 234
	.db #0x86	; 134
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xba	; 186
	.db #0xf6	; 246
	.db #0x6c	; 108	'l'
	.db #0xde	; 222
	.db #0xba	; 186
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0xc8	; 200
	.db #0xae	; 174
	.db #0xca	; 202
	.db #0xb6	; 182
	.db #0xca	; 202
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x48	; 72	'H'
	.db #0x58	; 88	'X'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x34	; 52	'4'
	.db #0x2c	; 44
	.db #0x28	; 40
	.db #0x2c	; 44
	.db #0x34	; 52	'4'
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x2c	; 44
	.db #0x34	; 52	'4'
	.db #0x14	; 20
	.db #0x34	; 52	'4'
	.db #0x2c	; 44
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x54	; 84	'T'
	.db #0x6c	; 108	'l'
	.db #0x54	; 84	'T'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x6c	; 108	'l'
	.db #0x44	; 68	'D'
	.db #0x6c	; 108	'l'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0xd0	; 208
	.db #0x90	; 144
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x1a	; 26
	.db #0x36	; 54	'6'
	.db #0x6c	; 108	'l'
	.db #0xd8	; 216
	.db #0xb0	; 176
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x5a	; 90	'Z'
	.db #0x5a	; 90	'Z'
	.db #0x5a	; 90	'Z'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x68	; 104	'h'
	.db #0x48	; 72	'H'
	.db #0x68	; 104	'h'
	.db #0x6c	; 108	'l'
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x46	; 70	'F'
	.db #0x7a	; 122	'z'
	.db #0x66	; 102	'f'
	.db #0x5e	; 94
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x46	; 70	'F'
	.db #0x7a	; 122	'z'
	.db #0x26	; 38
	.db #0x7a	; 122	'z'
	.db #0x46	; 70	'F'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x5c	; 92
	.db #0x56	; 86	'V'
	.db #0x42	; 66	'B'
	.db #0x76	; 118	'v'
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x5e	; 94
	.db #0x46	; 70	'F'
	.db #0x7a	; 122	'z'
	.db #0x46	; 70	'F'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x62	; 98	'b'
	.db #0x5e	; 94
	.db #0x46	; 70	'F'
	.db #0x5a	; 90	'Z'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x7a	; 122	'z'
	.db #0x36	; 54	'6'
	.db #0x6c	; 108	'l'
	.db #0x58	; 88	'X'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x5a	; 90	'Z'
	.db #0x66	; 102	'f'
	.db #0x5a	; 90	'Z'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x5a	; 90	'Z'
	.db #0x62	; 98	'b'
	.db #0x7a	; 122	'z'
	.db #0x46	; 70	'F'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0xd0	; 208
	.db #0x90	; 144
	.db #0xf0	; 240
	.db #0x1c	; 28
	.db #0x34	; 52	'4'
	.db #0x6c	; 108	'l'
	.db #0x58	; 88	'X'
	.db #0x6c	; 108	'l'
	.db #0x34	; 52	'4'
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x58	; 88	'X'
	.db #0x6c	; 108	'l'
	.db #0x34	; 52	'4'
	.db #0x6c	; 108	'l'
	.db #0x58	; 88	'X'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x4c	; 76	'L'
	.db #0x74	; 116	't'
	.db #0x2c	; 44
	.db #0x38	; 56	'8'
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0xc6	; 198
	.db #0xba	; 186
	.db #0xfa	; 250
	.db #0x4a	; 74	'J'
	.db #0x46	; 70	'F'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x5a	; 90	'Z'
	.db #0x5a	; 90	'Z'
	.db #0x42	; 66	'B'
	.db #0x5a	; 90	'Z'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x46	; 70	'F'
	.db #0x5a	; 90	'Z'
	.db #0x46	; 70	'F'
	.db #0x5a	; 90	'Z'
	.db #0x46	; 70	'F'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x5a	; 90	'Z'
	.db #0x5e	; 94
	.db #0x5a	; 90	'Z'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x46	; 70	'F'
	.db #0x5a	; 90	'Z'
	.db #0x5a	; 90	'Z'
	.db #0x5a	; 90	'Z'
	.db #0x46	; 70	'F'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x5e	; 94
	.db #0x44	; 68	'D'
	.db #0x5e	; 94
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x5e	; 94
	.db #0x44	; 68	'D'
	.db #0x5c	; 92
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x5e	; 94
	.db #0x52	; 82	'R'
	.db #0x5a	; 90	'Z'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x5a	; 90	'Z'
	.db #0x5a	; 90	'Z'
	.db #0x42	; 66	'B'
	.db #0x5a	; 90	'Z'
	.db #0x5a	; 90	'Z'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x6c	; 108	'l'
	.db #0x28	; 40
	.db #0x6c	; 108	'l'
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x76	; 118	'v'
	.db #0x74	; 116	't'
	.db #0x54	; 84	'T'
	.db #0x6c	; 108	'l'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x5a	; 90	'Z'
	.db #0x56	; 86	'V'
	.db #0x4c	; 76	'L'
	.db #0x56	; 86	'V'
	.db #0x5a	; 90	'Z'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x5e	; 94
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xba	; 186
	.db #0x92	; 146
	.db #0xaa	; 170
	.db #0xba	; 186
	.db #0xaa	; 170
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xba	; 186
	.db #0x9a	; 154
	.db #0xaa	; 170
	.db #0xb2	; 178
	.db #0xba	; 186
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0xc6	; 198
	.db #0xba	; 186
	.db #0xba	; 186
	.db #0xba	; 186
	.db #0xc6	; 198
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x46	; 70	'F'
	.db #0x5a	; 90	'Z'
	.db #0x46	; 70	'F'
	.db #0x5c	; 92
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x62	; 98	'b'
	.db #0x5a	; 90	'Z'
	.db #0x62	; 98	'b'
	.db #0x3a	; 58
	.db #0x0a	; 10
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x46	; 70	'F'
	.db #0x5a	; 90	'Z'
	.db #0x46	; 70	'F'
	.db #0x5a	; 90	'Z'
	.db #0x5a	; 90	'Z'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x62	; 98	'b'
	.db #0x5e	; 94
	.db #0x66	; 102	'f'
	.db #0x7a	; 122	'z'
	.db #0x46	; 70	'F'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x82	; 130
	.db #0xee	; 238
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x5a	; 90	'Z'
	.db #0x5a	; 90	'Z'
	.db #0x5a	; 90	'Z'
	.db #0x5a	; 90	'Z'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xaa	; 170
	.db #0xba	; 186
	.db #0xd6	; 214
	.db #0x54	; 84	'T'
	.db #0x6c	; 108	'l'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xaa	; 170
	.db #0xba	; 186
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0xd6	; 214
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xba	; 186
	.db #0xd6	; 214
	.db #0x6c	; 108	'l'
	.db #0xd6	; 214
	.db #0xba	; 186
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x5a	; 90	'Z'
	.db #0x5a	; 90	'Z'
	.db #0x66	; 102	'f'
	.db #0x34	; 52	'4'
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x7a	; 122	'z'
	.db #0x66	; 102	'f'
	.db #0x5e	; 94
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x2c	; 44
	.db #0x28	; 40
	.db #0x2c	; 44
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xb0	; 176
	.db #0xd8	; 216
	.db #0x6c	; 108	'l'
	.db #0x36	; 54	'6'
	.db #0x1a	; 26
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x34	; 52	'4'
	.db #0x14	; 20
	.db #0x34	; 52	'4'
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x6c	; 108	'l'
	.db #0xd6	; 214
	.db #0xba	; 186
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x82	; 130
	.db #0xfe	; 254
	.db #0x78	; 120	'x'
	.db #0x48	; 72	'H'
	.db #0x68	; 104	'h'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x26	; 38
	.db #0x3a	; 58
	.db #0x62	; 98	'b'
	.db #0x5a	; 90	'Z'
	.db #0x62	; 98	'b'
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0x5c	; 92
	.db #0x46	; 70	'F'
	.db #0x5a	; 90	'Z'
	.db #0x46	; 70	'F'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x62	; 98	'b'
	.db #0x5e	; 94
	.db #0x5e	; 94
	.db #0x62	; 98	'b'
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x0a	; 10
	.db #0x3a	; 58
	.db #0x62	; 98	'b'
	.db #0x5a	; 90	'Z'
	.db #0x62	; 98	'b'
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x5a	; 90	'Z'
	.db #0x46	; 70	'F'
	.db #0x5e	; 94
	.db #0x62	; 98	'b'
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x62	; 98	'b'
	.db #0x5e	; 94
	.db #0x44	; 68	'D'
	.db #0x5c	; 92
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x62	; 98	'b'
	.db #0x5a	; 90	'Z'
	.db #0x62	; 98	'b'
	.db #0x7a	; 122	'z'
	.db #0x46	; 70	'F'
	.db #0x7c	; 124
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0x5c	; 92
	.db #0x46	; 70	'F'
	.db #0x5a	; 90	'Z'
	.db #0x5a	; 90	'Z'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x2c	; 44
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x0a	; 10
	.db #0x0e	; 14
	.db #0x7a	; 122	'z'
	.db #0x5a	; 90	'Z'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0x5e	; 94
	.db #0x52	; 82	'R'
	.db #0x4e	; 78	'N'
	.db #0x52	; 82	'R'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x2c	; 44
	.db #0x34	; 52	'4'
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x86	; 134
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x46	; 70	'F'
	.db #0x5a	; 90	'Z'
	.db #0x5a	; 90	'Z'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x5a	; 90	'Z'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x46	; 70	'F'
	.db #0x5a	; 90	'Z'
	.db #0x46	; 70	'F'
	.db #0x5c	; 92
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x62	; 98	'b'
	.db #0x5a	; 90	'Z'
	.db #0x62	; 98	'b'
	.db #0x3a	; 58
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x52	; 82	'R'
	.db #0x4e	; 78	'N'
	.db #0x58	; 88	'X'
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x64	; 100	'd'
	.db #0x5c	; 92
	.db #0x66	; 102	'f'
	.db #0x3a	; 58
	.db #0x26	; 38
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x58	; 88	'X'
	.db #0x48	; 72	'H'
	.db #0x58	; 88	'X'
	.db #0x5c	; 92
	.db #0x64	; 100	'd'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x5a	; 90	'Z'
	.db #0x5a	; 90	'Z'
	.db #0x62	; 98	'b'
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x5a	; 90	'Z'
	.db #0x56	; 86	'V'
	.db #0x6c	; 108	'l'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0xd6	; 214
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x54	; 84	'T'
	.db #0x6c	; 108	'l'
	.db #0x54	; 84	'T'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x4a	; 74	'J'
	.db #0x72	; 114	'r'
	.db #0x7a	; 122	'z'
	.db #0x46	; 70	'F'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x76	; 118	'v'
	.db #0x6e	; 110	'n'
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x6c	; 108	'l'
	.db #0x48	; 72	'H'
	.db #0x6c	; 108	'l'
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x48	; 72	'H'
	.db #0x6c	; 108	'l'
	.db #0x24	; 36
	.db #0x6c	; 108	'l'
	.db #0x48	; 72	'H'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x6a	; 106	'j'
	.db #0x56	; 86	'V'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x78	; 120	'x'
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x98	; 152
	.db #0xe0	; 224
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x88	; 136
	.db #0x98	; 152
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0xf8	; 248
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x88	; 136
	.db #0x98	; 152
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x78	; 120	'x'
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0x20	; 32
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x98	; 152
	.db #0xe0	; 224
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0xf8	; 248
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x50	; 80	'P'
	.db #0xf8	; 248
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0xf8	; 248
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0xf8	; 248
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xd0	; 208
	.db #0x68	; 104	'h'
	.db #0xb0	; 176
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0xa0	; 160
	.db #0xb0	; 176
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0xb8	; 184
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x78	; 120	'x'
	.db #0x08	; 8
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x78	; 120	'x'
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0x78	; 120	'x'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x50	; 80	'P'
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0x40	; 64
	.db #0x48	; 72	'H'
	.db #0xb0	; 176
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x50	; 80	'P'
	.db #0xf8	; 248
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xd0	; 208
	.db #0xb0	; 176
	.db #0xb0	; 176
	.db #0xb8	; 184
	.db #0xd0	; 208
	.db #0x88	; 136
	.db #0x80	; 128
	.db #0x38	; 56	'8'
	.db #0x40	; 64
	.db #0xf0	; 240
	.db #0x40	; 64
	.db #0xf0	; 240
	.db #0x40	; 64
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x88	; 136
	.db #0x98	; 152
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0xc8	; 200
	.db #0xa8	; 168
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x88	; 136
	.db #0x98	; 152
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x48	; 72	'H'
	.db #0x50	; 80	'P'
	.db #0x30	; 48	'0'
	.db #0x48	; 72	'H'
	.db #0x90	; 144
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x48	; 72	'H'
	.db #0x50	; 80	'P'
	.db #0x28	; 40
	.db #0x58	; 88	'X'
	.db #0xb8	; 184
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x90	; 144
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x90	; 144
	.db #0x48	; 72	'H'
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0xf8	; 248
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x88	; 136
	.db #0x98	; 152
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0xe8	; 232
	.db #0x08	; 8
	.db #0x30	; 48	'0'
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0xd8	; 216
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0xe8	; 232
	.db #0x08	; 8
	.db #0x30	; 48	'0'
	.db #0xe0	; 224
	.db #0x68	; 104	'h'
	.db #0x30	; 48	'0'
	.db #0xe8	; 232
	.db #0x58	; 88	'X'
	.db #0xb8	; 184
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xb0	; 176
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x50	; 80	'P'
	.db #0x88	; 136
	.db #0x50	; 80	'P'
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x90	; 144
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0xa8	; 168
	.db #0xa8	; 168
	.db #0xa8	; 168
	.db #0x68	; 104	'h'
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x44	; 68	'D'
	.db #0x70	; 112	'p'
	.db #0x80	; 128
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x11	; 17
	.db #0x22	; 34
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x11	; 17
	.db #0x22	; 34
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x22	; 34
	.db #0x11	; 17
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x22	; 34
	.db #0x11	; 17
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xc3	; 195
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0x81	; 129
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x88	; 136
	.db #0xa8	; 168
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x90	; 144
	.db #0xe0	; 224
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x88	; 136
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x48	; 72	'H'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x48	; 72	'H'
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x88	; 136
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x90	; 144
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0xc8	; 200
	.db #0xb0	; 176
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0xa0	; 160
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0xa8	; 168
	.db #0xa8	; 168
	.db #0x70	; 112	'p'
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0xf8	; 248
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x50	; 80	'P'
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x40	; 64
	.db #0x30	; 48	'0'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0xa8	; 168
	.db #0xa8	; 168
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x70	; 112	'p'
	.db #0xa8	; 168
	.db #0xa8	; 168
	.db #0x70	; 112	'p'
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0x50	; 80	'P'
	.db #0x30	; 48	'0'
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x60	; 96
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_teste:
	.db #0x80	; 128
	.db #0x41	; 65	'A'
	.db #0x54	; 84	'T'
	.db #0x33	; 51	'3'
	.db #0x30	; 48	'0'
	.db #0x0e	; 14
	.db #0xd0	; 208
	.db #0x60	; 96
	.db #0xdb	; 219
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0xd3	; 211
	.db #0xa8	; 168
	.db #0x00	; 0
	.db #0xd3	; 211
	.db #0x22	; 34
	.db #0xd0	; 208
	.db #0x46	; 70	'F'
	.db #0xd0	; 208
	.db #0x6a	; 106	'j'
	.db #0xd0	; 208
	.db #0x8e	; 142
	.db #0x00	; 0
	.db #0xd0	; 208
	.db #0x94	; 148
	.db #0xd0	; 208
	.db #0xb8	; 184
	.db #0xd0	; 208
	.db #0xbf	; 191
	.db #0xd0	; 208
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0xd0	; 208
	.db #0xcd	; 205
	.db #0xd0	; 208
	.db #0xd4	; 212
	.db #0xd0	; 208
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x7e	; 126
	.db #0x18	; 24
	.db #0x84	; 132
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x18	; 24
	.db #0x3f	; 63
	.db #0x24	; 36
	.db #0x30	; 48	'0'
	.db #0x43	; 67	'C'
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0x47	; 71	'G'
	.db #0x0f	; 15
	.db #0x47	; 71	'G'
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0xd0	; 208
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0x6b	; 107	'k'
	.db #0xc1	; 193
	.db #0x23	; 35
	.db #0x18	; 24
	.db #0x80	; 128
	.db #0x8f	; 143
	.db #0x1f	; 31
	.db #0x05	; 5
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0xb1	; 177
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x95	; 149
	.db #0x81	; 129
	.db #0x29	; 41
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x80	; 128
	.db #0xb9	; 185
	.db #0xc3	; 195
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x87	; 135
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0xc7	; 199
	.db #0x0e	; 14
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x80	; 128
	.db #0xce	; 206
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x80	; 128
	.db #0xd5	; 213
	.db #0xd0	; 208
	.db #0xfd	; 253
	.db #0xd0	; 208
	.db #0x00	; 0
	.db #0xd1	; 209
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0xd1	; 209
	.db #0x54	; 84	'T'
	.db #0xd1	; 209
	.db #0x83	; 131
	.db #0xd1	; 209
	.db #0xc1	; 193
	.db #0xd1	; 209
	.db #0x00	; 0
	.db #0xc9	; 201
	.db #0xd1	; 209
	.db #0x3b	; 59
	.db #0xd2	; 210
	.db #0x5d	; 93
	.db #0xd2	; 210
	.db #0x62	; 98	'b'
	.db #0xd2	; 210
	.db #0x00	; 0
	.db #0x74	; 116	't'
	.db #0xd2	; 210
	.db #0xb2	; 178
	.db #0xd2	; 210
	.db #0xd3	; 211
	.db #0xd2	; 210
	.db #0xf8	; 248
	.db #0xd2	; 210
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0xd2	; 210
	.db #0x04	; 4
	.db #0xd3	; 211
	.db #0x0a	; 10
	.db #0xd3	; 211
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xe9	; 233
	.db #0xe9	; 233
	.db #0x04	; 4
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xd9	; 217
	.db #0xd9	; 217
	.db #0xd1	; 209
	.db #0x25	; 37
	.db #0xc9	; 201
	.db #0x00	; 0
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xb9	; 185
	.db #0xb9	; 185
	.db #0xb1	; 177
	.db #0xb1	; 177
	.db #0xa9	; 169
	.db #0xa9	; 169
	.db #0x00	; 0
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0x71	; 113	'q'
	.db #0x88	; 136
	.db #0x90	; 144
	.db #0x01	; 1
	.db #0x18	; 24
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x40	; 64
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x71	; 113	'q'
	.db #0x80	; 128
	.db #0xd0	; 208
	.db #0xc3	; 195
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0xd4	; 212
	.db #0x9d	; 157
	.db #0x04	; 4
	.db #0x32	; 50	'2'
	.db #0xf8	; 248
	.db #0x44	; 68	'D'
	.db #0x06	; 6
	.db #0x28	; 40
	.db #0x65	; 101	'e'
	.db #0x01	; 1
	.db #0x24	; 36
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xe8	; 232
	.db #0x06	; 6
	.db #0x61	; 97	'a'
	.db #0x87	; 135
	.db #0xc3	; 195
	.db #0x04	; 4
	.db #0x59	; 89	'Y'
	.db #0x5e	; 94
	.db #0x87	; 135
	.db #0x0d	; 13
	.db #0xe4	; 228
	.db #0x2e	; 46
	.db #0x81	; 129
	.db #0x0b	; 11
	.db #0x7f	; 127
	.db #0x8b	; 139
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x20	; 32
	.db #0x25	; 37
	.db #0x9a	; 154
	.db #0x03	; 3
	.db #0xe1	; 225
	.db #0xb8	; 184
	.db #0x0d	; 13
	.db #0xff	; 255
	.db #0x70	; 112	'p'
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0xb0	; 176
	.db #0xd1	; 209
	.db #0xd0	; 208
	.db #0x3d	; 61
	.db #0x07	; 7
	.db #0xc5	; 197
	.db #0xb9	; 185
	.db #0x07	; 7
	.db #0x74	; 116	't'
	.db #0x60	; 96
	.db #0x8f	; 143
	.db #0x74	; 116	't'
	.db #0x40	; 64
	.db #0x55	; 85	'U'
	.db #0x10	; 16
	.db #0x09	; 9
	.db #0xf1	; 241
	.db #0x06	; 6
	.db #0xf9	; 249
	.db #0x07	; 7
	.db #0x34	; 52	'4'
	.db #0x68	; 104	'h'
	.db #0xd2	; 210
	.db #0x79	; 121	'y'
	.db #0xd9	; 217
	.db #0x83	; 131
	.db #0xb4	; 180
	.db #0x06	; 6
	.db #0xb2	; 178
	.db #0xb0	; 176
	.db #0x0c	; 12
	.db #0xae	; 174
	.db #0x18	; 24
	.db #0xac	; 172
	.db #0x3a	; 58
	.db #0xe0	; 224
	.db #0xd9	; 217
	.db #0x01	; 1
	.db #0xe9	; 233
	.db #0x07	; 7
	.db #0x5e	; 94
	.db #0xd2	; 210
	.db #0x02	; 2
	.db #0xfd	; 253
	.db #0x23	; 35
	.db #0x77	; 119	'w'
	.db #0x16	; 22
	.db #0x11	; 17
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x49	; 73	'I'
	.db #0xd0	; 208
	.db #0x1c	; 28
	.db #0x03	; 3
	.db #0xc9	; 201
	.db #0xd5	; 213
	.db #0xc8	; 200
	.db #0x0d	; 13
	.db #0xec	; 236
	.db #0x1c	; 28
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x7f	; 127
	.db #0xa1	; 161
	.db #0xd4	; 212
	.db #0x76	; 118	'v'
	.db #0x5e	; 94
	.db #0xa5	; 165
	.db #0x2c	; 44
	.db #0x36	; 54	'6'
	.db #0x5b	; 91
	.db #0xf9	; 249
	.db #0x00	; 0
	.db #0xa5	; 165
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0xc8	; 200
	.db #0x45	; 69	'E'
	.db #0xee	; 238
	.db #0x45	; 69	'E'
	.db #0x02	; 2
	.db #0x82	; 130
	.db #0x30	; 48	'0'
	.db #0x07	; 7
	.db #0xf9	; 249
	.db #0x05	; 5
	.db #0x83	; 131
	.db #0x07	; 7
	.db #0x48	; 72	'H'
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0x22	; 34
	.db #0x0b	; 11
	.db #0x05	; 5
	.db #0xd3	; 211
	.db #0xa0	; 160
	.db #0x05	; 5
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0xd3	; 211
	.db #0x59	; 89	'Y'
	.db #0xd3	; 211
	.db #0x00	; 0
	.db #0x56	; 86	'V'
	.db #0xd3	; 211
	.db #0x6e	; 110	'n'
	.db #0xd3	; 211
	.db #0x57	; 87	'W'
	.db #0xd3	; 211
	.db #0x67	; 103	'g'
	.db #0xd3	; 211
	.db #0x00	; 0
	.db #0x74	; 116	't'
	.db #0xd3	; 211
	.db #0x77	; 119	'w'
	.db #0xd3	; 211
	.db #0x7a	; 122	'z'
	.db #0xd3	; 211
	.db #0x70	; 112	'p'
	.db #0xd3	; 211
	.db #0x00	; 0
	.db #0x5e	; 94
	.db #0xd3	; 211
	.db #0x61	; 97	'a'
	.db #0xd3	; 211
	.db #0x72	; 114	'r'
	.db #0xd3	; 211
	.db #0x5b	; 91
	.db #0xd3	; 211
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0xd3	; 211
	.db #0x88	; 136
	.db #0xd3	; 211
	.db #0x7d	; 125
	.db #0xd3	; 211
	.db #0x63	; 99	'c'
	.db #0xd3	; 211
	.db #0x00	; 0
	.db #0x65	; 101	'e'
	.db #0xd3	; 211
	.db #0x81	; 129
	.db #0xd3	; 211
	.db #0x8a	; 138
	.db #0xd3	; 211
	.db #0x6a	; 106	'j'
	.db #0xd3	; 211
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0xd3	; 211
	.db #0x86	; 134
	.db #0xd3	; 211
	.db #0x6c	; 108	'l'
	.db #0xd3	; 211
	.db #0x95	; 149
	.db #0xd3	; 211
	.db #0x00	; 0
	.db #0x96	; 150
	.db #0xd3	; 211
	.db #0x99	; 153
	.db #0xd3	; 211
	.db #0x9c	; 156
	.db #0xd3	; 211
	.db #0x8c	; 140
	.db #0xd3	; 211
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0xd3	; 211
	.db #0x92	; 146
	.db #0xd3	; 211
	.db #0x9f	; 159
	.db #0xd3	; 211
	.db #0xa2	; 162
	.db #0xd3	; 211
	.db #0x08	; 8
	.db #0xa4	; 164
	.db #0xd3	; 211
	.db #0xa6	; 166
	.db #0xd3	; 211
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x14	; 20
	.db #0x98	; 152
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x97	; 151
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x28	; 40
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x44	; 68	'D'
	.db #0x08	; 8
	.db #0xb1	; 177
	.db #0xa4	; 164
	.db #0x08	; 8
	.db #0x15	; 21
	.db #0x0a	; 10
	.db #0xcd	; 205
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0xb0	; 176
	.db #0x84	; 132
	.db #0x02	; 2
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x12	; 18
	.db #0x36	; 54	'6'
	.db #0x16	; 22
	.db #0x24	; 36
	.db #0x12	; 18
	.db #0x90	; 144
	.db #0x3a	; 58
	.db #0x90	; 144
	.db #0x09	; 9
	.db #0xa8	; 168
	.db #0x90	; 144
	.db #0x02	; 2
	.db #0xc8	; 200
	.db #0x1b	; 27
	.db #0x0b	; 11
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x11	; 17
	.db #0x04	; 4
	.db #0x0d	; 13
	.db #0x02	; 2
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x03	; 3
	.db #0xd5	; 213
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0xd5	; 213
	.db #0x88	; 136
	.db #0xd5	; 213
	.db #0xd3	; 211
	.db #0xd4	; 212
	.db #0x8c	; 140
	.db #0xd5	; 213
	.db #0x00	; 0
	.db #0xca	; 202
	.db #0xd5	; 213
	.db #0x49	; 73	'I'
	.db #0xd6	; 214
	.db #0xdb	; 219
	.db #0xd4	; 212
	.db #0x4e	; 78	'N'
	.db #0xd6	; 214
	.db #0x1a	; 26
	.db #0xcc	; 204
	.db #0xd6	; 214
	.db #0xe5	; 229
	.db #0x34	; 52	'4'
	.db #0x07	; 7
	.db #0xed	; 237
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0xd7	; 215
	.db #0x91	; 145
	.db #0xd7	; 215
	.db #0xa7	; 167
	.db #0xd7	; 215
	.db #0xe3	; 227
	.db #0xd4	; 212
	.db #0x02	; 2
	.db #0xb2	; 178
	.db #0xd7	; 215
	.db #0x15	; 21
	.db #0xd8	; 216
	.db #0x2e	; 46
	.db #0xd8	; 216
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0xe0	; 224
	.db #0xd8	; 216
	.db #0x43	; 67	'C'
	.db #0xd9	; 217
	.db #0x5c	; 92
	.db #0xd9	; 217
	.db #0x01	; 1
	.db #0x17	; 23
	.db #0xda	; 218
	.db #0x9f	; 159
	.db #0xda	; 218
	.db #0xb8	; 184
	.db #0xda	; 218
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x77	; 119	'w'
	.db #0xdb	; 219
	.db #0x0b	; 11
	.db #0xdc	; 220
	.db #0x24	; 36
	.db #0xdc	; 220
	.db #0x07	; 7
	.db #0x3f	; 63
	.db #0xe3	; 227
	.db #0xdc	; 220
	.db #0x77	; 119	'w'
	.db #0xdd	; 221
	.db #0x40	; 64
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0xea	; 234
	.db #0xdd	; 221
	.db #0x5d	; 93
	.db #0xde	; 222
	.db #0xeb	; 235
	.db #0x01	; 1
	.db #0xd4	; 212
	.db #0x1b	; 27
	.db #0xdf	; 223
	.db #0x37	; 55	'7'
	.db #0xdf	; 223
	.db #0xaa	; 170
	.db #0xdf	; 223
	.db #0x37	; 55	'7'
	.db #0x0f	; 15
	.db #0xaf	; 175
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x07	; 7
	.db #0x6c	; 108	'l'
	.db #0xe0	; 224
	.db #0xda	; 218
	.db #0x07	; 7
	.db #0xc4	; 196
	.db #0x14	; 20
	.db #0x07	; 7
	.db #0xa4	; 164
	.db #0x70	; 112	'p'
	.db #0xe1	; 225
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0xe2	; 226
	.db #0xa0	; 160
	.db #0x6c	; 108	'l'
	.db #0xe2	; 226
	.db #0x07	; 7
	.db #0xee	; 238
	.db #0xc0	; 192
	.db #0x07	; 7
	.db #0x89	; 137
	.db #0xe3	; 227
	.db #0xe2	; 226
	.db #0xe3	; 227
	.db #0x20	; 32
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0x07	; 7
	.db #0x17	; 23
	.db #0xe4	; 228
	.db #0x51	; 81	'Q'
	.db #0xe4	; 228
	.db #0x20	; 32
	.db #0x5e	; 94
	.db #0xe4	; 228
	.db #0x07	; 7
	.db #0xa3	; 163
	.db #0xe4	; 228
	.db #0xb1	; 177
	.db #0xe4	; 228
	.db #0x60	; 96
	.db #0xc2	; 194
	.db #0x07	; 7
	.db #0x0a	; 10
	.db #0xe5	; 229
	.db #0x28	; 40
	.db #0x1a	; 26
	.db #0xe5	; 229
	.db #0x47	; 71	'G'
	.db #0xe5	; 229
	.db #0xc3	; 195
	.db #0x0f	; 15
	.db #0x8f	; 143
	.db #0xe5	; 229
	.db #0x9e	; 158
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0xf3	; 243
	.db #0xd4	; 212
	.db #0xad	; 173
	.db #0xe5	; 229
	.db #0xd8	; 216
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0xf6	; 246
	.db #0xe5	; 229
	.db #0x3a	; 58
	.db #0xe6	; 230
	.db #0x47	; 71	'G'
	.db #0x35	; 53	'5'
	.db #0xe6	; 230
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xc8	; 200
	.db #0xe6	; 230
	.db #0x0c	; 12
	.db #0xe7	; 231
	.db #0x19	; 25
	.db #0xe7	; 231
	.db #0xbe	; 190
	.db #0x17	; 23
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x9f	; 159
	.db #0x1c	; 28
	.db #0x07	; 7
	.db #0x9a	; 154
	.db #0xc3	; 195
	.db #0x0f	; 15
	.db #0xdf	; 223
	.db #0xe7	; 231
	.db #0x62	; 98	'b'
	.db #0x07	; 7
	.db #0x3b	; 59
	.db #0xe8	; 232
	.db #0x07	; 7
	.db #0x20	; 32
	.db #0x41	; 65	'A'
	.db #0xe8	; 232
	.db #0x07	; 7
	.db #0x46	; 70	'F'
	.db #0xe8	; 232
	.db #0x48	; 72	'H'
	.db #0xe8	; 232
	.db #0xb5	; 181
	.db #0x03	; 3
	.db #0xa1	; 161
	.db #0x2f	; 47
	.db #0xfe	; 254
	.db #0x0c	; 12
	.db #0xaf	; 175
	.db #0xd3	; 211
	.db #0x40	; 64
	.db #0x84	; 132
	.db #0x18	; 24
	.db #0x75	; 117	'u'
	.db #0xe8	; 232
	.db #0x7f	; 127
	.db #0x73	; 115	's'
	.db #0xe8	; 232
	.db #0x07	; 7
	.db #0x78	; 120	'x'
	.db #0xc7	; 199
	.db #0x07	; 7
	.db #0x79	; 121	'y'
	.db #0x8c	; 140
	.db #0x07	; 7
	.db #0x7b	; 123
	.db #0x07	; 7
	.db #0x6e	; 110	'n'
	.db #0x20	; 32
	.db #0x31	; 49	'1'
	.db #0x17	; 23
	.db #0x7d	; 125
	.db #0x07	; 7
	.db #0xd1	; 209
	.db #0x04	; 4
	.db #0xda	; 218
	.db #0x3c	; 60
	.db #0x11	; 17
	.db #0x20	; 32
	.db #0x11	; 17
	.db #0x1d	; 29
	.db #0x02	; 2
	.db #0x18	; 24
	.db #0x16	; 22
	.db #0x14	; 20
	.db #0x3c	; 60
	.db #0x06	; 6
	.db #0x16	; 22
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3e	; 62
	.db #0x11	; 17
	.db #0xee	; 238
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x3d	; 61
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x01	; 1
	.db #0x3d	; 61
	.db #0x42	; 66	'B'
	.db #0x03	; 3
	.db #0x33	; 51	'3'
	.db #0x15	; 21
	.db #0x0c	; 12
	.db #0x7d	; 125
	.db #0x3a	; 58
	.db #0x0f	; 15
	.db #0x45	; 69	'E'
	.db #0x03	; 3
	.db #0x7f	; 127
	.db #0x91	; 145
	.db #0xa0	; 160
	.db #0x87	; 135
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x64	; 100	'd'
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x64	; 100	'd'
	.db #0xfe	; 254
	.db #0x89	; 137
	.db #0x07	; 7
	.db #0x63	; 99	'c'
	.db #0x15	; 21
	.db #0x13	; 19
	.db #0x11	; 17
	.db #0xf2	; 242
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x90	; 144
	.db #0xbf	; 191
	.db #0xd8	; 216
	.db #0xbd	; 189
	.db #0x06	; 6
	.db #0xb7	; 183
	.db #0x23	; 35
	.db #0x7b	; 123
	.db #0x38	; 56	'8'
	.db #0x94	; 148
	.db #0x0e	; 14
	.db #0xbf	; 191
	.db #0x0b	; 11
	.db #0x70	; 112	'p'
	.db #0xbf	; 191
	.db #0xb2	; 178
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x7e	; 126
	.db #0x17	; 23
	.db #0xc5	; 197
	.db #0x0d	; 13
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x87	; 135
	.db #0x24	; 36
	.db #0x51	; 81	'Q'
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x48	; 72	'H'
	.db #0x51	; 81	'Q'
	.db #0x03	; 3
	.db #0x56	; 86	'V'
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x58	; 88	'X'
	.db #0x00	; 0
	.db #0x56	; 86	'V'
	.db #0x03	; 3
	.db #0x88	; 136
	.db #0x4f	; 79	'O'
	.db #0x3c	; 60
	.db #0xe1	; 225
	.db #0x18	; 24
	.db #0x2e	; 46
	.db #0x9d	; 157
	.db #0x32	; 50	'2'
	.db #0x01	; 1
	.db #0x11	; 17
	.db #0x05	; 5
	.db #0x99	; 153
	.db #0x2e	; 46
	.db #0x1f	; 31
	.db #0x3e	; 62
	.db #0x94	; 148
	.db #0x01	; 1
	.db #0xd0	; 208
	.db #0x21	; 33
	.db #0x11	; 17
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x14	; 20
	.db #0xb5	; 181
	.db #0x00	; 0
	.db #0xbe	; 190
	.db #0x3a	; 58
	.db #0x64	; 100	'd'
	.db #0xb9	; 185
	.db #0x19	; 25
	.db #0x3b	; 59
	.db #0xa0	; 160
	.db #0x5e	; 94
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x6f	; 111	'o'
	.db #0x38	; 56	'8'
	.db #0x03	; 3
	.db #0x82	; 130
	.db #0x20	; 32
	.db #0x07	; 7
	.db #0x7d	; 125
	.db #0xac	; 172
	.db #0x04	; 4
	.db #0x3d	; 61
	.db #0x0b	; 11
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x2b	; 43
	.db #0xfe	; 254
	.db #0x26	; 38
	.db #0x7c	; 124
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0x8d	; 141
	.db #0x05	; 5
	.db #0x27	; 39
	.db #0x80	; 128
	.db #0x9b	; 155
	.db #0x1e	; 30
	.db #0x7a	; 122	'z'
	.db #0x08	; 8
	.db #0xd3	; 211
	.db #0x20	; 32
	.db #0x9f	; 159
	.db #0x19	; 25
	.db #0x3e	; 62
	.db #0x25	; 37
	.db #0x84	; 132
	.db #0x4f	; 79	'O'
	.db #0x01	; 1
	.db #0xca	; 202
	.db #0xbc	; 188
	.db #0x00	; 0
	.db #0x4a	; 74	'J'
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x11	; 17
	.db #0x0f	; 15
	.db #0x0d	; 13
	.db #0x4a	; 74	'J'
	.db #0x03	; 3
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xcb	; 203
	.db #0x1c	; 28
	.db #0x4f	; 79	'O'
	.db #0xfc	; 252
	.db #0x08	; 8
	.db #0x1a	; 26
	.db #0x8a	; 138
	.db #0x01	; 1
	.db #0xb8	; 184
	.db #0x19	; 25
	.db #0x07	; 7
	.db #0x96	; 150
	.db #0x01	; 1
	.db #0x74	; 116	't'
	.db #0x0a	; 10
	.db #0x06	; 6
	.db #0xca	; 202
	.db #0x0a	; 10
	.db #0x05	; 5
	.db #0xc3	; 195
	.db #0x31	; 49	'1'
	.db #0x8d	; 141
	.db #0x01	; 1
	.db #0xf9	; 249
	.db #0x25	; 37
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x4d	; 77	'M'
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x19	; 25
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x8c	; 140
	.db #0x3f	; 63
	.db #0x4d	; 77	'M'
	.db #0x19	; 25
	.db #0xae	; 174
	.db #0x03	; 3
	.db #0x19	; 25
	.db #0x27	; 39
	.db #0x1c	; 28
	.db #0x7f	; 127
	.db #0x64	; 100	'd'
	.db #0x01	; 1
	.db #0x1d	; 29
	.db #0xcf	; 207
	.db #0xa0	; 160
	.db #0x5e	; 94
	.db #0x13	; 19
	.db #0x0f	; 15
	.db #0x1b	; 27
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x75	; 117	'u'
	.db #0x11	; 17
	.db #0x14	; 20
	.db #0x42	; 66	'B'
	.db #0x77	; 119	'w'
	.db #0x34	; 52	'4'
	.db #0x15	; 21
	.db #0xa0	; 160
	.db #0xc4	; 196
	.db #0x10	; 16
	.db #0xa6	; 166
	.db #0xa3	; 163
	.db #0x00	; 0
	.db #0x1b	; 27
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x29	; 41
	.db #0x2c	; 44
	.db #0x3d	; 61
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x2e	; 46
	.db #0x3e	; 62
	.db #0x30	; 48	'0'
	.db #0x3e	; 62
	.db #0x2e	; 46
	.db #0x3d	; 61
	.db #0x06	; 6
	.db #0x13	; 19
	.db #0x33	; 51	'3'
	.db #0x7e	; 126
	.db #0x2e	; 46
	.db #0x15	; 21
	.db #0xca	; 202
	.db #0x81	; 129
	.db #0xc1	; 193
	.db #0x33	; 51	'3'
	.db #0x02	; 2
	.db #0x0e	; 14
	.db #0x20	; 32
	.db #0x18	; 24
	.db #0xde	; 222
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x1c	; 28
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x17	; 23
	.db #0x26	; 38
	.db #0x15	; 21
	.db #0x10	; 16
	.db #0x0a	; 10
	.db #0x55	; 85	'U'
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x57	; 87	'W'
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x03	; 3
	.db #0x17	; 23
	.db #0x50	; 80	'P'
	.db #0xab	; 171
	.db #0xe4	; 228
	.db #0x17	; 23
	.db #0x62	; 98	'b'
	.db #0xe8	; 232
	.db #0x22	; 34
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x6a	; 106	'j'
	.db #0x68	; 104	'h'
	.db #0x10	; 16
	.db #0x7b	; 123
	.db #0x33	; 51	'3'
	.db #0x68	; 104	'h'
	.db #0x11	; 17
	.db #0x03	; 3
	.db #0x5b	; 91
	.db #0x0b	; 11
	.db #0x40	; 64
	.db #0xa2	; 162
	.db #0xa0	; 160
	.db #0xc4	; 196
	.db #0x8a	; 138
	.db #0x1b	; 27
	.db #0x90	; 144
	.db #0x0e	; 14
	.db #0x90	; 144
	.db #0x08	; 8
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0xd0	; 208
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x84	; 132
	.db #0x0d	; 13
	.db #0x04	; 4
	.db #0xbb	; 187
	.db #0x0b	; 11
	.db #0x04	; 4
	.db #0xbb	; 187
	.db #0x19	; 25
	.db #0x10	; 16
	.db #0x5f	; 95
	.db #0x30	; 48	'0'
	.db #0x29	; 41
	.db #0x97	; 151
	.db #0x36	; 54	'6'
	.db #0x02	; 2
	.db #0xde	; 222
	.db #0x16	; 22
	.db #0x77	; 119	'w'
	.db #0x38	; 56	'8'
	.db #0x08	; 8
	.db #0x9e	; 158
	.db #0x28	; 40
	.db #0x6d	; 109	'm'
	.db #0x27	; 39
	.db #0x1a	; 26
	.db #0xdf	; 223
	.db #0x15	; 21
	.db #0xdb	; 219
	.db #0x22	; 34
	.db #0x9f	; 159
	.db #0x34	; 52	'4'
	.db #0x79	; 121	'y'
	.db #0x26	; 38
	.db #0x7a	; 122	'z'
	.db #0xe4	; 228
	.db #0x20	; 32
	.db #0xb1	; 177
	.db #0x04	; 4
	.db #0xce	; 206
	.db #0xad	; 173
	.db #0x10	; 16
	.db #0x4e	; 78	'N'
	.db #0x03	; 3
	.db #0x4e	; 78	'N'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x1a	; 26
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x15	; 21
	.db #0x14	; 20
	.db #0x12	; 18
	.db #0x32	; 50	'2'
	.db #0x0a	; 10
	.db #0x54	; 84	'T'
	.db #0x0e	; 14
	.db #0xe9	; 233
	.db #0x00	; 0
	.db #0x54	; 84	'T'
	.db #0x03	; 3
	.db #0x15	; 21
	.db #0x6a	; 106	'j'
	.db #0x4e	; 78	'N'
	.db #0xf9	; 249
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x62	; 98	'b'
	.db #0xe6	; 230
	.db #0x04	; 4
	.db #0xa1	; 161
	.db #0x16	; 22
	.db #0x66	; 102	'f'
	.db #0x04	; 4
	.db #0xa1	; 161
	.db #0x66	; 102	'f'
	.db #0x11	; 17
	.db #0xcf	; 207
	.db #0x03	; 3
	.db #0xbc	; 188
	.db #0x0b	; 11
	.db #0xad	; 173
	.db #0x0a	; 10
	.db #0xc2	; 194
	.db #0xfa	; 250
	.db #0x01	; 1
	.db #0x8e	; 142
	.db #0x0e	; 14
	.db #0xb9	; 185
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x96	; 150
	.db #0xce	; 206
	.db #0x01	; 1
	.db #0x96	; 150
	.db #0x82	; 130
	.db #0x2a	; 42
	.db #0xce	; 206
	.db #0x0b	; 11
	.db #0xee	; 238
	.db #0x04	; 4
	.db #0x19	; 25
	.db #0xed	; 237
	.db #0x10	; 16
	.db #0x7c	; 124
	.db #0x29	; 41
	.db #0xd8	; 216
	.db #0xad	; 173
	.db #0x3a	; 58
	.db #0x79	; 121	'y'
	.db #0x16	; 22
	.db #0x38	; 56	'8'
	.db #0xde	; 222
	.db #0x08	; 8
	.db #0x79	; 121	'y'
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0xb7	; 183
	.db #0x1a	; 26
	.db #0x7f	; 127
	.db #0x15	; 21
	.db #0x6e	; 110	'n'
	.db #0x22	; 34
	.db #0x7d	; 125
	.db #0x34	; 52	'4'
	.db #0x26	; 38
	.db #0x78	; 120	'x'
	.db #0x7a	; 122	'z'
	.db #0x29	; 41
	.db #0x06	; 6
	.db #0xc0	; 192
	.db #0xaa	; 170
	.db #0xa4	; 164
	.db #0xcc	; 204
	.db #0x87	; 135
	.db #0x8c	; 140
	.db #0x4c	; 76	'L'
	.db #0x03	; 3
	.db #0x4c	; 76	'L'
	.db #0xd2	; 210
	.db #0x92	; 146
	.db #0xeb	; 235
	.db #0x8b	; 139
	.db #0x66	; 102	'f'
	.db #0x36	; 54	'6'
	.db #0x0b	; 11
	.db #0x13	; 19
	.db #0x06	; 6
	.db #0xb6	; 182
	.db #0x12	; 18
	.db #0x07	; 7
	.db #0x31	; 49	'1'
	.db #0x53	; 83	'S'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xd3	; 211
	.db #0x3d	; 61
	.db #0x07	; 7
	.db #0x0c	; 12
	.db #0xdc	; 220
	.db #0x23	; 35
	.db #0x80	; 128
	.db #0x93	; 147
	.db #0xe4	; 228
	.db #0xe0	; 224
	.db #0xdb	; 219
	.db #0xb0	; 176
	.db #0x64	; 100	'd'
	.db #0xcf	; 207
	.db #0x26	; 38
	.db #0x64	; 100	'd'
	.db #0x11	; 17
	.db #0x7d	; 125
	.db #0x03	; 3
	.db #0x0b	; 11
	.db #0xe0	; 224
	.db #0xdb	; 219
	.db #0x50	; 80	'P'
	.db #0xcc	; 204
	.db #0xa8	; 168
	.db #0x46	; 70	'F'
	.db #0x98	; 152
	.db #0x0e	; 14
	.db #0x8c	; 140
	.db #0x80	; 128
	.db #0xde	; 222
	.db #0x41	; 65	'A'
	.db #0xd8	; 216
	.db #0xc3	; 195
	.db #0xf0	; 240
	.db #0xa0	; 160
	.db #0x35	; 53	'5'
	.db #0x14	; 20
	.db #0x5a	; 90	'Z'
	.db #0xf9	; 249
	.db #0x15	; 21
	.db #0xe7	; 231
	.db #0x06	; 6
	.db #0xb5	; 181
	.db #0x2e	; 46
	.db #0x08	; 8
	.db #0xe3	; 227
	.db #0x13	; 19
	.db #0x0c	; 12
	.db #0xcd	; 205
	.db #0x07	; 7
	.db #0x5b	; 91
	.db #0x30	; 48	'0'
	.db #0x4a	; 74	'J'
	.db #0x25	; 37
	.db #0x1e	; 30
	.db #0x17	; 23
	.db #0xde	; 222
	.db #0x26	; 38
	.db #0xb7	; 183
	.db #0x42	; 66	'B'
	.db #0x2f	; 47
	.db #0x2f	; 47
	.db #0x06	; 6
	.db #0x5a	; 90	'Z'
	.db #0x2f	; 47
	.db #0x28	; 40
	.db #0xf6	; 246
	.db #0x7b	; 123
	.db #0xd4	; 212
	.db #0x86	; 134
	.db #0x3f	; 63
	.db #0x04	; 4
	.db #0xeb	; 235
	.db #0xd6	; 214
	.db #0x01	; 1
	.db #0xc4	; 196
	.db #0xf1	; 241
	.db #0x48	; 72	'H'
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x22	; 34
	.db #0xe9	; 233
	.db #0xe8	; 232
	.db #0x23	; 35
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0x1d	; 29
	.db #0x15	; 21
	.db #0x06	; 6
	.db #0xdd	; 221
	.db #0x06	; 6
	.db #0x12	; 18
	.db #0xb1	; 177
	.db #0x0e	; 14
	.db #0x5d	; 93
	.db #0x00	; 0
	.db #0xb3	; 179
	.db #0x0f	; 15
	.db #0x16	; 22
	.db #0xdd	; 221
	.db #0xc8	; 200
	.db #0x23	; 35
	.db #0x93	; 147
	.db #0x0e	; 14
	.db #0xe2	; 226
	.db #0xeb	; 235
	.db #0x09	; 9
	.db #0x62	; 98	'b'
	.db #0x14	; 20
	.db #0x04	; 4
	.db #0xdf	; 223
	.db #0x62	; 98	'b'
	.db #0x17	; 23
	.db #0xcd	; 205
	.db #0x03	; 3
	.db #0x6d	; 109	'm'
	.db #0x0b	; 11
	.db #0x92	; 146
	.db #0x98	; 152
	.db #0x0d	; 13
	.db #0x90	; 144
	.db #0xf8	; 248
	.db #0x0e	; 14
	.db #0x68	; 104	'h'
	.db #0x8a	; 138
	.db #0xbc	; 188
	.db #0x17	; 23
	.db #0xd6	; 214
	.db #0xc1	; 193
	.db #0xeb	; 235
	.db #0xe7	; 231
	.db #0x14	; 20
	.db #0x0a	; 10
	.db #0xe7	; 231
	.db #0x15	; 21
	.db #0x9e	; 158
	.db #0x06	; 6
	.db #0xd7	; 215
	.db #0x2e	; 46
	.db #0x08	; 8
	.db #0x8f	; 143
	.db #0x13	; 19
	.db #0x0a	; 10
	.db #0x35	; 53	'5'
	.db #0x07	; 7
	.db #0x6d	; 109	'm'
	.db #0x30	; 48	'0'
	.db #0x2b	; 43
	.db #0x25	; 37
	.db #0x1e	; 30
	.db #0x17	; 23
	.db #0x7a	; 122	'z'
	.db #0x26	; 38
	.db #0x42	; 66	'B'
	.db #0xdc	; 220
	.db #0x2f	; 47
	.db #0xbd	; 189
	.db #0x06	; 6
	.db #0x6b	; 107	'k'
	.db #0x2f	; 47
	.db #0x28	; 40
	.db #0xdb	; 219
	.db #0x7b	; 123
	.db #0xd0	; 208
	.db #0xeb	; 235
	.db #0x28	; 40
	.db #0xcc	; 204
	.db #0xeb	; 235
	.db #0x3a	; 58
	.db #0xea	; 234
	.db #0x84	; 132
	.db #0xd7	; 215
	.db #0x40	; 64
	.db #0xeb	; 235
	.db #0x04	; 4
	.db #0x69	; 105	'i'
	.db #0x02	; 2
	.db #0x2b	; 43
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x67	; 103	'g'
	.db #0x02	; 2
	.db #0x26	; 38
	.db #0x67	; 103	'g'
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x02	; 2
	.db #0x27	; 39
	.db #0x62	; 98	'b'
	.db #0x64	; 100	'd'
	.db #0x09	; 9
	.db #0x24	; 36
	.db #0x0e	; 14
	.db #0x80	; 128
	.db #0xbd	; 189
	.db #0x62	; 98	'b'
	.db #0xc9	; 201
	.db #0x0d	; 13
	.db #0x0c	; 12
	.db #0x62	; 98	'b'
	.db #0x30	; 48	'0'
	.db #0x0c	; 12
	.db #0x5f	; 95
	.db #0x0c	; 12
	.db #0x1f	; 31
	.db #0x60	; 96
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x5f	; 95
	.db #0x02	; 2
	.db #0x20	; 32
	.db #0xa1	; 161
	.db #0x42	; 66	'B'
	.db #0x60	; 96
	.db #0x02	; 2
	.db #0x1d	; 29
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x5d	; 93
	.db #0x02	; 2
	.db #0x5a	; 90	'Z'
	.db #0x00	; 0
	.db #0x5b	; 91
	.db #0x02	; 2
	.db #0x6b	; 107	'k'
	.db #0x00	; 0
	.db #0xdd	; 221
	.db #0x96	; 150
	.db #0x37	; 55	'7'
	.db #0x6c	; 108	'l'
	.db #0x03	; 3
	.db #0xc0	; 192
	.db #0x1b	; 27
	.db #0x69	; 105	'i'
	.db #0x00	; 0
	.db #0x6b	; 107	'k'
	.db #0x02	; 2
	.db #0x29	; 41
	.db #0x52	; 82	'R'
	.db #0x67	; 103	'g'
	.db #0x04	; 4
	.db #0x1b	; 27
	.db #0x69	; 105	'i'
	.db #0x1b	; 27
	.db #0xb9	; 185
	.db #0x09	; 9
	.db #0x13	; 19
	.db #0x6f	; 111	'o'
	.db #0x9c	; 156
	.db #0x0d	; 13
	.db #0x72	; 114	'r'
	.db #0x04	; 4
	.db #0xf7	; 247
	.db #0xfb	; 251
	.db #0x72	; 114	'r'
	.db #0x19	; 25
	.db #0xd3	; 211
	.db #0xbf	; 191
	.db #0xb8	; 184
	.db #0xa3	; 163
	.db #0x6c	; 108	'l'
	.db #0xbd	; 189
	.db #0x03	; 3
	.db #0x3e	; 62
	.db #0x9d	; 157
	.db #0x97	; 151
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xe2	; 226
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x08	; 8
	.db #0x03	; 3
	.db #0x0b	; 11
	.db #0x82	; 130
	.db #0xcc	; 204
	.db #0x05	; 5
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xcc	; 204
	.db #0x26	; 38
	.db #0xc0	; 192
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x93	; 147
	.db #0x3e	; 62
	.db #0xeb	; 235
	.db #0x7b	; 123
	.db #0x09	; 9
	.db #0xb9	; 185
	.db #0x78	; 120	'x'
	.db #0xa3	; 163
	.db #0xf7	; 247
	.db #0xca	; 202
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x95	; 149
	.db #0x4b	; 75	'K'
	.db #0x80	; 128
	.db #0xf2	; 242
	.db #0xae	; 174
	.db #0x0d	; 13
	.db #0x03	; 3
	.db #0xc4	; 196
	.db #0x08	; 8
	.db #0xfe	; 254
	.db #0xf6	; 246
	.db #0x5f	; 95
	.db #0x5c	; 92
	.db #0x11	; 17
	.db #0x41	; 65	'A'
	.db #0x3c	; 60
	.db #0xe9	; 233
	.db #0xd8	; 216
	.db #0xc7	; 199
	.db #0xec	; 236
	.db #0x3c	; 60
	.db #0xc0	; 192
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0xd2	; 210
	.db #0x05	; 5
	.db #0x58	; 88	'X'
	.db #0x02	; 2
	.db #0x7c	; 124
	.db #0xd5	; 213
	.db #0x15	; 21
	.db #0xe6	; 230
	.db #0x07	; 7
	.db #0x90	; 144
	.db #0x05	; 5
	.db #0xe0	; 224
	.db #0x4f	; 79	'O'
	.db #0xa7	; 167
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x90	; 144
	.db #0xa6	; 166
	.db #0x0d	; 13
	.db #0xc6	; 198
	.db #0x15	; 21
	.db #0xa2	; 162
	.db #0x09	; 9
	.db #0x69	; 105	'i'
	.db #0x28	; 40
	.db #0x0f	; 15
	.db #0xb1	; 177
	.db #0x07	; 7
	.db #0x9f	; 159
	.db #0x09	; 9
	.db #0xac	; 172
	.db #0xd1	; 209
	.db #0x0c	; 12
	.db #0x0e	; 14
	.db #0x38	; 56	'8'
	.db #0x9b	; 155
	.db #0x09	; 9
	.db #0xa2	; 162
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x5c	; 92
	.db #0x2d	; 45
	.db #0x3a	; 58
	.db #0x10	; 16
	.db #0xe7	; 231
	.db #0x6e	; 110	'n'
	.db #0x09	; 9
	.db #0x03	; 3
	.db #0xd8	; 216
	.db #0x66	; 102	'f'
	.db #0x32	; 50	'2'
	.db #0xe4	; 228
	.db #0x8e	; 142
	.db #0x48	; 72	'H'
	.db #0xa9	; 169
	.db #0x48	; 72	'H'
	.db #0x39	; 57	'9'
	.db #0xe9	; 233
	.db #0x09	; 9
	.db #0x5b	; 91
	.db #0xe9	; 233
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x4d	; 77	'M'
	.db #0x51	; 81	'Q'
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0xe6	; 230
	.db #0xc0	; 192
	.db #0x94	; 148
	.db #0xd5	; 213
	.db #0xb4	; 180
	.db #0x4a	; 74	'J'
	.db #0x3f	; 63
	.db #0xec	; 236
	.db #0x48	; 72	'H'
	.db #0x45	; 69	'E'
	.db #0xe0	; 224
	.db #0xa9	; 169
	.db #0xe9	; 233
	.db #0x38	; 56	'8'
	.db #0x8e	; 142
	.db #0x11	; 17
	.db #0x62	; 98	'b'
	.db #0x29	; 41
	.db #0x36	; 54	'6'
	.db #0xdf	; 223
	.db #0x09	; 9
	.db #0x11	; 17
	.db #0x4e	; 78	'N'
	.db #0xe0	; 224
	.db #0x07	; 7
	.db #0x5f	; 95
	.db #0x07	; 7
	.db #0x69	; 105	'i'
	.db #0xdd	; 221
	.db #0x29	; 41
	.db #0x71	; 113	'q'
	.db #0x05	; 5
	.db #0x0b	; 11
	.db #0x9d	; 157
	.db #0x09	; 9
	.db #0xfc	; 252
	.db #0x9e	; 158
	.db #0x0f	; 15
	.db #0xd9	; 217
	.db #0x53	; 83	'S'
	.db #0xeb	; 235
	.db #0xdc	; 220
	.db #0x11	; 17
	.db #0x2a	; 42
	.db #0xa9	; 169
	.db #0xbc	; 188
	.db #0x33	; 51	'3'
	.db #0x29	; 41
	.db #0xd3	; 211
	.db #0x07	; 7
	.db #0x40	; 64
	.db #0xb2	; 178
	.db #0x35	; 53	'5'
	.db #0x06	; 6
	.db #0x61	; 97	'a'
	.db #0x84	; 132
	.db #0x61	; 97	'a'
	.db #0xa1	; 161
	.db #0x51	; 81	'Q'
	.db #0x01	; 1
	.db #0xe1	; 225
	.db #0xef	; 239
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x17	; 23
	.db #0xf0	; 240
	.db #0x96	; 150
	.db #0x4b	; 75	'K'
	.db #0xf0	; 240
	.db #0x98	; 152
	.db #0x88	; 136
	.db #0xe9	; 233
	.db #0xce	; 206
	.db #0x92	; 146
	.db #0x71	; 113	'q'
	.db #0xeb	; 235
	.db #0x07	; 7
	.db #0x44	; 68	'D'
	.db #0xe7	; 231
	.db #0x07	; 7
	.db #0x26	; 38
	.db #0xec	; 236
	.db #0x06	; 6
	.db #0xe6	; 230
	.db #0x8d	; 141
	.db #0x06	; 6
	.db #0x27	; 39
	.db #0xe9	; 233
	.db #0x18	; 24
	.db #0x0d	; 13
	.db #0x24	; 36
	.db #0x14	; 20
	.db #0xe4	; 228
	.db #0x9a	; 154
	.db #0x06	; 6
	.db #0xe6	; 230
	.db #0x26	; 38
	.db #0x13	; 19
	.db #0xe7	; 231
	.db #0x05	; 5
	.db #0xe2	; 226
	.db #0x34	; 52	'4'
	.db #0x12	; 18
	.db #0xe4	; 228
	.db #0x12	; 18
	.db #0x62	; 98	'b'
	.db #0x1f	; 31
	.db #0x13	; 19
	.db #0xdf	; 223
	.db #0x06	; 6
	.db #0x24	; 36
	.db #0x20	; 32
	.db #0xe2	; 226
	.db #0x06	; 6
	.db #0xe0	; 224
	.db #0x06	; 6
	.db #0x1d	; 29
	.db #0xc4	; 196
	.db #0x14	; 20
	.db #0xdd	; 221
	.db #0x06	; 6
	.db #0xdf	; 223
	.db #0x96	; 150
	.db #0x05	; 5
	.db #0xdb	; 219
	.db #0x05	; 5
	.db #0xcf	; 207
	.db #0x50	; 80	'P'
	.db #0x2b	; 43
	.db #0x1a	; 26
	.db #0x4f	; 79	'O'
	.db #0xee	; 238
	.db #0xe3	; 227
	.db #0x4f	; 79	'O'
	.db #0xee	; 238
	.db #0xbe	; 190
	.db #0x05	; 5
	.db #0x27	; 39
	.db #0x58	; 88	'X'
	.db #0xf3	; 243
	.db #0x06	; 6
	.db #0xce	; 206
	.db #0x53	; 83	'S'
	.db #0x29	; 41
	.db #0xf2	; 242
	.db #0xa7	; 167
	.db #0x06	; 6
	.db #0x27	; 39
	.db #0xee	; 238
	.db #0x58	; 88	'X'
	.db #0x27	; 39
	.db #0x0d	; 13
	.db #0x1b	; 27
	.db #0x2e	; 46
	.db #0x3e	; 62
	.db #0x29	; 41
	.db #0x2b	; 43
	.db #0xfb	; 251
	.db #0x02	; 2
	.db #0x0c	; 12
	.db #0xc0	; 192
	.db #0x04	; 4
	.db #0xbf	; 191
	.db #0x0e	; 14
	.db #0xc2	; 194
	.db #0x07	; 7
	.db #0x7a	; 122	'z'
	.db #0x04	; 4
	.db #0xf7	; 247
	.db #0x12	; 18
	.db #0x76	; 118	'v'
	.db #0x02	; 2
	.db #0xa3	; 163
	.db #0x42	; 66	'B'
	.db #0x47	; 71	'G'
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0xcb	; 203
	.db #0x18	; 24
	.db #0xe6	; 230
	.db #0x06	; 6
	.db #0xc0	; 192
	.db #0xc6	; 198
	.db #0x06	; 6
	.db #0xcc	; 204
	.db #0x0e	; 14
	.db #0x83	; 131
	.db #0x06	; 6
	.db #0x7f	; 127
	.db #0x47	; 71	'G'
	.db #0x07	; 7
	.db #0x8e	; 142
	.db #0xb7	; 183
	.db #0x01	; 1
	.db #0xda	; 218
	.db #0x2a	; 42
	.db #0x0d	; 13
	.db #0xdf	; 223
	.db #0x79	; 121	'y'
	.db #0x25	; 37
	.db #0x0d	; 13
	.db #0xed	; 237
	.db #0x25	; 37
	.db #0xa6	; 166
	.db #0x26	; 38
	.db #0xc5	; 197
	.db #0x9c	; 156
	.db #0x61	; 97	'a'
	.db #0x3e	; 62
	.db #0xe3	; 227
	.db #0xed	; 237
	.db #0x02	; 2
	.db #0x33	; 51	'3'
	.db #0xe3	; 227
	.db #0xc4	; 196
	.db #0x95	; 149
	.db #0x87	; 135
	.db #0x99	; 153
	.db #0x87	; 135
	.db #0xef	; 239
	.db #0xc5	; 197
	.db #0x0f	; 15
	.db #0x7f	; 127
	.db #0x0b	; 11
	.db #0x87	; 135
	.db #0xf4	; 244
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0x0f	; 15
	.db #0x02	; 2
	.db #0x0d	; 13
	.db #0x02	; 2
	.db #0x4e	; 78	'N'
	.db #0x12	; 18
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x15	; 21
	.db #0xeb	; 235
	.db #0x0b	; 11
	.db #0x16	; 22
	.db #0x6d	; 109	'm'
	.db #0x12	; 18
	.db #0x6e	; 110	'n'
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x6b	; 107	'k'
	.db #0x0e	; 14
	.db #0x69	; 105	'i'
	.db #0x0b	; 11
	.db #0x2b	; 43
	.db #0x6d	; 109	'm'
	.db #0x86	; 134
	.db #0xac	; 172
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x2d	; 45
	.db #0x6e	; 110	'n'
	.db #0x08	; 8
	.db #0x2b	; 43
	.db #0xaf	; 175
	.db #0x16	; 22
	.db #0x2d	; 45
	.db #0x3d	; 61
	.db #0x02	; 2
	.db #0x2e	; 46
	.db #0x2c	; 44
	.db #0x07	; 7
	.db #0x58	; 88	'X'
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x6b	; 107	'k'
	.db #0x13	; 19
	.db #0x3c	; 60
	.db #0x2a	; 42
	.db #0x69	; 105	'i'
	.db #0x08	; 8
	.db #0x23	; 35
	.db #0x04	; 4
	.db #0xe9	; 233
	.db #0x32	; 50	'2'
	.db #0x0b	; 11
	.db #0x04	; 4
	.db #0x54	; 84	'T'
	.db #0x0f	; 15
	.db #0x35	; 53	'5'
	.db #0x04	; 4
	.db #0x3a	; 58
	.db #0x12	; 18
	.db #0xed	; 237
	.db #0xf2	; 242
	.db #0xb2	; 178
	.db #0xc7	; 199
	.db #0xd7	; 215
	.db #0xe4	; 228
	.db #0x2e	; 46
	.db #0x87	; 135
	.db #0x8d	; 141
	.db #0x06	; 6
	.db #0x13	; 19
	.db #0x6d	; 109	'm'
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xd4	; 212
	.db #0x04	; 4
	.db #0x17	; 23
	.db #0x5f	; 95
	.db #0x08	; 8
	.db #0x3d	; 61
	.db #0x6d	; 109	'm'
	.db #0x15	; 21
	.db #0xbd	; 189
	.db #0x49	; 73	'I'
	.db #0x89	; 137
	.db #0x07	; 7
	.db #0x6d	; 109	'm'
	.db #0x03	; 3
	.db #0x74	; 116	't'
	.db #0x02	; 2
	.db #0x54	; 84	'T'
	.db #0x74	; 116	't'
	.db #0x7d	; 125
	.db #0x4e	; 78	'N'
	.db #0x0b	; 11
	.db #0x0e	; 14
	.db #0x92	; 146
	.db #0x0b	; 11
	.db #0x0d	; 13
	.db #0x0b	; 11
	.db #0x12	; 18
	.db #0x0b	; 11
	.db #0x60	; 96
	.db #0x16	; 22
	.db #0x6e	; 110	'n'
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x7c	; 124
	.db #0x01	; 1
	.db #0x1c	; 28
	.db #0x7c	; 124
	.db #0x1d	; 29
	.db #0x7c	; 124
	.db #0x1e	; 30
	.db #0x7c	; 124
	.db #0x18	; 24
	.db #0xa5	; 165
	.db #0x5e	; 94
	.db #0x5c	; 92
	.db #0xa9	; 169
	.db #0x56	; 86	'V'
	.db #0xfd	; 253
	.db #0x07	; 7
	.db #0xdb	; 219
	.db #0x01	; 1
	.db #0xe7	; 231
	.db #0x17	; 23
	.db #0x97	; 151
	.db #0x02	; 2
	.db #0x1f	; 31
	.db #0x02	; 2
	.db #0x8b	; 139
	.db #0x51	; 81	'Q'
	.db #0x33	; 51	'3'
	.db #0x3d	; 61
	.db #0x16	; 22
	.db #0x88	; 136
	.db #0x21	; 33
	.db #0x31	; 49	'1'
	.db #0x3d	; 61
	.db #0x1a	; 26
	.db #0x30	; 48	'0'
	.db #0xdd	; 221
	.db #0xa8	; 168
	.db #0x92	; 146
	.db #0x83	; 131
	.db #0x0a	; 10
	.db #0xde	; 222
	.db #0x10	; 16
	.db #0x40	; 64
	.db #0xc3	; 195
	.db #0x63	; 99	'c'
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xbb	; 187
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x74	; 116	't'
	.db #0x07	; 7
	.db #0x44	; 68	'D'
	.db #0xc1	; 193
	.db #0x22	; 34
	.db #0x81	; 129
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0xbb	; 187
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x74	; 116	't'
	.db #0x07	; 7
	.db #0x96	; 150
	.db #0x47	; 71	'G'
	.db #0xb1	; 177
	.db #0xf8	; 248
	.db #0x4b	; 75	'K'
	.db #0x0a	; 10
	.db #0x30	; 48	'0'
	.db #0xeb	; 235
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x2c	; 44
	.db #0x7c	; 124
	.db #0x19	; 25
	.db #0x20	; 32
	.db #0x7c	; 124
	.db #0x1a	; 26
	.db #0xbd	; 189
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0xfc	; 252
	.db #0xdb	; 219
	.db #0x95	; 149
	.db #0x07	; 7
	.db #0xfe	; 254
	.db #0x29	; 41
	.db #0x3c	; 60
	.db #0x7c	; 124
	.db #0x1b	; 27
	.db #0x00	; 0
	.db #0xc9	; 201
	.db #0x7e	; 126
	.db #0xb1	; 177
	.db #0x7b	; 123
	.db #0x0a	; 10
	.db #0xda	; 218
	.db #0x1e	; 30
	.db #0xb9	; 185
	.db #0x61	; 97	'a'
	.db #0xc0	; 192
	.db #0xa7	; 167
	.db #0x7e	; 126
	.db #0x04	; 4
	.db #0xc0	; 192
	.db #0xa7	; 167
	.db #0xf8	; 248
	.db #0x84	; 132
	.db #0x0c	; 12
	.db #0x31	; 49	'1'
	.db #0xf5	; 245
	.db #0xd0	; 208
	.db #0xfe	; 254
	.db #0x31	; 49	'1'
	.db #0x33	; 51	'3'
	.db #0xd4	; 212
	.db #0x75	; 117	'u'
	.db #0xea	; 234
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x18	; 24
	.db #0xf3	; 243
	.db #0x04	; 4
	.db #0x1f	; 31
	.db #0x6c	; 108	'l'
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x34	; 52	'4'
	.db #0x00	; 0
	.db #0x39	; 57	'9'
	.db #0x74	; 116	't'
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x0b	; 11
	.db #0xce	; 206
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0x73	; 115	's'
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x0d	; 13
	.db #0x91	; 145
	.db #0x04	; 4
	.db #0x12	; 18
	.db #0x03	; 3
	.db #0xd5	; 213
	.db #0x01	; 1
	.db #0xef	; 239
	.db #0x68	; 104	'h'
	.db #0xe0	; 224
	.db #0xbf	; 191
	.db #0x47	; 71	'G'
	.db #0x12	; 18
	.db #0x04	; 4
	.db #0x37	; 55	'7'
	.db #0x34	; 52	'4'
	.db #0x01	; 1
	.db #0x30	; 48	'0'
	.db #0x01	; 1
	.db #0x49	; 73	'I'
	.db #0x2b	; 43
	.db #0x01	; 1
	.db #0x28	; 40
	.db #0x01	; 1
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x1c	; 28
	.db #0x01	; 1
	.db #0x18	; 24
	.db #0x92	; 146
	.db #0x01	; 1
	.db #0x13	; 19
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x66	; 102	'f'
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x66	; 102	'f'
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x66	; 102	'f'
	.db #0x15	; 21
	.db #0x1b	; 27
	.db #0x66	; 102	'f'
	.db #0x21	; 33
	.db #0x27	; 39
	.db #0x65	; 101	'e'
	.db #0x2d	; 45
	.db #0x33	; 51	'3'
	.db #0x39	; 57	'9'
	.db #0x6d	; 109	'm'
	.db #0x01	; 1
	.db #0x9a	; 154
	.db #0x66	; 102	'f'
	.db #0x1e	; 30
	.db #0x59	; 89	'Y'
	.db #0x8e	; 142
	.db #0x0e	; 14
	.db #0xf5	; 245
	.db #0x8e	; 142
	.db #0x98	; 152
	.db #0x3c	; 60
	.db #0xcf	; 207
	.db #0x4c	; 76	'L'
	.db #0xd0	; 208
	.db #0x39	; 57	'9'
	.db #0x3c	; 60
	.db #0x8c	; 140
	.db #0x1f	; 31
	.db #0xd9	; 217
	.db #0x9a	; 154
	.db #0xc7	; 199
	.db #0x3c	; 60
	.db #0xc6	; 198
	.db #0xd6	; 214
	.db #0xdd	; 221
	.db #0x08	; 8
	.db #0x17	; 23
	.db #0x37	; 55	'7'
	.db #0xd1	; 209
	.db #0x66	; 102	'f'
	.db #0x1b	; 27
	.db #0x0c	; 12
	.db #0xe9	; 233
	.db #0x1d	; 29
	.db #0xdb	; 219
	.db #0x08	; 8
	.db #0xf7	; 247
	.db #0x3e	; 62
	.db #0x7c	; 124
	.db #0x0b	; 11
	.db #0x1a	; 26
	.db #0x0c	; 12
	.db #0xd6	; 214
	.db #0x0a	; 10
	.db #0xfe	; 254
	.db #0x40	; 64
	.db #0xe7	; 231
	.db #0xac	; 172
	.db #0x04	; 4
	.db #0x45	; 69	'E'
	.db #0x04	; 4
	.db #0x35	; 53	'5'
	.db #0x32	; 50	'2'
	.db #0x01	; 1
	.db #0x2e	; 46
	.db #0x92	; 146
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0x01	; 1
	.db #0x26	; 38
	.db #0x01	; 1
	.db #0x49	; 73	'I'
	.db #0x22	; 34
	.db #0x01	; 1
	.db #0x1d	; 29
	.db #0x01	; 1
	.db #0x1a	; 26
	.db #0x24	; 36
	.db #0x01	; 1
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x11	; 17
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x99	; 153
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x03	; 3
	.db #0x99	; 153
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x99	; 153
	.db #0x15	; 21
	.db #0x1b	; 27
	.db #0x99	; 153
	.db #0x21	; 33
	.db #0x27	; 39
	.db #0x99	; 153
	.db #0x2d	; 45
	.db #0x33	; 51	'3'
	.db #0x5b	; 91
	.db #0x39	; 57	'9'
	.db #0x01	; 1
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0x1e	; 30
	.db #0x94	; 148
	.db #0xf4	; 244
	.db #0x7d	; 125
	.db #0x0e	; 14
	.db #0xf4	; 244
	.db #0x43	; 67	'C'
	.db #0x3c	; 60
	.db #0xca	; 202
	.db #0x10	; 16
	.db #0x6c	; 108	'l'
	.db #0x96	; 150
	.db #0x92	; 146
	.db #0x1e	; 30
	.db #0x8a	; 138
	.db #0x01	; 1
	.db #0x92	; 146
	.db #0xd6	; 214
	.db #0xbc	; 188
	.db #0xd1	; 209
	.db #0x0e	; 14
	.db #0x1b	; 27
	.db #0x6e	; 110	'n'
	.db #0x0a	; 10
	.db #0x9d	; 157
	.db #0x1d	; 29
	.db #0x08	; 8
	.db #0xbf	; 191
	.db #0x77	; 119	'w'
	.db #0x3e	; 62
	.db #0x0b	; 11
	.db #0xcd	; 205
	.db #0x1a	; 26
	.db #0x0a	; 10
	.db #0x6f	; 111	'o'
	.db #0x0a	; 10
	.db #0xee	; 238
	.db #0x40	; 64
	.db #0xb6	; 182
	.db #0xa4	; 164
	.db #0x16	; 22
	.db #0x8c	; 140
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0xcf	; 207
	.db #0x8f	; 143
	.db #0x56	; 86	'V'
	.db #0x07	; 7
	.db #0xc6	; 198
	.db #0x01	; 1
	.db #0x18	; 24
	.db #0xe5	; 229
	.db #0xfb	; 251
	.db #0x08	; 8
	.db #0x3c	; 60
	.db #0x4c	; 76	'L'
	.db #0xca	; 202
	.db #0xb0	; 176
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x4c	; 76	'L'
	.db #0x02	; 2
	.db #0xc4	; 196
	.db #0x04	; 4
	.db #0x53	; 83	'S'
	.db #0x09	; 9
	.db #0x53	; 83	'S'
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x0b	; 11
	.db #0x03	; 3
	.db #0xcc	; 204
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x99	; 153
	.db #0x23	; 35
	.db #0x0b	; 11
	.db #0x04	; 4
	.db #0x4a	; 74	'J'
	.db #0x15	; 21
	.db #0x18	; 24
	.db #0x03	; 3
	.db #0x24	; 36
	.db #0x0b	; 11
	.db #0xb9	; 185
	.db #0x03	; 3
	.db #0x18	; 24
	.db #0x03	; 3
	.db #0x50	; 80	'P'
	.db #0x18	; 24
	.db #0x23	; 35
	.db #0xf6	; 246
	.db #0x6c	; 108	'l'
	.db #0x0e	; 14
	.db #0x2f	; 47
	.db #0x05	; 5
	.db #0x0e	; 14
	.db #0x4c	; 76	'L'
	.db #0x0f	; 15
	.db #0x4c	; 76	'L'
	.db #0x0d	; 13
	.db #0x03	; 3
	.db #0xc4	; 196
	.db #0x16	; 22
	.db #0x0e	; 14
	.db #0x53	; 83	'S'
	.db #0xc3	; 195
	.db #0x0a	; 10
	.db #0x61	; 97	'a'
	.db #0x5b	; 91
	.db #0x0c	; 12
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0x61	; 97	'a'
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0xab	; 171
	.db #0x31	; 49	'1'
	.db #0xc4	; 196
	.db #0x68	; 104	'h'
	.db #0x04	; 4
	.db #0xe0	; 224
	.db #0xe1	; 225
	.db #0x0f	; 15
	.db #0x3c	; 60
	.db #0x70	; 112	'p'
	.db #0x03	; 3
	.db #0x1e	; 30
	.db #0xdb	; 219
	.db #0x04	; 4
	.db #0x47	; 71	'G'
	.db #0x02	; 2
	.db #0x8d	; 141
	.db #0x91	; 145
	.db #0x04	; 4
	.db #0x0b	; 11
	.db #0xe0	; 224
	.db #0xe8	; 232
	.db #0x04	; 4
	.db #0xea	; 234
	.db #0xe8	; 232
	.db #0x16	; 22
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x6b	; 107	'k'
	.db #0x51	; 81	'Q'
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0xef	; 239
	.db #0xd0	; 208
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x12	; 18
	.db #0x6b	; 107	'k'
	.db #0x22	; 34
	.db #0x71	; 113	'q'
	.db #0x3c	; 60
	.db #0xf5	; 245
	.db #0xe4	; 228
	.db #0xf4	; 244
	.db #0x00	; 0
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0x0e	; 14
	.db #0xfd	; 253
	.db #0x0c	; 12
	.db #0xfd	; 253
	.db #0x06	; 6
	.db #0x3f	; 63
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf0	; 240
_g_SpritePatternShip:
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0xdb	; 219
	.db #0x7e	; 126
	.db #0x24	; 36
_g_SpritePatternEBullet:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
_g_SpritePatternExplosion:
	.db #0x24	; 36
	.db #0x5a	; 90	'Z'
	.db #0x81	; 129
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x5a	; 90	'Z'
	.db #0x24	; 36
_g_SpritePatternCrab:
	.db #0x3c	; 60
	.db #0x5a	; 90	'Z'
	.db #0xdb	; 219
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x81	; 129
_g_SpritePatternCyclops:
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0xb1	; 177
	.db #0xa1	; 161
	.db #0x81	; 129
	.db #0x85	; 133
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
_g_SpritePatternBat:
	.db #0x24	; 36
	.db #0x7e	; 126
	.db #0xdb	; 219
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x00	; 0
_g_SpritePatternSpike:
	.db #0x24	; 36
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0xdb	; 219
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x42	; 66	'B'
_g_SpritePatternScorpion:
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0xfe	; 254
	.db #0xee	; 238
	.db #0x7c	; 124
	.db #0x54	; 84	'T'
_g_SpritePatternUFO:
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
_g_SpritePatternSpider:
	.db #0x24	; 36
	.db #0x7e	; 126
	.db #0xdb	; 219
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x5a	; 90	'Z'
	.db #0x81	; 129
	.db #0x00	; 0
_g_SpritePatternInvader:
	.db #0x24	; 36
	.db #0x7e	; 126
	.db #0xdb	; 219
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xdb	; 219
	.db #0x7e	; 126
	.db #0x24	; 36
_g_SpritePatternInvader2:
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0xdf	; 223
	.db #0xf1	; 241
	.db #0xf5	; 245
	.db #0xe1	; 225
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
_g_SpritePatternCrab2:
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0xdb	; 219
	.db #0xbd	; 189
	.db #0xbd	; 189
	.db #0xdb	; 219
	.db #0x7e	; 126
	.db #0x24	; 36
_g_SpritePatternXInvader:
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0xdb	; 219
	.db #0xff	; 255
	.db #0x24	; 36
	.db #0x5a	; 90	'Z'
	.db #0x81	; 129
_g_SpritePatternClassicInvader:
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0xdb	; 219
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x81	; 129
_g_SpritePatternStar:
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x5a	; 90	'Z'
	.db #0x5a	; 90	'Z'
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0x24	; 36
_g_SpritePatternPowerUp:
	.db #0x78	; 120	'x'
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xd5	; 213
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
_g_SpritePatternWallWalkPowerUp:
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0xfe	; 254
	.db #0x8a	; 138
	.db #0x8a	; 138
	.db #0x8c	; 140
	.db #0x70	; 112	'p'
_g_SpritePatternGravityPowerUp:
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x7c	; 124
_g_IntroMusic:
	.dw #0x023b
	.dw #0x01e0
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x023b
	.dw #0x01e0
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x023b
	.dw #0x01e0
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x02cf
	.dw #0x023b
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x1e	; 30
	.dw #0x047a
	.dw #0x03cf
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x047a
	.dw #0x03cf
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x047a
	.dw #0x03cf
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x05a0
	.dw #0x047a
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x1e	; 30
	.dw #0x047a
	.dw #0x03cf
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x28	; 40
	.dw #0x0000
	.dw #0x0000
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0a	; 10
	.dw #0x0281
	.dw #0x021b
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x0281
	.dw #0x021b
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x0281
	.dw #0x021b
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x02fa
	.dw #0x0281
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0f	; 15
	.dw #0x04fa
	.dw #0x043e
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x04fa
	.dw #0x043e
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x04fa
	.dw #0x043e
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x05f4
	.dw #0x04fa
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0f	; 15
	.dw #0x0000
	.dw #0x0000
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0a	; 10
	.dw #0x02cf
	.dw #0x023b
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x14	; 20
	.dw #0x0281
	.dw #0x021b
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x14	; 20
	.dw #0x023b
	.dw #0x01e0
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x14	; 20
	.dw #0x02cf
	.dw #0x023b
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x14	; 20
	.dw #0x0281
	.dw #0x021b
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x14	; 20
	.dw #0x02fa
	.dw #0x0281
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x1e	; 30
	.dw #0x05a0
	.dw #0x047a
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x14	; 20
	.dw #0x04fa
	.dw #0x043e
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x14	; 20
	.dw #0x047a
	.dw #0x03cf
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x14	; 20
	.dw #0x05a0
	.dw #0x047a
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x14	; 20
	.dw #0x04fa
	.dw #0x043e
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x14	; 20
	.dw #0x05f4
	.dw #0x04fa
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x1e	; 30
	.dw #0x0000
	.dw #0x0000
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0a	; 10
	.dw #0x023b
	.dw #0x01e0
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x023b
	.dw #0x01e0
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x023b
	.dw #0x01e0
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x02cf
	.dw #0x023b
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x14	; 20
	.dw #0x0281
	.dw #0x021b
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x0281
	.dw #0x021b
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x0281
	.dw #0x021b
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x02fa
	.dw #0x0281
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x14	; 20
	.dw #0x047a
	.dw #0x03cf
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x047a
	.dw #0x03cf
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x047a
	.dw #0x03cf
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x05a0
	.dw #0x047a
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x14	; 20
	.dw #0x04fa
	.dw #0x043e
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x04fa
	.dw #0x043e
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x04fa
	.dw #0x043e
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x05f4
	.dw #0x04fa
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x14	; 20
	.dw #0x047a
	.dw #0x03cf
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x28	; 40
	.dw #0x0000
	.dw #0x0000
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0a	; 10
	.dw #0x0281
	.dw #0x021b
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x0281
	.dw #0x021b
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x0281
	.dw #0x021b
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x02fa
	.dw #0x0281
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x28	; 40
	.dw #0x04fa
	.dw #0x043e
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x04fa
	.dw #0x043e
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x04fa
	.dw #0x043e
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.dw #0x05f4
	.dw #0x04fa
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x28	; 40
	.dw #0x0000
	.dw #0x0000
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x14	; 20
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_StarfieldEntranceFX:
	.dw #0x06ae
	.db #0x0f	; 15
	.db #0x0f	; 15
	.dw #0x04fa
	.db #0x0f	; 15
	.db #0x0c	; 12
	.dw #0x0405
	.db #0x0f	; 15
	.db #0x0a	; 10
	.dw #0x0357
	.db #0x0f	; 15
	.db #0x0a	; 10
	.dw #0x0281
	.db #0x0f	; 15
	.db #0x0a	; 10
	.dw #0x01fd
	.db #0x0f	; 15
	.db #0x08	; 8
	.dw #0x01ac
	.db #0x0e	; 14
	.db #0x06	; 6
	.dw #0x0140
	.db #0x0e	; 14
	.db #0x06	; 6
	.dw #0x00fe
	.db #0x0e	; 14
	.db #0x06	; 6
	.dw #0x00d6
	.db #0x0e	; 14
	.db #0x05	; 5
	.dw #0x00a0
	.db #0x0e	; 14
	.db #0x05	; 5
	.dw #0x007f
	.db #0x0e	; 14
	.db #0x05	; 5
	.dw #0x006b
	.db #0x0d	; 13
	.db #0x03	; 3
	.dw #0x0047
	.db #0x0d	; 13
	.db #0x03	; 3
	.dw #0x0032
	.db #0x0d	; 13
	.db #0x03	; 3
	.dw #0x006b
	.db #0x0c	; 12
	.db #0x02	; 2
	.dw #0x0047
	.db #0x0c	; 12
	.db #0x02	; 2
	.dw #0x0032
	.db #0x0c	; 12
	.db #0x02	; 2
	.dw #0x008f
	.db #0x0c	; 12
	.db #0x06	; 6
	.dw #0x00a0
	.db #0x0c	; 12
	.db #0x08	; 8
	.dw #0x00b4
	.db #0x0c	; 12
	.db #0x08	; 8
	.dw #0x00d6
	.db #0x0c	; 12
	.db #0x0a	; 10
	.dw #0x0000
	.db #0x0f	; 15
	.db #0x14	; 20
	.dw #0x0000
	.db #0x00	; 0
	.db #0x00	; 0
_g_MenuMain:
	.dw __str_0
	.db #0x00	; 0
	.dw _MenuAction_GameStart
	.dw #0x0001
	.dw __str_1
	.db #0x00	; 0
	.dw _MenuAction_About
	.dw #0x0000
	.dw __str_2
	.db #0x00	; 0
	.dw _MenuAction_GameStart
	.dw #0x0000
_g_Menus:
	.dw __str_3
	.dw _g_MenuMain
	.db #0x03	; 3
	.dw #0x0000
__str_0:
	.ascii "Start Game"
	.db 0x00
__str_1:
	.ascii "About"
	.db 0x00
__str_2:
	.ascii "Exit"
	.db 0x00
__str_3:
	.ascii "Micro Invasion"
	.db 0x00
;./mi.c:24: static void UpdatePowerUpSound(void)
;	---------------------------------
; Function UpdatePowerUpSound
; ---------------------------------
_UpdatePowerUpSound:
;./mi.c:26: if (!g_PowerUpSoundActive)
	ld	a, (_g_PowerUpSoundActive+0)
	or	a, a
;./mi.c:27: return;
	ret	Z
;./mi.c:29: if (g_PowerUpSoundTimer > 0)
	ld	a, (_g_PowerUpSoundTimer+0)
	or	a, a
	jr	Z, 00104$
;./mi.c:31: g_PowerUpSoundTimer--;
	ld	hl, #_g_PowerUpSoundTimer
	dec	(hl)
;./mi.c:32: return;
	ret
00104$:
;./mi.c:36: PSG_EnableTone(1, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_PSG_EnableTone
;./mi.c:37: PSG_EnableEnvelope(1, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_PSG_EnableEnvelope
;./mi.c:38: PSG_SetVolume(1, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_PSG_SetVolume
;./mi.c:39: PSG_Apply();
	call	_PSG_Apply
;./mi.c:41: g_PowerUpSoundActive = false;
	ld	hl, #_g_PowerUpSoundActive
	ld	(hl), #0x00
;./mi.c:42: }
	ret
;./mi.c:48: void StartStarfieldEntranceFX(void)
;	---------------------------------
; Function StartStarfieldEntranceFX
; ---------------------------------
_StartStarfieldEntranceFX::
;./mi.c:50: s_StarfieldFXIndex = 0;
	ld	hl, #_s_StarfieldFXIndex
	ld	(hl), #0x00
;./mi.c:51: s_StarfieldFXTimer = g_StarfieldEntranceFX[0].duration;
	ld	hl, #_g_StarfieldEntranceFX + 3
	ld	a, (hl)
	ld	(_s_StarfieldFXTimer+0), a
;./mi.c:52: s_StarfieldFXActive = true;
	ld	hl, #_s_StarfieldFXActive
;./mi.c:53: PSG_EnableTone(1, 1);
;	spillPairReg hl
;	spillPairReg hl
	ld	(hl), #0x01
	ld	a, (hl)
	ld	l,a
	call	_PSG_EnableTone
;./mi.c:54: PSG_SetTone(1, g_StarfieldEntranceFX[0].tone);
	ld	de, (#_g_StarfieldEntranceFX + 0)
	ld	a, #0x01
	call	_PSG_SetTone
;./mi.c:55: PSG_SetVolume(1, g_StarfieldEntranceFX[0].volume);
	ld	hl, #_g_StarfieldEntranceFX + 2
	ld	l, (hl)
;	spillPairReg hl
	ld	a, #0x01
	call	_PSG_SetVolume
;./mi.c:56: PSG_Apply();
;./mi.c:57: }
	jp	_PSG_Apply
;./mi.c:59: void UpdateStarfieldEntranceFX(void)
;	---------------------------------
; Function UpdateStarfieldEntranceFX
; ---------------------------------
_UpdateStarfieldEntranceFX::
;./mi.c:61: if (!s_StarfieldFXActive) return;
	ld	a, (_s_StarfieldFXActive+0)
	or	a, a
	ret	Z
;./mi.c:62: if (s_StarfieldFXTimer > 0)
	ld	a, (_s_StarfieldFXTimer+0)
	or	a, a
	jr	Z, 00104$
;./mi.c:64: s_StarfieldFXTimer--;
	ld	hl, #_s_StarfieldFXTimer
	dec	(hl)
;./mi.c:65: return;
	ret
00104$:
;./mi.c:67: s_StarfieldFXIndex++;
	ld	hl, #_s_StarfieldFXIndex
	inc	(hl)
;./mi.c:68: if (g_StarfieldEntranceFX[s_StarfieldFXIndex].tone == NOTE_REST &&
	ld	a, (_s_StarfieldFXIndex+0)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_g_StarfieldEntranceFX
	add	hl, de
	ld	e, l
	ld	d, h
	ld	c, (hl)
	inc	hl
	ld	a, (hl)
;./mi.c:69: g_StarfieldEntranceFX[s_StarfieldFXIndex].duration == 0)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
;./mi.c:68: if (g_StarfieldEntranceFX[s_StarfieldFXIndex].tone == NOTE_REST &&
;./mi.c:69: g_StarfieldEntranceFX[s_StarfieldFXIndex].duration == 0)
	or	a,c
	jr	NZ, 00106$
	or	a,l
	jr	NZ, 00106$
;./mi.c:71: s_StarfieldFXActive = false;
	ld	hl, #_s_StarfieldFXActive
;./mi.c:72: PSG_SetVolume(1, 0);
	ld	(hl), #0x00
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_PSG_SetVolume
;./mi.c:73: PSG_Apply();
;./mi.c:74: return;
	jp	_PSG_Apply
00106$:
;./mi.c:76: s_StarfieldFXTimer = g_StarfieldEntranceFX[s_StarfieldFXIndex].duration;
	ld	a, l
	ld	(#_s_StarfieldFXTimer), a
;./mi.c:77: PSG_SetTone(1, g_StarfieldEntranceFX[s_StarfieldFXIndex].tone);
	ex	de,hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, #0x01
	call	_PSG_SetTone
;./mi.c:78: PSG_SetVolume(1, g_StarfieldEntranceFX[s_StarfieldFXIndex].volume);
	ld	a, (_s_StarfieldFXIndex+0)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	ld	de, #_g_StarfieldEntranceFX
	add	hl, de
	inc	hl
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
	ld	a, #0x01
	call	_PSG_SetVolume
;./mi.c:79: PSG_Apply();
;./mi.c:80: }
	jp	_PSG_Apply
;./mi.c:85: static void DrawBackground(void)
;	---------------------------------
; Function DrawBackground
; ---------------------------------
_DrawBackground:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;./mi.c:88: for (u8 row = 1; row < SKY_ROWS; row++)
	ld	c, #0x01
00114$:
	ld	a, c
	sub	a, #0x15
	jr	NC, 00105$
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x00
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), c
;./mi.c:91: for (u8 col = 0; col < SCREEN1_COLS; col++)
	ld	-1 (ix), #0x00
00111$:
	ld	a, -1 (ix)
	sub	a, #0x20
	jr	NC, 00115$
;./mi.c:93: if ((Math_GetRandom16() % STAR_DENSITY) == 0)
	push	bc
	call	_Math_GetRandom16
	ld	de, #0x0026
	call	__moduint
	pop	bc
	ld	a, d
	or	a, e
	jr	NZ, 00102$
;./mi.c:94: Print_DrawChar(CHAR_STAR);
	push	bc
	ld	a, #0xfa
	call	_Print_DrawChar
	pop	bc
	jp	00112$
00102$:
;./mi.c:96: Print_DrawChar(CHAR_SPACE);
	push	bc
	ld	a, #0x20
	call	_Print_DrawChar
	pop	bc
00112$:
;./mi.c:91: for (u8 col = 0; col < SCREEN1_COLS; col++)
	inc	-1 (ix)
	jp	00111$
00115$:
;./mi.c:88: for (u8 row = 1; row < SKY_ROWS; row++)
	inc	c
	jp	00114$
00105$:
;./mi.c:100: for (u8 row = SKY_ROWS; row < (SKY_ROWS + GROUND_ROWS); row++)
	ld	-1 (ix), #0x15
00120$:
	ld	a, -1 (ix)
	sub	a, #0x16
	jr	NC, 00107$
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x00
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	a, -1 (ix)
	ld	(hl), a
;./mi.c:103: for (u8 col = 0; col < SCREEN1_COLS; col++)
	ld	c, #0x00
00117$:
	ld	a, c
	sub	a, #0x20
	jr	NC, 00121$
;./mi.c:104: Print_DrawChar(CHAR_GROUND);
	push	bc
	ld	a, #0xdc
	call	_Print_DrawChar
	pop	bc
;./mi.c:103: for (u8 col = 0; col < SCREEN1_COLS; col++)
	inc	c
	jp	00117$
00121$:
;./mi.c:100: for (u8 row = SKY_ROWS; row < (SKY_ROWS + GROUND_ROWS); row++)
	inc	-1 (ix)
	jp	00120$
00107$:
;./mi.c:107: Print_DrawLineH(0, 1, 32);// top line
	ld	a, #0x20
	push	af
	inc	sp
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_Print_DrawLineH
;./mi.c:108: }
	inc	sp
	pop	ix
	ret
;./mi.c:114: const c8* MenuAction_GameStart(u8 op, i8 value)
;	---------------------------------
; Function MenuAction_GameStart
; ---------------------------------
_MenuAction_GameStart::
;./mi.c:116: if (op == MENU_ACTION_SET)
	or	a, a
	jr	NZ, 00105$
;./mi.c:118: if (value == 1)
	dec	l
	jr	NZ, 00102$
;./mi.c:119: g_StartGame = true;
	ld	hl, #_g_StartGame
	ld	(hl), #0x01
	jp	00105$
00102$:
;./mi.c:121: g_Exit = true;
	ld	hl, #_g_Exit
	ld	(hl), #0x01
00105$:
;./mi.c:123: return NULL;
	ld	de, #0x0000
;./mi.c:124: }
	ret
;./mi.c:126: const c8* MenuAction_About(u8 op, i8 value)
;	---------------------------------
; Function MenuAction_About
; ---------------------------------
_MenuAction_About::
;./mi.c:130: if (op == MENU_ACTION_SET)
	or	a, a
	jp	NZ, 00106$
;./mi.c:132: ClearScreen();
	call	_ClearScreen
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x02
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x05
;./mi.c:134: Print_DrawText("Micro Invasion");
	ld	hl, #___str_4
	call	_Print_DrawText
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x02
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x07
;./mi.c:136: Print_DrawText(VERSION_NUMBER);
	ld	hl, #___str_5
	call	_Print_DrawText
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x02
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x09
;./mi.c:138: Print_DrawText("Developed by:");
	ld	hl, #___str_6
	call	_Print_DrawText
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x02
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x0b
;./mi.c:140: Print_DrawText("Reinaldo de Sales Flamino");
	ld	hl, #___str_7
	call	_Print_DrawText
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x02
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x0d
;./mi.c:142: Print_DrawText("Intro Music by:");
	ld	hl, #___str_8
	call	_Print_DrawText
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x02
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x0f
;./mi.c:144: Print_DrawText("Ludwig van Beethoven");
	ld	hl, #___str_9
	call	_Print_DrawText
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x02
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x16
;./mi.c:146: Print_DrawText("Press SPACE key to return...");
	ld	hl, #___str_10
	call	_Print_DrawText
;./mi.c:147: while (!Keyboard_IsKeyPressed(KEY_SPACE) && !Joystick_IsButtonPressed(JOY_PORT_1, JOY_INPUT_TRIGGER_A))
00102$:
	ld	a, #0x08
	call	_Keyboard_IsKeyPressed
	or	a, a
	jr	NZ, 00104$
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/input.h:192: u8 in = Joystick_Read(port);
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
	ld	a, l
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/input.h:193: return ((in & trigger) == 0);
	and	a,#0x10
	jr	Z, 00104$
;./mi.c:147: while (!Keyboard_IsKeyPressed(KEY_SPACE) && !Joystick_IsButtonPressed(JOY_PORT_1, JOY_INPUT_TRIGGER_A))
;./mi.c:150: AKG_Decode();     // Process one frame of music playback.
	call	_AKG_Decode
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/system.h:140: inline void Halt() { __asm__("halt"); }
	halt
;./mi.c:152: Halt();
	jp	00102$
00104$:
;./mi.c:154: ClearScreen();
	call	_ClearScreen
;./mi.c:155: Menu_DrawPage(0);
	xor	a, a
	call	_Menu_DrawPage
00106$:
;./mi.c:158: return NULL;
	ld	de, #0x0000
;./mi.c:159: }
	ret
___str_4:
	.ascii "Micro Invasion"
	.db 0x00
___str_5:
	.ascii "Version 0.0.1"
	.db 0x00
___str_6:
	.ascii "Developed by:"
	.db 0x00
___str_7:
	.ascii "Reinaldo de Sales Flamino"
	.db 0x00
___str_8:
	.ascii "Intro Music by:"
	.db 0x00
___str_9:
	.ascii "Ludwig van Beethoven"
	.db 0x00
___str_10:
	.ascii "Press SPACE key to return..."
	.db 0x00
;./mi.c:161: u8 Menu_Input_CB(void)
;	---------------------------------
; Function Menu_Input_CB
; ---------------------------------
_Menu_Input_CB::
;./mi.c:163: u8 new = 0;
	ld	c, #0x00
;./mi.c:165: if (Keyboard_IsKeyPressed(KEY_UP))    new |= MENU_INPUT_UP;
	push	bc
	ld	a, #0x58
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00102$
	ld	c, #0x01
00102$:
;./mi.c:166: if (Keyboard_IsKeyPressed(KEY_DOWN))  new |= MENU_INPUT_DOWN;
	push	bc
	ld	a, #0x68
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00104$
	set	1, c
00104$:
;./mi.c:167: if (Keyboard_IsKeyPressed(KEY_LEFT))  new |= MENU_INPUT_LEFT;
	push	bc
	ld	a, #0x48
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00106$
	set	2, c
00106$:
;./mi.c:168: if (Keyboard_IsKeyPressed(KEY_RIGHT)) new |= MENU_INPUT_RIGHT;
	push	bc
	ld	a, #0x78
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00108$
	set	3, c
00108$:
;./mi.c:169: if (Keyboard_IsKeyPressed(KEY_SPACE)) new |= MENU_INPUT_TRIGGER;
	push	bc
	ld	a, #0x08
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00110$
	set	4, c
00110$:
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/input.h:185: u8 in = ~Joystick_Read(port);
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
	ld	a, l
	cpl
;./mi.c:172: u8 joyDir = Joystick_GetDirection(JOY_PORT_1);
	and	a, #0x0f
	ld	b, a
;./mi.c:173: if (joyDir & JOY_INPUT_DIR_UP)           new |= MENU_INPUT_UP;
	rrca
	jr	NC, 00112$
	set	0, c
00112$:
;./mi.c:174: if (joyDir & JOY_INPUT_DIR_DOWN)         new |= MENU_INPUT_DOWN;
	bit	1, b
	jr	Z, 00114$
	set	1, c
00114$:
;./mi.c:175: if (joyDir & JOY_INPUT_DIR_LEFT)         new |= MENU_INPUT_LEFT;
	bit	2, b
	jr	Z, 00116$
	set	2, c
00116$:
;./mi.c:176: if (joyDir & JOY_INPUT_DIR_RIGHT)        new |= MENU_INPUT_RIGHT;
	bit	3, b
	jr	Z, 00118$
	set	3, c
00118$:
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/input.h:192: u8 in = Joystick_Read(port);
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
	ld	a, l
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/input.h:193: return ((in & trigger) == 0);
	and	a,#0x10
	jr	NZ, 00120$
;./mi.c:177: if (Joystick_IsButtonPressed(JOY_PORT_1, JOY_INPUT_TRIGGER_A))
;./mi.c:178: new |= MENU_INPUT_TRIGGER;
	set	4, c
00120$:
;./mi.c:180: u8 ret = (new & g_MenuInputPrev) ^ new;
	ld	a, c
	ld	iy, #_g_MenuInputPrev
	and	a, 0 (iy)
	xor	a, c
;./mi.c:181: g_MenuInputPrev = new;
	ld	0 (iy), c
;./mi.c:183: return ret;
;./mi.c:184: }
	ret
;./mi.c:189: static void HideSprite(u8 sprId)
;	---------------------------------
; Function HideSprite
; ---------------------------------
_HideSprite:
	ld	c, a
;./mi.c:191: VDP_SetSpritePosition(sprId, 0, 216);
	ld	a, #0xd8
	push	af
	inc	sp
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_VDP_SetSpritePosition
;./mi.c:192: }
	ret
;./mi.c:194: static void LoadCommonSpritePatterns(void)
;	---------------------------------
; Function LoadCommonSpritePatterns
; ---------------------------------
_LoadCommonSpritePatterns:
;./mi.c:196: VDP_LoadSpritePattern(g_SpritePatternShip, PATTERN_PLAYER, 1);
	ld	hl, #0x100
	push	hl
	ld	hl, #_g_SpritePatternShip
	call	_VDP_LoadSpritePattern
;./mi.c:197: VDP_LoadSpritePattern(g_SpritePatternEBullet, PATTERN_EBULLET, 1);
	ld	hl, #0x103
	push	hl
	ld	hl, #_g_SpritePatternEBullet
	call	_VDP_LoadSpritePattern
;./mi.c:199: VDP_LoadSpritePattern(g_SpritePatternPowerUp, PATTERN_POWERUP, 1);
	ld	hl, #0x105
	push	hl
	ld	hl, #_g_SpritePatternPowerUp
	call	_VDP_LoadSpritePattern
;./mi.c:201: VDP_LoadSpritePattern(g_SpritePatternWallWalkPowerUp, PATTERN_WALLWALK_POWERUP, 1);
	ld	hl, #0x106
	push	hl
	ld	hl, #_g_SpritePatternWallWalkPowerUp
	call	_VDP_LoadSpritePattern
;./mi.c:203: VDP_LoadSpritePattern(g_SpritePatternGravityPowerUp, PATTERN_GRAVITY_POWERUP, 1);
	ld	hl, #0x107
	push	hl
	ld	hl, #_g_SpritePatternGravityPowerUp
	call	_VDP_LoadSpritePattern
;./mi.c:205: }
	ret
;./mi.c:209: static void LoadEnemyPatternForWave(u8 wave)
;	---------------------------------
; Function LoadEnemyPatternForWave
; ---------------------------------
_LoadEnemyPatternForWave:
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;./mi.c:211: switch (wave % 13)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #0x000d
	call	__modsint
	bit	7, d
	ret	NZ
	ld	a, #0x0c
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jp	PO, 00127$
	xor	a, #0x80
00127$:
	ret	M
	ld	d, #0x00
	ld	hl, #00128$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
00128$:
	jp	00113$
	jp	00101$
	jp	00102$
	jp	00103$
	jp	00104$
	jp	00105$
	jp	00106$
	jp	00107$
	jp	00108$
	jp	00109$
	jp	00110$
	jp	00111$
	jp	00112$
;./mi.c:213: case 1:
00101$:
;./mi.c:214: VDP_LoadSpritePattern(g_SpritePatternCrab, PATTERN_ENEMY, 1);
	ld	hl, #0x101
	push	hl
	ld	hl, #_g_SpritePatternCrab
	call	_VDP_LoadSpritePattern
;./mi.c:215: break;
	ret
;./mi.c:216: case 2:
00102$:
;./mi.c:217: VDP_LoadSpritePattern(g_SpritePatternClassicInvader, PATTERN_ENEMY, 1);
	ld	hl, #0x101
	push	hl
	ld	hl, #_g_SpritePatternClassicInvader
	call	_VDP_LoadSpritePattern
;./mi.c:218: break;
	ret
;./mi.c:219: case 3:
00103$:
;./mi.c:220: VDP_LoadSpritePattern(g_SpritePatternBat, PATTERN_ENEMY, 1);
	ld	hl, #0x101
	push	hl
	ld	hl, #_g_SpritePatternBat
	call	_VDP_LoadSpritePattern
;./mi.c:221: break;
	ret
;./mi.c:222: case 4:
00104$:
;./mi.c:223: VDP_LoadSpritePattern(g_SpritePatternSpike, PATTERN_ENEMY, 1);
	ld	hl, #0x101
	push	hl
	ld	hl, #_g_SpritePatternSpike
	call	_VDP_LoadSpritePattern
;./mi.c:224: break;
	ret
;./mi.c:225: case 5:
00105$:
;./mi.c:226: VDP_LoadSpritePattern(g_SpritePatternScorpion, PATTERN_ENEMY, 1);
	ld	hl, #0x101
	push	hl
	ld	hl, #_g_SpritePatternScorpion
	call	_VDP_LoadSpritePattern
;./mi.c:227: break;
	ret
;./mi.c:228: case 6:
00106$:
;./mi.c:229: VDP_LoadSpritePattern(g_SpritePatternUFO, PATTERN_ENEMY, 1);
	ld	hl, #0x101
	push	hl
	ld	hl, #_g_SpritePatternUFO
	call	_VDP_LoadSpritePattern
;./mi.c:230: break;
	ret
;./mi.c:231: case 7:
00107$:
;./mi.c:232: VDP_LoadSpritePattern(g_SpritePatternSpider, PATTERN_ENEMY, 1);
	ld	hl, #0x101
	push	hl
	ld	hl, #_g_SpritePatternSpider
	call	_VDP_LoadSpritePattern
;./mi.c:233: break;
	ret
;./mi.c:234: case 8:
00108$:
;./mi.c:235: VDP_LoadSpritePattern(g_SpritePatternCyclops, PATTERN_ENEMY, 1);
	ld	hl, #0x101
	push	hl
	ld	hl, #_g_SpritePatternCyclops
	call	_VDP_LoadSpritePattern
;./mi.c:236: break;
	ret
;./mi.c:237: case 9:
00109$:
;./mi.c:238: VDP_LoadSpritePattern(g_SpritePatternCrab2, PATTERN_ENEMY, 1);
	ld	hl, #0x101
	push	hl
	ld	hl, #_g_SpritePatternCrab2
	call	_VDP_LoadSpritePattern
;./mi.c:239: break;
	ret
;./mi.c:240: case 10:
00110$:
;./mi.c:241: VDP_LoadSpritePattern(g_SpritePatternInvader, PATTERN_ENEMY, 1);
	ld	hl, #0x101
	push	hl
	ld	hl, #_g_SpritePatternInvader
	call	_VDP_LoadSpritePattern
;./mi.c:242: break;
	ret
;./mi.c:243: case 11:
00111$:
;./mi.c:244: VDP_LoadSpritePattern(g_SpritePatternInvader2, PATTERN_ENEMY, 1);
	ld	hl, #0x101
	push	hl
	ld	hl, #_g_SpritePatternInvader2
	call	_VDP_LoadSpritePattern
;./mi.c:245: break;
	ret
;./mi.c:246: case 12:
00112$:
;./mi.c:247: VDP_LoadSpritePattern(g_SpritePatternStar, PATTERN_ENEMY, 1);
	ld	hl, #0x101
	push	hl
	ld	hl, #_g_SpritePatternStar
	call	_VDP_LoadSpritePattern
;./mi.c:248: break;
	ret
;./mi.c:249: case 0:
00113$:
;./mi.c:250: VDP_LoadSpritePattern(g_SpritePatternXInvader, PATTERN_ENEMY, 1);
	ld	hl, #0x101
	push	hl
	ld	hl, #_g_SpritePatternXInvader
	call	_VDP_LoadSpritePattern
;./mi.c:252: }
;./mi.c:253: }
	ret
;./mi.c:255: static u8 GetEnemyColorForWave(u8 wave)
;	---------------------------------
; Function GetEnemyColorForWave
; ---------------------------------
_GetEnemyColorForWave:
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;./mi.c:257: switch (wave % 12)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #0x000c
	call	__modsint
	bit	7, d
	jr	NZ, 00114$
	ld	a, #0x0c
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jp	PO, 00128$
	xor	a, #0x80
00128$:
	jp	M, 00114$
	ld	d, #0x00
	ld	hl, #00129$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
00129$:
	jp	00113$
	jp	00101$
	jp	00102$
	jp	00103$
	jp	00104$
	jp	00105$
	jp	00106$
	jp	00107$
	jp	00108$
	jp	00109$
	jp	00110$
	jp	00111$
	jp	00112$
;./mi.c:259: case 1:  return COLOR_LIGHT_RED;
00101$:
	ld	a, #0x09
	ret
;./mi.c:260: case 2:  return COLOR_LIGHT_BLUE;
00102$:
	ld	a, #0x05
	ret
;./mi.c:261: case 3:  return COLOR_MAGENTA;
00103$:
	ld	a, #0x0d
	ret
;./mi.c:262: case 4:  return COLOR_DARK_GREEN;
00104$:
	ld	a, #0x0c
	ret
;./mi.c:263: case 5:  return COLOR_LIGHT_YELLOW;
00105$:
	ld	a, #0x0b
	ret
;./mi.c:264: case 6:  return COLOR_CYAN;
00106$:
	ld	a, #0x07
	ret
;./mi.c:265: case 7:  return COLOR_MEDIUM_RED;
00107$:
	ld	a, #0x08
	ret
;./mi.c:266: case 8:  return COLOR_DARK_YELLOW;
00108$:
	ld	a, #0x0a
	ret
;./mi.c:267: case 9:  return COLOR_LIGHT_GREEN;
00109$:
	ld	a, #0x03
	ret
;./mi.c:268: case 10: return COLOR_GRAY;
00110$:
	ld	a, #0x0e
	ret
;./mi.c:269: case 11: return COLOR_MEDIUM_GREEN;
00111$:
	ld	a, #0x02
	ret
;./mi.c:270: case 12: return COLOR_DARK_RED;
00112$:
	ld	a, #0x06
	ret
;./mi.c:271: case 0:  return COLOR_DARK_BLUE;
00113$:
	ld	a, #0x04
	ret
;./mi.c:272: default: return COLOR_WHITE;
00114$:
	ld	a, #0x0f
;./mi.c:273: }
;./mi.c:274: }
	ret
;./mi.c:276: static void InitAllSprites(void)
;	---------------------------------
; Function InitAllSprites
; ---------------------------------
_InitAllSprites:
;./mi.c:279: VDP_SetSpritePattern(SPRID_PLAYER, PATTERN_PLAYER);
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	l, a
	call	_VDP_SetSpritePattern
;./mi.c:280: VDP_SetSpriteColorSM1(SPRID_PLAYER, COLOR_CYAN);
	ld	l, #0x07
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_VDP_SetSpriteColorSM1
;./mi.c:281: HideSprite(SPRID_PLAYER);
	xor	a, a
	call	_HideSprite
;./mi.c:284: VDP_SetSpritePattern(SPRID_BULLET, PATTERN_BULLET);
	ld	l, #0x02
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_VDP_SetSpritePattern
;./mi.c:285: VDP_SetSpriteColorSM1(SPRID_BULLET, COLOR_WHITE);
	ld	l, #0x0f
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_VDP_SetSpriteColorSM1
;./mi.c:286: HideSprite(SPRID_BULLET);
	ld	a, #0x01
	call	_HideSprite
;./mi.c:289: for (u8 i = 0; i < MAX_EBULLETS; i++)
	ld	c, #0x00
00104$:
	ld	a, c
	sub	a, #0x03
	jr	NC, 00101$
;./mi.c:291: u8 sprId = SPRID_EBULLET_BASE + i;
	ld	b, c
	inc	b
	inc	b
;./mi.c:292: VDP_SetSpritePattern(sprId, PATTERN_EBULLET);
	push	bc
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_VDP_SetSpritePattern
	pop	bc
;./mi.c:293: VDP_SetSpriteColorSM1(sprId, COLOR_LIGHT_YELLOW);
	push	bc
	ld	l, #0x0b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_VDP_SetSpriteColorSM1
	pop	bc
;./mi.c:294: HideSprite(sprId);
	push	bc
	ld	a, b
	call	_HideSprite
	pop	bc
;./mi.c:289: for (u8 i = 0; i < MAX_EBULLETS; i++)
	inc	c
	jp	00104$
00101$:
;./mi.c:298: for (u8 i = 0; i < ENEMY_COUNT; i++)
	ld	c, #0x00
00107$:
;./mi.c:300: u8 sprId = SPRID_ENEMY_BASE + i;
	ld	a,c
	cp	a,#0x0c
	jr	NC, 00102$
	add	a, #0x05
	ld	b, a
;./mi.c:301: VDP_SetSpritePattern(sprId, PATTERN_ENEMY);
	push	bc
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_VDP_SetSpritePattern
	pop	bc
;./mi.c:302: HideSprite(sprId);
	push	bc
	ld	a, b
	call	_HideSprite
	pop	bc
;./mi.c:298: for (u8 i = 0; i < ENEMY_COUNT; i++)
	inc	c
	jp	00107$
00102$:
;./mi.c:306: VDP_SetSpritePattern(SPRID_POWERUP, PATTERN_POWERUP);
	ld	l, #0x05
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x14
	call	_VDP_SetSpritePattern
;./mi.c:307: VDP_SetSpriteColorSM1(SPRID_POWERUP, COLOR_LIGHT_GREEN);
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x14
	call	_VDP_SetSpriteColorSM1
;./mi.c:308: HideSprite(SPRID_POWERUP);
	ld	a, #0x14
;./mi.c:309: }
	jp	_HideSprite
;./mi.c:314: static void ClearScreen(void)
;	---------------------------------
; Function ClearScreen
; ---------------------------------
_ClearScreen:
;./mi.c:316: for (u8 row = 0; row < SCREEN1_ROWS; row++)
	ld	c, #0x00
00108$:
	ld	a, c
	sub	a, #0x18
	ret	NC
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x00
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), c
;./mi.c:319: for (u8 col = 0; col < SCREEN1_COLS; col++)
	ld	b, #0x00
00105$:
	ld	a, b
	sub	a, #0x20
	jr	NC, 00109$
;./mi.c:320: Print_DrawChar(CHAR_SPACE);
	push	bc
	ld	a, #0x20
	call	_Print_DrawChar
	pop	bc
;./mi.c:319: for (u8 col = 0; col < SCREEN1_COLS; col++)
	inc	b
	jp	00105$
00109$:
;./mi.c:316: for (u8 row = 0; row < SCREEN1_ROWS; row++)
	inc	c
;./mi.c:322: }
	jp	00108$
;./mi.c:324: static void PrintNum(u16 val)
;	---------------------------------
; Function PrintNum
; ---------------------------------
_PrintNum:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	ex	de, hl
;./mi.c:326: if (val > MAX_SCORE) val = MAX_SCORE;
	ld	c, e
	ld	b, d
	ld	a, #0xe7
	cp	a, c
	ld	a, #0x03
	sbc	a, b
	jr	NC, 00102$
	ld	de, #0x03e7
00102$:
;./mi.c:328: buf[3] = '\0';
	ld	-1 (ix), #0x00
;./mi.c:329: for (int i = 2; i >= 0; i--)
	ld	bc, #0x0002
00105$:
	bit	7, b
	jr	NZ, 00103$
;./mi.c:331: buf[i] = '0' + (val % 10);
	ld	hl, #0
	add	hl, sp
	add	hl, bc
	push	de
	pop	iy
	push	hl
	push	bc
	push	iy
	ld	de, #0x000a
	push	iy
	pop	hl
	call	__moduint
	pop	iy
	pop	bc
	pop	hl
	ld	a, e
	add	a, #0x30
	ld	(hl), a
;./mi.c:332: val /= 10;
	push	bc
	ld	de, #0x000a
	push	iy
	pop	hl
	call	__divuint
	pop	bc
;./mi.c:329: for (int i = 2; i >= 0; i--)
	dec	bc
	jp	00105$
00103$:
;./mi.c:334: Print_DrawText(buf);
	ld	hl, #0
	add	hl, sp
	call	_Print_DrawText
;./mi.c:335: }
	ld	sp, ix
	pop	ix
	ret
;./mi.c:337: static void PrintBigNum(u32 val)
;	---------------------------------
; Function PrintBigNum
; ---------------------------------
_PrintBigNum:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-12
	add	iy, sp
	ld	sp, iy
	ld	c, l
	ld	b, h
;./mi.c:340: buf[7] = '\0';
	ld	-5 (ix), #0x00
;./mi.c:341: for (int i = 6; i >= 0; i--)
	ld	-2 (ix), #0x06
	ld	-1 (ix), #0
00103$:
	bit	7, -1 (ix)
	jr	NZ, 00101$
;./mi.c:343: buf[i] = '0' + (val % 10);
	push	de
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	hl, #2
	add	hl, sp
	add	hl, de
	pop	de
	ld	-4 (ix), l
	ld	-3 (ix), h
	push	bc
	push	de
	ld	hl, #0x0000
	push	hl
	ld	l, #0x0a
	push	hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	__modulong
	pop	af
	pop	af
	push	hl
	pop	iy
	ex	de, hl
	pop	de
	pop	bc
	ld	a, l
	add	a, #0x30
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), a
;./mi.c:344: val /= 10;
	ld	hl, #0x0000
	push	hl
	ld	l, #0x0a
	push	hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	__divulong
	pop	af
	pop	af
	ld	c, l
	ld	b, h
;./mi.c:341: for (int i = 6; i >= 0; i--)
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	dec	hl
	ld	-2 (ix), l
	ld	-1 (ix), h
	jp	00103$
00101$:
;./mi.c:346: Print_DrawText(buf);
	ld	hl, #0
	add	hl, sp
	call	_Print_DrawText
;./mi.c:347: }
	ld	sp, ix
	pop	ix
	ret
;./mi.c:348: static void UpdateScoreText(void)
;	---------------------------------
; Function UpdateScoreText
; ---------------------------------
_UpdateScoreText:
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	de, #_g_PrintData + 5
	xor	a, a
	ld	(de), a
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	bc, #_g_PrintData + 6
	xor	a, a
	ld	(bc), a
;./mi.c:351: Print_DrawText("HI:");
	push	bc
	push	de
	ld	hl, #___str_11
	call	_Print_DrawText
	pop	de
	pop	bc
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	a, #0x03
	ld	(de), a
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	xor	a, a
	ld	(bc), a
;./mi.c:353: PrintNum(g_HiScore);
	push	bc
	push	de
	ld	hl, (_g_HiScore)
	call	_PrintNum
	pop	de
	pop	bc
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	a, #0x08
	ld	(de), a
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	xor	a, a
	ld	(bc), a
;./mi.c:356: Print_DrawText("SCORE:");
	push	bc
	push	de
	ld	hl, #___str_12
	call	_Print_DrawText
	pop	de
	pop	bc
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	a, #0x0e
	ld	(de), a
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	xor	a, a
	ld	(bc), a
;./mi.c:358: PrintNum(g_Score);
	push	bc
	push	de
	ld	hl, (_g_Score)
	call	_PrintNum
	pop	de
	pop	bc
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	a, #0x13
	ld	(de), a
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	xor	a, a
	ld	(bc), a
;./mi.c:361: Print_DrawText("WAVE:");
	push	bc
	push	de
	ld	hl, #___str_13
	call	_Print_DrawText
	pop	de
	pop	bc
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	a, #0x18
	ld	(de), a
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	xor	a, a
	ld	(bc), a
;./mi.c:363: PrintNum(g_Wave);
	ld	a, (_g_Wave+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
;./mi.c:365: }
	jp	_PrintNum
___str_11:
	.ascii "HI:"
	.db 0x00
___str_12:
	.ascii "SCORE:"
	.db 0x00
___str_13:
	.ascii "WAVE:"
	.db 0x00
;./mi.c:370: static void ClearEnemyBullets(void)
;	---------------------------------
; Function ClearEnemyBullets
; ---------------------------------
_ClearEnemyBullets:
;./mi.c:372: for (u8 i = 0; i < MAX_EBULLETS; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x03
	ret	NC
;./mi.c:374: g_EBActive[i] = false;
	ld	hl, #_g_EBActive
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;./mi.c:375: HideSprite(SPRID_EBULLET_BASE + i);
	ld	b, c
	inc	b
	inc	b
	push	bc
	ld	a, b
	call	_HideSprite
	pop	bc
;./mi.c:372: for (u8 i = 0; i < MAX_EBULLETS; i++)
	inc	c
;./mi.c:377: }
	jp	00103$
;./mi.c:379: static void InitWaveEnemies(void)
;	---------------------------------
; Function InitWaveEnemies
; ---------------------------------
_InitWaveEnemies:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;./mi.c:381: u8 idx = 0;
;./mi.c:382: for (u8 rowI = 0; rowI < ENEMY_ROWS; rowI++)
	ld	e, #0x00
	ld	b, e
00107$:
;./mi.c:384: u8 rowY = ENEMY_START_ROW + (rowI * ENEMY_ROW_SPACING);
	ld	a,b
	cp	a,#0x03
	jr	NC, 00102$
	add	a, a
	add	a, #0x03
	ld	-1 (ix), a
;./mi.c:385: for (u8 colI = 0; colI < ENEMY_PER_ROW; colI++)
	ld	c, #0x00
00104$:
	ld	a, c
	sub	a, #0x04
	jr	NC, 00115$
;./mi.c:387: g_EnemyX[idx] = 4 + colI * 4;
	ld	hl, #_g_EnemyX
	ld	d, #0x00
	add	hl, de
	ld	a, c
	add	a, a
	add	a, a
	add	a, #0x04
	ld	(hl), a
;./mi.c:388: g_EnemyY[idx] = rowY;
	ld	hl, #_g_EnemyY
	ld	d, #0x00
	add	hl, de
	ld	a, -1 (ix)
	ld	(hl), a
;./mi.c:389: g_EnemyAlive[idx++] = true;
	ld	hl, #_g_EnemyAlive
	ld	d, #0x00
	add	hl, de
	inc	e
	ld	(hl), #0x01
;./mi.c:385: for (u8 colI = 0; colI < ENEMY_PER_ROW; colI++)
	inc	c
	jp	00104$
00115$:
;./mi.c:382: for (u8 rowI = 0; rowI < ENEMY_ROWS; rowI++)
	inc	b
	jp	00107$
00102$:
;./mi.c:392: g_EnemyDir = 1;
	ld	hl, #_g_EnemyDir
	ld	(hl), #0x01
;./mi.c:393: g_EnemyMoveCount = 0;
	ld	hl, #_g_EnemyMoveCount
	ld	(hl), #0x00
;./mi.c:394: }
	inc	sp
	pop	ix
	ret
;./mi.c:396: static void SetWaveBackdropColor(u8 wave)
;	---------------------------------
; Function SetWaveBackdropColor
; ---------------------------------
_SetWaveBackdropColor:
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/vdp.h:725: inline void VDP_SetColor2(u8 bg, u8 text) { VDP_RegWrite(7, bg | (text << 4)); }
	ld	l, #0xf1
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x07
;./mi.c:401: VDP_SetColor2(COLOR_BLACK, COLOR_WHITE);
;./mi.c:402: }
	jp	_VDP_RegWrite
;./mi.c:404: static void InitWave(void)
;	---------------------------------
; Function InitWave
; ---------------------------------
_InitWave:
;./mi.c:406: LoadEnemyPatternForWave(g_Wave);
	ld	a, (_g_Wave+0)
	call	_LoadEnemyPatternForWave
;./mi.c:407: InitAllSprites();
	call	_InitAllSprites
;./mi.c:408: u8 enemyColor = GetEnemyColorForWave(g_Wave);
	ld	a, (_g_Wave+0)
	call	_GetEnemyColorForWave
	ld	c, a
;./mi.c:409: for (u8 i = 0; i < ENEMY_COUNT; i++)
	ld	b, #0x00
00103$:
;./mi.c:411: VDP_SetSpriteColorSM1(SPRID_ENEMY_BASE + i, enemyColor);
	ld	a,b
	cp	a,#0x0c
	jr	NC, 00101$
	add	a, #0x05
	ld	e, a
	push	bc
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	_VDP_SetSpriteColorSM1
	pop	bc
;./mi.c:409: for (u8 i = 0; i < ENEMY_COUNT; i++)
	inc	b
	jp	00103$
00101$:
;./mi.c:413: SetWaveBackdropColor(g_Wave);
	ld	a, (_g_Wave+0)
	call	_SetWaveBackdropColor
;./mi.c:414: InitWaveEnemies();
	call	_InitWaveEnemies
;./mi.c:415: g_BulletY = BULLET_OFF;
	ld	hl, #_g_BulletY
	ld	(hl), #0xff
;./mi.c:416: ClearEnemyBullets();
	call	_ClearEnemyBullets
;./mi.c:417: g_Running = true;
	ld	hl, #_g_Running
	ld	(hl), #0x01
;./mi.c:418: }
	ret
;./mi.c:423: static void UpdateEnemySprite(u8 i)
;	---------------------------------
; Function UpdateEnemySprite
; ---------------------------------
_UpdateEnemySprite:
	ld	c, a
;./mi.c:425: if (g_EnemyAlive[i])
	ld	hl, #_g_EnemyAlive
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
;./mi.c:426: VDP_SetSpritePosition(SPRID_ENEMY_BASE + i, SPR_X(g_EnemyX[i]), SPR_Y(g_EnemyY[i]));
	ld	a, c
	add	a, #0x05
	ld	e, a
;./mi.c:425: if (g_EnemyAlive[i])
	ld	a, b
	or	a, a
	jr	Z, 00102$
;./mi.c:426: VDP_SetSpritePosition(SPRID_ENEMY_BASE + i, SPR_X(g_EnemyX[i]), SPR_Y(g_EnemyY[i]));
	ld	hl, #_g_EnemyY+0
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	inc	a
	ld	d, a
	ld	hl, #_g_EnemyX+0
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	de
	inc	sp
	ld	a, e
	call	_VDP_SetSpritePosition
	ret
00102$:
;./mi.c:428: HideSprite(SPRID_ENEMY_BASE + i);
	ld	a, e
;./mi.c:429: }
	jp	_HideSprite
;./mi.c:431: static void UpdateAllEnemiesSprites(void)
;	---------------------------------
; Function UpdateAllEnemiesSprites
; ---------------------------------
_UpdateAllEnemiesSprites:
;./mi.c:433: for (u8 i = 0; i < ENEMY_COUNT; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x0c
	ret	NC
;./mi.c:434: UpdateEnemySprite(i);
	push	bc
	ld	a, c
	call	_UpdateEnemySprite
	pop	bc
;./mi.c:433: for (u8 i = 0; i < ENEMY_COUNT; i++)
	inc	c
;./mi.c:435: }
	jp	00103$
;./mi.c:437: static void UpdatePlayerSprite(void)
;	---------------------------------
; Function UpdatePlayerSprite
; ---------------------------------
_UpdatePlayerSprite:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
;./mi.c:440: u8 color = (g_SlowDownActive) ? COLOR_LIGHT_YELLOW :
	ld	a, (_g_SlowDownActive+0)
	or	a, a
	jr	Z, 00118$
	ld	hl, #0x000b
	jp	00119$
00118$:
	ld	a, (_g_WallWalkActive+0)
	or	a, a
	jr	Z, 00120$
	ld	hl, #0x0004
	jp	00121$
00120$:
	ld	a, (_g_BulletGravityActive+0)
	or	a, a
	jr	Z, 00122$
	ld	hl, #0x000d
	jp	00123$
00122$:
	ld	hl, #0x0007
00123$:
00121$:
00119$:
;./mi.c:444: VDP_SetSpriteColorSM1(SPRID_PLAYER, color);
	xor	a, a
	call	_VDP_SetSpriteColorSM1
;./mi.c:456: if (g_WallWalkActive &&
	ld	a, (_g_WallWalkActive+0)
	or	a, a
	jr	Z, 00105$
;./mi.c:457: (g_PlayerX == 0 || g_PlayerX == SCREEN1_COLS - 1) &&
	ld	a, (_g_PlayerX+0)
	or	a, a
	jr	Z, 00109$
	ld	a, (_g_PlayerX+0)
	sub	a, #0x1f
	jr	NZ, 00105$
00109$:
;./mi.c:458: (g_PlayerY < SHIP_ROW))
	ld	a, (_g_PlayerY+0)
	sub	a, #0x14
	jr	NC, 00105$
;./mi.c:460: if (g_PlayerX == 0)
	ld	a, (_g_PlayerX+0)
	or	a, a
	jr	NZ, 00102$
;./mi.c:463: SpriteFX_RotateRight8(g_SpritePatternShip, ship_buffer);
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	hl, #_g_SpritePatternShip
	call	_SpriteFX_RotateRight8
	jp	00106$
00102$:
;./mi.c:468: SpriteFX_RotateLeft8(g_SpritePatternShip, ship_buffer);
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	hl, #_g_SpritePatternShip
	call	_SpriteFX_RotateLeft8
	jp	00106$
00105$:
;./mi.c:474: Mem_Copy(g_SpritePatternShip, ship_buffer, sizeof(ship_buffer));
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	hl, #_g_SpritePatternShip
	ld	bc, #0x0008
	ldir
00106$:
;./mi.c:478: VDP_LoadSpritePattern(ship_buffer, PATTERN_PLAYER, 1);
	ld	hl, #0x100
	push	hl
	ld	hl, #2
	add	hl, sp
	call	_VDP_LoadSpritePattern
;./mi.c:490: VDP_SetSpritePosition(SPRID_PLAYER, SPR_X(g_PlayerX), SPR_Y(g_PlayerY));
	ld	a, (_g_PlayerX+0)
	add	a, a
	add	a, a
	add	a, a
	ld	c, a
;./mi.c:486: if (g_WallWalkActive &&
	ld	a, (_g_WallWalkActive+0)
	or	a, a
	jr	Z, 00111$
;./mi.c:487: (g_PlayerX == 0 || g_PlayerX == SCREEN1_COLS - 1) &&
	ld	a, (_g_PlayerX+0)
	or	a, a
	jr	Z, 00115$
	ld	a, (_g_PlayerX+0)
	sub	a, #0x1f
	jr	NZ, 00111$
00115$:
;./mi.c:488: (g_PlayerY < SHIP_ROW))
;./mi.c:490: VDP_SetSpritePosition(SPRID_PLAYER, SPR_X(g_PlayerX), SPR_Y(g_PlayerY));
	ld	a,(_g_PlayerY+0)
	cp	a,#0x14
	jr	NC, 00111$
	add	a, a
	add	a, a
	add	a, a
	inc	a
	push	af
	inc	sp
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_VDP_SetSpritePosition
	jp	00116$
00111$:
;./mi.c:494: VDP_SetSpritePosition(SPRID_PLAYER, SPR_X(g_PlayerX), SPR_Y(SHIP_ROW));
	ld	a, #0xa1
	push	af
	inc	sp
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_VDP_SetSpritePosition
00116$:
;./mi.c:496: }
	ld	sp, ix
	pop	ix
	ret
;./mi.c:499: static void UpdatePlayerBulletSprite(void)
;	---------------------------------
; Function UpdatePlayerBulletSprite
; ---------------------------------
_UpdatePlayerBulletSprite:
;./mi.c:501: if (g_BulletY == BULLET_OFF)
	ld	a, (_g_BulletY+0)
	inc	a
	jr	NZ, 00102$
;./mi.c:502: HideSprite(SPRID_BULLET);
	ld	a, #0x01
	jp	_HideSprite
00102$:
;./mi.c:504: VDP_SetSpritePosition(SPRID_BULLET, SPR_X(g_BulletX), SPR_Y(g_BulletY));
	ld	a, (_g_BulletY+0)
	add	a, a
	add	a, a
	add	a, a
	inc	a
	ld	b, a
	ld	a, (_g_BulletX+0)
	add	a, a
	add	a, a
	add	a, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	inc	sp
	ld	a, #0x01
	call	_VDP_SetSpritePosition
;./mi.c:505: }
	ret
;./mi.c:507: static void UpdateEnemyBulletSprite(u8 i)
;	---------------------------------
; Function UpdateEnemyBulletSprite
; ---------------------------------
_UpdateEnemyBulletSprite:
	ld	c, a
;./mi.c:509: if (g_EBActive[i])
	ld	hl, #_g_EBActive
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
;./mi.c:510: VDP_SetSpritePosition(SPRID_EBULLET_BASE + i, SPR_X(g_EBX[i]), SPR_Y(g_EBY[i]));
	ld	e, c
	inc	e
	inc	e
;./mi.c:509: if (g_EBActive[i])
	ld	a, b
	or	a, a
	jr	Z, 00102$
;./mi.c:510: VDP_SetSpritePosition(SPRID_EBULLET_BASE + i, SPR_X(g_EBX[i]), SPR_Y(g_EBY[i]));
	ld	hl, #_g_EBY+0
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	inc	a
	ld	d, a
	ld	hl, #_g_EBX+0
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	de
	inc	sp
	ld	a, e
	call	_VDP_SetSpritePosition
	ret
00102$:
;./mi.c:512: HideSprite(SPRID_EBULLET_BASE + i);
	ld	a, e
;./mi.c:513: }
	jp	_HideSprite
;./mi.c:515: static void UpdateAllEnemyBulletsSprites(void)
;	---------------------------------
; Function UpdateAllEnemyBulletsSprites
; ---------------------------------
_UpdateAllEnemyBulletsSprites:
;./mi.c:517: for (u8 i = 0; i < MAX_EBULLETS; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x03
	ret	NC
;./mi.c:518: UpdateEnemyBulletSprite(i);
	push	bc
	ld	a, c
	call	_UpdateEnemyBulletSprite
	pop	bc
;./mi.c:517: for (u8 i = 0; i < MAX_EBULLETS; i++)
	inc	c
;./mi.c:519: }
	jp	00103$
;./mi.c:521: static void DrawAll(void)
;	---------------------------------
; Function DrawAll
; ---------------------------------
_DrawAll:
;./mi.c:523: UpdateScoreText();
	call	_UpdateScoreText
;./mi.c:524: UpdateAllEnemiesSprites();
	call	_UpdateAllEnemiesSprites
;./mi.c:525: UpdatePlayerSprite();
	call	_UpdatePlayerSprite
;./mi.c:526: UpdatePlayerBulletSprite();
	call	_UpdatePlayerBulletSprite
;./mi.c:527: UpdateAllEnemyBulletsSprites();
;./mi.c:529: }
	jp	_UpdateAllEnemyBulletsSprites
;./mi.c:535: void InitIntroMusic(void)
;	---------------------------------
; Function InitIntroMusic
; ---------------------------------
_InitIntroMusic::
;./mi.c:537: s_IntroMusicIndex = 0;
	ld	hl, #_s_IntroMusicIndex
	ld	(hl), #0x00
;./mi.c:538: s_IntroMusicTimer = g_IntroMusic[0].duration;
	ld	a, (#_g_IntroMusic + 6)
	ld	(_s_IntroMusicTimer+0), a
;./mi.c:541: PSG_EnableTone(0, 1);
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_PSG_EnableTone
;./mi.c:542: PSG_EnableTone(1, 1);
;	spillPairReg hl
;	spillPairReg hl
	ld	a,#0x01
	ld	l,a
	call	_PSG_EnableTone
;./mi.c:546: PSG_SetTone(0, g_IntroMusic[0].tone[0]);
	ld	de, (#_g_IntroMusic + 0)
	xor	a, a
	call	_PSG_SetTone
;./mi.c:547: PSG_SetTone(1, g_IntroMusic[0].tone[1]);
	ld	de, (#_g_IntroMusic + 2)
	ld	a, #0x01
	call	_PSG_SetTone
;./mi.c:550: PSG_SetVolume(0, g_IntroMusic[0].volume[0]);
	ld	hl, #_g_IntroMusic + 4
	ld	l, (hl)
;	spillPairReg hl
	xor	a, a
	call	_PSG_SetVolume
;./mi.c:551: PSG_SetVolume(1, g_IntroMusic[0].volume[1]);
	ld	hl, #_g_IntroMusic + 5
	ld	l, (hl)
;	spillPairReg hl
	ld	a, #0x01
	call	_PSG_SetVolume
;./mi.c:554: PSG_Apply();
;./mi.c:555: }
	jp	_PSG_Apply
;./mi.c:558: void UpdateIntroMusic(void)
;	---------------------------------
; Function UpdateIntroMusic
; ---------------------------------
_UpdateIntroMusic::
;./mi.c:560: if (s_IntroMusicTimer > 0)
	ld	a, (_s_IntroMusicTimer+0)
	or	a, a
	jr	Z, 00102$
;./mi.c:562: s_IntroMusicTimer--;
	ld	hl, #_s_IntroMusicTimer
	dec	(hl)
;./mi.c:563: return;
	ret
00102$:
;./mi.c:566: s_IntroMusicIndex++;
	ld	iy, #_s_IntroMusicIndex
	inc	0 (iy)
;./mi.c:568: if (g_IntroMusic[s_IntroMusicIndex].duration == 0)
	ld	bc, #_g_IntroMusic+0
	ld	de, (_s_IntroMusicIndex)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	de, #0x0006
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ, 00104$
;./mi.c:570: s_IntroMusicIndex = 0;
	ld	0 (iy), #0x00
00104$:
;./mi.c:572: s_IntroMusicTimer = g_IntroMusic[s_IntroMusicIndex].duration;
	ld	de, (_s_IntroMusicIndex)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, bc
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	bc, #0x0006
	add	hl, bc
	pop	bc
	ld	a, (hl)
	ld	(_s_IntroMusicTimer+0), a
;./mi.c:575: PSG_SetTone(0, g_IntroMusic[s_IntroMusicIndex].tone[0]);
	ex	de,hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	xor	a, a
	call	_PSG_SetTone
	pop	bc
;./mi.c:576: PSG_SetTone(1, g_IntroMusic[s_IntroMusicIndex].tone[1]);
	ld	de, (_s_IntroMusicIndex)
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
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ld	a, #0x01
	call	_PSG_SetTone
	pop	bc
;./mi.c:579: PSG_SetVolume(0, g_IntroMusic[s_IntroMusicIndex].volume[0]);
	ld	de, (_s_IntroMusicIndex)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	de, #0x0004
	add	hl, de
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	xor	a, a
	call	_PSG_SetVolume
	pop	bc
;./mi.c:580: PSG_SetVolume(1, g_IntroMusic[s_IntroMusicIndex].volume[1]);
	ld	de, (_s_IntroMusicIndex)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	de, #0x0005
	add	hl, de
	ld	l, (hl)
;	spillPairReg hl
	ld	a, #0x01
	call	_PSG_SetVolume
;./mi.c:583: PSG_Apply();
;./mi.c:584: }
	jp	_PSG_Apply
;./mi.c:587: void CutFx(void)
;	---------------------------------
; Function CutFx
; ---------------------------------
_CutFx::
;./mi.c:589: PSG_SetVolume(2, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_PSG_SetVolume
;./mi.c:590: PSG_Apply();
;./mi.c:591: }
	jp	_PSG_Apply
;./mi.c:596: void StartExplosion(void)
;	---------------------------------
; Function StartExplosion
; ---------------------------------
_StartExplosion::
;./mi.c:598: g_ExplosionActive = true;
	ld	hl, #_g_ExplosionActive
	ld	(hl), #0x01
;./mi.c:599: g_ExplosionPhase = 0;
	ld	hl, #_g_ExplosionPhase
	ld	(hl), #0x00
;./mi.c:600: g_ExplosionStep = 0;
	ld	hl, #_g_ExplosionStep
	ld	(hl), #0x00
;./mi.c:601: PSG_EnableNoise(2, 1);
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_PSG_EnableNoise
;./mi.c:602: PSG_EnableEnvelope(2, 1);
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_PSG_EnableEnvelope
;./mi.c:603: PSG_SetNoise(0x03);
	ld	a, #0x03
	call	_PSG_SetNoise
;./mi.c:604: PSG_SetVolume(2, 0xF);
	ld	l, #0x0f
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_PSG_SetVolume
;./mi.c:605: PSG_SetEnvelope(0x2000);
	ld	hl, #0x2000
	call	_PSG_SetEnvelope
;./mi.c:606: PSG_SetShape(0x09);
	ld	a, #0x09
	call	_PSG_SetShape
;./mi.c:607: PSG_Apply();
;./mi.c:608: }
	jp	_PSG_Apply
;./mi.c:610: void UpdateExplosion(void)
;	---------------------------------
; Function UpdateExplosion
; ---------------------------------
_UpdateExplosion::
;./mi.c:612: if (!g_ExplosionActive) return;
	ld	a, (_g_ExplosionActive+0)
	or	a, a
	ret	Z
;./mi.c:613: switch (g_ExplosionPhase)
	ld	a, (_g_ExplosionPhase+0)
	or	a, a
	jr	Z, 00103$
	ld	a, (_g_ExplosionPhase+0)
	dec	a
	jr	Z, 00106$
	ld	a, (_g_ExplosionPhase+0)
	sub	a, #0x02
	jr	Z, 00109$
	ret
;./mi.c:615: case 0:
00103$:
;./mi.c:616: PSG_SetNoise(0x03 + (g_ExplosionStep << 1));
	ld	a, (_g_ExplosionStep+0)
	add	a, a
	add	a, #0x03
	call	_PSG_SetNoise
;./mi.c:617: PSG_Apply();
	call	_PSG_Apply
;./mi.c:618: g_ExplosionStep++;
	ld	hl, #_g_ExplosionStep
	inc	(hl)
;./mi.c:619: if (g_ExplosionStep >= 20)
	ld	a, (_g_ExplosionStep+0)
	sub	a, #0x14
	ret	C
;./mi.c:621: g_ExplosionPhase++;
	ld	hl, #_g_ExplosionPhase
	inc	(hl)
;./mi.c:622: g_ExplosionStep = 0;
	ld	hl, #_g_ExplosionStep
	ld	(hl), #0x00
;./mi.c:624: break;
	ret
;./mi.c:625: case 1:
00106$:
;./mi.c:626: PSG_SetNoise(0x20 - g_ExplosionStep);
	ld	a, (_g_ExplosionStep+0)
	ld	c, a
	ld	a, #0x20
	sub	a, c
	call	_PSG_SetNoise
;./mi.c:627: PSG_Apply();
	call	_PSG_Apply
;./mi.c:628: g_ExplosionStep++;
	ld	hl, #_g_ExplosionStep
	inc	(hl)
;./mi.c:629: if (g_ExplosionStep >= 10)
	ld	a, (_g_ExplosionStep+0)
	sub	a, #0x0a
	ret	C
;./mi.c:631: g_ExplosionPhase++;
	ld	hl, #_g_ExplosionPhase
	inc	(hl)
;./mi.c:632: g_ExplosionStep = 0;
	ld	hl, #_g_ExplosionStep
	ld	(hl), #0x00
;./mi.c:634: break;
	ret
;./mi.c:635: case 2:
00109$:
;./mi.c:636: PSG_SetVolume(2, 15 - g_ExplosionStep);
	ld	a, (_g_ExplosionStep+0)
	ld	c, a
	ld	a, #0x0f
	sub	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_PSG_SetVolume
;./mi.c:637: PSG_Apply();
	call	_PSG_Apply
;./mi.c:638: g_ExplosionStep++;
	ld	hl, #_g_ExplosionStep
	inc	(hl)
;./mi.c:639: if (g_ExplosionStep >= 16)
	ld	a, (_g_ExplosionStep+0)
	sub	a, #0x10
	ret	C
;./mi.c:641: PSG_EnableNoise(2, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_PSG_EnableNoise
;./mi.c:642: PSG_EnableEnvelope(2, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_PSG_EnableEnvelope
;./mi.c:643: PSG_SetVolume(2, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_PSG_SetVolume
;./mi.c:644: PSG_Apply();
	call	_PSG_Apply
;./mi.c:645: g_ExplosionActive = false;
	ld	hl, #_g_ExplosionActive
	ld	(hl), #0x00
;./mi.c:648: }
;./mi.c:649: }
	ret
;./mi.c:654: static void MoveEnemiesIfTime(void)
;	---------------------------------
; Function MoveEnemiesIfTime
; ---------------------------------
_MoveEnemiesIfTime:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;./mi.c:656: u8 mode_delay = (ENEMY_MOVE_DELAY > g_Wave) ? (ENEMY_MOVE_DELAY - g_Wave) : ENEMY_MOVE_DELAY_MIN;
	ld	a, (#_g_Wave)
	sub	a, #0x16
	jr	NC, 00133$
	ld	a, (_g_Wave+0)
	ld	c, a
	ld	a, #0x16
	sub	a, c
	ld	c, a
	rlca
	jp	00134$
00133$:
	ld	c, #0x02
00134$:
;./mi.c:657: mode_delay = (mode_delay < ENEMY_MOVE_DELAY_MIN) ? ENEMY_MOVE_DELAY_MIN : mode_delay;
	ld	a, c
	sub	a, #0x02
	jr	NC, 00135$
	ld	bc, #0x0002
00135$:
;./mi.c:661: float mod_delay_f = mode_delay;
	ld	a, c
	call	___uchar2fs
	ld	c, l
	ld	b, h
;./mi.c:662: if (g_SlowDownActive)
	ld	a, (_g_SlowDownActive+0)
	or	a, a
	jr	Z, 00102$
;./mi.c:663: mod_delay_f *= SLOWDOWN_FACTOR;
	push	bc
	push	de
	ld	de, #0x0000
	ld	hl, #0x4000
	call	___fsmul
	ld	c, l
	ld	b, h
00102$:
;./mi.c:664: mode_delay = (u8)mod_delay_f;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	___fs2uchar
	ld	c, a
;./mi.c:674: g_EnemyMoveCount++;
	ld	hl, #_g_EnemyMoveCount
	inc	(hl)
;./mi.c:675: if (g_EnemyMoveCount < mode_delay) return;
	ld	a, (_g_EnemyMoveCount+0)
	sub	a, c
	jp	C,00131$
;./mi.c:676: g_EnemyMoveCount = 0;
	ld	hl, #_g_EnemyMoveCount
	ld	(hl), #0x00
;./mi.c:677: bool canShift = true;
	ld	c, #0x01
;./mi.c:678: for (u8 i = 0; i < ENEMY_COUNT; i++)
	ld	e, #0x00
00125$:
	ld	a, e
	sub	a, #0x0c
	jr	NC, 00111$
;./mi.c:680: if (!g_EnemyAlive[i]) continue;
	ld	hl, #_g_EnemyAlive
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00110$
;./mi.c:681: int nx = g_EnemyX[i] + g_EnemyDir;
	ld	hl, #_g_EnemyX
	ld	d, #0x00
	add	hl, de
	ld	l, (hl)
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_EnemyDir+0)
	push	af
	rlca
	sbc	a, a
	ld	b, a
	pop	af
	add	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	adc	a, h
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
;./mi.c:682: if (nx < 0 || nx >= SCREEN1_COLS)
	bit	7, h
	jr	NZ, 00107$
	ld	a, l
	sub	a, #0x20
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C, 00110$
00107$:
;./mi.c:684: canShift = false;
	ld	c, #0x00
;./mi.c:685: break;
	jp	00111$
00110$:
;./mi.c:678: for (u8 i = 0; i < ENEMY_COUNT; i++)
	inc	e
	jp	00125$
00111$:
;./mi.c:688: if (canShift)
	ld	a, c
	or	a, a
	jr	Z, 00152$
;./mi.c:690: for (u8 i = 0; i < ENEMY_COUNT; i++)
	ld	bc, #_g_EnemyX
	ld	-1 (ix), #0x00
00127$:
	ld	a, -1 (ix)
	sub	a, #0x0c
	jr	NC, 00123$
;./mi.c:692: if (g_EnemyAlive[i])
	ld	a, #<(_g_EnemyAlive)
	add	a, -1 (ix)
	ld	e, a
	ld	a, #>(_g_EnemyAlive)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	or	a, a
	jr	Z, 00128$
;./mi.c:693: g_EnemyX[i] += g_EnemyDir;
	ld	a, c
	add	a, -1 (ix)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	hl, #_g_EnemyDir
	add	a, (hl)
	ld	(de), a
00128$:
;./mi.c:690: for (u8 i = 0; i < ENEMY_COUNT; i++)
	inc	-1 (ix)
	jp	00127$
;./mi.c:698: for (u8 i = 0; i < ENEMY_COUNT; i++)
00152$:
	ld	e, #0x00
00130$:
	ld	a, e
	sub	a, #0x0c
	jr	NC, 00120$
;./mi.c:700: if (!g_EnemyAlive[i]) continue;
	ld	hl, #_g_EnemyAlive
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00119$
;./mi.c:701: g_EnemyY[i]++;
	ld	hl, #_g_EnemyY
	ld	d, #0x00
	add	hl, de
	inc	(hl)
	ld	a, (hl)
;./mi.c:702: if (g_EnemyY[i] >= SHIP_ROW)
	sub	a, #0x14
	jr	C, 00119$
;./mi.c:703: g_Running = false;
	ld	hl, #_g_Running
	ld	(hl), #0x00
00119$:
;./mi.c:698: for (u8 i = 0; i < ENEMY_COUNT; i++)
	inc	e
	jp	00130$
00120$:
;./mi.c:705: g_EnemyDir = -g_EnemyDir;
	ld	hl, #_g_EnemyDir
	xor	a, a
	sub	a, (hl)
	ld	(hl), a
00123$:
;./mi.c:707: UpdateAllEnemiesSprites();
	call	_UpdateAllEnemiesSprites
00131$:
;./mi.c:708: }
	inc	sp
	pop	ix
	ret
;./mi.c:710: static bool AllEnemiesDead(void)
;	---------------------------------
; Function AllEnemiesDead
; ---------------------------------
_AllEnemiesDead:
;./mi.c:712: for (u8 i = 0; i < ENEMY_COUNT; i++)
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x0c
	jr	NC, 00103$
;./mi.c:714: if (g_EnemyAlive[i]) return false;
	ld	hl, #_g_EnemyAlive
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00106$
	xor	a, a
	ret
00106$:
;./mi.c:712: for (u8 i = 0; i < ENEMY_COUNT; i++)
	inc	c
	jp	00105$
00103$:
;./mi.c:716: return true;
	ld	a, #0x01
;./mi.c:717: }
	ret
;./mi.c:722: static void UpdatePlayerBullet(void)
;	---------------------------------
; Function UpdatePlayerBullet
; ---------------------------------
_UpdatePlayerBullet:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-5
	add	hl, sp
	ld	sp, hl
;./mi.c:725: if (g_BulletY == BULLET_OFF) return;
	ld	a, (_g_BulletY+0)
	inc	a
	jp	Z,00135$
	jp	00102$
00102$:
;./mi.c:727: if (g_BulletGravityActive)
	ld	a, (_g_BulletGravityActive+0)
	or	a, a
	jr	Z, 00121$
;./mi.c:730: g_BulletVelY += GRAVITY_ACCEL;  // accelerate downward
	ld	hl, #0x3d7d
	push	hl
	ld	hl, #0xf3b6
	push	hl
	ld	de, (_g_BulletVelY)
	ld	hl, (_g_BulletVelY + 2)
	call	___fsadd
	ld	(_g_BulletVelY), de
;./mi.c:731: g_BulletY_f += g_BulletVelY;      // update position using velocity
	ld	(_g_BulletVelY + 2), hl
	push	hl
	ld	hl, (_g_BulletVelY)
	push	hl
	ld	de, (_g_BulletY_f)
	ld	hl, (_g_BulletY_f + 2)
	call	___fsadd
;./mi.c:732: g_BulletY = (u8)g_BulletY_f;      // convert to integer for display
	ld	(_g_BulletY_f),de
	ld	(_g_BulletY_f + 2),hl
	call	___fs2uchar
;./mi.c:735: if (g_BulletY >= SHIP_ROW)
	ld	(_g_BulletY+0), a
	sub	a, #0x14
	jr	C, 00122$
;./mi.c:737: g_BulletY = BULLET_OFF;
	ld	hl, #_g_BulletY
	ld	(hl), #0xff
;./mi.c:738: UpdatePlayerBulletSprite();
	call	_UpdatePlayerBulletSprite
;./mi.c:739: return;
	jp	00135$
00121$:
;./mi.c:742: else if (g_BulletSideways)
	ld	a, (_g_BulletSideways+0)
	or	a, a
	jr	Z, 00118$
;./mi.c:745: if (g_BulletHorizontalRight)
	ld	a, (_g_BulletHorizontalRight+0)
	or	a, a
	jr	Z, 00112$
;./mi.c:747: if (g_BulletX < (SCREEN1_COLS - 1))
	ld	a, (_g_BulletX+0)
	sub	a, #0x1f
	jr	NC, 00106$
;./mi.c:748: g_BulletX++;
	ld	hl, #_g_BulletX
	inc	(hl)
	jp	00122$
00106$:
;./mi.c:751: g_BulletY = BULLET_OFF;
	ld	hl, #_g_BulletY
	ld	(hl), #0xff
;./mi.c:752: UpdatePlayerBulletSprite();
	call	_UpdatePlayerBulletSprite
;./mi.c:753: return;
	jp	00135$
00112$:
;./mi.c:758: if (g_BulletX > 0)
	ld	a, (_g_BulletX+0)
	or	a, a
	jr	Z, 00109$
;./mi.c:759: g_BulletX--;
	ld	hl, #_g_BulletX
	dec	(hl)
	jp	00122$
00109$:
;./mi.c:762: g_BulletY = BULLET_OFF;
	ld	hl, #_g_BulletY
	ld	(hl), #0xff
;./mi.c:763: UpdatePlayerBulletSprite();
	call	_UpdatePlayerBulletSprite
;./mi.c:764: return;
	jp	00135$
00118$:
;./mi.c:771: if (g_BulletY > 0)
	ld	a, (_g_BulletY+0)
	or	a, a
	jr	Z, 00115$
;./mi.c:772: g_BulletY--;
	ld	hl, #_g_BulletY
	dec	(hl)
	jp	00122$
00115$:
;./mi.c:775: g_BulletY = BULLET_OFF;
	ld	hl, #_g_BulletY
	ld	(hl), #0xff
;./mi.c:776: UpdatePlayerBulletSprite();
	call	_UpdatePlayerBulletSprite
;./mi.c:777: return;
	jp	00135$
00122$:
;./mi.c:782: for (u8 i = 0; i < ENEMY_COUNT; i++)
	ld	-5 (ix), #0x00
	ld	e, #0x00
00134$:
	ld	a, e
	sub	a, #0x0c
	jp	NC, 00132$
;./mi.c:784: if (!g_EnemyAlive[i]) continue;
	ld	a, #<(_g_EnemyAlive)
	add	a, e
	ld	-4 (ix), a
	ld	a, #>(_g_EnemyAlive)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, (hl)
	or	a, a
	jp	Z, 00131$
;./mi.c:785: if ((g_EnemyX[i] == g_BulletX) && (g_EnemyY[i] == g_BulletY))
	ld	a, #<(_g_EnemyX)
	add	a, e
	ld	-2 (ix), a
	ld	a, #>(_g_EnemyX)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	c, (hl)
	ld	a, (_g_BulletX+0)
	sub	a, c
	jr	NZ, 00131$
	ld	a, #<(_g_EnemyY)
	add	a, e
	ld	c, a
	ld	a, #>(_g_EnemyY)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	d, a
	ld	a, (_g_BulletY+0)
	sub	a, d
	jr	NZ, 00131$
;./mi.c:787: g_EnemyAlive[i] = false;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), #0x00
;./mi.c:788: g_BulletY = BULLET_OFF;
	ld	hl, #_g_BulletY
	ld	(hl), #0xff
;./mi.c:789: g_Score++;
	ld	hl, (_g_Score)
	inc	hl
	ld	(_g_Score), hl
;./mi.c:790: UpdateScoreText();
	push	bc
	call	_UpdateScoreText
	ld	a, -5 (ix)
	call	_UpdateEnemySprite
	call	_StartExplosion
	pop	bc
;./mi.c:793: if (!g_PowerUpActive && (Math_GetRandom16() % 10) == 0)
	ld	a, (_g_PowerUpActive+0)
	or	a, a
	jr	NZ, 00132$
	push	bc
	call	_Math_GetRandom16
	ld	de, #0x000a
	call	__moduint
	pop	bc
	ld	a, d
	or	a, e
	jr	NZ, 00132$
;./mi.c:795: g_PowerUpActive = true;
	ld	hl, #_g_PowerUpActive
	ld	(hl), #0x01
;./mi.c:796: g_PowerUpX = g_EnemyX[i];
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	(_g_PowerUpX+0), a
;./mi.c:797: g_PowerUpY = g_EnemyY[i];
	ld	a, (bc)
	ld	(_g_PowerUpY+0), a
;./mi.c:798: g_PowerUpType = (Math_GetRandom16() % 3); // 0 = shield, 1 = wall–walk, 2 = gravity
	call	_Math_GetRandom16
	ld	de, #0x0003
	call	__moduint
	ld	hl, #_g_PowerUpType
	ld	(hl), e
;./mi.c:801: break;
	jp	00132$
00131$:
;./mi.c:782: for (u8 i = 0; i < ENEMY_COUNT; i++)
	inc	e
	ld	-5 (ix), e
	jp	00134$
00132$:
;./mi.c:804: UpdatePlayerBulletSprite();
	call	_UpdatePlayerBulletSprite
00135$:
;./mi.c:805: }
	ld	sp, ix
	pop	ix
	ret
;./mi.c:811: static void ClearEnemyBulletSlot(u8 i)
;	---------------------------------
; Function ClearEnemyBulletSlot
; ---------------------------------
_ClearEnemyBulletSlot:
	ld	c, a
;./mi.c:813: g_EBActive[i] = false;
	ld	hl, #_g_EBActive
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;./mi.c:814: HideSprite(SPRID_EBULLET_BASE + i);
	inc	c
	inc	c
	ld	a, c
;./mi.c:815: }
	jp	_HideSprite
;./mi.c:817: static u16 EnemyBulletChance(void)
;	---------------------------------
; Function EnemyBulletChance
; ---------------------------------
_EnemyBulletChance:
;./mi.c:820: u16 sub = (g_Wave - 1) * 100;
	ld	a, (_g_Wave+0)
	ld	b, #0x00
	ld	c, a
	dec	bc
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
;./mi.c:821: if (sub > 500) sub = 500;
	ld	e, c
	ld	d, b
	ld	a, #0xf4
	cp	a, e
	ld	a, #0x01
	sbc	a, d
	jr	NC, 00102$
	ld	bc, #0x01f4
00102$:
;./mi.c:822: u16 c = (base > sub) ? (base - sub) : 100;
	ld	a, c
	sub	a, #0x58
	ld	a, b
	sbc	a, #0x02
	jr	NC, 00105$
	ld	hl, #0x0258
	cp	a, a
	sbc	hl, bc
	ex	de, hl
	ret
00105$:
	ld	de, #0x0064
;./mi.c:823: return c;
;./mi.c:824: }
	ret
;./mi.c:826: static void SpawnEnemyBullet(void)
;	---------------------------------
; Function SpawnEnemyBullet
; ---------------------------------
_SpawnEnemyBullet:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-6
	add	hl, sp
	ld	sp, hl
;./mi.c:828: u8 slot = 0xFF;
	ld	-6 (ix), #0xff
;./mi.c:829: for (u8 i = 0; i < MAX_EBULLETS; i++)
	ld	c, #0x00
	ld	e, c
00110$:
	ld	a, e
	sub	a, #0x03
	jr	NC, 00103$
;./mi.c:831: if (!g_EBActive[i])
	ld	hl, #_g_EBActive
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ, 00111$
;./mi.c:833: slot = i;
	ld	-6 (ix), c
;./mi.c:834: break;
	jp	00103$
00111$:
;./mi.c:829: for (u8 i = 0; i < MAX_EBULLETS; i++)
	inc	e
	ld	c, e
	jp	00110$
00103$:
;./mi.c:837: if (slot == 0xFF) return;
	ld	a, -6 (ix)
	inc	a
	jp	Z,00115$
	jp	00123$
;./mi.c:838: for (u8 tries = 0; tries < 20; tries++)
00123$:
	ld	-1 (ix), #0x00
00113$:
	ld	a, -1 (ix)
	sub	a, #0x14
	jp	NC, 00115$
;./mi.c:840: u8 eidx = (Math_GetRandom16() % ENEMY_COUNT);
	call	_Math_GetRandom16
	ld	de, #0x000c
	call	__moduint
	ld	-5 (ix), e
;./mi.c:841: if (g_EnemyAlive[eidx])
	ld	a, #<(_g_EnemyAlive)
	add	a, -5 (ix)
	ld	c, a
	ld	a, #>(_g_EnemyAlive)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	or	a, a
	jp	Z, 00114$
;./mi.c:843: g_EBActive[slot] = true;
	ld	a, #<(_g_EBActive)
	add	a, -6 (ix)
	ld	-2 (ix), a
	ld	a, #>(_g_EBActive)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
;./mi.c:844: g_EBX[slot] = g_EnemyX[eidx];
	ld	a, #<(_g_EBX)
	add	a, -6 (ix)
	ld	-4 (ix), a
	ld	a, #>(_g_EBX)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	a, #<(_g_EnemyX)
	add	a, -5 (ix)
	ld	-2 (ix), a
	ld	a, #>(_g_EnemyX)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	a, -1 (ix)
	ld	(hl), a
;./mi.c:845: g_EBY[slot] = g_EnemyY[eidx] + 1;
	ld	a, #<(_g_EBY)
	add	a, -6 (ix)
	ld	-4 (ix), a
	ld	a, #>(_g_EBY)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	a, #<(_g_EnemyY)
	add	a, -5 (ix)
	ld	-2 (ix), a
	ld	a, #>(_g_EnemyY)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
	inc	-1 (ix)
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	a, -1 (ix)
	ld	(hl), a
;./mi.c:846: UpdateEnemyBulletSprite(slot);
	ld	a, -6 (ix)
	call	_UpdateEnemyBulletSprite
;./mi.c:847: return;
	jp	00115$
00114$:
;./mi.c:838: for (u8 tries = 0; tries < 20; tries++)
	inc	-1 (ix)
	jp	00113$
00115$:
;./mi.c:850: }
	ld	sp, ix
	pop	ix
	ret
;./mi.c:852: static void PossiblySpawnEnemyBullet(void)
;	---------------------------------
; Function PossiblySpawnEnemyBullet
; ---------------------------------
_PossiblySpawnEnemyBullet:
;./mi.c:854: if (Math_GetRandom16() < EnemyBulletChance())
	call	_Math_GetRandom16
	push	hl
	call	_EnemyBulletChance
	pop	hl
	xor	a, a
	sbc	hl, de
;./mi.c:855: SpawnEnemyBullet();
	jp	C,_SpawnEnemyBullet
;./mi.c:856: }
	ret
;./mi.c:858: static void UpdateEnemyBullets(void)
;	---------------------------------
; Function UpdateEnemyBullets
; ---------------------------------
_UpdateEnemyBullets:
;./mi.c:860: for (u8 i = 0; i < MAX_EBULLETS; i++)
	ld	c, #0x00
00114$:
	ld	a, c
	sub	a, #0x03
	ret	NC
;./mi.c:862: if (!g_EBActive[i]) continue;
	ld	hl, #_g_EBActive
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
;./mi.c:863: if (g_EBY[i] < (SCREEN1_ROWS - 1))
	ld	hl, #_g_EBY
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	cp	a, #0x17
	jr	NC, 00104$
;./mi.c:864: g_EBY[i]++;
	inc	a
	ld	(hl), a
	jp	00105$
00104$:
;./mi.c:867: ClearEnemyBulletSlot(i);
	push	bc
	ld	a, c
	call	_ClearEnemyBulletSlot
	pop	bc
;./mi.c:868: continue;
	jp	00111$
00105$:
;./mi.c:871: if (g_EBY[i] >= (g_WallWalkActive ? g_PlayerY : SHIP_ROW))
	ld	e, (hl)
	ld	a, (_g_WallWalkActive+0)
	or	a, a
	jr	Z, 00117$
	ld	a, (_g_PlayerY+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	jp	00118$
00117$:
	ld	hl, #0x0014
00118$:
	ld	b, #0x00
	ld	a, e
	sub	a, l
	ld	a, b
	sbc	a, h
	jp	PO, 00155$
	xor	a, #0x80
00155$:
	jp	M, 00109$
;./mi.c:873: if (g_EBX[i] == g_PlayerX)
	ld	hl, #_g_EBX
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
	ld	a, (_g_PlayerX+0)
	sub	a, b
	jr	NZ, 00107$
;./mi.c:875: g_Running = false;
	ld	hl, #_g_Running
	ld	(hl), #0x00
00107$:
;./mi.c:877: ClearEnemyBulletSlot(i);
	push	bc
	ld	a, c
	call	_ClearEnemyBulletSlot
	pop	bc
	jp	00111$
00109$:
;./mi.c:881: UpdateEnemyBulletSprite(i);
	push	bc
	ld	a, c
	call	_UpdateEnemyBulletSprite
	pop	bc
00111$:
;./mi.c:860: for (u8 i = 0; i < MAX_EBULLETS; i++)
	inc	c
;./mi.c:884: }
	jp	00114$
;./mi.c:886: void UpdateBulletAnimation(u8 counter)
;	---------------------------------
; Function UpdateBulletAnimation
; ---------------------------------
_UpdateBulletAnimation::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
;./mi.c:890: u8 temp_buffer[8] = { 0 };
	ld	-8 (ix), #0x00
	ld	-7 (ix), #0x00
	ld	-6 (ix), #0x00
	ld	-5 (ix), #0x00
	ld	-4 (ix), #0x00
	ld	-3 (ix), #0x00
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x00
;./mi.c:892: VDP_LoadSpritePattern(g_SpritePatternBullet, PATTERN_BULLET, 1);
	ld	hl, #0x102
	push	hl
	ld	hl, #_g_SpritePatternBullet
	call	_VDP_LoadSpritePattern
;./mi.c:894: SpriteFX_Rotate90_8(g_SpritePatternBullet, temp_buffer);
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	hl, #_g_SpritePatternBullet
	call	_SpriteFX_RotateRight8
;./mi.c:897: Mem_Copy(temp_buffer, g_SpritePatternBullet, sizeof(temp_buffer));
	ld	de, #_g_SpritePatternBullet
	ld	hl, #0
	add	hl, sp
	ld	bc, #0x0008
	ldir
;./mi.c:907: }
	ld	sp, ix
	pop	ix
	ret
;./mi.c:912: static void UpdatePowerUp(void)
;	---------------------------------
; Function UpdatePowerUp
; ---------------------------------
_UpdatePowerUp:
;./mi.c:916: if (!g_PowerUpActive)
	ld	a, (_g_PowerUpActive+0)
	or	a, a
;./mi.c:917: return;
	ret	Z
;./mi.c:920: if (g_PowerUpType == 0)
	ld	a, (_g_PowerUpType+0)
	or	a, a
	jr	NZ, 00109$
;./mi.c:922: VDP_SetSpritePattern(SPRID_POWERUP, PATTERN_POWERUP);
	ld	l, #0x05
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x14
	call	_VDP_SetSpritePattern
	jp	00110$
00109$:
;./mi.c:924: else if (g_PowerUpType == 1)
	ld	a, (_g_PowerUpType+0)
	dec	a
	jr	NZ, 00106$
;./mi.c:926: VDP_SetSpritePattern(SPRID_POWERUP, PATTERN_WALLWALK_POWERUP);
	ld	l, #0x06
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x14
	call	_VDP_SetSpritePattern
	jp	00110$
00106$:
;./mi.c:928: else if (g_PowerUpType == 2)  // gravity powerup
	ld	a, (_g_PowerUpType+0)
	sub	a, #0x02
	jr	NZ, 00110$
;./mi.c:930: VDP_SetSpritePattern(SPRID_POWERUP, PATTERN_GRAVITY_POWERUP);
	ld	l, #0x07
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x14
	call	_VDP_SetSpritePattern
00110$:
;./mi.c:934: VDP_SetSpritePosition(SPRID_POWERUP, SPR_X(g_PowerUpX), SPR_Y(g_PowerUpY));
	ld	a, (_g_PowerUpY+0)
	add	a, a
	add	a, a
	add	a, a
	inc	a
	ld	b, a
	ld	a, (_g_PowerUpX+0)
	add	a, a
	add	a, a
	add	a, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	inc	sp
	ld	a, #0x14
	call	_VDP_SetSpritePosition
;./mi.c:937: s_PowerUpDelayCounter++;
	ld	iy, #_UpdatePowerUp_s_PowerUpDelayCounter_65536_980
	inc	0 (iy)
;./mi.c:938: if (s_PowerUpDelayCounter >= 3)
	ld	a, (_UpdatePowerUp_s_PowerUpDelayCounter_65536_980+0)
	sub	a, #0x03
	jr	C, 00115$
;./mi.c:940: s_PowerUpDelayCounter = 0;
	ld	0 (iy), #0x00
;./mi.c:941: if (g_PowerUpY < (SHIP_ROW - 1))
	ld	a, (_g_PowerUpY+0)
	sub	a, #0x13
	jr	NC, 00112$
;./mi.c:942: g_PowerUpY++;
	ld	hl, #_g_PowerUpY
	inc	(hl)
	jp	00115$
00112$:
;./mi.c:946: g_PowerUpActive = false;
	ld	iy, #_g_PowerUpActive
	ld	0 (iy), #0x00
;./mi.c:947: HideSprite(SPRID_POWERUP);
;./mi.c:948: return;
	ld	a, #0x14
	jp	_HideSprite
00115$:
;./mi.c:954: if ((g_PowerUpY >= SHIP_ROW - 1) &&
	ld	a, (_g_PowerUpY+0)
	sub	a, #0x13
	ret	C
;./mi.c:955: ((g_PowerUpX == g_PlayerX) || (g_PowerUpX == g_PlayerX - 1) || (g_PowerUpX == g_PlayerX + 1)))
	ld	a, (_g_PowerUpX+0)
	ld	hl, #_g_PlayerX
	sub	a, (hl)
	jr	Z, 00127$
	ld	a, (_g_PlayerX+0)
	ld	e, a
	ld	d, #0x00
	ld	l, e
	ld	h, d
	dec	hl
	ld	a, (_g_PowerUpX+0)
	ld	c, a
	ld	b, #0x00
	cp	a, a
	sbc	hl, bc
	jr	Z, 00127$
	ex	de, hl
	inc	hl
	cp	a, a
	sbc	hl, bc
	ret	NZ
00127$:
;./mi.c:957: if (g_PowerUpType == 0) {
	ld	a, (_g_PowerUpType+0)
	or	a, a
	jr	NZ, 00125$
;./mi.c:959: g_SlowDownActive = true;
	ld	hl, #_g_SlowDownActive
	ld	(hl), #0x01
;./mi.c:960: g_SlowDownTimer = POWERUP_SLOWDOWN_TIME;
	ld	hl, #0x012c
	ld	(_g_SlowDownTimer), hl
	jp	00126$
00125$:
;./mi.c:962: else if (g_PowerUpType == 1) {
	ld	a, (_g_PowerUpType+0)
	dec	a
	jr	NZ, 00122$
;./mi.c:964: g_WallWalkActive = true;
	ld	hl, #_g_WallWalkActive
	ld	(hl), #0x01
;./mi.c:965: g_WallWalkTimer = POWERUP_WALLWALK_TIME;
	ld	hl, #0x01f4
	ld	(_g_WallWalkTimer), hl
;./mi.c:967: if (g_PlayerX <= SCREEN1_COLS / 2)
	ld	a, #0x10
	ld	iy, #_g_PlayerX
	sub	a, 0 (iy)
	jr	C, 00117$
;./mi.c:968: g_PlayerX = 0;  // left wall
	ld	0 (iy), #0x00
	jp	00118$
00117$:
;./mi.c:970: g_PlayerX = SCREEN1_COLS - 1;  // right wall
	ld	hl, #_g_PlayerX
	ld	(hl), #0x1f
00118$:
;./mi.c:971: g_PlayerY = SHIP_ROW;
	ld	hl, #_g_PlayerY
	ld	(hl), #0x14
	jp	00126$
00122$:
;./mi.c:973: else if (g_PowerUpType == 2) {
	ld	a, (_g_PowerUpType+0)
	sub	a, #0x02
	jr	NZ, 00126$
;./mi.c:975: g_BulletGravityActive = true;
	ld	hl, #_g_BulletGravityActive
	ld	(hl), #0x01
;./mi.c:976: g_BulletGravityTimer = GRAVITY_POWERUP_TIME;
	ld	hl, #0x01f4
	ld	(_g_BulletGravityTimer), hl
00126$:
;./mi.c:979: g_PowerUpActive = false;
	ld	hl, #_g_PowerUpActive
	ld	(hl), #0x00
;./mi.c:980: g_Score += 1; // Award one point for collecting the power–up.
	ld	hl, (_g_Score)
	inc	hl
	ld	(_g_Score), hl
;./mi.c:981: UpdateScoreText();
	call	_UpdateScoreText
;./mi.c:982: HideSprite(SPRID_POWERUP);
	ld	a, #0x14
	call	_HideSprite
;./mi.c:983: PlayPowerUpSound();
;./mi.c:986: }
	jp	_PlayPowerUpSound
;./mi.c:992: static bool RunWave(void)
;	---------------------------------
; Function RunWave
; ---------------------------------
_RunWave:
	push	af
;./mi.c:1002: u8 frame_counter = 0;
	ld	iy, #1
	add	iy, sp
	ld	0 (iy), #0x00
;./mi.c:1004: InitWave();
	call	_InitWave
;./mi.c:1005: ClearScreen();
	call	_ClearScreen
;./mi.c:1006: DrawAll();
	call	_DrawAll
;./mi.c:1007: DrawBackground();
	call	_DrawBackground
;./mi.c:1009: while (g_Running)
00184$:
	ld	a, (_g_Running+0)
	or	a, a
	jp	Z, 00186$
;./mi.c:1011: frame_counter++;
	ld	iy, #1
	add	iy, sp
	inc	0 (iy)
;./mi.c:1013: MoveEnemiesIfTime();
	call	_MoveEnemiesIfTime
;./mi.c:1014: if (!g_Running)
	ld	a, (_g_Running+0)
	or	a, a
	jp	Z, 00186$
;./mi.c:1016: if (AllEnemiesDead())
	call	_AllEnemiesDead
	or	a, a
	jr	Z, 00104$
;./mi.c:1017: return true;
	ld	a, #0x01
	jp	00190$
00104$:
;./mi.c:1019: PossiblySpawnEnemyBullet();
	call	_PossiblySpawnEnemyBullet
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/input.h:185: u8 in = ~Joystick_Read(port);
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
	ld	a, l
	cpl
;./mi.c:1022: u8 direction = Joystick_GetDirection(JOY_PORT_1);
	and	a, #0x0f
	ld	b, a
	ld	c, b
;./mi.c:1023: go_left = ((direction & JOY_INPUT_DIR_LEFT) || (Keyboard_IsKeyPressed(KEY_LEFT)));
	ld	a, b
	rrca
	rrca
	and	a, #0x01
	ld	b, a
	or	a, a
	jr	NZ, 00193$
	push	bc
	ld	a, #0x48
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a,a
	jr	Z, 00194$
00193$:
	ld	a, #0x01
00194$:
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
;./mi.c:1024: go_right = ((direction & JOY_INPUT_DIR_RIGHT) || (Keyboard_IsKeyPressed(KEY_RIGHT)));
	ld	a, c
	rrca
	rrca
	rrca
	and	a,#0x01
	jr	NZ, 00196$
	ld	a, #0x78
	call	_Keyboard_IsKeyPressed
	or	a,a
	jr	NZ, 00196$
	ld	c,a
	jp	00197$
00196$:
	ld	c, #0x01
00197$:
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/input.h:192: u8 in = Joystick_Read(port);
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
	ld	a, l
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/input.h:193: return ((in & trigger) == 0);
	and	a,#0x10
	jr	Z, 00199$
;./mi.c:1025: fire_pressed = (Joystick_IsButtonPressed(JOY_PORT_1, JOY_INPUT_TRIGGER_A) ||
;./mi.c:1026: Keyboard_IsKeyPressed(KEY_SPACE));
	push	bc
	ld	a, #0x08
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a,a
	jr	NZ, 00199$
	ld	b,a
	jp	00200$
00199$:
	ld	b, #0x01
00200$:
;./mi.c:1029: if (g_WallWalkActive) {
	ld	a, (_g_WallWalkActive+0)
	or	a, a
	jp	Z, 00148$
;./mi.c:1031: if (g_PlayerX == SCREEN1_COLS - 1) { // On the right wall.
	ld	a, (_g_PlayerX+0)
;./mi.c:1032: if (go_right) {
	sub	a,#0x1f
	jr	NZ, 00138$
	or	a,c
	jr	Z, 00114$
;./mi.c:1034: if (g_PlayerY > 0)
	ld	a, (_g_PlayerY+0)
	or	a, a
	jp	Z, 00149$
;./mi.c:1035: g_PlayerY--;
	ld	iy, #_g_PlayerY
	dec	0 (iy)
	jp	00149$
00114$:
;./mi.c:1037: else if (go_left) {
	ld	iy, #0
	add	iy, sp
	ld	a, 0 (iy)
	or	a, a
	jp	Z, 00149$
;./mi.c:1039: if (g_PlayerY != SHIP_ROW)
	ld	a, (_g_PlayerY+0)
	sub	a, #0x14
	jr	Z, 00108$
;./mi.c:1040: g_PlayerY = SHIP_ROW;
	ld	a, #0x14
	ld	(#_g_PlayerY), a
00108$:
;./mi.c:1041: if (g_PlayerX > 0)
	ld	a, (_g_PlayerX+0)
	or	a, a
	jp	Z, 00149$
;./mi.c:1042: g_PlayerX--;
	ld	iy, #_g_PlayerX
	dec	0 (iy)
	jp	00149$
00138$:
;./mi.c:1045: else if (g_PlayerX == 0) { // On the left wall.
	ld	a, (_g_PlayerX+0)
	or	a, a
	jr	NZ, 00135$
;./mi.c:1046: if (go_left) {
	ld	iy, #0
	add	iy, sp
	ld	a, 0 (iy)
	or	a, a
	jr	Z, 00125$
;./mi.c:1048: if (g_PlayerY > 0)
	ld	a, (_g_PlayerY+0)
	or	a, a
	jp	Z, 00149$
;./mi.c:1049: g_PlayerY--;
	ld	iy, #_g_PlayerY
	dec	0 (iy)
	jp	00149$
00125$:
;./mi.c:1051: else if (go_right) {
	ld	a, c
	or	a, a
	jp	Z, 00149$
;./mi.c:1053: if (g_PlayerY != SHIP_ROW)
	ld	a, (_g_PlayerY+0)
	sub	a, #0x14
	jr	Z, 00119$
;./mi.c:1054: g_PlayerY = SHIP_ROW;
	ld	a, #0x14
	ld	(#_g_PlayerY), a
00119$:
;./mi.c:1055: if (g_PlayerX < SCREEN1_COLS - 1)
	ld	a, (_g_PlayerX+0)
	sub	a, #0x1f
	jr	NC, 00149$
;./mi.c:1056: g_PlayerX++;
	ld	iy, #_g_PlayerX
	inc	0 (iy)
	jp	00149$
00135$:
;./mi.c:1061: if (go_left && (g_PlayerX > 0))
	ld	iy, #0
	add	iy, sp
	ld	a, 0 (iy)
	or	a, a
	jr	Z, 00131$
	ld	a, (_g_PlayerX+0)
	or	a, a
	jr	Z, 00131$
;./mi.c:1062: g_PlayerX--;
	ld	iy, #_g_PlayerX
	dec	0 (iy)
	jp	00149$
00131$:
;./mi.c:1063: else if (go_right && (g_PlayerX < SCREEN1_COLS - 1))
	ld	a, c
	or	a, a
	jr	Z, 00149$
	ld	a, (_g_PlayerX+0)
	sub	a, #0x1f
	jr	NC, 00149$
;./mi.c:1064: g_PlayerX++;
	ld	iy, #_g_PlayerX
	inc	0 (iy)
	jp	00149$
00148$:
;./mi.c:1069: if (go_left && (g_PlayerX > 0))
	ld	iy, #0
	add	iy, sp
	ld	a, 0 (iy)
	or	a, a
	jr	Z, 00144$
	ld	a, (_g_PlayerX+0)
	or	a, a
	jr	Z, 00144$
;./mi.c:1070: g_PlayerX--;
	ld	iy, #_g_PlayerX
	dec	0 (iy)
	jp	00145$
00144$:
;./mi.c:1071: else if (go_right && (g_PlayerX < SCREEN1_COLS - 1))
	ld	a, c
	or	a, a
	jr	Z, 00145$
	ld	a, (_g_PlayerX+0)
	sub	a, #0x1f
	jr	NC, 00145$
;./mi.c:1072: g_PlayerX++;
	ld	iy, #_g_PlayerX
	inc	0 (iy)
00145$:
;./mi.c:1073: g_PlayerY = SHIP_ROW;
	ld	a, #0x14
	ld	(#_g_PlayerY), a
00149$:
;./mi.c:1077: if ((g_BulletY == BULLET_OFF) && fire_pressed)
	ld	a, (_g_BulletY+0)
	inc	a
	jp	NZ,00164$
	ld	a, b
	or	a, a
	jp	Z, 00164$
;./mi.c:1082: g_BulletX = g_PlayerX;
	ld	a, (_g_PlayerX+0)
	ld	c, a
;./mi.c:1079: if (g_WallWalkActive && (g_PlayerY < SHIP_ROW))
	ld	a, (_g_WallWalkActive+0)
	or	a, a
	jr	Z, 00160$
	ld	a, (_g_PlayerY+0)
	sub	a, #0x14
	jr	NC, 00160$
;./mi.c:1082: g_BulletX = g_PlayerX;
	ld	a, c
	ld	(#_g_BulletX), a
;./mi.c:1083: g_BulletY = g_PlayerY;  // use the player's current vertical position
	ld	a, (_g_PlayerY+0)
	ld	(_g_BulletY+0), a
;./mi.c:1084: g_BulletSideways = true;
	ld	hl, #_g_BulletSideways
	ld	(hl), #0x01
;./mi.c:1086: if (g_PlayerX == 0)
	ld	a, (_g_PlayerX+0)
	or	a, a
	jr	NZ, 00154$
;./mi.c:1087: g_BulletHorizontalRight = true;   // on left wall: fire to the right
	ld	hl, #_g_BulletHorizontalRight
	ld	(hl), #0x01
	jp	00161$
00154$:
;./mi.c:1088: else if (g_PlayerX == (SCREEN1_COLS - 1))
	ld	a, (_g_PlayerX+0)
	sub	a, #0x1f
	jr	NZ, 00151$
;./mi.c:1089: g_BulletHorizontalRight = false;  // on right wall: fire to the left
	ld	hl, #_g_BulletHorizontalRight
	ld	(hl), #0x00
	jp	00161$
00151$:
;./mi.c:1091: g_BulletHorizontalRight = true;   // default if not exactly at an edge
	ld	hl, #_g_BulletHorizontalRight
	ld	(hl), #0x01
	jp	00161$
00160$:
;./mi.c:1093: else if (g_BulletGravityActive)
	ld	a, (_g_BulletGravityActive+0)
	or	a, a
	jr	Z, 00157$
;./mi.c:1096: g_BulletX = g_PlayerX;
	ld	a, c
	ld	(#_g_BulletX), a
;./mi.c:1097: g_BulletY_f = (float)SHIP_ROW;   // start at the ship's row
	xor	a, a
	ld	(_g_BulletY_f+0), a
	ld	(_g_BulletY_f+1), a
	ld	iy, #_g_BulletY_f
	ld	2 (iy), #0xa0
	ld	3 (iy), #0x41
;./mi.c:1098: g_BulletVelY = -1.5f;            // give an initial upward speed
	xor	a, a
	ld	(_g_BulletVelY+0), a
	ld	(_g_BulletVelY+1), a
	ld	iy, #_g_BulletVelY
	ld	2 (iy), #0xc0
	ld	3 (iy), #0xbf
;./mi.c:1099: g_BulletY = (u8)g_BulletY_f;
	ld	hl, #_g_BulletY
	ld	(hl), #0x14
;./mi.c:1100: g_BulletSideways = false;
	ld	hl, #_g_BulletSideways
	ld	(hl), #0x00
	jp	00161$
00157$:
;./mi.c:1105: g_BulletX = g_PlayerX;
	ld	hl, #_g_BulletX
	ld	(hl), c
;./mi.c:1106: g_BulletY = SHIP_ROW - 1;
	ld	hl, #_g_BulletY
	ld	(hl), #0x13
;./mi.c:1107: g_BulletSideways = false;
	ld	hl, #_g_BulletSideways
	ld	(hl), #0x00
00161$:
;./mi.c:1109: UpdatePlayerBulletSprite();
	call	_UpdatePlayerBulletSprite
;./mi.c:1110: fire_fx_cnt = 5;
	ld	hl, #_RunWave_fire_fx_cnt_65536_991
	ld	(hl), #0x05
;./mi.c:1111: frame_counter = 0;
	ld	iy, #1
	add	iy, sp
	ld	0 (iy), #0x00
00164$:
;./mi.c:1116: UpdatePlayerSprite();
	call	_UpdatePlayerSprite
;./mi.c:1118: if (fire_fx_cnt > 0)
	ld	a, (_RunWave_fire_fx_cnt_65536_991+0)
	or	a, a
	jr	Z, 00167$
;./mi.c:1120: PSG_EnableTone(0, 1);
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_PSG_EnableTone
;./mi.c:1121: fire_fx_cnt--;
	ld	hl, #_RunWave_fire_fx_cnt_65536_991
	dec	(hl)
;./mi.c:1122: fire_tone--;
	ld	hl, #_RunWave_fire_tone_65536_991
	dec	(hl)
	jp	00168$
00167$:
;./mi.c:1126: PSG_EnableTone(0, 0);
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	l, a
	call	_PSG_EnableTone
;./mi.c:1127: fire_fx_cnt = 0;
	ld	hl, #_RunWave_fire_fx_cnt_65536_991
	ld	(hl), #0x00
;./mi.c:1128: fire_tone = 0x20;
	ld	hl, #_RunWave_fire_tone_65536_991
	ld	(hl), #0x20
00168$:
;./mi.c:1131: PSG_SetTone(0, fire_tone);
	ld	a, (_RunWave_fire_tone_65536_991+0)
	ld	e, a
	xor	a, a
	ld	d, a
	call	_PSG_SetTone
;./mi.c:1132: PSG_Apply();
	call	_PSG_Apply
;./mi.c:1134: UpdateBulletAnimation(frame_counter);
	ld	hl, #1
	add	hl, sp
	ld	a, (hl)
	call	_UpdateBulletAnimation
;./mi.c:1135: UpdatePlayerBullet();
	call	_UpdatePlayerBullet
;./mi.c:1136: UpdateEnemyBullets();
	call	_UpdateEnemyBullets
;./mi.c:1139: UpdatePowerUp();
	call	_UpdatePowerUp
;./mi.c:1142: if (g_SlowDownActive)
	ld	a, (_g_SlowDownActive+0)
	or	a, a
	jr	Z, 00173$
;./mi.c:1144: if (g_SlowDownTimer > 0)
	ld	a, (_g_SlowDownTimer+1)
	ld	hl, #_g_SlowDownTimer
	or	a, (hl)
	jr	Z, 00170$
;./mi.c:1145: g_SlowDownTimer--;
	ld	hl, (_g_SlowDownTimer)
	dec	hl
	ld	(_g_SlowDownTimer), hl
	jp	00173$
00170$:
;./mi.c:1147: g_SlowDownActive = false;
	ld	hl, #_g_SlowDownActive
	ld	(hl), #0x00
00173$:
;./mi.c:1151: if (g_WallWalkActive)
	ld	a, (_g_WallWalkActive+0)
	or	a, a
	jr	Z, 00178$
;./mi.c:1153: if (g_WallWalkTimer > 0)
	ld	a, (_g_WallWalkTimer+1)
	ld	hl, #_g_WallWalkTimer
	or	a, (hl)
	jr	Z, 00175$
;./mi.c:1154: g_WallWalkTimer--;
	ld	hl, (_g_WallWalkTimer)
	dec	hl
	ld	(_g_WallWalkTimer), hl
	jp	00178$
00175$:
;./mi.c:1157: g_WallWalkActive = false;
	ld	hl, #_g_WallWalkActive
	ld	(hl), #0x00
;./mi.c:1158: g_PlayerY = SHIP_ROW;
	ld	hl, #_g_PlayerY
	ld	(hl), #0x14
00178$:
;./mi.c:1163: if (g_BulletGravityActive)
	ld	a, (_g_BulletGravityActive+0)
	or	a, a
	jr	Z, 00183$
;./mi.c:1165: if (g_BulletGravityTimer > 0)
	ld	a, (_g_BulletGravityTimer+1)
	ld	hl, #_g_BulletGravityTimer
	or	a, (hl)
	jr	Z, 00180$
;./mi.c:1166: g_BulletGravityTimer--;
	ld	hl, (_g_BulletGravityTimer)
	dec	hl
	ld	(_g_BulletGravityTimer), hl
	jp	00183$
00180$:
;./mi.c:1168: g_BulletGravityActive = false;
	ld	hl, #_g_BulletGravityActive
	ld	(hl), #0x00
00183$:
;./mi.c:1171: UpdateStarfieldEntranceFX();
	call	_UpdateStarfieldEntranceFX
;./mi.c:1172: UpdateExplosion();
	call	_UpdateExplosion
;./mi.c:1173: UpdatePowerUpSound();  // Update the power-up sound effect state machine.
	call	_UpdatePowerUpSound
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/system.h:140: inline void Halt() { __asm__("halt"); }
	halt
;./mi.c:1175: Halt(); // Wait for next frame.
	jp	00184$
00186$:
;./mi.c:1177: return false; // Player died.
	xor	a, a
00190$:
;./mi.c:1178: }
	pop	bc
	ret
;./mi.c:1180: static void RunGameRound(void)
;	---------------------------------
; Function RunGameRound
; ---------------------------------
_RunGameRound:
;./mi.c:1182: g_Wave = 1;
	ld	hl, #_g_Wave
	ld	(hl), #0x01
;./mi.c:1183: g_Score = 0;
	ld	hl, #0x0000
	ld	(_g_Score), hl
;./mi.c:1184: g_PlayerX = SCREEN1_COLS / 2;
	ld	hl, #_g_PlayerX
	ld	(hl), #0x10
;./mi.c:1185: g_Running = true;
	ld	hl, #_g_Running
	ld	(hl), #0x01
;./mi.c:1186: UpdatePlayerSprite();
	call	_UpdatePlayerSprite
;./mi.c:1188: while (g_Running)
00103$:
	ld	a, (_g_Running+0)
	or	a, a
	ret	Z
;./mi.c:1190: bool success = RunWave();
	call	_RunWave
;./mi.c:1191: if (!success) break;
	or	a, a
	ret	Z
;./mi.c:1192: g_Wave++;
	ld	hl, #_g_Wave
	inc	(hl)
;./mi.c:1194: }
	jp	00103$
;./mi.c:1199: void initPsg(void)
;	---------------------------------
; Function initPsg
; ---------------------------------
_initPsg::
;./mi.c:1201: PSG_SetMixer(0);
	xor	a, a
	call	_PSG_SetMixer
;./mi.c:1202: PSG_SetTone(0, 0x400);
	ld	de, #0x0400
	xor	a, a
	call	_PSG_SetTone
;./mi.c:1203: PSG_SetTone(1, 0x800);
	ld	de, #0x0800
	ld	a, #0x01
	call	_PSG_SetTone
;./mi.c:1204: PSG_SetTone(2, 0xA00);
	ld	de, #0x0a00
	ld	a, #0x02
	call	_PSG_SetTone
;./mi.c:1205: PSG_EnableTone(0, 0);
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	l, a
	call	_PSG_EnableTone
;./mi.c:1206: PSG_EnableTone(1, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_PSG_EnableTone
;./mi.c:1207: PSG_EnableTone(2, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_PSG_EnableTone
;./mi.c:1208: PSG_SetNoise(0x10);
	ld	a, #0x10
	call	_PSG_SetNoise
;./mi.c:1209: PSG_EnableNoise(0, 0);
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	l, a
	call	_PSG_EnableNoise
;./mi.c:1210: PSG_EnableNoise(1, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_PSG_EnableNoise
;./mi.c:1211: PSG_EnableNoise(2, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_PSG_EnableNoise
;./mi.c:1212: PSG_SetShape(0xE);
	ld	a, #0x0e
	call	_PSG_SetShape
;./mi.c:1213: PSG_SetEnvelope(0x800);
	ld	hl, #0x0800
	call	_PSG_SetEnvelope
;./mi.c:1214: PSG_EnableEnvelope(0, 0);
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	l, a
	call	_PSG_EnableEnvelope
;./mi.c:1215: PSG_EnableEnvelope(1, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_PSG_EnableEnvelope
;./mi.c:1216: PSG_EnableEnvelope(2, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_PSG_EnableEnvelope
;./mi.c:1217: PSG_SetVolume(0, 0xF);
	ld	l, #0x0f
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_PSG_SetVolume
;./mi.c:1218: PSG_SetVolume(1, 0xF);
	ld	l, #0x0f
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_PSG_SetVolume
;./mi.c:1219: PSG_SetVolume(2, 0xF);
	ld	l, #0x0f
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_PSG_SetVolume
;./mi.c:1220: PSG_Apply();
;./mi.c:1221: }
	jp	_PSG_Apply
;./mi.c:1223: void hideAllSprites(void)
;	---------------------------------
; Function hideAllSprites
; ---------------------------------
_hideAllSprites::
;./mi.c:1225: HideSprite(SPRID_PLAYER);
	xor	a, a
	call	_HideSprite
;./mi.c:1226: HideSprite(SPRID_BULLET);
	ld	a, #0x01
	call	_HideSprite
;./mi.c:1227: for (u8 i = 0; i < ENEMY_COUNT; i++)
	ld	c, #0x00
00104$:
;./mi.c:1228: HideSprite(SPRID_ENEMY_BASE + i);
	ld	a,c
	cp	a,#0x0c
	jr	NC, 00101$
	add	a, #0x05
	ld	b, a
	push	bc
	ld	a, b
	call	_HideSprite
	pop	bc
;./mi.c:1227: for (u8 i = 0; i < ENEMY_COUNT; i++)
	inc	c
	jp	00104$
00101$:
;./mi.c:1229: for (u8 j = 0; j < MAX_EBULLETS; j++)
	ld	c, #0x00
00107$:
	ld	a, c
	sub	a, #0x03
	jr	NC, 00102$
;./mi.c:1230: HideSprite(SPRID_EBULLET_BASE + j);
	ld	b, c
	inc	b
	inc	b
	push	bc
	ld	a, b
	call	_HideSprite
	pop	bc
;./mi.c:1229: for (u8 j = 0; j < MAX_EBULLETS; j++)
	inc	c
	jp	00107$
00102$:
;./mi.c:1231: HideSprite(SPRID_POWERUP);
	ld	a, #0x14
;./mi.c:1232: }
	jp	_HideSprite
;./mi.c:1234: void printGameOver(void)
;	---------------------------------
; Function printGameOver
; ---------------------------------
_printGameOver::
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x00
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x16
;./mi.c:1237: Print_DrawText("GAME OVER!");
	ld	hl, #___str_14
;./mi.c:1238: }
	jp	_Print_DrawText
___str_14:
	.ascii "GAME OVER!"
	.db 0x00
;./mi.c:1240: void getHiScore(void)
;	---------------------------------
; Function getHiScore
; ---------------------------------
_getHiScore::
;./mi.c:1242: if (g_Score > g_HiScore)
	ld	hl, #_g_HiScore
	ld	a, (hl)
	ld	iy, #_g_Score
	sub	a, 0 (iy)
	inc	hl
	ld	a, (hl)
	sbc	a, 1 (iy)
	ret	NC
;./mi.c:1243: g_HiScore = g_Score;
	ld	hl, (_g_Score)
	ld	(_g_HiScore), hl
;./mi.c:1244: }
	ret
;./mi.c:1248: void VBlankHook()
;	---------------------------------
; Function VBlankHook
; ---------------------------------
_VBlankHook::
;./mi.c:1250: g_VBlank = TRUE;
	ld	hl, #_g_VBlank
	ld	(hl), #0x01
;./mi.c:1251: }
	ret
;./mi.c:1255: void WaitVBlank()
;	---------------------------------
; Function WaitVBlank
; ---------------------------------
_WaitVBlank::
;./mi.c:1257: while (!g_VBlank) {}
00101$:
	ld	a, (_g_VBlank+0)
	or	a, a
	jr	Z, 00101$
;./mi.c:1258: g_VBlank = FALSE;
	ld	hl, #_g_VBlank
	ld	(hl), #0x00
;./mi.c:1259: }
	ret
;./mi.c:1264: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;./mi.c:1269: VDP_SetMode(VDP_MODE_GRAPHIC1);
	ld	a, #0x02
	call	_VDP_SetMode
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/vdp.h:710: inline void VDP_EnableVBlank(bool enable) { VDP_RegWriteBakMask(1, (u8)~R01_IE0, enable ? R01_IE0 : 0); }
	ld	a, #0x20
	push	af
	inc	sp
	ld	l, #0xdf
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_VDP_RegWriteBakMask
;./mi.c:1271: VDP_ClearVRAM();
	call	_VDP_ClearVRAM
;./mi.c:1272: Print_SetTextFont(g_Font_MI, 1);
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #_g_Font_MI
	call	_Print_SetTextFont
;./mi.c:1273: Print_SetColor(COLOR_WHITE, COLOR_BLACK);
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0f
	call	_Print_SetColor
;./mi.c:1274: LoadCommonSpritePatterns();
	call	_LoadCommonSpritePatterns
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/bios.h:64: inline void Bios_SetKeyClick(bool enable) { g_CLIKSW = enable; }
	ld	hl, #_g_CLIKSW
	ld	(hl), #0x00
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/vdp.h:710: inline void VDP_EnableVBlank(bool enable) { VDP_RegWriteBakMask(1, (u8)~R01_IE0, enable ? R01_IE0 : 0); }
	ld	a, #0x20
	push	af
	inc	sp
	ld	l, #0xdf
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_VDP_RegWriteBakMask
;./mi.c:1280: Bios_SetHookCallback(H_TIMI, VBlankHook); // VBlankHook() sets a flag every VBlank
	ld	de, #_VBlankHook
	ld	hl, #0xfd9f
	call	_Bios_SetHookCallback
;./mi.c:1283: while (!g_Exit)
00107$:
	ld	a, (_g_Exit+0)
	or	a, a
	jr	NZ, 00109$
;./mi.c:1285: g_StartGame = false;
	ld	hl, #_g_StartGame
	ld	(hl), #0x00
;./mi.c:1287: Menu_Initialize(g_Menus);
	ld	hl, #_g_Menus
	call	_Menu_Initialize
;./mi.c:1288: Menu_SetInputCallback(Menu_Input_CB); //set the menu input callback
	ld	iy, #_g_MenuInputCB
	ld	0 (iy), #<(_Menu_Input_CB)
	ld	1 (iy), #>(_Menu_Input_CB)
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/game_menu.h:318: inline void Menu_SetScreenWidth(u8 width) { g_MenuScrWidth = width; }
	ld	hl, #_g_MenuScrWidth
	ld	(hl), #0x20
;./mi.c:1290: Menu_DrawPage(0);
	xor	a, a
	call	_Menu_DrawPage
;./mi.c:1300: Pletter_UnpackToRAM(g_teste, (void*)MUSIC_ADDRESS);
	ld	de, #0xd000
	ld	hl, #_g_teste
	call	_Pletter_UnpackToRAM
;./mi.c:1303: AKG_Init((const void*)MUSIC_ADDRESS, 0);
	xor	a, a
	push	af
	inc	sp
	ld	hl, #0xd000
	call	_AKG_Init
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x0c
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x14
;./mi.c:1306: PrintBigNum(MUSIC_SIZE);
	ld	de, #0x0990
	ld	hl, #0x0000
	call	_PrintBigNum
;./mi.c:1308: while (!g_Exit && !g_StartGame)
00102$:
	ld	a, (_g_Exit+0)
	or	a, a
	jr	NZ, 00104$
	ld	a, (_g_StartGame+0)
	or	a, a
	jr	NZ, 00104$
;C:/Users/reina/OneDrive/Documentos/MSXgl/engine/src/system.h:140: inline void Halt() { __asm__("halt"); }
	halt
;./mi.c:1313: Menu_Update();
	call	_Menu_Update
;./mi.c:1316: AKG_Decode();     // Process one frame of music playback.
	call	_AKG_Decode
	jp	00102$
00104$:
;./mi.c:1321: if (g_Exit) break;
	ld	a, (_g_Exit+0)
	or	a, a
	jr	NZ, 00109$
;./mi.c:1324: AKG_Stop();
	call	_AKG_Stop
;./mi.c:1326: initPsg();
	call	_initPsg
;./mi.c:1328: StartStarfieldEntranceFX();
	call	_StartStarfieldEntranceFX
;./mi.c:1330: RunGameRound();
	call	_RunGameRound
;./mi.c:1332: getHiScore();
	call	_getHiScore
;./mi.c:1333: printGameOver();
	call	_printGameOver
;./mi.c:1334: hideAllSprites();
	call	_hideAllSprites
	jp	00107$
00109$:
;./mi.c:1337: Bios_Exit(0);
	xor	a, a
;./mi.c:1340: }
	jp	_Bios_Exit
	.area _CODE
	.area _INITIALIZER
__xinit__g_VBlank:
	.db #0x00	; 0
__xinit__g_SlowDownActive:
	.db #0x00	; 0
__xinit__g_SlowDownTimer:
	.dw #0x0000
__xinit__g_SpritePatternBullet:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__g_HiScore:
	.dw #0x0000
__xinit__g_PowerUpActive:
	.db #0x00	; 0
__xinit__g_WallWalkActive:
	.db #0x00	; 0
__xinit__g_WallWalkTimer:
	.dw #0x0000
__xinit__g_PlayerY:
	.db #0x14	; 20
__xinit__g_PowerUpType:
	.db #0x00	; 0
__xinit__g_BulletSideways:
	.db #0x00	; 0
__xinit__g_BulletHorizontalRight:
	.db #0x00	; 0
__xinit__g_BulletGravityActive:
	.db #0x00	; 0
__xinit__g_BulletGravityTimer:
	.dw #0x0000
__xinit__g_BulletY_f:
	.byte #0x00, #0x00, #0x00, #0x00	;  0.000000e+00
__xinit__g_BulletVelY:
	.byte #0x00, #0x00, #0x00, #0x00	;  0.000000e+00
__xinit__s_IntroMusicIndex:
	.db #0x00	; 0
__xinit__s_IntroMusicTimer:
	.db #0x00	; 0
__xinit__g_PowerUpSoundActive:
	.db #0x00	; 0
__xinit__g_PowerUpSoundTimer:
	.db #0x00	; 0
__xinit__g_Exit:
	.db #0x00	; 0
__xinit__g_StartGame:
	.db #0x00	; 0
__xinit__s_MusicIndex:
	.db #0x00	; 0
__xinit__s_MusicTimer:
	.db #0x00	; 0
__xinit__g_ExplosionActive:
	.db #0x00	; 0
__xinit__g_ExplosionPhase:
	.db #0x00	; 0
__xinit__g_ExplosionStep:
	.db #0x00	; 0
__xinit__s_StarfieldFXIndex:
	.db #0x00	; 0
__xinit__s_StarfieldFXTimer:
	.db #0x00	; 0
__xinit__s_StarfieldFXActive:
	.db #0x00	; 0
	.area _CABS (ABS)
