@ECHO OFF
CLS

SET qres_bin="%~dp0\QRes.exe"

FOR /F "tokens=* USEBACKQ" %%F IN (`"%qres_bin%" /S`) DO (
SET var=%%F
)
ECHO Storing original resolution - %VAR%

powershell -Command ^
	"\"%var%\" -match '([\d]{3,4})x([\d]{3,4}).+@ ([\d]{2,3})';"^
	"$Matches.1+'x'+$Matches.2+'@'+$Matches.3 > %TEMP%\qres-original-resolution.txt"

%qres_bin% %*