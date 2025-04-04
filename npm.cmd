@echo off
setlocal EnableDelayedExpansion
if /i "%1"=="x" (
    for /f "tokens=1*" %%a in ("%*") do (
        set "remaining=%%b"
    )
    bunx !remaining!
) else (
    call npmreal.cmd %*
)
exit /b %ERRORLEVEL%
