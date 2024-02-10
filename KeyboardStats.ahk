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
#include %A_ScriptDir%\Lib\ctcolors.ahk

F_GuiDefine_Keybs()
	vOverallCounter := 0
,	aKeyboardCounters := {} 
F_InitiateInputHook()
v_InputH.Start()

return
; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
; end of initialization
; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =


; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - FUNCTIONS BLOCK
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
F_InputHookOnKeyUp(ih, VK, SC)	;this function is run whenever Backspace key or LShift or RShift is up 
{
	global	;assume-global mode of operation
	Critical, On
	local	WhatWasUp := GetKeyName(Format("vk{:x}sc{:x}", VK, SC))

	vOverallCounter++
	NewVariableName := "KC_" . WhatWasUp	; Create a variable name dynamically based on WhatWasUp and assign it a value; KC = KeyCounter
	if (!IsSet(%NewVariableName%))
	{
		%NewVariableName% := 0
		aKeyboardCounters.Push(SubStr(NewVariableName, 4)) 
	}
	%NewVariableName%++
	OutputDebug, % "WhatWasUp:" . WhatWasUp . "|" . "NewVariableName:" . NewVariableName . "|" . "%NewVariableName%:" . %NewVariableName%  . "`n"

	; HwndKeybS_TA

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