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
		,	% "HwndKeybS_TEscape" . A_Space 
		. "Border"
		,	% "  ⎋  "	;escape key

	Gui, KeybS: Add
		,	Text
		,	% "x+25" . A_Space 
		. "HwndKeybS_TF1" . A_Space 
		. "Border"
		,	% " F1  "	

	Gui, KeybS: Add
		,	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TF2" . A_Space . "Border"
		,	% " F2  "	

	Gui, KeybS: Add
		,	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TF3" . A_Space . "Border"
		,	% " F3  "

	Gui, KeybS: Add
		,	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TF4" . A_Space . "Border"
		,	% " F4  "

	Gui, KeybS: Add
		,	Text
		,	% "x+25" . A_Space . "HwndKeybS_TF5" . A_Space . "Border"
		,	% " F5  "

	Gui, KeybS: Add
		,	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TF6" . A_Space . "Border"
		,	% " F6  "

	Gui, KeybS: Add
		,	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TF7" . A_Space . "Border"
		,	% " F7  "

	Gui, KeybS: Add
		,	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TF8" . A_Space . "Border"
		,	% " F8  "

	Gui, KeybS: Add
		,	Text
		,	% "x+25" . A_Space . "HwndKeybS_TF9" . A_Space . "Border"
		,	% " F9  "

	Gui, KeybS: Add
		,	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TF10" . A_Space . "Border"
		,	% " F10 "

	Gui, KeybS: Add
		,	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TF11" . A_Space . "Border"
		,	% " F11 "

	Gui, KeybS: Add
		,	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TF12" . A_Space . "Border"
		,	% " F12 "

	; raw 1 (14 keys) 
	Gui, KeybS: Add
		,	Text
		,	% "xm" . A_Space . "y+10" . A_Space . "HwndKeybS_TBacktick" . A_Space . "Border"
		,	% "  ``  "	;backtick must be escaped

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space . "HwndKeybS_T1" . A_Space . "Border"
		,	% "  1  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space . "HwndKeybS_T2" . A_Space . "Border"
		,	% "  2  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space . "HwndKeybS_T3" . A_Space . "Border"
		,	% "  3  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space . "HwndKeybS_T4" . A_Space . "Border"
		,	% "  4  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space . "HwndKeybS_T5" . A_Space . "Border"
		,	% "  5  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space . "HwndKeybS_T6" . A_Space . "Border"
		,	% "  6  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space . "HwndKeybS_T7" . A_Space . "Border"
		,	% "  7  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space . "HwndKeybS_T8" . A_Space . "Border"
		,	% "  8  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space . "HwndKeybS_T9" . A_Space . "Border"
		,	% "  9  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space . "HwndKeybS_T0" . A_Space . "Border"
		,	% "  0  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space . "HwndKeybS_TMinus" . A_Space . "Border"
		,	% "  -  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space . "HwndKeybS_TEquals" . A_Space . "Border"
		,	% "  =  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space . "HwndKeybS_TBackspace" . A_Space . "Border"
		,	% "  ←   "

	; raw 2 (14 keys) 
	Gui, KeybS: Add
		,	Text
		,	% "xm" . A_Space . "y+5" . A_Space . "HwndKeybS_TTab" . A_Space . "Border"
		,	% "   ⭾  "

	Gui, KeybS: Add
		, 	Text
		,   	% "x+5" . A_Space .  "HwndKeybS_TQ" . A_Space . "Border"
		,	% "  Q  "

	Gui, KeybS: Add
		, 	Text
		,   	% "x+5" . A_Space .  "HwndKeybS_TW" . A_Space . "Border"
		,	% "  W  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TE" . A_Space . "Border"
		,	% "  E  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TR" . A_Space . "Border"
		,	% "  R  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TT" . A_Space . "Border"
		,	% "  T  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TY" . A_Space . "Border"
		,	% "  Y  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TU" . A_Space . "Border"
		,	% "  U  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TI" . A_Space . "Border"
		,	% "  I  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TO" . A_Space . "Border"
		,	% "  O  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TP" . A_Space . "Border"
		,	% "  P  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TSquareBracket1"  . A_Space . "Border"
		,	% "  [  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TSquareBracket2"   . A_Space . "Border"
		,	% "  ]  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TBackslash"   . A_Space . "Border"
		,	% "   \  "

	;raw 3 (13 keys)
	Gui, KeybS: Add
		, 	Text
		,	% "xm" . A_Space . "y+5" . A_Space . "HwndKeybS_TCapslock" . A_Space . "Border"
		,	% "   ⇪   "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TA"   . A_Space . "Border"
		,	% "  A  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TS"   . A_Space . "Border"
		,	% "  S  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TD"   . A_Space . "Border"
		,	% "  D  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TF"   . A_Space . "Border"
		,	% "  F  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TG"   . A_Space . "Border"
		,	% "  G  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TH"   . A_Space . "Border"
		,	% "  H  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TJ"   . A_Space . "Border"
		,	% "  J  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TK"   . A_Space . "Border"
		,	% "  K  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TL"   . A_Space . "Border"
		,	% "  L  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_Tsemicolon"   . A_Space . "Border"
		,	% "  `;  "	;semicolon must be escaped in such circumstances

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TApostrophe"   . A_Space . "Border"
		,	% "  '  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TEnter"   . A_Space . "Border"
		,	% "     ↵     "

	;raw 4 (12 keys)
	Gui, KeybS: Add
		, 	Text
		,	% "xm" . A_Space . "y+5" . A_Space . "HwndKeybS_TLShift" . A_Space . "Border"
		,	% "     ⇧    "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TZ" . A_Space . "Border"
		,	% "  Z  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TX" . A_Space . "Border"
		,	% "  X  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TC" . A_Space . "Border"
		,	% "  C  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TB"   . A_Space . "Border"
		,	% "  B  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TV"   . A_Space . "Border"
		,	% "  B  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TN"   . A_Space . "Border"
		,	% "  N  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TM"   . A_Space . "Border"
		,	% "  M  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TComma"   . A_Space . "Border"
		,	% "  ,  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TDot"   . A_Space . "Border"
		,	% "  .  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TSlash"   . A_Space . "Border"
		,	% "  /  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TRShift"   . A_Space . "Border"
		,	% "      ⇧       "

	;raw 5 (8 keys)
	Gui, KeybS: Add
		, 	Text
		,	% "xm" . A_Space . "y+5" . A_Space . "HwndKeybS_TLControl" . A_Space . "Border"
		,	% "   ⎈  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TLWindows" . A_Space . "Border"
		,	% "   ⊞  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TLAlt" . A_Space . "Border"
		,	% "   ⎇  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TSpace" . A_Space . "Border"
		,	% "                ␣                 "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TRAlt" . A_Space . "Border"
		,	% "   ⎇  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TRWindows" . A_Space . "Border"
		,	% "   ⊞  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TFn" . A_Space . "Border"
		,	% "  Fn  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space .  "HwndKeybS_TRControl" . A_Space . "Border"
		,	% "   ⎈  "

	;middle island, first row (3 keys) 
	GuiControlGet,	vControlPos, Pos
		, 	% KeybS_TF12

	Gui, KeybS: Add
		,	Text
		,	% "x" . vControlPosX + vControlPosW + 3 * vXm . A_Space 
		. "y" . vControlPosY . A_Space 
		. "HwndKeybS_TPrintScreen" . A_Space . "Border"
		,	% " PS  "		;PrtScr (Print Screen)

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space . "HwndKeybS_TPause" . A_Space . "Border"
		,	% "  Pe  "		;Pause

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space . "HwndKeybS_TMode" . A_Space . "Border"
		,	% "  Me  "		;Mode

	;middle island, second raw (3 keys) 
	GuiControlGet, vControlPos, Pos
		, 	% KeybS_TPrintScreen

	Gui, KeybS: Add
		, 	Text
		,	% "x" . vControlPosX . A_Space 
		. "y" . vControlPosY + vControlPosH + 10 . A_Space 
		. "HwndKeybS_TInsert" . A_Space . "Border"
		,	% " Ins "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space . "HwndKeybS_THome" . A_Space . "Border"
		,	% "  ⇱   "		;Home

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space . "HwndKeybS_TPgUp" . A_Space . "Border"
		,	% "  PU  "		;Page Up

	;middle island, third raw (3 keys) 
	GuiControlGet, vControlPos, Pos
		, 	% KeybS_TInsert

	Gui, KeybS: Add
		, 	Text
		,	% "x" . vControlPosX . A_Space 
		. "y" . vControlPosY + vControlPosH + 5 . A_Space 
		. "HwndKeybS_TDelete" . A_Space . "Border"
		,	% " Del "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space . "HwndKeybS_TEnd" . A_Space . "Border"
		,	% "  ⇲   "		;Home

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space . "HwndKeybS_TPgDn" . A_Space . "Border"
		,	% "  PD  "		;Home

	;cursors (4 keys) 
	GuiControlGet, vControlPos, Pos
		, 	% KeybS_TEnd

	Gui, KeybS: Add
		, 	Text
		,	% "x" . vControlPosX + 3 . A_Space 
		. "y" . vControlPosY + vControlPosH * 2 + 5 * 2 . A_Space 
		. "HwndKeybS_TUp" . A_Space . "Border"
		,	% "  ↑  "

	Gui, KeybS: Add
		, 	Text
		,	% "y+5" . A_Space . "HwndKeybS_TDown" . A_Space . "Border"
		,	% "  ↓  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space . "HwndKeybS_TRight" . A_Space . "Border"
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
	global	;assume-global mode of operation

	CTLCOLORS.Free()
	v_InputH.Stop()
	ExitApp, 0
}

; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

F_ColorScale()	;color scale, 1…100 in form of text spaces with colored background.
{
	global	;assume-global mode of operation
	local	AuxCounter 	:= 1
		,	numColors 	:= 100	; Define the number of colors

	rgbColors := ["800080", "7B0086", "76008D", "700094", "6B009A", "6600A1", "6100A7", "5C00AE", "5700B4", "5200BA"
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