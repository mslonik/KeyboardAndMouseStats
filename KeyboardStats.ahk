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
; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#include %A_ScriptDir%\Lib\ctcolors.ahk	;https://gist.github.com/AHK-just-me/5882556

	vOverallCounter 	:= 0		;overall number of recorded keyboard keys which were up after pressing
,	aKeyboardCounters 	:= {}	;array variable to store KC (key counters) variable names (not values of counters, which are stored in variables "KC_" concatenated with variable name) 
,	aHWNDToVariable 	:= {}	;array variable (associative) to store names of HWND variable names and HWND values (hexadecimal addresses)

Critical, On
F_GuiDefine_Keybs()
Critical, Off
OnMessage(0x06, "F_WM_ACTIVATE")  	;register callback F_WM_ACTIVATE to Windows Message WM_ACTIVATE := 0x0006
F_InitiateInputHook()
v_InputH.Start()
return
; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
; end of initialization
; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - FUNCTIONS BLOCK
F_OnText()	;when text control is clicked with mouse
{
	global	;assume-global mode of operation
	local	vHWND 	:= 0
		,	index	:= 1
		,	vHWNDvarN	:= "" 
		,	vCounterV	:= 0
		,	FlagFound	:= false

	MouseGetPos, , , , vHWND, 2		;vHWND contains HWND of text control in hexadecimal format
	vHWND := Format("{:u}", vHWND)	;conversion of vHWND from hexadecimal to decimal format (unsigned integer) 
	for index in aHWNDToVariable		;search array variable for value associated to vHWND
		if (index = vHWND) 
		{
			vHWNDvarN := aHWNDToVariable[vHWND] 
			FlagFound	:= true
			break
		}
	if (FlagFound)
	{
		vHWNDvarN := SubStr(vHWNDvarN, 8)	;remove the first 7 characters, prefix: "KeybS_T"
		vHWNDvarN := "KC_" . vHWNDvarN	;add prefix "KC_" to get variable name in which value is stored
		vCounterV := %vHWNDvarN%			;get value of counter
		ToolTip, % vCounterV			;show information on screen
		SetTimer, F_RemoveToolTip, -5000	;"-" = one time only, 5000 ms = 5 s
	}	
} 
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_RemoveToolTip()
{
	Tooltip							;with no arguments just hides the tooltips
} 
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_WM_ACTIVATE(wParam, lParam) ; Check if the GUI window is being activated
; msg: The `msg` parameter is typically used to represent the message identifier. However, in the case of `OnMessage()`, AutoHotkey already knows which message we're handling because we specify it explicitly when registering the message handler. Therefore, there's no need to pass `msg` as a parameter to the user-defined function.
; hwnd: The `hwnd` parameter represents the handle of the window that received the message. In the case of `OnMessage()`, the `hwnd` is implicit and is not passed as a parameter to the user-defined function. Instead, the `hwnd` is available within the `WM_ACTIVATE` function as `lParam`. 
; - `wParam`: This parameter typically carries additional information about the message being sent. In the case of the `WM_ACTIVATE` message, `wParam` indicates the activation state of the window. Specifically:
;   - `wParam = 1` indicates that the window is being activated.
;   - `wParam = 2` indicates that the window is being deactivated.
; - `lParam`: This parameter carries additional information specific to the message being sent. For the `WM_ACTIVATE` message, `lParam` contains the handle (HWND) of the window being activated or deactivated.
; https://learn.microsoft.com/en-us/windows/win32/inputdev/wm-activate
{
	global	;assume-global mode of operation
	Critical, On	;documentation says about it
	; OutputDebug, % A_ThisFunc . "|" . "wParam:" . wParam . "|" . "lParam:" . lParam . "`n"
	if ((wParam = 1) || (wParam = 2))
	{  ; wParam 1 = activated by mouse, 2 = activated by keyboard ;for some reasons the lparam is always returned as null. In official Microsoft documentation: "This handle can be NULL." without any further explanation.
		if WinActive(("ahk_id" KeybSHwnd))		; Check if the GUI window is active
		{
          	F_ColorGuiKeys()  ; Call your function when the specified GUI window is selected
			F_UpdateDateTimeCounter()
		}
    	}
	return 0	;documentation says about it
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_UpdateDateTimeCounter()
{
	global	;assume-global mode of operation

	GuiControl, 
		, % Date							;HWND identifier of text control
		, % A_Year . "-" . A_MM . "-" . A_DD	;update the date
	GuiControl, 
		, % Time							;HWND identifier of text control
		, % A_Hour . ":" . A_Min . ":" . A_Sec	;update the time
	GuiControl, 
		, % OvCount						;HWND identifier of text control
		, % vOverallCounter					;update total counter value
} 
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_ColorGuiKeys() 
{
	global	;assume-global mode of operation
	local	index 		:= 1
		,	VarNameTemp 	:= ""
		,	RefTemp 		:= 0
		,	vWhichColor 	:= 0
		,	WhichText		:= ""
		,	MaxVal		:= 0

	for index in aKeyboardCounters	;search for maximum value
	{
		VarNameTemp 	:= "KC_" . aKeyboardCounters[index]	; KC = KeyCounter
	,	RefTemp 		:= %VarNameTemp%
		if (RefTemp > MaxVal)
			MaxVal 	:= RefTemp
	}

	; OutputDebug, % A_ThisFunc . A_Space . "vOverallCounter:" . vOverallCounter . "`n"
	; OutputDebug, % "MaxVal:" . MaxVal . "`n"
	index 			:= 1
	for index in aKeyboardCounters
	{
		WhichText		:= "KeybS_T"
	,	VarNameTemp 	:= "KC_" . aKeyboardCounters[index]	; KC = KeyCounter
	,	RefTemp 		:= %VarNameTemp%
		; OutputDebug, % aKeyboardCounters[index] . "|" . RefTemp . "`n"
	,	vWhichColor 	:= Floor((RefTemp / MaxVal) * 100)	;Floor = rounding down to the nearest integer
		WhichText 	.= aKeyboardCounters[index]
		; OutputDebug, % "WhichText:" . WhichText . "|" . "%WhichText%:" . %WhichText% . "|" . "ColorArg:" . vWhichColor . "|" . "ColorVal:" . rgbColors[vWhichColor] . "`n"
		CTLCOLORS.Change(%WhichText%, rgbColors[vWhichColor], "")
	}
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_InitiateInputHook()
{
	global	;assume-global mode of operation

	; OutputDebug, % A_ThisFunc . "`n" 
	v_InputH 				:= InputHook("I5 V L0")			
; ,	v_InputH.OnKeyDown		:= Func("F_OnKeyDown")
,	v_InputH.OnKeyUp 		:= Func("F_InputHookOnKeyUp")
,	v_InputH.OnEnd			:= Func("F_InputHookOnEnd")
,	v_InputH.KeyOpt("{All}", "N")	;Necessary if only OnKeyUp is present in the code; "N" = Notify
	; OutputDebug, % A_ThisFunc . A_Space . "ini_MinSendLevel:" . ini_MinSendLevel . "|" . A_Space . v_InputH.MinSendLevel . "`n"
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_InputHookOnKeyUp(ih, VK, SC)
{
	global	;assume-global mode of operation
	Critical, On
	local	WhatWasUp := GetKeyName(Format("vk{:x}sc{:x}", VK, SC))

	; OutputDebug, % "WhatWasUp:" . WhatWasUp . "`n"
	vOverallCounter++
	NewVariableName := ""
	Switch, WhatWasUp
	{
		Case "``":	NewVariableName := "KC_" . "Backtick"
		Case "-":		NewVariableName := "KC_" . "Minus"
		Case "=":		NewVariableName := "KC_" . "Equals"
		Case "[":		NewVariableName := "KC_" . "SquareBracket1"
		Case "]":		NewVariableName := "KC_" . "SquareBracket2"
		Case "\":		NewVariableName := "KC_" . "Backslash"
		Case ";":		NewVariableName := "KC_" . "Semicolon"
		Case "'":		NewVariableName := "KC_" . "Apostrophe"
		Case ",":		NewVariableName := "KC_" . "Comma"
		Case ".":		NewVariableName := "KC_" . "Dot"
		Case "/":		NewVariableName := "KC_" . "Slash"
		Default:		NewVariableName := "KC_" . WhatWasUp	; Create a variable name dynamically based on WhatWasUp and assign it a value; KC = KeyCounter
	}
	OutputDebug, % "NewVariableName:" . NewVariableName . "`n"
	
	if (!IsSet(%NewVariableName%))
	{
		%NewVariableName% := 0
		aKeyboardCounters.Push(SubStr(NewVariableName, 4)) 
	}
	%NewVariableName%++
	Critical, Off
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_InputHookOnEnd(ih)	;for debugging purposes
{
	global	;assume-global mode of operation
	local 	KeyName 	:= ih.EndKey, Reason	:= ih.EndReason

	OutputDebug, % A_ThisFunc . "`n" 
	; if (ini_THLog)	
	; 	FileAppend, % A_Hour . ":" . A_Min . ":" . A_Sec . "|" . ++v_LogCounter . "|" . "OnEnd" . "|" . KeyName 
	; 		. "|" . "GetKeyName:" 	. "|" . GetKeyName(KeyName) 
	; 		. "|" . "GetKeyVK:" 	. "|" . GetKeyVK(KeyName)
	; 		. "|" . "GetKeySC:" 	. "|" . GetKeySC(KeyName)
	; 		. "|" . "EndReason:"	. "|" . Reason
	; 		. "|" . "`n", % v_LogFileName

	if (Reason = "Max")
		ih.Start()
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -