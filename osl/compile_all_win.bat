@ECHO off

@REM set your oslc path
@SET "OSLC=%USERPROFILE%\ktoa\ktoa-4.0.0.3-kat4.5-windows\bin\oslc.exe"

@REM set osl directory and compiled oso directory (May do not touch)
@SET "IN_DIR=./osl"
@SET "OUT_DIR=./oso"

@REM set current directory
cd /d "%~dp0"

@REM if not exist $OUT_DIR, make it
if not exist "%OUT_DIR%" mkdir "%OUT_DIR%"

@REM search all .osl filse
for %%f in (%IN_DIR%/*.osl) do (
    @REM compile to .oso
    "%OSLC%" -v -o "%OUT_DIR%/%%~nf.oso" "%IN_DIR%/%%~nxf"
)

pause
