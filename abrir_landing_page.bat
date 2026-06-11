@echo off
setlocal
set "FILE=%~dp0index.html"
set "CHROME=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if not exist "%CHROME%" set "CHROME=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if exist "%CHROME%" (
    start "" "%CHROME%" "%FILE%"
) else (
    set "EDGE=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
    if not exist "%EDGE%" set "EDGE=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"
    if exist "%EDGE%" (
        start "" "%EDGE%" "%FILE%"
    ) else (
        rundll32 url.dll,FileProtocolHandler "%FILE%"
    )
)
endlocal
