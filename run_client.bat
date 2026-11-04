@echo off
title Cinema Client
cd /d "%~dp0"
echo Starting the client. On the first screen keep localhost / 3000 and press Enter.
call "%~dp0mvnw.cmd" -q -pl client exec:java
if errorlevel 1 (
  echo.
  echo The client did not start. Run run_server.bat first and wait until the server is running.
)
pause
