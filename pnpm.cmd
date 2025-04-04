@echo off
setlocal EnableDelayedExpansion
if /i "%1"=="dlx" (
    for /f "tokens=1*" %%a in ("%*") do (
        set "remaining=%%b"
    )
    bunx !remaining!
) else (
    call pnpmreal.cmd %*
)
exit /b %ERRORLEVEL%
