; ============================================================
; CISCO ANYCONNECT AUTO LOGIN
; Configuración externa en config.txt
; ============================================================

Opt("WinTitleMatchMode", 2)

; ------------------------------------------------------------
; ARCHIVO DE CONFIGURACION
; Se busca siempre junto al EXE
; ------------------------------------------------------------

Global $config = @ScriptDir & "\config.txt"

If Not FileExists($config) Then
    MsgBox(16, "Cisco AutoLogin", _
        "No se encontró el archivo de configuración:" & @CRLF & @CRLF & _
        $config)
    Exit
EndIf


; ------------------------------------------------------------
; LEER CONFIGURACION
; ------------------------------------------------------------

Global $rutaCisco = IniRead($config, "VPN", "RutaExe", "")
Global $password   = IniRead($config, "VPN", "Password", "")


; ------------------------------------------------------------
; VALIDAR CONFIGURACION
; ------------------------------------------------------------

If $rutaCisco = "" Then
    MsgBox(16, "Cisco AutoLogin", _
        "No se configuró RutaExe en config.txt")
    Exit
EndIf

If Not FileExists($rutaCisco) Then
    MsgBox(16, "Cisco AutoLogin", _
        "No existe el ejecutable de Cisco:" & @CRLF & @CRLF & _
        $rutaCisco)
    Exit
EndIf

If $password = "" Then
    MsgBox(16, "Cisco AutoLogin", _
        "No se configuró Password en config.txt")
    Exit
EndIf


; ------------------------------------------------------------
; ABRIR CISCO ANYCONNECT
; ------------------------------------------------------------

If Not ProcessExists("vpnui.exe") Then

    Run('"' & $rutaCisco & '"')

EndIf


; ------------------------------------------------------------
; ESPERAR VENTANA PRINCIPAL
; ------------------------------------------------------------

If Not WinWait("Cisco AnyConnect Secure Mobility Client", "", 15) Then

    MsgBox(16, "Cisco AutoLogin", _
        "No se encontró la ventana de Cisco AnyConnect.")

    Exit

EndIf

WinActivate("Cisco AnyConnect Secure Mobility Client")

Sleep(1000)


; ------------------------------------------------------------
; CLICK CONNECT
; ------------------------------------------------------------

ControlClick( _
    "Cisco AnyConnect Secure Mobility Client", _
    "", _
    "[CLASS:Button; INSTANCE:1]" _
)

Sleep(1000)


; ------------------------------------------------------------
; ESPERAR CONNECT ANYWAY
; ------------------------------------------------------------

Global $tiempo = TimerInit()
Global $textoBoton = ""

While TimerDiff($tiempo) < 15000

    $textoBoton = ControlGetText( _
        "Cisco AnyConnect Secure Mobility Client", _
        "", _
        "[CLASS:Button; INSTANCE:2]" _
    )

    If $textoBoton = "Connect Anyway" Then

        ControlClick( _
            "Cisco AnyConnect Secure Mobility Client", _
            "", _
            "[CLASS:Button; INSTANCE:2]" _
        )

        ExitLoop

    EndIf

    Sleep(250)

WEnd


; ------------------------------------------------------------
; ESPERAR VENTANA LOGIN
; ------------------------------------------------------------

If Not WinWait("Cisco AnyConnect | VPN-TK", "", 15) Then

    MsgBox(16, "Cisco AutoLogin", _
        "No apareció la ventana de login de la VPN.")

    Exit

EndIf

WinActivate("Cisco AnyConnect | VPN-TK")

Sleep(500)


; ------------------------------------------------------------
; ESCRIBIR PASSWORD
; Edit2 según los datos obtenidos con AutoIt Window Info
; ------------------------------------------------------------

ControlSetText( _
    "Cisco AnyConnect | VPN-TK", _
    "", _
    "[CLASS:Edit; INSTANCE:2]", _
    $password _
)

Sleep(500)


; ------------------------------------------------------------
; CLICK OK
; ------------------------------------------------------------

ControlClick( _
    "Cisco AnyConnect | VPN-TK", _
    "", _
    "[CLASS:Button; INSTANCE:1]" _
)

Exit