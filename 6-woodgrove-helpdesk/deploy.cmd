@echo off
setlocal

set "PROJECT_DIR=%~dp0"

if not defined DEPLOYMENT_TARGET (
  set "DEPLOYMENT_TARGET=%PROJECT_DIR%..\artifacts\woodgrove-helpdesk\wwwroot"
)

echo Publishing Woodgrove Helpdesk...
dotnet publish "%PROJECT_DIR%WoodgroveHelpdesk.csproj" --configuration Release --output "%DEPLOYMENT_TARGET%" /p:GenerateFullPaths=true

if not "%ERRORLEVEL%"=="0" (
  echo Deployment failed.
  exit /b 1
)

echo Deployment successful.
exit /b 0
