#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

/*
SetTitleMatchMode, Mode
SetTitleMatchMode, Speed

Modes:
------------------
1: A window's title must start with the specified WinTitle to be a match.
2: A window's title can contain WinTitle anywhere inside it to be a match.
3: A window's title must exactly match WinTitle to be a match.
RegEx: [v1.0.45+] Changes WinTitle, WinText, ExcludeTitle, and ExcludeText to accept regular expressions. Do not enclose such expressions in quotes when using them with commands. For example: WinActivate Untitled.*Notepad.

Speeds:
-------------------
Fast: This is the default behavior. Performance may be substantially better than Slow, but certain types of controls are not detected. For instance, text is typically detected within Static and Button controls, but not Edit controls, unless they are owned by the script.

Slow: Can be much slower, but works with all controls which respond to the WM_GETTEXT message.
*/
SetTitleMatchMode, 2
SetTitleMatchMode, Fast

;;===================================================================
;; Define Globals
;;===================================================================
global GW5_MSGBOX_CLASS := "ahk_class #32770"

global GW500_ERROR_MSGBOX_TEXT := "We have detected the following fatal error and cannot continue"
global GW5_STARTUP_ERROR_TEXT := "The procedure entry point DXGIGetDebugInterface1 could not be located"
global GW5_CRASH_MSGBOX_TEXT := "The exception unknown software exception"

global GAME_PROCESS_NAME := "Gears5.exe"
global GAME_WINDOW_NAME := "Gears 5"

global G_KEYPRESS_DURA_MS = 20
global G_KEYPRESS_WAIT_MS = 20
global G_BUFFER_WAIT_MS   = 65

/*
-------------------------------------
Initial startup error:
-------------------------------------
	Window Title, Class, and Process:
		Gears5.exe - Entry Point Not Found
		ahk_class #32770
		ahk_exe csrss.exe

	Visible Text:
		OK
		The procedure entry point DXGIGetDebugInterface1 could not be located in the dynamic link library dxgi.dll.

-------------------------------------
For the GW50x errors:
-------------------------------------
	Window Title, Class, and Process:
		Gears 5
		ahk_class #32770
		ahk_exe Gears5.exe

	Visible Text:
		OK
		Help
		We have detected the following fatal error and cannot continue:

		The graphics card stopped responding. Please make sure your graphics card drivers are updated to the latest from the manufacturer.

		(Code: GW502)

		Click on the 'Help' button below to view details on error codes and learn more about the game's requirements.

-------------------------------------
For the random exception errors:
-------------------------------------
	Window Title, Class, and Process:
		Gears5.exe - Application Error
		ahk_class #32770
		ahk_exe csrss.exe

	Visible Text:
		OK
		The exception unknown software exception (0x40000015) occurred in the application at location 0xe398e01f.

		Click on OK to terminate the program
*/

; http://www.autohotkey.com/board/topic/40217-how-to-check-if-desktop-is-active/
; shows  what else gets active

Loop{
	WinWait , %GW5_MSGBOX_CLASS%, OK, 4,
	dismissGameErrorMessages()
	Sleep, 1000
	;IfWinExist, %GAME_PROCESS_NAME%
	;{
	;	IfWinNotExist, %GW5_MSGBOX_CLASS%
	;	{
	;		sleep 10000
	;	}
	;}
}

;;	^ = Ctrl, + = Shift, ~ = native keypress not blocked
^+Backspace::ExitApp ; <- press Ctrl+Escape to exit.

^+R::
{
	;MsgBox, %A_Desktop%\Gears 5.url
	Run, %A_Desktop%\Gears 5.url
}


;;===================================================================
;; Define Functions
;;===================================================================
;; Dismiss error messagebox
dismissGameErrorMessages() {
	Loop, 20
	{
	    ; MsgBox, Iteration number is %A_Index%.  ; A_Index will be 1, 2, then 3

		;;	IfWinExist , WinTitle, WinText, ExcludeTitle, ExcludeText
		;;	IfWinNotExist , WinTitle, WinText, ExcludeTitle, ExcludeText

		IfWinExist, %GW5_MSGBOX_CLASS%, OK
		{
		    WinActivate  ; Automatically uses the window found above.
		    Send, {Enter}
		} else {
			IfWinExist, %GW5_MSGBOX_CLASS%, %GW5_STARTUP_ERROR_TEXT%
			{
			    WinActivate  ; Automatically uses the window found above.
			    Send, {Enter}
			} else {
				IfWinExist, %GW5_MSGBOX_CLASS%, %GW500_ERROR_MSGBOX_TEXT%
				{
				    WinActivate  ; Automatically uses the window found above.
				    Send, {Enter}
				} else {
					IfWinExist, %GW5_MSGBOX_CLASS%, %GW5_CRASH_MSGBOX_TEXT%
					{
					    WinActivate  ; Automatically uses the window found above.
					    Send, {Enter}
					}
				}
		}
		}
	    Sleep, 300
	}
}
