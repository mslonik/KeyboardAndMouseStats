/* 
 	Author:      	Maciej Słojewski (mslonik, http://mslonik.pl)
 	Purpose:     	Basic heatmap and statistics of pressed keyboard keys, 
				clicked mouse buttons and distance travelled by mouse over a desk.
 	Description: 	Basic text-based GUI is displayed which mimics keyboard layout.
				Also mouse is monitered against clicks, wheel up and down, travelled cursor distance.
				Simple monitoring of pressed keys with heat map.
				Log is saved every hour since script started to work.

				Control: to display individual values for pressed keys
				F1 or ?: to display this info
				F2: to copy current results to Clipboard
				F3: to copy heatmap scale to Clipboard
				F4: to save current results to log
				Left mouse click into key name: current value in tooltip
					displayed for 5 s
	GitHub:		https://github.com/mslonik/KeyboardStats
 	License:     	MIT License
	Year:		2024
*/
; -----------Beginning of auto-execute section of the script, directives and general settings -------------------------------------------------
; After the script has been loaded, it begins executing at the top line, continuing until a Return, Exit, hotkey/hotstring label, or the physical end of the script is encountered (whichever comes first). 
#Requires AutoHotkey v1.1.35+ 		; Displays an error and quits if a version requirement is not met.    
#SingleInstance, 		force		; Only one instance of this script may run at a time!
#NoEnv  							; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  							; Enable warnings to assist with detecting common errors.
#HotkeyInterval, 		1000			; Specifies the rate of hotkey activations beyond which a warning dialog will be displayed. Default value = 2000 ms. Workaround of problem with touchpad on Lenovo ThinkPad T14.
#MaxHotkeysPerInterval, 	200			; Specifies the rate of hotkey activations beyond which a warning dialog will be displayed. Default value = 70. Workaround of problem with touchpad on Lenovo ThinkPad T14.
ListLines, 			Off			; ListLines is disabled to make it harder to determine how script works.
SetWorkingDir, 		% A_ScriptDir	; Ensures a consistent starting directory.
FileEncoding, 			UTF-16		; Sets the default encoding for FileRead, FileReadLine, Loop Read, FileAppend, and FileOpen(). Unicode UTF-16, little endian byte order (BMP of ISO 10646). Useful for .ini files which by default are coded as UTF-16. https://docs.microsoft.com/pl-pl/windows/win32/intl/code-page-identifiers?redirectedfrom=MSDN Warning! UTF-16 is not recognized by Notepad++ editor (2021), which recognizes correctly UCS-2 (defined by the International Standard ISO/IEC 10646). BMP = Basic Multilingual Plane.
; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#include %A_ScriptDir%\Lib\ctcolors.ahk	;https://gist.github.com/AHK-just-me/5882556

	vOverallKCounter 	:= 0		;overall number of recorded keyboard keys which were up after pressing
,	vOverallMCounter	:= 0		;overall number of recorder mouse activities
,	aKeyboardCounters 	:= {}	;array variable to store KC (key counters) variable names (not values of counters, which are stored in variables "KC_" concatenated with variable name) 
,	aHWNDToVariable 	:= {}	;array variable (associative) to store names of HWND variable names and HWND values (hexadecimal addresses)
,	aKeyLabel			:= {}	;array variable to store initial keyboard key labels
,	vLeftClicks		:= 0		;number of LButton mouse clicks
,	vMiddleClicks		:= 0		;number of MButton mouse clicks
,	vRightClicks		:= 0		;number of RButton mouse clicks
,	vRollUpCounts		:= 0		;number of mouse WheelUp steps
,	vRollDownCounts	:= 0		;number of mouse WheelUp steps
,	vDistPix			:= 0		;distance travelled by mouse pointer in [px]
,	vDistM			:= 0		;distance travelled by mouse pointer in [m]
,	vDPI				:= 1600	;actual value for Lenovo mouse M/N: MSU1175

Critical, On
F_GuiDefine_Keybs()
Critical, Off

F_PrepareTrayMenu()
OnMessage(0x06, "F_WM_ACTIVATE")  	;register callback F_WM_ACTIVATE to Windows Message WM_ACTIVATE := 0x0006
F_InitiateInputHook()
v_InputH.Start()
SetTimer,	F_CheckMidnight	;at midnight reset all counters
	, % 1000 * 60			;run every 1 minute: 1000 ms = 1 s, 60 s = 1 min.
SetTimer, F_LogValues		;every hour log counter values
	, % 1000 * 60 * 60		; run every 1 hour: 1000 ms = 1 s,  60 s = 1 min., 60 min. = 1 h
OnExit("F_ExitFunc")
return
; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
; end of initialization
; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

; section of hotkeys

; Monitor left, right, and middle mouse clicks
~LButton Up::
	vLeftClicks++
	vOverallMCounter++
	F_MCalcDist()
return

~RButton Up::	
	vRightClicks++
	vOverallMCounter++
	F_MCalcDist()
return

~MButton Up::	
	vMiddleClicks++
	vOverallMCounter++
	F_MCalcDist()
return

~WheelUp::	
	vRollUpCounts++
	vOverallMCounter++
return

~WheelDown::	
	vRollDownCounts++
	vOverallMCounter++
return

#If WinActive("ahk_id" KeybSHwnd)		;conditional hotkeys
	~LButton::
		Critical, On
		F_UpdateGuiValue()			;update values displayed in GUI each time mouse button is pressed
	return

	~LButton Up::
		vLeftClicks++
		vOverallMCounter++
		F_MCalcDist()
		F_RestoreKLabels() 			;Restore keyboard keys labels
		F_RestoreMLabels()
		F_ColorGuiKeys()  			;Call your function when the specified GUI window is selected
		F_UpdateDateTimeCounter()	;Update some GUI values: date, time, overall counter value
	return

	~MButton::
		Critical, On
		F_UpdateGuiValue()	;update values displayed in GUI each time mouse button is pressed
	return

	~MButton Up::
		vMiddleClicks++
		vOverallMCounter++
		F_MCalcDist()
		F_RestoreKLabels() 			;Restore keyboard keys labels
		F_RestoreMLabels()
		F_ColorGuiKeys()  			;Call your function when the specified GUI window is selected
		F_UpdateDateTimeCounter()	;Update some GUI values: date, time, overall counter value
	return

	~RButton::
		Critical, On
		F_UpdateGuiValue()	;update values displayed in GUI each time mouse button is pressed
	return

	~RButton Up::
		vMiddleClicks++
		vOverallMCounter++
		F_MCalcDist()
		F_RestoreKLabels() 			;Restore keyboard keys labels
		F_RestoreMLabels()
		F_ColorGuiKeys()  			;Call your function when the specified GUI window is selected
		F_UpdateDateTimeCounter()	;Update some GUI values: date, time, overall counter value
	return

	~Control::
		; OutputDebug, % "Ctrl Down" . "`n"
		F_ShowKCount()				;Show values of individual counters
		F_ShowMCount()
		F_ColorGuiKeys()  			;Call your function when the specified GUI window is selected
		F_UpdateDateTimeCounter()	;Update some GUI values: date, time, overall counter value
	return	

	~Control Up::
		; OutputDebug, % "Ctrl Up" . "`n"
		F_RestoreKLabels() 			;Restore keyboard keys labels
		F_RestoreMLabels()
		F_ColorGuiKeys()  			;Call your function when the specified GUI window is selected
		F_UpdateDateTimeCounter()	;Update some GUI values: date, time, overall counter value
	return

	F1::							;to display help info
	?::
		F_TrayHelp()
	return

	F2::
		F_CurrValToClipboard()
	return

	F3::							;to copy heatmap scale to Clipboard
		F_HeatmapToClipboard()
	return

	F4::							;to save current results to log
		F_LogValues()
	return

#If	;end #If

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - FUNCTIONS BLOCK
F_UpdateGuiValue()
{
	global	;assume-global mode of operation
	local	OutputVarWin := 0

	MouseGetPos, , , OutputVarWin, , 2
	; OutputDebug, % "OutputVarWin:" . OutputVarWin . "HwndKeybSHwnd:" . KeybSHwnd . "`n"
	if (OutputVarWin = KeybSHwnd)
	{
		F_ShowKCount()				;Show values of individual counters
		F_ShowMCount()
		F_ColorGuiKeys()  			;Call your function when the specified GUI window is selected
		F_UpdateDateTimeCounter()	;Update some GUI values: date, time, overall counter value
	}
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_CheckMidnight()
{
	global	;assume-global mode of operation
	static 	LastDay		:= A_DD	;keep track of the last day
	local	CurrentDay	:= 0
		,	index		:= 1		;index variable of "for" loop
		,	KeybCounter	:= ""

	CurrentDay	:= A_DD			;get the current day
	if (CurrentDay != LastDay)
	{
		for index in aKeyboardCounters	;reset values of counters
		{
			KeybCounter 	:= "KC_" . aKeyboardCounters[index]
		,	%KeybCounter% 	:= 0
		}
		vOverallKCounter 	:= 0		;overall number of recorded keyboard keys which were up after pressing
	,	vOverallMCounter	:= 0		;overall number of recorder mouse activities
	,	vLeftClicks		:= 0		;number of LButton mouse clicks
	,	vMiddleClicks		:= 0		;number of MButton mouse clicks
	,	vRightClicks		:= 0		;number of RButton mouse clicks
	,	vRollUpCounts		:= 0		;number of mouse WheelUp steps
	,	vRollDownCounts	:= 0		;number of mouse WheelUp steps
	,	vDistPix			:= 0		;distance travelled by mouse pointer in [px]
	,	vDistM			:= 0		;distance travelled by mouse pointer in [m]
	,	LastDay 			:= CurrentDay
	}
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_PrepareTrayMenu()
{
	Menu, Tray
		, NoMainWindow
	Menu, Tray
		, Tip
		, % SubStr(A_ScriptName, 1, -4)
	Menu, Tray
		, NoStandard
	Menu, Tray
		, Add
		, % SubStr(A_ScriptName, 1, -4)
		, F_TrayShowKeybGui
	Menu, Tray
		, Default
		, % SubStr(A_ScriptName, 1, -4)
	Menu, Tray
		, Add
	Menu, Tray
		, Add
		, Help
		, F_TrayHelp
	Menu, Tray
		, Add
		, About
		, F_About
	Menu, Tray
		, Add
		, Exit
		, F_TrayExit
	Menu, Tray
		, Click
		, 1
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_MCalcDist()
{
	global	;assume-global mode of operation
	static	PrevX 	:= 0
		,	PrevY 	:= 0
	local	NewX		:= 0
		,	NewY		:= 0
		,	DistPix	:= 0
		,	Temp		:= 0

	MouseGetPos, NewX, NewY
	if (NewX != PrevX) or (NewY != PrevY)
	{
		DistPix		:= Floor(Sqrt((NewX - PrevX) ** 2 + (NewY - PrevY) ** 2)) 
		vDistPix	 	+= DistPix
		Temp			:= DistPix / vDPI	;in [''] = inches
		vDistM		+= Temp * 0.0254
		PrevX		:= NewX
	,	PrevY		:= NewY
	}
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_TrayExit()
{
	; OutputDebug, % A_ThisFunc . "`n"
	ExitApp, 0
} 
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_About()
{
	MsgBox, 64
		, % SubStr(A_ScriptName, 1, -4)
		,
(LTrim
 	Author:      	Maciej Słojewski (mslonik, http://mslonik.pl)
 	Description: 	Basic text-based GUI is displayed which mimics keyboard layout.
	GitHub:		https://github.com/mslonik/KeyboardStats
 	License:     	MIT License
	Year:		2024
)
} 
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_CurrValToClipboard()
{
	global	;assume-global mode of operation

	Clipboard := ""
,	Clipboard := F_PrepareCurrentVal()
	ClipWait
	MsgBox, 64
		, % SubStr(A_ScriptName, 1, -4)
		, Current values were copied into Clipboard
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_HeatmapToClipboard()
{
	global	;assume-global mode of operation
	local	index		:= 1
		,	temp			:= "" 

	Clipboard := ""
	for index in rgbColors 
		temp .= rgbColors[index] . "`n"  
	Clipboard := temp
	ClipWait
	MsgBox, 64
		, % SubStr(A_ScriptName, 1, -4)
		, Heatmap scale was copied into Clipboard
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_RestoreMLabels()
{
	global	;assume-global mode of operation

	GuiControl, 
		, % MBLeft
		, % "  left  "

	GuiControl, 
		, % MBMiddle
		, % " middle "

	GuiControl, 
		, % MBRight
		, % " right "

	GuiControl, 
		, % RollUp
		, % "  up  "

	GuiControl, 
		, % RollDown
		, % " down "

}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_RestoreKLabels()
{
	global	;assume-global mode of operation
	local	WhichHWND		:= 0

	for WhichHWND in aKeyLabel
		GuiControl,  
		,	% WhichHWND
		,	% aKeyLabel[WhichHWND] 
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_TrayHelp()
{
	MsgBox, 64
		, % SubStr(A_ScriptName, 1, -4)
		, 
(LTrim
	Simple monitoring of pressed keys with heat map.
	Mouse: clicks, wheel up/down, travelled distance
	Log is saved every hour since script started to work.
	For more information visit:
	https://github.com/mslonik/KeyboardAndMouseStats
	Press Ctrl+C to copy this message box into a clipboard.

	When GUI is active:
	
	Control up/down: toggle individual values for pressed keys
	Mouse click up/down: toggle individual values for pressed keys
	F1 or ?: to display this info
	F2: to copy current results to Clipboard
	F3: to copy heatmap scale to Clipboard
	F4: to save current results to log
	Left mouse click into key name: current value in tooltip
		displayed for 5 s
)
} 
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_TrayShowKeybGui()
{
	; OutputDebug, % A_ThisFunc . "`n"
	Gui, KeybS: Show, Restore
	Gui, KeybS: +LastFound		;this is described in ctcolors.ahk as a trick to redraw controls of a window
     WinSet, ReDraw				;this is described in ctcolors.ahk as a trick to redraw controls of a window
	F_ColorGuiKeys()  			;Call your function when the specified GUI window is selected
	F_UpdateDateTimeCounter()	;Update some GUI values: date, time, overall counter value
} 
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_ExitFunc(ExitReason)	;a function to be called automatically whenever the script exits. 
{
	global	;assume-global mode of operation
	local	Folder			:= A_ScriptDir . "\" . "Log"	
		,	FileName			:= Folder . "\" . A_Year . A_MM . A_DD . "_" . SubStr(A_ScriptName, 1, -4) . "DailyLog" . ".csv" 
		,	CurrTime			:= A_Year . "-" . A_MM . "-" . A_DD . A_Space . A_Hour . ":" . A_Min . ":" . A_Sec 
		,	Text				:=  ""

	Switch ExitReason 
	{
		Case "Logoff", "Shutdown":
			Text		:= CurrTime . A_Space . "Logoff or Shutdown…" . "`n"
		Case "Exit":
			; OutputDebug, % "Exit" . "`n"
			Text		:= CurrTime . A_Space . "User closed window…" . "`n"
		Default:
			MsgBox, % 4 + 16, % SubStr(A_ScriptName, 1, -4), Are you sure you want to exit?	;4 = Yes/No, 16 = Stop Hand
			IfMsgBox, Yes
				Text	:= CurrTime . A_Space . "User exits or reloads…" . "`n"
	}
	FileAppend, % Text
		, % FileName
		, UTF-8				;encoding
	F_LogValues()				;Values are logged after each check
	; Do not call ExitApp -- that would prevent other callbacks from being called.
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_MouseText()	;it doesn't work anymore
{
	global	;assume-global mode of operation
	local	vHWND 		:= 0
		,	OutputVar 	:= 0

	MouseGetPos, , , , vHWND, 2		;vHWND contains HWND of text control in hexadecimal format
	GuiControlGet, OutputVar, , vHWND
	ToolTip, % OutputVar			;show information on screen
	SetTimer, F_RemoveToolTip, -5000	;"-" = one time only, 5000 ms = 5 s
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_OnText()	;when text control is clicked with mouse ;it doesn't work anymore
{
	global	;assume-global mode of operation
	local	vHWND 	:= 0
		,	index	:= 1
		,	vHWNDvarN	:= "" 
		,	vCounterV	:= 0

	MouseGetPos, , , , vHWND, 2		;vHWND contains HWND of text control in hexadecimal format
	vHWND := Format("{:u}", vHWND)	;conversion of vHWND from hexadecimal to decimal format (unsigned integer) 
	for index in aHWNDToVariable		;search array variable for value associated to vHWND
		if (index = vHWND) 
		{
			vHWNDvarN := aHWNDToVariable[vHWND] 
			break
		}
	vHWNDvarN := SubStr(vHWNDvarN, 8)	;remove the first 7 characters, prefix: "KeybS_T"
	vHWNDvarN := "KC_" . vHWNDvarN	;add prefix "KC_" to get variable name in which value is stored
	if (!IsSet(%vHWNDvarN%))			;if such dynamic variable doesn't exist (wasn't yet declared), what means there was no such a key presses yet 
		return
	vCounterV := %vHWNDvarN%			;get value of counter
	ToolTip, % vCounterV			;show information on screen
	SetTimer, F_RemoveToolTip, -5000	;"-" = one time only, 5000 ms = 5 s
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
			F_ColorGuiKeys()  			;Call your function when the specified GUI window is selected
			F_UpdateDateTimeCounter()	;Update some GUI values: date, time, overall counter value
		}
    	}
	return 0	;documentation says about it
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_PrepareCurrentVal()
{
	global	;assume-global mode of operation
	local	index 		:= 1		;index variable for "for" loop
		,	WhichKeyName 	:= ""
		,	VarNameTemp	:= ""
		,	KCvalue		:= 0		;Key Counter value
		,	Text			:= ""	;what to put in the log
		,	temp			:= ""

	Text 			:= A_Year . "-" . A_MM . "-" . A_DD . A_Space . A_Hour . ":" . A_Min . ":" . A_Sec . "`n"
	Text				.= "Overall keyboard" 	. "," . vOverallKCounter . "`n"
	Text				.= "Overall mouse" 		. "," . vOverallMCounter . "`n"
	for index in aKeyboardCounters
	{
		WhichKeyName	:= aKeyboardCounters[index]
	,	VarNameTemp 	:= "KC_" . WhichKeyName				; KC = KeyCounter
	,	KCvalue 		:= %VarNameTemp%					; KC values are stored under dynamically generated variable
		Text			.= WhichKeyName . "," . A_Space . KCvalue . ";"
	}
	Text				.= "`n`n"
	Text				.= "LButton" 		. "," . A_Space . vLeftClicks 	. ";"
	Text				.= "MButton" 		. "," . A_Space . vMiddleClicks 	. ";"
	Text				.= "RButton" 		. "," . A_Space . vRightClicks	. ";"
	Text				.= "WheelUp" 		. "," . A_Space . vRollUpCounts	. ";"
	Text				.= "WheelDown" 	. "," . A_Space . vRollDownCounts	. ";"
	temp	:= F_FormatValToStr(vDistM)
,	temp	:= Format("{1:-6.2f}", temp)
	Text				.= "Dist. [m]"		. "," . A_Space . temp			. ";"
	Text				.= "Dist. [px]"	. "," . A_Space . vDistPix		. ";"
	Text				.= "mouse DPI"		. "," . A_Space . vDPI			. ";"
	Text				.= "`n`n"
	return Text
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_LogValues()
{
	global	;assume-global mode of operation
	local	Folder		:= ""
		,	FileName		:= ""
		,	Text			:= ""

	Text 			:= F_PrepareCurrentVal()
,	Folder			:= A_ScriptDir . "\" . "Log"
,	FileName			:= Folder . "\" . A_Year . A_MM . A_DD . "_" . SubStr(A_ScriptName, 1, -4) . "DailyLog" . ".csv" 

	if (!InStr(FileExist(Folder), "D"))
	{
		; OutputDebug, % "No folder:" . ErrorLevel . "`n"
		FileCreateDir, % Folder
		; OutputDebug, % "ErrorLevel:" . ErrorLevel . "`n"
	}

	FileAppend, % Text
		, % FileName
		, UTF-8										;encoding
	; OutputDebug, % "ErrorLevel:" . ErrorLevel . "`n"
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_FormatValToStr(Counter)
{
	global	;assume-global mode of operation
	local	TempStr	 	:= Counter . "" 	;convert a number to a text string
		,	FormLength	:= StrLen(TempStr)
		,	FormattedStr	:= ""
		,	ThreeChar		:= ""
		,	ThreeChar2	:= ""

	Switch FormLength	;set space as thousand separator
	{
		Case 4, 5, 6:
			ThreeChar		:= SubStr(TempStr, -2)
		,	TempStr		:= SubStr(TempStr, 1, FormLength - 3)
		,	FormattedStr	:= TempStr . A_Space . ThreeChar
		Case 7, 8:
			ThreeChar		:= SubStr(TempStr, -2)
		,	TempStr		:= SubStr(TempStr, 1, FormLength - 3)
		,	ThreeChar2	:= SubStr(TempStr, -2)
		,	FormattedStr	:= TempStr . A_Space . ThreeChar2 . A_Space . ThreeChar
		Default:
			FormattedStr	:= TempStr
	}
	return FormattedStr
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_UpdateDateTimeCounter()
{
	global	;assume-global mode of operation
	local	temp := 0

	GuiControl, 
		, % Date							;HWND identifier of text control
		, % A_Year . "-" . A_MM . "-" . A_DD	;update the date
	GuiControl, 
		, % Time							;HWND identifier of text control
		, % A_Hour . ":" . A_Min . ":" . A_Sec	;update the time

	GuiControl, 
		, % OvKCount						;HWND identifier of text control
		, % F_FormatValToStr(vOverallKCounter)	;update total counter value

	GuiControl, 
		, % OvMCount						;HWND identifier of text control
		, % F_FormatValToStr(vOverallMCounter)	;update total counter value
} 
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_ShowMCount()
{
	global	;assume-global mode of operation
	local	temp := 0

	GuiControl, 
		, % MBLeft
		, % vLeftClicks

	GuiControl, 
		, % MBMiddle
		, % vMiddleClicks

	GuiControl, 
		, % MBRight
		, % vRightClicks

	GuiControl, 
		, % RollUp
		, % vRollUpCounts

	GuiControl, 
		, % RollDown
		, % vRollDownCounts

	GuiControl,
		, % Distpx
		, % F_FormatValToStr(vDistPix)

	temp	:= F_FormatValToStr(vDistM)
,	temp	:= Format("{1:-6.2f}", temp)
	GuiControl,
		, % Distm
		, % temp
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_ShowKCount()
{
	global	;assume-global mode of operation
	local	index 		:= 1	
		,	WhichHWND		:= "" 
		,	CntVarName	:= ""

	for index in aKeyboardCounters
	{
		WhichHWND		:= "KeybS_T" . aKeyboardCounters[index]
	,	CntVarName 	:= "KC_" . aKeyboardCounters[index]	; KC = KeyCounter
		GuiControl,  
		,	% %WhichHWND%
		,	% %CntVarName%
	}
} 
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_ColorGuiKeys() 
{
	global	;assume-global mode of operation
	local	index 		:= 1
		,	CntVarName 	:= ""
		,	CntVal		:= 0
		,	vWhichColor 	:= 0
		,	WhichHWND		:= ""
		,	MaxVal		:= 0
		,	WhenDarkLight	:= 40	;if the background is dark (see color scale), set white color of text

	for index in aKeyboardCounters	;search for maximum value
	{
		CntVarName 	:= "KC_" . aKeyboardCounters[index]	; KC = KeyCounter
	,	CntVal		:= %CntVarName%
		if (CntVal > MaxVal)
			MaxVal 	:= CntVal
	}

	if (vLeftClicks > MaxVal)
		MaxVal		:= vLeftClicks

	if (vMiddleClicks > MaxVal)
		MaxVal		:= vMiddleClicks

	if (vRightClicks > MaxVal)
		MaxVal		:= vRightClicks

	if (vRollUpCounts > MaxVal)
		MaxVal		:= vRollUpCounts

	if (vRollDownCounts > MaxVal)
		MaxVal		:= vRollDownCounts

	; OutputDebug, % A_ThisFunc . A_Space . "vOverallKCounter:" . vOverallKCounter . "`n"
	; OutputDebug, % "MaxVal:" . MaxVal . "`n"
	index 			:= 1
	for index in aKeyboardCounters
	{
		WhichHWND		:= "KeybS_T" 	. aKeyboardCounters[index]
	,	CntVarName 	:= "KC_" 		. aKeyboardCounters[index]	; KC = KeyCounter
	,	CntVal 		:= %CntVarName%
		; OutputDebug, % aKeyboardCounters[index] . "|" . CntVal . "`n"
	,	vWhichColor 	:= Ceil((CntVal / MaxVal) * 100)	;Floor = rounding down to the nearest integer
		; OutputDebug, % "WhichHWND:" . WhichHWND . "|" . "%WhichHWND%:" . %WhichHWND% . "|" . "ColorArg:" . vWhichColor . "|" . "ColorVal:" . rgbColors[vWhichColor] . "`n"
		if (!IsSet(%WhichHWND%))						;It means there is no such key in GUI layout: such text was not defined, so it can't be colored
			Continue								;Skips the rest of a loop statement's current iteration and begins a new one.
		if (vWhichColor < WhenDarkLight)				;if the background is dark (see color scale), set white color of text
			CTLCOLORS.Change(%WhichHWND%, rgbColors[vWhichColor], "FFFFFF")
		else
			CTLCOLORS.Change(%WhichHWND%, rgbColors[vWhichColor], "")
	}

	if (vLeftClicks > 0)
	{
		vWhichColor 	:= Ceil((vLeftClicks / MaxVal) * 100)	;Floor = rounding down to the nearest integer
		if (vWhichColor < WhenDarkLight)				;if the background is dark (see color scale), set white color of text
			CTLCOLORS.Change(MBLeft, rgbColors[vWhichColor], "FFFFFF")
		else
			CTLCOLORS.Change(MBLeft, rgbColors[vWhichColor], "")
	}

	if (vMiddleClicks > 0)
	{
		vWhichColor 	:= Ceil((vMiddleClicks / MaxVal) * 100)	;Floor = rounding down to the nearest integer
		if (vWhichColor < WhenDarkLight)				;if the background is dark (see color scale), set white color of text
			CTLCOLORS.Change(MBMiddle, rgbColors[vWhichColor], "FFFFFF")
		else
			CTLCOLORS.Change(MBMiddle, rgbColors[vWhichColor], "")
	}

	if (vRightClicks > 0)
	{
		vWhichColor 	:= Ceil((vRightClicks / MaxVal) * 100)	;Floor = rounding down to the nearest integer
		if (vWhichColor < WhenDarkLight)				;if the background is dark (see color scale), set white color of text
			CTLCOLORS.Change(MBRight, rgbColors[vWhichColor], "FFFFFF")
		else
			CTLCOLORS.Change(MBRight, rgbColors[vWhichColor], "")
	}

	if (vRollUpCounts > 0)
	{
		vWhichColor 	:= Ceil((vRollUpCounts / MaxVal) * 100)	;Floor = rounding down to the nearest integer
		if (vWhichColor < WhenDarkLight)				;if the background is dark (see color scale), set white color of text
			CTLCOLORS.Change(RollUp, rgbColors[vWhichColor], "FFFFFF")
		else
			CTLCOLORS.Change(RollUp, rgbColors[vWhichColor], "")
	}

	if (vRollDownCounts > 0)
	{
		vWhichColor 	:= Ceil((vRollDownCounts / MaxVal) * 100)	;Floor = rounding down to the nearest integer
		if (vWhichColor < WhenDarkLight)				;if the background is dark (see color scale), set white color of text
			CTLCOLORS.Change(RollDown, rgbColors[vWhichColor], "FFFFFF")
		else
			CTLCOLORS.Change(RollDown, rgbColors[vWhichColor], "")
	}
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_InitiateInputHook()
{
	global	;assume-global mode of operation

	v_InputH 				:= InputHook("I5 V L0")			
,	v_InputH.OnKeyUp 		:= Func("F_InputHookOnKeyUp")
,	v_InputH.OnEnd			:= Func("F_InputHookOnEnd")
,	v_InputH.KeyOpt("{All}", "N")	;Necessary if only OnKeyUp is present in the code; "N" = Notify
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_InputHookOnKeyUp(ih, VK, SC)
{
	global	;assume-global mode of operation
	Critical, On
	local	WhatWasUp := GetKeyName(Format("vk{:x}sc{:x}", VK, SC))

	; OutputDebug, % "WhatWasUp:" . WhatWasUp . "`n"
	if (WhatWasUp = "")
	{
		MsgBox, 64
			, % SubStr(A_ScriptName, 1, -4)
			, % "Unrecognized key name." . "`n" . "Virtual Key (VK):" . VK . A_Space . "Scan Code (SC):" SC
			, 5
		return
	}
	vOverallKCounter++
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
	; OutputDebug, % "NewVariableName:" . NewVariableName . "`n"
	
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

	; OutputDebug, % A_ThisFunc . "`n" 
	if (Reason = "Max")
		ih.Start()
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -