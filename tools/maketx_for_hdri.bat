@ECHO off

@REM set Maketx path
@SET "MAKETX=%userprofile%/ktoa/ktoa-4.0.0.2-kat4.5-windows/bin/maketx.exe"

@REM # Options

@REM ## Input Image Options
@SET "IN=../textures/hdri/wht.2k.acescg.exr"
@SET "IN_COLORSPACE=ACES - ACEScg"

@REM ## Output Image Options
@REM Select output format: tiff, OpenEXR
@SET "OUT_FORMAT=OpenEXR"
@REM Select output data bit-depth: uint8, sint8, uint16, sint16, half, float
@SET "OUT_BITDEPTHT=float"
@SET "OUT_COLORSPACE=ACES - ACEScg"
@SET "OUT=../textures/hdri/tiled.exr"

@REM ## Maketx Options
@SET "TILESIZE=64 64"

@REM OCIO
set "OCIO=%userprofile%/Documents/ocio/aces_1.2/config.ocio"


@REM run Maketx
"%MAKETX%"^
    -v --runstats^
    -o "%OUT%"^
    --format "%OUT_FORMAT%"^
    -d "%OUT_BITDEPTHT%"^
    --tile "%TILESIZE%"^
    --separate^
    --colorconfig "%OCIO%"^
    --colorconvert "%IN_COLORSPACE%" "%OUT_COLORSPACE%"^
    --filter lanczos3^
    --envlatl^
    "%IN%"

pause