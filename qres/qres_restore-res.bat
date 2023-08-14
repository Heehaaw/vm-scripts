@ECHO OFF
CLS

SET qres_bin="%~dp0\QRes.exe"

powershell -Command ^
	"\"$(Get-Content $env:Temp\qres-original-resolution.txt)\" -match '([\d]{3,4})x([\d]{3,4})@([\d]{2,3})';"^
	"%qres_bin% /X $Matches.1 /Y $Matches.2 /R $Matches.3"