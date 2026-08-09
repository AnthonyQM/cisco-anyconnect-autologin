# Cisco AnyConnect AutoLogin

Script desarrollado en **AutoIt** para automatizar el proceso de conexión a **Cisco AnyConnect Secure Mobility Client**.

El script abre Cisco AnyConnect, inicia la conexión, acepta la advertencia de certificado si aparece, introduce automáticamente la contraseña y confirma el inicio de sesión.

La configuración se mantiene en un archivo externo, permitiendo modificar la ruta del ejecutable y las credenciales sin necesidad de recompilar el script.

## Características

- Inicio automático de Cisco AnyConnect.
- Detección de la ventana principal.
- Click automático en **Connect**.
- Soporte para la ventana **Connect Anyway**.
- Ingreso automático de contraseña.
- Configuración externa mediante `config.txt`.
- No requiere modificar ni recompilar el código para cambiar la contraseña.
- Compatible con compilación a `.exe` mediante AutoIt.

## Requisitos

- Windows.
- Cisco AnyConnect Secure Mobility Client.
- AutoIt v3 para ejecutar o compilar el código fuente.

## Estructura

```text
CiscoAnyConnectAutoLogin/
│
├── cisco_autologin.au3
├── config.example.txt
├── .gitignore
├── LICENSE
└── README.md
```

Una vez configurado y compilado, puedes tener:

```text
CiscoAnyConnectAutoLogin/
│
├── CiscoAutoLogin.exe
└── config.txt
```

## Configuración

Copia:

```text
config.example.txt
```

como:

```text
config.txt
```

Luego configura los datos de la VPN:

```ini
[VPN]
RutaExe=C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe
Perfil=VPN-TK
Password=YOUR_PASSWORD
```

### Parámetros

| Parámetro | Descripción |
|---|---|
| `RutaExe` | Ruta completa del ejecutable `vpnui.exe` de Cisco AnyConnect. |
| `Perfil` | Nombre del perfil o conexión VPN. |
| `Password` | Contraseña utilizada para iniciar sesión. |

## Uso

Ejecuta directamente:

```text
cisco_autologin.au3
```

si tienes AutoIt instalado.

También puedes compilar el script para generar:

```text
CiscoAutoLogin.exe
```

Luego simplemente ejecuta el `.exe` y el proceso de conexión se realizará automáticamente.

## Seguridad

**No subas tu archivo `config.txt` al repositorio.**

Este archivo contiene la contraseña de la VPN en texto plano.

Agrega lo siguiente al `.gitignore`:

```gitignore
config.txt
```

El repositorio debe incluir únicamente un archivo de ejemplo:

```text
config.example.txt
```

con valores ficticios:

```ini
[VPN]
RutaExe=C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe
Perfil=VPN-TK
Password=YOUR_PASSWORD
```

> **Importante:** compilar el script como `.exe` no cifra ni protege automáticamente las credenciales almacenadas en `config.txt`.

## Compilación

Puedes compilar el script utilizando **AutoIt / SciTE**.

Desde SciTE:

```text
Tools → Compile
```

También puedes utilizar **Compile Script (x86)** desde el menú contextual de Windows.

## Personalización

Los controles utilizados actualmente están basados en la interfaz clásica de Cisco AnyConnect Secure Mobility Client.

Si la versión de Cisco cambia la estructura de sus ventanas o controles, puede ser necesario actualizar los identificadores utilizados por `ControlClick`, `ControlSetText` o `ControlGetText`.

## Disclaimer

Este proyecto no está afiliado, respaldado ni mantenido por Cisco Systems.

Cisco y Cisco AnyConnect son marcas comerciales de sus respectivos propietarios.

El proyecto simplemente automatiza interacciones con el cliente instalado localmente.

## Licencia

Este proyecto está distribuido bajo la **MIT License**.

Consulta el archivo `LICENSE` para más información.
