F_GuiDefine_Keybs()
{
	global	;assume-global mode of operation
	local	vControlPos 	:= 0
		,	vControlPosX 	:= 0
		,	vControlPosY 	:= 0
		,	vControlPosW 	:= 0
		,	vControlPosH 	:= 0
		,	HWNDaddress	:= 0

	Gui, KeybS: New
		, -Resize +HwndKeybSHwnd -MaximizeBox	;+Owner: An owned window has no taskbar button by default, no separate icon on taskbar when script is launched.
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
		,	% "Hwnd" . "KeybS_TEscape" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  ⎋  "	;escape key
	GuiControlGet, HWNDaddress, HWND, % KeybS_TEscape
	aHWNDToVariable[HWNDaddress] 	:= "KeybS_TEscape"
,	aKeyLabel[HWNDaddress] 		:= "  ⎋  "

	Gui, KeybS: Add
		,	Text
		,	% "x+25" . A_Space 
		. 	"Hwnd" . "KeybS_TF1" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% " F1  "	
	GuiControlGet, HWNDaddress, HWND, % KeybS_TF1
	aHWNDToVariable[HWNDaddress] := "KeybS_TF1"
,	aKeyLabel[HWNDaddress] 		:= " F1  "

	Gui, KeybS: Add
		,	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TF2" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% " F2  "	
	GuiControlGet, HWNDaddress, HWND, % KeybS_TF2
	aHWNDToVariable[HWNDaddress] := "KeybS_TF2"
,	aKeyLabel[HWNDaddress] 		:= " F2  "

	Gui, KeybS: Add
		,	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TF3" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% " F3  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TF3
	aHWNDToVariable[HWNDaddress] := "KeybS_TF3"
,	aKeyLabel[HWNDaddress] 		:= " F3  "

	Gui, KeybS: Add
		,	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TF4" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% " F4  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TF4
	aHWNDToVariable[HWNDaddress] := "KeybS_TF4"
,	aKeyLabel[HWNDaddress] 		:= " F4  "

	Gui, KeybS: Add
		,	Text
		,	% "x+25" . A_Space 
		. 	"Hwnd" . "KeybS_TF5" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% " F5  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TF5
	aHWNDToVariable[HWNDaddress] := "KeybS_TF5"
,	aKeyLabel[HWNDaddress] 		:= " F5  "

	Gui, KeybS: Add
		,	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TF6" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% " F6  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TF6
	aHWNDToVariable[HWNDaddress] := "KeybS_TF6"
,	aKeyLabel[HWNDaddress] 		:= " F6  "

	Gui, KeybS: Add
		,	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TF7" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% " F7  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TF7
	aHWNDToVariable[HWNDaddress] := "KeybS_TF7"
,	aKeyLabel[HWNDaddress] 		:= " F7  "

	Gui, KeybS: Add
		,	Text
		,	% "x+5" . A_Space 
		.  	"Hwnd" . "KeybS_TF8" . A_Space 
		.	"Border" . A_Space
		.	"g" . "F_OnText"
		,	% " F8  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TF8
	aHWNDToVariable[HWNDaddress] := "KeybS_TF8"
,	aKeyLabel[HWNDaddress] 		:= " F8  "

	Gui, KeybS: Add
		,	Text
		,	% "x+25" . A_Space 
		.	"Hwnd" . "KeybS_TF9" . A_Space 
		.	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% " F9  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TF9
	aHWNDToVariable[HWNDaddress] := "KeybS_TF9"
,	aKeyLabel[HWNDaddress] 		:= " F9  "

	Gui, KeybS: Add
		,	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TF10" . A_Space 
		.	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% " F10 "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TF10
	aHWNDToVariable[HWNDaddress] := "KeybS_TF10"
,	aKeyLabel[HWNDaddress] 		:= " F10 "

	Gui, KeybS: Add
		,	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TF11" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% " F11 "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TF11
	aHWNDToVariable[HWNDaddress] := "KeybS_TF11"
,	aKeyLabel[HWNDaddress] 		:= " F11 "

	Gui, KeybS: Add
		,	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TF12" . A_Space 
		.	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% " F12 "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TF12
	aHWNDToVariable[HWNDaddress] := "KeybS_TF12"
,	aKeyLabel[HWNDaddress] 		:= " F12 "

	; raw 1 (14 keys) 
	Gui, KeybS: Add
		,	Text
		,	% "xm" . A_Space . "y+10" . A_Space 
		.	"Hwnd" . "KeybS_TBacktick" . A_Space 
		.	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  ``  "	;backtick must be escaped
	GuiControlGet, HWNDaddress, HWND, % KeybS_TBacktick
	aHWNDToVariable[HWNDaddress] := "KeybS_TBacktick"
,	aKeyLabel[HWNDaddress] 		:= "  ``  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space 
		.	"Hwnd" . "KeybS_T1" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  1  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_T1
	aHWNDToVariable[HWNDaddress] := "KeybS_T1"
,	aKeyLabel[HWNDaddress] 		:= "  1  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space 
		.	"Hwnd" . "KeybS_T2" . A_Space 
		.	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  2  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_T2
	aHWNDToVariable[HWNDaddress] := "KeybS_T2"
,	aKeyLabel[HWNDaddress] 		:= "  2  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space 
		.	"Hwnd" . "KeybS_T3" . A_Space 
		.	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  3  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_T3
	aHWNDToVariable[HWNDaddress] := "KeybS_T3"
,	aKeyLabel[HWNDaddress] 		:= "  3  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space 
		. 	"Hwnd" . "KeybS_T4" . A_Space 
		.	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  4  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_T4
	aHWNDToVariable[HWNDaddress] := "KeybS_T4"
,	aKeyLabel[HWNDaddress] 		:= "  4  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space 
		.	"Hwnd" . "KeybS_T5" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  5  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_T5
	aHWNDToVariable[HWNDaddress] := "KeybS_T5"
,	aKeyLabel[HWNDaddress] 		:= "  5  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space 
		. 	"Hwnd" . "KeybS_T6" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  6  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_T6
	aHWNDToVariable[HWNDaddress] := "KeybS_T6"
,	aKeyLabel[HWNDaddress] 		:= "  6  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space 
		. 	"Hwnd" . "KeybS_T7" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  7  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_T7
	aHWNDToVariable[HWNDaddress] := "KeybS_T7"
,	aKeyLabel[HWNDaddress] 		:= "  7  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space 
		. 	"Hwnd" . "KeybS_T8" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  8  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_T8
	aHWNDToVariable[HWNDaddress] := "KeybS_T8"
,	aKeyLabel[HWNDaddress] 		:= "  8  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space 
		. 	"Hwnd" . "KeybS_T9" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  9  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_T9
	aHWNDToVariable[HWNDaddress] := "KeybS_T9"
,	aKeyLabel[HWNDaddress] 		:= "  9  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space 
		. 	"Hwnd" . "KeybS_T0" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  0  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_T0
	aHWNDToVariable[HWNDaddress] := "KeybS_T0"
,	aKeyLabel[HWNDaddress] 		:= "  0  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space 
		. 	"Hwnd" . "KeybS_TMinus" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  -  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TMinus
	aHWNDToVariable[HWNDaddress] := "KeybS_TMinus"
,	aKeyLabel[HWNDaddress] 		:= "  -  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space 
		. 	"Hwnd" . "KeybS_TEquals" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  =  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TEquals
	aHWNDToVariable[HWNDaddress] := "KeybS_TEquals"
,	aKeyLabel[HWNDaddress] 		:= "  =  "

	Gui, KeybS: Add
		,	Text
		,	% "x+6" . A_Space 
		. 	"Hwnd" . "KeybS_TBackspace" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  ←   "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TBackspace
	aHWNDToVariable[HWNDaddress] := "KeybS_TBackspace"
,	aKeyLabel[HWNDaddress] 		:= "  ←   "

	; raw 2 (14 keys) 
	Gui, KeybS: Add
		,	Text
		,	% "xm" . A_Space . "y+5" . A_Space 
		. 	"Hwnd" . "KeybS_TTab" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "   ⭾  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TTab
	aHWNDToVariable[HWNDaddress] := "KeybS_TTab"
,	aKeyLabel[HWNDaddress] 		:= "   ⭾  "

	Gui, KeybS: Add
		, 	Text
		,   	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TQ" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  Q  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TQ
	aHWNDToVariable[HWNDaddress] := "KeybS_TQ"
,	aKeyLabel[HWNDaddress] 		:= "  Q  "

	Gui, KeybS: Add
		, 	Text
		,   	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TW" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  W  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TW
	aHWNDToVariable[HWNDaddress] := "KeybS_TW"
,	aKeyLabel[HWNDaddress] 		:= "  W  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		.	"Hwnd" . "KeybS_TE" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  E  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TE
	aHWNDToVariable[HWNDaddress] := "KeybS_TE"
,	aKeyLabel[HWNDaddress] 		:= "  E  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		.  	"Hwnd" . "KeybS_TR" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  R  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TR
	aHWNDToVariable[HWNDaddress] := "KeybS_TR"
,	aKeyLabel[HWNDaddress] 		:= "  R  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TT" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  T  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TT
	aHWNDToVariable[HWNDaddress] := "KeybS_TT"
,	aKeyLabel[HWNDaddress] 		:= "  T  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TY" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  Y  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TY
	aHWNDToVariable[HWNDaddress] := "KeybS_TY"
,	aKeyLabel[HWNDaddress] 		:= "  Y  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TU" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  U  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TU
	aHWNDToVariable[HWNDaddress] := "KeybS_TU"
,	aKeyLabel[HWNDaddress] 		:= "  U  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TI" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  I  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TI
	aHWNDToVariable[HWNDaddress] := "KeybS_TI"
,	aKeyLabel[HWNDaddress] 		:= "  I  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TO" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  O  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TO
	aHWNDToVariable[HWNDaddress] := "KeybS_TO"
,	aKeyLabel[HWNDaddress] 		:= "  O  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TP" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  P  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TP
	aHWNDToVariable[HWNDaddress] := "KeybS_TP"
,	aKeyLabel[HWNDaddress] 		:= "  P  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TSquareBracket1" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  [  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TSquareBracket1
	aHWNDToVariable[HWNDaddress] := "KeybS_TSquareBracket1"
,	aKeyLabel[HWNDaddress] 		:= "  [  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TSquareBracket2" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  ]  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TSquareBracket2
	aHWNDToVariable[HWNDaddress] := "KeybS_TSquareBracket2"
,	aKeyLabel[HWNDaddress] 		:= "  ]  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TBackslash" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "   \  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TBackslash
	aHWNDToVariable[HWNDaddress] := "KeybS_TBackslash"
,	aKeyLabel[HWNDaddress] 		:= "  \  "

	;raw 3 (13 keys)
	Gui, KeybS: Add
		, 	Text
		,	% "xm" . A_Space . "y+5" . A_Space 
		. 	"Hwnd" . "KeybS_TCapslock" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "   ⇪   "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TCapslock
	aHWNDToVariable[HWNDaddress] := "KeybS_TCapslock"
,	aKeyLabel[HWNDaddress] 		:= "   ⇪   "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TA" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  A  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TA
	aHWNDToVariable[HWNDaddress] := "KeybS_TA"
,	aKeyLabel[HWNDaddress] 		:= "  A  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TS" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  S  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TS
	aHWNDToVariable[HWNDaddress] := "KeybS_TS"
,	aKeyLabel[HWNDaddress] 		:= "  S  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TD" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  D  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TD
	aHWNDToVariable[HWNDaddress] := "KeybS_TD"
,	aKeyLabel[HWNDaddress] 		:= "  D  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TF" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  F  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TF
	aHWNDToVariable[HWNDaddress] := "KeybS_TF"
,	aKeyLabel[HWNDaddress] 		:= "  F  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TG" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  G  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TG
	aHWNDToVariable[HWNDaddress] := "KeybS_TG"
,	aKeyLabel[HWNDaddress] 		:= "  G  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TH" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  H  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TH
	aHWNDToVariable[HWNDaddress] := "KeybS_TH"
,	aKeyLabel[HWNDaddress] 		:= "  H  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TJ" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  J  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TJ
	aHWNDToVariable[HWNDaddress] := "KeybS_TJ"
,	aKeyLabel[HWNDaddress] 		:= "  J  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TK" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  K  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TK
	aHWNDToVariable[HWNDaddress] := "KeybS_TK"
,	aKeyLabel[HWNDaddress] 		:= "  K  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TL" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  L  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TL
	aHWNDToVariable[HWNDaddress] := "KeybS_TL"
,	aKeyLabel[HWNDaddress] 		:= "  L  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_Tsemicolon" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  `;  "	;semicolon must be escaped in such circumstances
	GuiControlGet, HWNDaddress, HWND, % KeybS_Tsemicolon
	aHWNDToVariable[HWNDaddress] := "KeybS_Tsemicolon"
,	aKeyLabel[HWNDaddress] 		:= "  `;  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TApostrophe" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  '  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TApostrophe
	aHWNDToVariable[HWNDaddress] := "KeybS_TApostrophe"
,	aKeyLabel[HWNDaddress] 		:= "  '  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TEnter" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "     ↵     "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TEnter
	aHWNDToVariable[HWNDaddress] := "KeybS_TEnter"
,	aKeyLabel[HWNDaddress] 		:= "     ↵     "

	;raw 4 (12 keys)
	Gui, KeybS: Add
		, 	Text
		,	% "xm" . A_Space . "y+5" . A_Space 
		. 	"Hwnd" . "KeybS_TLShift" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "     ⇧    "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TLShift
	aHWNDToVariable[HWNDaddress] := "KeybS_TLShift"
,	aKeyLabel[HWNDaddress] 		:= "     ⇧    "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TZ" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  Z  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TZ
	aHWNDToVariable[HWNDaddress] 	:= "KeybS_TZ"
,	aKeyLabel[HWNDaddress] 		:= "  Z  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TX" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  X  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TX
	aHWNDToVariable[HWNDaddress] := "KeybS_TX"
,	aKeyLabel[HWNDaddress] 		:= "  X  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TC" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  C  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TC
	aHWNDToVariable[HWNDaddress] := "KeybS_TC"
,	aKeyLabel[HWNDaddress] 		:= "  C  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TV" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  V  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TV
	aHWNDToVariable[HWNDaddress] := "KeybS_TV"
,	aKeyLabel[HWNDaddress] 		:= "  V  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TB" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  B  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TB
	aHWNDToVariable[HWNDaddress] := "KeybS_TB"
,	aKeyLabel[HWNDaddress] 		:= "  B  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TN" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  N  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TN
	aHWNDToVariable[HWNDaddress] := "KeybS_TN"
,	aKeyLabel[HWNDaddress] 		:= "  N  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TM" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  M  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TM
	aHWNDToVariable[HWNDaddress] := "KeybS_TM"
,	aKeyLabel[HWNDaddress] 		:= "  M  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TComma" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  ,  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TComma
	aHWNDToVariable[HWNDaddress] := "KeybS_TComma"
,	aKeyLabel[HWNDaddress] 		:= "  ,  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TDot" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  .  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TDot
	aHWNDToVariable[HWNDaddress] := "KeybS_TDot"
,	aKeyLabel[HWNDaddress] 		:= "  .  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TSlash" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  /  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TSlash
	aHWNDToVariable[HWNDaddress] := "KeybS_TSlash"
,	aKeyLabel[HWNDaddress] 		:= "  /  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TRShift" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "      ⇧       "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TRShift
	aHWNDToVariable[HWNDaddress] 	:= "KeybS_TRShift"
,	aKeyLabel[HWNDaddress] 		:= "      ⇧       "

	;raw 5 (8 keys)
	Gui, KeybS: Add
		, 	Text
		,	% "xm" . A_Space . "y+5" . A_Space 
		. 	"Hwnd" . "KeybS_TLControl" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "   ⎈  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TLControl
	aHWNDToVariable[HWNDaddress] 	:= "KeybS_TLControl"
,	aKeyLabel[HWNDaddress] 		:= "   ⎈  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TLWin" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "   ⊞  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TLWin
	aHWNDToVariable[HWNDaddress] 	:= "KeybS_TLWin"
,	aKeyLabel[HWNDaddress] 		:= "   ⊞  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TLAlt" . A_Space 
		.	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "   ⎇  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TLAlt
	aHWNDToVariable[HWNDaddress] 	:= "KeybS_TLAlt"
,	aKeyLabel[HWNDaddress] 		:= "   ⎇  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		.	"Hwnd" . "KeybS_TSpace" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "                ␣                 "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TSpace
	aHWNDToVariable[HWNDaddress] 	:= "KeybS_TSpace"
,	aKeyLabel[HWNDaddress] 		:= "                ␣                 "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TRAlt" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "   ⎇  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TRAlt
	aHWNDToVariable[HWNDaddress] 	:= "KeybS_TRAlt"
,	aKeyLabel[HWNDaddress] 		:= "   ⎇  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TRWin" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "   ⊞  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TRWin
	aHWNDToVariable[HWNDaddress] 	:= "KeybS_TRWin"
,	aKeyLabel[HWNDaddress] 		:= "   ⊞  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TFn" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  Fn  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TFn
	aHWNDToVariable[HWNDaddress] := "KeybS_TFn"
,	aKeyLabel[HWNDaddress] 		:= "  Fn  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TRControl" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "   ⎈  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TRControl
	aHWNDToVariable[HWNDaddress] 	:= "KeybS_TRControl"
,	aKeyLabel[HWNDaddress] 		:= "   ⎈  "

	;middle island, first row (3 keys) 
	GuiControlGet,	vControlPos, Pos
		, 	% KeybS_TF12

	Gui, KeybS: Add
		,	Text
		,	% "x" . vControlPosX + vControlPosW + 3 * vXm . A_Space . "y" . vControlPosY . A_Space 
		. 	"Hwnd" . "KeybS_TPrintScreen" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% " PS  "		;PrtScr (Print Screen)
	GuiControlGet, HWNDaddress, HWND, % KeybS_TPrintScreen
	aHWNDToVariable[HWNDaddress] 	:= "KeybS_TPrintScreen"
,	aKeyLabel[HWNDaddress] 		:= " PS  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TPause" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  Pe  "		;Pause
	GuiControlGet, HWNDaddress, HWND, % KeybS_TPause
	aHWNDToVariable[HWNDaddress] 	:= "KeybS_TPause"
,	aKeyLabel[HWNDaddress] 		:= "  Pe  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TMode" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  Me  "		;Mode
	GuiControlGet, HWNDaddress, HWND, % KeybS_TMode
	aHWNDToVariable[HWNDaddress] 	:= "KeybS_TMode"
,	aKeyLabel[HWNDaddress] 		:= "  Me  "

	;middle island, second raw (3 keys) 
	GuiControlGet, vControlPos, Pos
		, 	% KeybS_TPrintScreen

	Gui, KeybS: Add
		, 	Text
		,	% "x" . vControlPosX . A_Space . "y" . vControlPosY + vControlPosH + 10 . A_Space 
		. 	"Hwnd" . "KeybS_TInsert" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% " Ins "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TInsert
	aHWNDToVariable[HWNDaddress] := "KeybS_TInsert"
,	aKeyLabel[HWNDaddress] 		:= " Ins "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_THome" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  ⇱   "		;Home
	GuiControlGet, HWNDaddress, HWND, % KeybS_THome
	aHWNDToVariable[HWNDaddress] := "KeybS_THome"
,	aKeyLabel[HWNDaddress] 		:= "  ⇱   "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TPgUp" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  PU  "		;Page Up
	GuiControlGet, HWNDaddress, HWND, % KeybS_TPgUp
	aHWNDToVariable[HWNDaddress] := "KeybS_TPgUp"
,	aKeyLabel[HWNDaddress] 		:= "  PU  "

	;middle island, third raw (3 keys) 
	GuiControlGet, vControlPos, Pos
		, 	% KeybS_TInsert

	Gui, KeybS: Add
		, 	Text
		,	% "x" . vControlPosX . A_Space . "y" . vControlPosY + vControlPosH + 5 . A_Space 
		. 	"Hwnd" . "KeybS_TDelete" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% " Del "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TDelete
	aHWNDToVariable[HWNDaddress] := "KeybS_TDelete"
,	aKeyLabel[HWNDaddress] 		:= " Del "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TEnd" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  ⇲   "		;Home
	GuiControlGet, HWNDaddress, HWND, % KeybS_TEnd
	aHWNDToVariable[HWNDaddress] := "KeybS_TEnd"
,	aKeyLabel[HWNDaddress] 		:= "  ⇲   "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TPgDn" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  PD  "		;Home
	GuiControlGet, HWNDaddress, HWND, % KeybS_TPgDn
	aHWNDToVariable[HWNDaddress] := "KeybS_TPgDn"
,	aKeyLabel[HWNDaddress] 		:= "  PD  "

	;cursors (4 keys) 
	GuiControlGet, vControlPos, Pos
		, 	% KeybS_TEnd

	Gui, KeybS: Add
		, 	Text
		,	% "x" . vControlPosX + 3 . A_Space . "y" . vControlPosY + vControlPosH * 2 + 5 * 2 . A_Space 
		. 	"Hwnd" . "KeybS_TUp" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  ↑  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TUp
	aHWNDToVariable[HWNDaddress] := "KeybS_TUp"
,	aKeyLabel[HWNDaddress] 		:= "  ↑  "

	Gui, KeybS: Add
		, 	Text
		,	% "y+5" . A_Space 
		. 	"Hwnd" . "KeybS_TDown" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  ↓  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TDown
	aHWNDToVariable[HWNDaddress] := "KeybS_TDown"
,	aKeyLabel[HWNDaddress] 		:= "  ↓  "

	Gui, KeybS: Add
		, 	Text
		,	% "x+5" . A_Space 
		. 	"Hwnd" . "KeybS_TRight" . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  →  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TRight
	aHWNDToVariable[HWNDaddress] := "KeybS_TRight"
,	aKeyLabel[HWNDaddress] 		:= "  →  "

	GuiControlGet, vControlPos, Pos
		, 	% KeybS_TRight

	Gui, KeybS: Add
		, 	Text
		,	% "x+-" . vControlPosW * 3 + 12 . A_Space 
		. 	"Hwnd" . "KeybS_TLeft"  . A_Space 
		. 	"Border" . A_Space 
		.	"g" . "F_OnText"
		,	% "  ←  "
	GuiControlGet, HWNDaddress, HWND, % KeybS_TLeft
	aHWNDToVariable[HWNDaddress] := "KeybS_TLeft"
,	aKeyLabel[HWNDaddress] 		:= "  ←  "

	;date
	GuiControlGet, vControlPos, Pos
		, 	% KeybS_TMode
	Gui, KeybS: Add
		, 	Text
		,	% "x" . vControlPosX + vControlPosW + 10 . A_Space . "y" . vControlPosY . A_Space
		. 	"Hwnd" . "Date"  . A_Space 
		; . 	"Border" . A_Space 
		; .	"g" . "F_OnText"
		,	% A_Year . "-" . A_MM . "-" . A_DD

	;time
	GuiControlGet, vControlPos, Pos
		, 	% KeybS_TPgUp
	Gui, KeybS: Add
		, 	Text
		,	% "x" . vControlPosX + vControlPosW + 10 . A_Space . "y" . vControlPosY . A_Space
		. 	"Hwnd" . "Time"  . A_Space 
		; . 	"Border" . A_Space 
		; .	"g" . "F_OnText"
		,	% A_Hour . ":" . A_Min . ":" . A_Sec

	;overall counter value, all key presses since start
	GuiControlGet, vControlPos, Pos
		, 	% KeybS_TRight
	Gui, KeybS: Add
		, 	Text
		,	% "x" . vControlPosX + vControlPosW + 25 . A_Space . "y" . vControlPosY . A_Space
		. 	"Hwnd" . "OvCount"  . A_Space 
		; . 	"Border" . A_Space 
		; .	"g" . "F_OnText"
		,	% "99 999"	;placeholder, occupies space
	GuiControl, 
		, % OvCount
		, 0

	F_ColorScale()

	Gui, KeybS: Show
		, Hide Center AutoSize
		, % SubStr(A_ScriptName, 1, -4) 

	; OutputDebug, % A_ThisFunc . A_Space . "E" . "`n"
} 
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
KeybSGuiClose(GuiHwnd)	;GuiEvent
{
	global	;assume-global mode of operation
	local	Folder			:= A_ScriptDir . "\" . "Log"	
		,	FileName			:= Folder . "\" . A_Year . A_MM . A_DD . "_" . SubStr(A_ScriptName, 1, -4) . "DailyLog" . ".csv" 
		,	CurrTime			:= A_Year . "-" . A_MM . "-" . A_DD . A_Space . A_Hour . ":" . A_Min . ":" . A_Sec 
		,	Text				:=  ""

	; OutputDebug, % A_ThisFunc . "`n"
	MsgBox, % 4 + 16
		, % SubStr(A_ScriptName, 1, -4)
		, Are you sure you want to exit?	;4 = Yes/No, 16 = Stop Hand
	IfMsgBox, Yes
		ExitApp, 0
	Gui, KeybS: Show
		, Center AutoSize
		, % SubStr(A_ScriptName, 1, -4) 
	return true
}
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
KeybSGuiEscape()	;GuiEvent
{
	Gui, KeybS: Hide
}
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
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