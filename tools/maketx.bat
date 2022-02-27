@ECHO off

@REM set Maketx path
@SET "MAKETX=%userprofile%/ktoa/ktoa-4.0.0.2-kat4.5-windows/bin/maketx.exe"

@REM # Options

@REM ## Input Image Options
@SET "IN_COLORSPACE=ACES - ACEScg"
@SET "IN_DIR=../textures/wood"
@SET "IN_FILE=old_cabin_dusty_oak_flooring.roughness"
@SET "IN=%IN_DIR%/%IN_FILE%.exr"

@REM ## Output Image Options
@REM Select output format: tiff, OpenEXR
@SET "OUT_FORMAT=OpenEXR"
@REM Select output data bit-depth: uint8, sint8, uint16, sint16, half, float
@SET "OUT_BITDEPTHT=half"
@SET "OUT_COLORSPACE=ACES - ACEScg"
@SET "OUT=%IN_DIR%/%IN_FILE%.%OUT_COLORSPACE%.tiled.16bit.2k.exr"

@REM ## Maketx Options
@REM set tile size (default: 64 64)
@SET "TILESIZE=64 64"

@REM set your config.ocio path
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
    "%IN%"

pause