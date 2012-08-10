#Include <WinAPI.au3>
#include <GUIConstantsEx.au3>

Dim $runAllTests=False

GUICreate("Google Automated Hurdling", 320, 100)
GUICtrlCreateLabel("Google Automated Hurdling, created by Matias Palomera", 10, 10, 300, 50)
$okbutton = GUICtrlCreateButton("OK", 180, 50, 60)
$cancelbutton = GUICtrlCreateButton("Cancel", 245, 50, 60)
GUISetState(@SW_SHOW)

While 1
  $msg = GUIGetMsg()

  Select
  Case $msg = $cancelbutton
	  $runMarvel=False
	  Exit
	Case $msg = $okbutton
			$runGoogleAutoit=True

		GUIDelete()	
	    ExitLoop
   Case $msg = $GUI_EVENT_CLOSE
       Exit
   EndSelect
WEnd

$gcwin = "Google Chrome"

Global $Paused
HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{ESC}", "Terminate")

if not Run("C:\Documents and Settings\Administrador\Configuración local\Datos de programa\Google\Chrome\Application\chrome.exe about:blank") Then
   SplashOff()
	MsgBox(4096, "Error", "Path to Google Chrome not found!")
	Exit
EndIf
 
Opt("WinTitleMatchMode", 2)
If $runGoogleAutoit Then
   SplashTextOn("Google Automated Hurdling", "Google Automated Hurdling - Press ESC to exit", 300, 100, -1, 0, 4)
   Sleep(3000)
   GoogleAutoit($gcwin)
   SplashOff()
EndIf
 
SplashTextOn("Google Automated Hurdling", "Google Automated Hurdling - Press ESC to exit", 300, 100, -1, 0, 4)
Sleep(1000)
SplashOff()

Func Hurdling($gcwin)
   Send("^a" & "http://www.google.com/doodles/hurdles-2012" & "{ENTER}")
   WinWait("Hurdles 2012 - Google Chrome")
   Sleep(7000)
   MouseClick("left", 505, 359, 1, 0)
   Sleep(1000)
   $a = 0
	  While $a < 250
		 Send("{RIGHT}" & "{LEFT}")
		 $a = $a + 1
	  WEnd
   EndFunc
   
 Func GoogleAutoit($gcwin)
   Hurdling($gcwin)
EndFunc
 
 Func TogglePause()
    $Paused = Not $Paused
    While $Paused
        Sleep(100)
        ToolTip('Script is "Paused"', 0, 0)
    WEnd
    ToolTip("")
EndFunc
 
 Func Terminate()
    Exit 0
EndFunc 