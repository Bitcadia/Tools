@echo off
setlocal EnableDelayedExpansion

REM Pass all arguments directly to bunx (since npx is alias for npm x)
bunx %*
exit /b %ERRORLEVEL%
