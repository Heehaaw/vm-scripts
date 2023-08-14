@ECHO OFF
CLS

powershell -Command "\"$(Get-Content $env:Temp\qres-original-resolution.txt)\" -match '([\d]{3,4})x([\d]{3,4})@([\d]{2,3})'; C:\QRes.exe /X $Matches.1 /Y $Matches.2 /R $Matches.3"