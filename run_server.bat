@echo off
title Cinema Server
cd /d "%~dp0"
where java >nul 2>nul
if errorlevel 1 (
  echo Java was not found. Install JDK 17 from https://adoptium.net and run this file again.
  pause
  exit /b 1
)
echo Building the project. The first run downloads Maven and the libraries, so it can take a few minutes...
call "%~dp0mvnw.cmd" -q install -DskipTests
if errorlevel 1 (
  echo.
  echo Build failed. See the messages above.
  pause
  exit /b 1
)
echo Starting the server on port 3000. Keep this window open.
call "%~dp0mvnw.cmd" -q -pl server exec:java
pause
