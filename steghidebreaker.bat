@echo off
if "%2"=="" (
     echo missing arguments
     echo correct use: steghidebreaker photo.jpg dictionary.txt
     exit /b
)

setlocal enabledelayedexpansion
echo %TIME%
for /f %%i in (%2) do (
     for /f %%T in ('steghide extract -sf %1 -p "%%i" -f 2^>^&1 ^| find "wrote" /c') do set resultado=%%T
     if /i !resultado! EQU 1 (
          echo "a senha do arquivo eh %%i"  
          echo %TIME%
          exit /b
     ) 
)
