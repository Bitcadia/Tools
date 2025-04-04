@echo off
setlocal EnableDelayedExpansion

REM Pass all arguments directly to bunx (since pnpx is alias for pnpm dlx)
bunx %*
exit /b %ERRORLEVEL%
