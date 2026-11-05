@echo off
title Cinema Client
cd /d "%~dp0"
where java >nul 2>nul
if errorlevel 1 (
  echo Java was not found. Install JDK 17 from https://adoptium.net and run this file again.
  pause
  exit /b 1
)
if not exist "%~dp0client\target\classes" (
  echo Building the client. The first run downloads Maven and the libraries, so it can take a few minutes...
  call "%~dp0mvnw.cmd" -q install -DskipTests
  if errorlevel 1 (
    echo.
    echo Build failed. See the messages above.
    pause
    exit /b 1
  )
)
echo Starting the client. On the first screen enter the server address and port 3000, and press Enter.
call "%~dp0mvnw.cmd" -q -pl client exec:java
if errorlevel 1 (
  echo.
  echo The client did not start. See the messages above.
)
pause
