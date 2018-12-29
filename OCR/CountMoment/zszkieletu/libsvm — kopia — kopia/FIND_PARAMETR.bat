@ECHO OFF

setlocal enableextensions enabledelayedexpansion

SET "c=1"
SET "g=1"

:start1
	if %g% leq 20 (
		SET /A c=1
		:start2
			if %c% leq 1000 (
				echo -t 2 -c %c% -g %g% >> result.txt
				svm-train.exe -t 2 -c %c% -g %g% -v 5 -q NVF_Training.txt >> result.txt
				
				SET /A c=%c%*2
				goto :start2
			)
		SET /A g=%g%*2
		goto :start1
	)
endlocal