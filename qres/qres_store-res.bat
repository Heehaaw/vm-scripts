@ECHO OFF
CLS

powershell -Command "\"$(C:\QRes.exe /S)\" -match '([\d]{3,4})x([\d]{3,4}).+@ ([\d]{2,3})';	$Matches.1+'x'+$Matches.2+'@'+$Matches.3 > $env:Temp\qres-original-resolution.txt"