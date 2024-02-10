F_GuiDefine_Keybs()
{
	global	;assume-global mode of operation
	local	vControlPos 	:= 0
		,	vControlPosX 	:= 0
		,	vControlPosY 	:= 0
		,	vControlPosW 	:= 0
		,	vControlPosH 	:= 0

	Gui, KeybS: New
		, -Resize +HwndKeybSHwnd +Owner -MaximizeBox -MinimizeBox
	Gui,	KeybS: Font
		,	s10
		, 	Courier New	;this is monospace font, what is important to show correctly on the GUI. Number of spaces matters.

		vXm := 10
	,	vYm := 10

	Gui, KeybS: Margin
		,	% vXm	;X
		,	% vYm	;Y

	; upper row (13 keys) 
	Gui, KeybS: Add
		,	Text
		,	HwndKeybS_TEsc Border
		,	% "  ⎋  "	;escape key

	Gui, KeybS: Add
		,	Text
		,	x+25 HwndKeybS_TF1 Border
		,	% " F1  "	

	Gui, KeybS: Add
		,	Text
		,	x+5 HwndKeybS_TF2 Border
		,	% " F2  "	

	Gui, KeybS: Add
		,	Text
		,	x+5 HwndKeybS_TF3 Border
		,	% " F3  "

	Gui, KeybS: Add
		,	Text
		,	x+5 HwndKeybS_TF4 Border
		,	% " F4  "

	Gui, KeybS: Add
		,	Text
		,	x+25 HwndKeybS_TF5 Border
		,	% " F5  "

	Gui, KeybS: Add
		,	Text
		,	x+5 HwndKeybS_TF6 Border
		,	% " F6  "

	Gui, KeybS: Add
		,	Text
		,	x+5 HwndKeybS_TF7 Border
		,	% " F7  "

	Gui, KeybS: Add
		,	Text
		,	x+5 HwndKeybS_TF8 Border
		,	% " F8  "

	Gui, KeybS: Add
		,	Text
		,	x+25 HwndKeybS_TF9 Border
		,	% " F9  "

	Gui, KeybS: Add
		,	Text
		,	x+5 HwndKeybS_TF10 Border
		,	% " F10 "

	Gui, KeybS: Add
		,	Text
		,	x+5 HwndKeybS_TF11 Border
		,	% " F11 "

	Gui, KeybS: Add
		,	Text
		,	x+5 HwndKeybS_TF12 Border
		,	% " F12 "

	; raw 1 (14 keys) 
	Gui, KeybS: Add
		,	Text
		,	xm y+10 HwndKeybS_TBacktick Border
		,	% "  ``  "	;backtick must be escaped

	Gui, KeybS: Add
		,	Text
		,	x+6 HwndKeybS_T1 Border
		,	% "  1  "

	Gui, KeybS: Add
		,	Text
		,	x+6 HwndKeybS_T2 Border
		,	% "  2  "

	Gui, KeybS: Add
		,	Text
		,	x+6 HwndKeybS_T3 Border
		,	% "  3  "

	Gui, KeybS: Add
		,	Text
		,	x+6 HwndKeybS_T4 Border
		,	% "  4  "

	Gui, KeybS: Add
		,	Text
		,	x+6 HwndKeybS_T5 Border
		,	% "  5  "

	Gui, KeybS: Add
		,	Text
		,	x+6 HwndKeybS_T6 Border
		,	% "  6  "

	Gui, KeybS: Add
		,	Text
		,	x+6 HwndKeybS_T7 Border
		,	% "  7  "

	Gui, KeybS: Add
		,	Text
		,	x+6 HwndKeybS_T8 Border
		,	% "  8  "

	Gui, KeybS: Add
		,	Text
		,	x+6 HwndKeybS_T9 Border
		,	% "  9  "

	Gui, KeybS: Add
		,	Text
		,	x+6 HwndKeybS_T0 Border
		,	% "  0  "

	Gui, KeybS: Add
		,	Text
		,	x+6 HwndKeybS_TMinus Border
		,	% "  -  "

	Gui, KeybS: Add
		,	Text
		,	x+6 HwndKeybS_TEquals Border
		,	% "  =  "

	Gui, KeybS: Add
		,	Text
		,	x+6 HwndKeybS_TBackspace Border
		,	% "  ←   "

	; raw 2 (14 keys) 
	Gui, KeybS: Add
		,	Text
		,	xm y+5 HwndKeybS_TTab Border
		,	% "   ⭾  "

	Gui, KeybS: Add
		, 	Text
		,   	x+5 HwndKeybS_TQ Border
		,	% "  Q  "

	Gui, KeybS: Add
		, 	Text
		,   	x+5 HwndKeybS_TW Border
		,	% "  W  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TE Border
		,	% "  E  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TR Border
		,	% "  R  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TT Border
		,	% "  T  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TY Border
		,	% "  Y  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TU Border
		,	% "  U  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TI Border
		,	% "  I  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TO Border
		,	% "  O  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TP Border
		,	% "  P  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TSquareBracket1  Border
		,	% "  [  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TSquareBracket2   Border
		,	% "  ]  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TBackslash   Border
		,	% "   \  "

	;raw 3 (13 keys)
	Gui, KeybS: Add
		, 	Text
		,	xm y+5 HwndKeybS_TCapslock   Border
		,	% "   ⇪   "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TA   Border
		,	% "  A  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TS   Border
		,	% "  S  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TD   Border
		,	% "  D  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TF   Border
		,	% "  F  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TG   Border
		,	% "  G  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TH   Border
		,	% "  H  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TJ   Border
		,	% "  J  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TK   Border
		,	% "  K  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TL   Border
		,	% "  L  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_Tsemicolon   Border
		,	% "  `;  "	;semicolon must be escaped in such circumstances

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_Tsemicolon   Border
		,	% "  ""  "	;must be escaped

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TEnter   Border
		,	% "     ↵     "

	;raw 4 (12 keys)
	Gui, KeybS: Add
		, 	Text
		,	xm y+5 HwndKeybS_TLShift   Border
		,	% "     ⇧    "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TZ   Border
		,	% "  Z  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TX   Border
		,	% "  X  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TC   Border
		,	% "  C  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TB   Border
		,	% "  B  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TV   Border
		,	% "  B  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TN   Border
		,	% "  N  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TM   Border
		,	% "  M  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TPeriod   Border
		,	% "  ,  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TComa   Border
		,	% "  .  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TSlash   Border
		,	% "  /  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TRShift   Border
		,	% "      ⇧       "

	;raw 5 (8 keys)
	Gui, KeybS: Add
		, 	Text
		,	xm y+5 HwndKeybS_TLControl   Border
		,	% "   ⎈  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TLWindows   Border
		,	% "   ⊞  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TLAlt   Border
		,	% "   ⎇  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TSpace   Border
		,	% "                ␣                 "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TRAlt   Border
		,	% "   ⎇  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TRWindows   Border
		,	% "   ⊞  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TFn   Border
		,	% "  Fn  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TRControl   Border
		,	% "   ⎈  "

	;middle island, first row (3 keys) 
	GuiControlGet,	vControlPos, Pos
		, 	% KeybS_TF12

	Gui, KeybS: Add
		,	Text
		,	% "x" . vControlPosX + vControlPosW + 3 * vXm . A_Space 
		. "y" . vControlPosY . A_Space 
		. "HwndKeybS_TPrtScr Border"
		,	% " PS  "		;PrtScr (Print Screen)

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TPause   Border
		,	% "  Pe  "		;Pause

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TMode   Border
		,	% "  Me  "		;Mode

	;middle island, second raw (3 keys) 
	GuiControlGet, vControlPos, Pos
		, 	% KeybS_TPrtScr

	Gui, KeybS: Add
		, 	Text
		,	% "x" . vControlPosX . A_Space 
		. "y" . vControlPosY + vControlPosH + 10 . A_Space 
		. "HwndKeybS_TIns Border"
		,	% " Ins "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_THome   Border
		,	% "  ⇱   "		;Home

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TPgUp   Border
		,	% "  PU  "		;Page Up

	;middle island, third raw (3 keys) 
	GuiControlGet, vControlPos, Pos
		, 	% KeybS_TIns

	Gui, KeybS: Add
		, 	Text
		,	% "x" . vControlPosX . A_Space 
		. "y" . vControlPosY + vControlPosH + 5 . A_Space 
		. "HwndKeybS_TDel Border"
		,	% " Del "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TEnd   Border
		,	% "  ⇲   "		;Home

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TPgDown   Border
		,	% "  PD  "		;Home

	;cursors (4 keys) 
	GuiControlGet, vControlPos, Pos
		, 	% KeybS_TEnd

	Gui, KeybS: Add
		, 	Text
		,	% "x" . vControlPosX + 3 . A_Space 
		. "y" . vControlPosY + vControlPosH * 2 + 5 * 2 . A_Space 
		. "HwndKeybS_TUp Border"
		,	% "  ↑  "

	Gui, KeybS: Add
		, 	Text
		,	y+5 HwndKeybS_TDown   Border
		,	% "  ↓  "

	Gui, KeybS: Add
		, 	Text
		,	x+5 HwndKeybS_TRight   Border
		,	% "  →  "

	GuiControlGet, vControlPos, Pos
		, 	% KeybS_TRight

	Gui, KeybS: Add
		, 	Text
		,	% "x+-" . vControlPosW * 3 + 12 . A_Space . "HwndKeybS_TLeft   Border"
		,	% "  ←  "


	F_ColorScale()

	Gui, KeybS: Show
		, Center AutoSize
		, % SubStr(A_ScriptName, 1, -4) 
} 

; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

KeybSGuiClose(GuiHwnd)
{
	ExitApp, 0
}

; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

F_ColorScale()	;color scale, 1…100 in form of text spaces with colored background.
{
	global	;assume-global mode of operation
	local	AuxCounter 	:= 1
		,	numColors := 100	; Define the number of colors
		, rgbColors := ["800080", "7B0086", "76008D", "700094", "6B009A", "6600A1", "6100A7", "5C00AE", "5700B4", "5200BA"
					,"4D00C0", "4800C6", "4300CC", "3E00D2", "3900D8", "3400DE", "2F00E4", "2A00EA", "2500F0", "2000F6"
					,"1B00FC", "1604FF", "110AFE", "0C0EFD", "0718FC", "0222FB", "002CF9", "0036F8", "0040F7", "004AF5"
					,"0054F3", "005EF2", "0068F0", "0072EE", "007CEC", "0086EA", "0090E8", "009AE6", "00A4E4", "00AEE3"
					,"00B8E1", "00C2DF", "00CCDD", "00D6DB", "00E0D9", "00EAD7", "00F4D5", "00FED4", "08FFD6", "10FFD9"
					,"18FFDC", "20FFDF", "28FFE2", "30FFE5", "38FFE8", "40FFEB", "48FFEE", "50FFF1", "58FFF4", "60FFF7"
					,"68FFFA", "70FFFD", "78FFFF", "80FFFF", "88FFFF", "90FFFF", "98FFFF", "A0FFFF", "A8FFFF", "B0FFFF"
					,"B8FFFF", "C0FFFF", "C8FFFF", "D0FFFF", "D8FFFF", "E0FFFF", "E8FFFF", "F0FFFF", "F8FFFF", "FFFFFF"
					,"FFFFF8", "FFFFF0", "FFFFE8", "FFFFE0", "FFFFD8", "FFFFD0", "FFFFC8", "FFFFC0", "FFFFB8", "FFFFB0"
					,"FFFFA8", "FFFFA0", "FFFF98", "FFFF90", "FFFF88", "FFFF80", "FFFF78", "FFFF70", "FFFF68", "FFFF60"
					,"FFFF58", "FFFF50", "FFFF48", "FFFF40", "FFFF38", "FFFF30", "FFFF28", "FFFF20", "FFFF18", "FFFF10"]

	DynVar 		:= ""	;declaration of global variable

	; Gui, KeybS: Font, s10, Calibri
	Gui, KeybS: Add
		, 	Text
		,	xm HwndKeybS_TS1   Border
		,	% Chr(0x200A) ; U+200A is a hair space
	CTLCOLORS.Attach(KeybS_TS1, rgbColors[1], "")

	Loop, 99
	{
		AuxCounter 	:= A_Index + 1	;local
		DynVar 		:= "KeybS_TS" . AuxCounter ;global
		Gui, KeybS: Add
			, 	Text
			,	% "x+0" . A_Space . "Hwnd" . AHKVar(DynVar) . A_Space . "Border"
			,	% " " ; 	% Chr(0x2009) ; U+200A is a thin space
		CTLCOLORS.Attach(%DynVar%, rgbColors[AuxCounter], "")
	}
}

; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

AHKVar(varName) 
{
    global  ; Ensure access to global variables
    
    return % varName ; Return the value of the variable with the specified name
}