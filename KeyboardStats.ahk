/* 
 	Author:      	Maciej Słojewski (mslonik, http://mslonik.pl)
 	Purpose:     	
 	Description: 	
 	License:     	MIT License
	Year:		2024
*/
; -----------Beginning of auto-execute section of the script, directives and general settings -------------------------------------------------
; After the script has been loaded, it begins executing at the top line, continuing until a Return, Exit, hotkey/hotstring label, or the physical end of the script is encountered (whichever comes first). 
#Requires AutoHotkey v1.1.34+ 		; Displays an error and quits if a version requirement is not met.    
#SingleInstance, 		force		; Only one instance of this script may run at a time!
#NoEnv  							; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  							; Enable warnings to assist with detecting common errors.
; #LTrim							; Omits spaces and tabs at the beginning of each line. This is primarily used to allow the continuation section to be indented. Also, this option may be turned on for multiple continuation sections by specifying #LTrim on a line by itself. #LTrim is positional: it affects all continuation sections physically beneath it.
; #KeyHistory, 			10			; KeyHistory is necessary for A_PriorKey
; #HotkeyInterval, 		1000			; Specifies the rate of hotkey activations beyond which a warning dialog will be displayed. Default value = 2000 ms.
; #MaxHotkeysPerInterval, 	200			; Specifies the rate of hotkey activations beyond which a warning dialog will be displayed. Default value = 70.
; #MenuMaskKey, 			vkE8  		; vkE8 is something unassigned; this is important for F_Undo if triggerstring contained "l" and #z (Win + z) is applied as undo character
; ListLines, 			Off			; ListLines is disabled to make it harder to determine how script works.
; SendMode, 			Input		; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir, 		% A_ScriptDir	; Ensures a consistent starting directory.
FileEncoding, 			UTF-16		; Sets the default encoding for FileRead, FileReadLine, Loop Read, FileAppend, and FileOpen(). Unicode UTF-16, little endian byte order (BMP of ISO 10646). Useful for .ini files which by default are coded as UTF-16. https://docs.microsoft.com/pl-pl/windows/win32/intl/code-page-identifiers?redirectedfrom=MSDN Warning! UTF-16 is not recognized by Notepad++ editor (2021), which recognizes correctly UCS-2 (defined by the International Standard ISO/IEC 10646). BMP = Basic Multilingual Plane.
; CoordMode, Caret,		Screen		; Only Screen makes sense for functiofirmadd/ns prepared in this script to handle position of on screen GUIs. 
; CoordMode, ToolTip,		Screen		; Only Screen makes sense for functions prepared in this script to handle position of on screen GUIs. 
; CoordMode, Mouse,		Screen		; Only Screen makes sense for functions prepared in this script to handle position of on screen GUIs.


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
	vControlPos 	:= 0
,	vControlPosX 	:= 0
,	vControlPosY 	:= 0
,	vControlPosW 	:= 0
,	vControlPosH 	:= 0

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


Gui, KeybS: Show
	, Center AutoSize
	, % SubStr(A_ScriptName, 1, -4) 
return

; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

KeybSGuiClose(GuiHwnd)
{
	ExitApp, 0
}

; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =