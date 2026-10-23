@echo off
setlocal

set "GR_TARGET=%~1"
if "%GR_TARGET%"=="" set "GR_TARGET=D:\Generals Revival"

if not exist "%GR_TARGET%\!!GR_UnifiedPayload.big" (
  echo Generals Revival was not found at:
  echo %GR_TARGET%
  echo.
  echo Drag your Generals Revival folder onto INSTALL-PATCH.cmd, or run:
  echo INSTALL-PATCH.cmd "X:\path\to\Generals Revival"
  pause
  exit /b 2
)

tasklist /FI "IMAGENAME eq generalszh.exe" 2>NUL | find /I "generalszh.exe" >NUL
if not errorlevel 1 (
  echo Close Generals Revival before installing this patch.
  pause
  exit /b 3
)

tasklist /FI "IMAGENAME eq GeneralsRevival.exe" 2>NUL | find /I "GeneralsRevival.exe" >NUL
if not errorlevel 1 (
  echo Close the Generals Revival launcher before installing this patch.
  pause
  exit /b 3
)

set "GR_BACKUP=%LOCALAPPDATA%\GeneralsRevival\Rollback-0.6.6-GraphicsCompatibility"
if not exist "%GR_BACKUP%" mkdir "%GR_BACKUP%"

for %%F in (generalszh.exe GeneralsRevival.exe !!00_GR_InterfaceFix.big revival-multiplayer.sha256) do (
  if exist "%GR_TARGET%\%%F" copy /Y "%GR_TARGET%\%%F" "%GR_BACKUP%\%%F" >NUL
)

for %%F in (generalszh.exe GeneralsRevival.exe !!00_GR_InterfaceFix.big revival-multiplayer.sha256) do (
  copy /Y "%~dp0PatchFiles\%%F" "%GR_TARGET%\%%F" >NUL
  if errorlevel 1 goto :copy_failed
)

echo.
echo Generals Revival Graphics Compatibility Fix 0.6.6 installed successfully.
echo Start GeneralsRevival.exe and choose Balanced for the recommended settings.
echo Every multiplayer participant must install this same patch.
echo Rollback files: %GR_BACKUP%
pause
exit /b 0

:copy_failed
echo.
echo Patch installation failed while copying files.
echo The original files are preserved at: %GR_BACKUP%
pause
exit /b 4
