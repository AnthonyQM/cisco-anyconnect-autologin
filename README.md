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

## Inicio automático con Windows

Cisco AnyConnect AutoLogin puede configurarse para ejecutarse automáticamente al iniciar sesión en Windows 10/11.

### Opción recomendada: carpeta de Inicio

Primero coloca los archivos del programa en una ubicación permanente, por ejemplo:

```text
C:\CiscoAutoLogin\
│
├── CiscoAutoLogin.exe
└── config.txt
```

> `CiscoAutoLogin.exe` y `config.txt` deben permanecer juntos, ya que la aplicación busca el archivo de configuración en su mismo directorio.

### 1. Abrir la carpeta de Inicio de Windows

Presiona:

```text
Win + R
```

Escribe:

```text
shell:startup
```

y presiona **Enter**.

También puedes acceder directamente a:

```text
%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
```

### 2. Crear un acceso directo

Crea un acceso directo de:

```text
C:\CiscoAutoLogin\CiscoAutoLogin.exe
```

y coloca el acceso directo dentro de la carpeta `Startup`.

No es necesario copiar el ejecutable directamente a esta carpeta.

La estructura recomendada será:

```text
C:\CiscoAutoLogin\
├── CiscoAutoLogin.exe
└── config.txt

Startup\
└── CiscoAutoLogin.lnk
```

### 3. Reiniciar o cerrar sesión

En el siguiente inicio de sesión de Windows, `CiscoAutoLogin.exe` se ejecutará automáticamente e iniciará el proceso de conexión a la VPN.

### Desactivar el inicio automático

Ejecuta nuevamente:

```text
shell:startup
```

y elimina el acceso directo de `CiscoAutoLogin`.

Esto no elimina el programa ni su configuración.

## Personalización

Los controles utilizados actualmente están basados en la interfaz clásica de Cisco AnyConnect Secure Mobility Client.

Si la versión de Cisco cambia la estructura de sus ventanas o controles, puede ser necesario actualizar los identificadores utilizados por `ControlClick`, `ControlSetText` o `ControlGetText`.

## Quick Start

1. Descarga la última versión desde **Releases**.
2. Crea `config.txt` utilizando `config.example.txt` como referencia.
3. Configura la ruta de Cisco AnyConnect y tu contraseña.
4. Ejecuta `CiscoAutoLogin.exe`.
5. Opcionalmente, agrega un acceso directo a `shell:startup` para conectarte automáticamente al iniciar Windows.

## Disclaimer

Este proyecto no está afiliado, respaldado ni mantenido por Cisco Systems.

Cisco y Cisco AnyConnect son marcas comerciales de sus respectivos propietarios.

El proyecto simplemente automatiza interacciones con el cliente instalado localmente.

## Licencia

Este proyecto está distribuido bajo la **MIT License**.

Consulta el archivo `LICENSE` para más información.
