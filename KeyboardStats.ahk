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


F_ColorScale()


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


; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

; ======================================================================================================================
; AHK 1.1 +
; ======================================================================================================================
; Function:          Helper object to color controls on WM_CTLCOLOR... notifications.
;                    Supported controls are: Checkbox, ComboBox, DropDownList, Edit, ListBox, Radio, Text.
;                    Checkboxes and Radios accept background colors only due to design.
; Namespace:         CTLCOLORS
; AHK version:       1.1.11.01
; Language:          English
; Version:           0.9.01.00/2012-04-05/just me
;                    0.9.02.00/2013-06-26/just me  -  fixed to run on Win 7 x64
;                    0.9.03.00/2013-06-27/just me  -  added support for disabled edit controls
;
; How to use:        To register a control for coloring call
;                       CTLCOLORS.Attach()
;                    passing up to three parameters:
;                       Hwnd        - Hwnd of the GUI control                                   (Integer)
;                       BkColor     - HTML color name, 6-digit hex value ("RRGGBB")             (String)
;                                     or "" for default color
;                       ------------- Optional -------------------------------------------------------------------------
;                       TextColor   - HTML color name, 6-digit hex value ("RRGGBB")             (String)
;                                     or "" for default color
;                    If both BkColor and TextColor are "" the control will not be added and the call returns False.
;
;                    To change the colors for a registered control call
;                       CTLCOLORS.Change()
;                    passing up to three parameters:
;                       Hwnd        - see above
;                       BkColor     - see above
;                       ------------- Optional -------------------------------------------------------------------------
;                       TextColor   - see above
;                    Both BkColor and TextColor may be "" to reset them to default colors.
;                    If the control is not registered yet, CTLCOLORS.Attach() is called internally.
;
;                    To unregister a control from coloring call
;                       CTLCOLORS.Detach()
;                    passing one parameter:
;                       Hwnd      - see above
;
;                    To stop all coloring and free the resources call
;                       CTLCOLORS.Free()
;                    It's a good idea to insert this call into the scripts exit-routine.
;
;                    To check if a control is already registered call
;                       CTLCOLORS.IsAttached()
;                    passing one parameter:
;                       Hwnd      - see above
;
;                    To get a control's Hwnd use either the option "HwndOutputVar" with "Gui, Add" or the command
;                    "GuiControlGet" with sub-command "Hwnd".
;
;                    Properties/methods/functions declared as PRIVATE must not be set/called by the script!
;
; Special features:  On the first call for a specific control class the function registers the CTLCOLORS_OnMessage()
;                    function as message handler for WM_CTLCOLOR messages of this class(es).
;
;                    Buttons (Checkboxes and Radios) do not make use of the TextColor to draw the text, instead of
;                    that they use it to draw the focus rectangle.
;
;                    After displaying the GUI per "Gui, Show" you have to execute "WinSet, Redraw" once.
;                    It's no bad idea to do it using a GuiSize label, because it avoids rare problems when restoring
;                    a minimized window:
;                       GuiSize:
;                          If (A_EventInfo != 1) {
;                             Gui, %A_Gui%:+LastFound
;                             WinSet, ReDraw
;                          }
;                       Return
; ======================================================================================================================
; This software is provided 'as-is', without any express or implied warranty.
; In no event will the authors be held liable for any damages arising from the use of this software.
; ======================================================================================================================
Class CTLCOLORS {
   ; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   ; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   ; PRIVATE Properties and Methods ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   ; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   ; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   ; Registered Controls
   Static Attached := {}
   ; OnMessage Handlers
   Static HandledMessages := {Edit: 0, ListBox: 0, Static: 0}
   ; Message Handler Function
   Static MessageHandler := "CTLCOLORS_OnMessage"
   ; Windows Messages
   Static WM_CTLCOLOR := {Edit: 0x0133, ListBox: 0x134, Static: 0x0138}
   ; HTML Colors (BGR)
   Static HTML := {AQUA:    0xFFFF00, BLACK:   0x000000, BLUE:    0xFF0000, FUCHSIA: 0xFF00FF, GRAY:    0x808080
                 , GREEN:   0x008000, LIME:    0x00FF00, MAROON:  0x000080, NAVY:    0x800000, OLIVE:   0x008080
                 , PURPLE:  0x800080, RED:     0x0000FF, SILVER:  0xC0C0C0, TEAL:    0x808000, WHITE:   0xFFFFFF
                 , YELLOW:  0x00FFFF}
   ; System Colors
   Static SYSCOLORS := {Edit: "", ListBox: "", Static: ""}
   Static Initialize := CTLCOLORS.InitClass()
   ; ===================================================================================================================
   ; PRIVATE SUBCLASS CTLCOLORS_Base  - Base class
   ; ===================================================================================================================
   Class CTLCOLORS_Base {
      __New() {   ; This class is a helper object, you must not instantiate it.
         Return False
      }
      __Delete() {
         This.Free()
      }
   }
   ; ===================================================================================================================
   ; PRIVATE METHOD Init  Class       - Set the base
   ; ===================================================================================================================
   InitClass() {
      This.Base := This.CTLCOLORS_Base
      Return "DONE"
   }
   ; ===================================================================================================================
   ; PRIVATE METHOD CheckColors       - Check parameters BkColor and TextColor not to be empty both
   ; ===================================================================================================================
   CheckColors(BkColor, TextColor) {
      This.ErrorMsg := ""
      If (BkColor = "") && (TextColor = "") {
         This.ErrorMsg := "Both parameters BkColor and TextColor are empty!"
         Return False
      }
      Return True
   }
   ; ===================================================================================================================
   ; PRIVATE METHOD CheckBkColor      - Check parameter BkColor
   ; ===================================================================================================================
   CheckBkColor(ByRef BkColor, Class) {
      This.ErrorMsg := ""
      If (BkColor != "") && !This.HTML.HasKey(BkColor) && !RegExMatch(BkColor, "i)^[0-9A-F]{6}$") {
         This.ErrorMsg := "Invalid parameter BkColor: " . BkColor
         Return False
      }
      BkColor := BkColor = "" ? This.SYSCOLORS[Class]
               : This.HTML.HasKey(BkColor) ? This.HTML[BkColor]
               : "0x" . SubStr(BkColor, 5, 2) . SubStr(BkColor, 3, 2) . SubStr(BkColor, 1, 2)
      Return True
   }
   ; ===================================================================================================================
   ; PRIVATE METHOD CheckTextColor    - Check parameter TextColor
   ; ===================================================================================================================
   CheckTextColor(ByRef TextColor) {
      This.ErrorMsg := ""
      If (TextColor != "") && !This.HTML.HasKey(TextColor) && !RegExMatch(TextColor, "i)^[\dA-F]{6}$") {
         This.ErrorMsg := "Invalid parameter TextColor: " . TextColor
         Return False
      }
      TextColor := TextColor = "" ? ""
                 : This.HTML.HasKey(TextColor) ? This.HTML[TextColor]
                 : "0x" . SubStr(TextColor, 5, 2) . SubStr(TextColor, 3, 2) . SubStr(TextColor, 1, 2)
      Return True
   }
   ; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   ; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   ; PUBLIC Interface ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   ; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   ; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   ; Error message in case of errors
   Static ErrorMsg := ""
   ; ===================================================================================================================
   ; METHOD Attach         Register control for coloring
   ; Parameters:           Hwnd        - HWND of the GUI control                                   (Integer)
   ;                       BkColor     - HTML color name, 6-digit hex value ("RRGGBB")             (String)
   ;                                     or "" for default color
   ;                       ------------- Optional ----------------------------------------------------------------------
   ;                       TextColor   - HTML color name, 6-digit hex value ("RRGGBB")             (String)
   ;                                     or "" for default color
   ; Return values:        On success  - True
   ;                       On failure  - False, CTLCOLORS.ErrorMsg contains additional informations
   ; ===================================================================================================================
   Attach(Hwnd, BkColor, TextColor = "") {
      ; Names of supported classes
      Static ClassNames := {Button: "", ComboBox: "", Edit: "", ListBox: "", Static: ""}
      ; Button styles
      Static BS_CHECKBOX := 0x2
           , BS_RADIOBUTTON := 0x8
      ; Editstyles
      Static ES_READONLY := 0x800
      ; Default class background colors
      Static COLOR_3DFACE := 15
           , COLOR_WINDOW := 5
      ; Initialize default background colors on first call -------------------------------------------------------------
      If (This.SYSCOLORS.Edit = "") {
         This.SYSCOLORS.Static := DllCall("User32.dll\GetSysColor", "Int", COLOR_3DFACE, "UInt")
         This.SYSCOLORS.Edit := DllCall("User32.dll\GetSysColor", "Int", COLOR_WINDOW, "UInt")
         This.SYSCOLORS.ListBox := This.SYSCOLORS.Edit
      }
      ; Check Hwnd -----------------------------------------------------------------------------------------------------
      This.ErrorMsg := ""
      If !(CtrlHwnd := Hwnd + 0)
      Or !DllCall("User32.dll\IsWindow", "UPtr", Hwnd, "UInt") {
         This.ErrorMsg := "Invalid parameter Hwnd: " . Hwnd
         Return False
      }
      If This.Attached.HasKey(Hwnd) {
         This.ErrorMsg := "Control " . Hwnd . " is already registered!"
         Return False
      }
      Hwnds := [CtrlHwnd]
      ; Check control's class ------------------------------------------------------------------------------------------
      Classes := ""
      WinGetClass, CtrlClass, ahk_id %CtrlHwnd%
      This.ErrorMsg := "Unsupported control class: " . CtrlClass
      If !ClassNames.HasKey(CtrlClass)
         Return False
      ControlGet, CtrlStyle, Style, , , ahk_id %CtrlHwnd%
      If (CtrlClass = "Edit")
         Classes := ["Edit", "Static"]
      Else If (CtrlClass = "Button") {
         IF (CtrlStyle & BS_RADIOBUTTON) || (CtrlStyle & BS_CHECKBOX)
            Classes := ["Static"]
         Else
            Return False
      }
      Else If (CtrlClass = "ComboBox") {
         VarSetCapacity(CBBI, 40 + (A_PtrSize * 3), 0)
         NumPut(40 + (A_PtrSize * 3), CBBI, 0, "UInt")
         DllCall("User32.dll\GetComboBoxInfo", "Ptr", CtrlHwnd, "Ptr", &CBBI)
         Hwnds.Insert(NumGet(CBBI, 40 + (A_PtrSize * 2, "UPtr")) + 0)
         Hwnds.Insert(Numget(CBBI, 40 + A_PtrSize, "UPtr") + 0)
         Classes := ["Edit", "Static", "ListBox"]
      }
      If !IsObject(Classes)
         Classes := [CtrlClass]
      ; Check colors ---------------------------------------------------------------------------------------------------
      If !This.CheckColors(BkColor, TextColor)
         Return False
      ; Check background color -----------------------------------------------------------------------------------------
      If !This.CheckBkColor(BkColor, Classes[1])
         Return False
      ; Check text color -----------------------------------------------------------------------------------------------
      If !This.CheckTextColor(TextColor)
         Return False
      ; Activate message handling on the first call for a class --------------------------------------------------------
      For I, V In Classes {
         If (This.HandledMessages[V] = 0)
            OnMessage(This.WM_CTLCOLOR[V], This.MessageHandler)
         This.HandledMessages[V] += 1
      }
      ; Store values for Hwnd ------------------------------------------------------------------------------------------
      Brush := DllCall("Gdi32.dll\CreateSolidBrush", "UInt", BkColor, "UPtr")
      For I, V In Hwnds
         This.Attached[V] := {Brush: Brush, TextColor: TextColor, BkColor: BkColor, Classes: Classes, Hwnds: Hwnds}
      ; Redraw control -------------------------------------------------------------------------------------------------
      DllCall("User32.dll\InvalidateRect", "Ptr", Hwnd, "Ptr", 0, "Int", 1)
      This.ErrorMsg := ""
      Return True
   }
   ; ===================================================================================================================
   ; METHOD Change         Change control colors
   ; Parameters:           Hwnd        - HWND of the GUI control                                   (Integer)
   ;                       BkColor     - HTML color name, 6-digit hex value ("RRGGBB")             (String)
   ;                                     or "" for default color
   ;                       ------------- Optional ----------------------------------------------------------------------
   ;                       TextColor   - HTML color name, 6-digit hex value ("RRGGBB")             (String)
   ;                                     or "" for default color
   ; Return values:        On success  - True
   ;                       On failure  - False, CTLCOLORS.ErrorMsg contains additional informations
   ; Remarks:              If the control isn't registered yet, METHOD Add() is called instead internally.
   ; ===================================================================================================================
   Change(Hwnd, BkColor, TextColor = "") {
      ; Check Hwnd -----------------------------------------------------------------------------------------------------
      This.ErrorMsg := ""
      Hwnd += 0
      If !This.Attached.HasKey(Hwnd)
         Return This.Attach(Hwnd, BkColor, TextColor)
      CTL := This.Attached[Hwnd]
      ; Check BkColor --------------------------------------------------------------------------------------------------
      If !This.CheckBkColor(BkColor, CTL.Classes[1])
         Return False
      ; Check TextColor ------------------------------------------------------------------------------------------------
      If !This.CheckTextColor(TextColor)
         Return False
      ; Store Colors ---------------------------------------------------------------------------------------------------
      If (BkColor <> CTL.BkColor) {
         If (CTL.Brush) {
            DllCall("Gdi32.dll\DeleteObject", "Prt", CTL.Brush)
            This.Attached[Hwnd].Brush := 0
         }
         Brush := DllCall("Gdi32.dll\CreateSolidBrush", "UInt", BkColor, "UPtr")
         This.Attached[Hwnd].Brush := Brush
         This.Attached[Hwnd].BkColor := BkColor
      }
      This.Attached[Hwnd].TextColor := TextColor
      This.ErrorMsg := ""
      DllCall("User32.dll\InvalidateRect", "Ptr", Hwnd, "Ptr", 0, "Int", 1)
      Return True
   }
   ; ===================================================================================================================
   ; METHOD Detach         Stop control coloring
   ; Parameters:           Hwnd        - HWND of the GUI control                                   (Integer)
   ; Return values:        On success  - True
   ;                       On failure  - False, CTLCOLORS.ErrorMsg contains additional informations
   ; ===================================================================================================================
   Detach(Hwnd) {
      This.ErrorMsg := ""
      Hwnd += 0
      If This.Attached.HasKey(Hwnd) {
         CTL := This.Attached[Hwnd].Clone()
         If (CTL.Brush)
            DllCall("Gdi32.dll\DeleteObject", "Prt", CTL.Brush)
         For I, V In CTL.Classes {
            If This.HandledMessages[V] > 0 {
               This.HandledMessages[V] -= 1
               If This.HandledMessages[V] = 0
                  OnMessage(This.WM_CTLCOLOR[V], "")
         }  }
         For I, V In CTL.Hwnds
            This.Attached.Remove(V, "")
         DllCall("User32.dll\InvalidateRect", "Ptr", Hwnd, "Ptr", 0, "Int", 1)
         CTL := ""
         Return True
      }
      This.ErrorMsg := "Control " . Hwnd . " is not registered!"
      Return False
   }
   ; ===================================================================================================================
   ; METHOD Free           Stop coloring for all controls and free resources
   ; Return values:        Always True
   ; ===================================================================================================================
   Free() {
      For K, V In This.Attached
         DllCall("Gdi32.dll\DeleteObject", "Ptr", V.Brush)
      For K, V In This.HandledMessages
         If (V > 0) {
            OnMessage(This.WM_CTLCOLOR[K], "")
            This.HandledMessages[K] := 0
         }
      This.Attached := {}
      Return True
   }
   ; ===================================================================================================================
   ; METHOD IsAttached     Check if the control is registered for coloring
   ; Parameters:           Hwnd        - HWND of the GUI control                                   (Integer)
   ; Return values:        On success  - True
   ;                       On failure  - False
   ; ===================================================================================================================
   IsAttached(Hwnd) {
      Return This.Attached.HasKey(Hwnd)
   }
}
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; PRIVATE Functions ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; ======================================================================================================================
; PRIVATE FUNCTION CTLCOLORS_OnMessage
; This function is destined to handle CTLCOLOR messages. There's no reason to call it manually!
; ======================================================================================================================
CTLCOLORS_OnMessage(wParam, lParam) {
   Global CTLCOLORS
   Static SetTextColor := 0, SetBkColor := 0, Counter := 0
   Critical, 50
   If (SetTextColor = 0) {
      HM := DllCall("Kernel32.dll\GetModuleHandle", "Str", "Gdi32.dll", "UPtr")
      SetTextColor := DllCall("Kernel32.dll\GetProcAddress", "Ptr", HM, "AStr", "SetTextColor", "UPtr")
      SetBkColor := DllCall("Kernel32.dll\GetProcAddress", "Ptr", HM, "AStr", "SetBkColor", "UPtr")
   }
   Hwnd := lParam + 0, HDC := wParam + 0
   If CTLCOLORS.IsAttached(Hwnd) {
      CTL := CTLCOLORS.Attached[Hwnd]
      If (CTL.TextColor != "")
         DllCall(SetTextColor, "Ptr", HDC, "UInt", CTL.TextColor)
      DllCall(SetBkColor, "Ptr", HDC, "UInt", CTL.BkColor)
      Return CTL.Brush
   }
}