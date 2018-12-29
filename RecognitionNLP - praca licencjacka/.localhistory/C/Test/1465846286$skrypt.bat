@ECHO OFF 

SET "svm=0" 
SET "kernel=0" 
SET "e=0.09" 
SET "c=1000" 
C:\Test\svm-train.exe -s %svm% -t %kernel% -e %e% -c %c% -q C:\Test\SVF.txt C:\Test\SVFTraining.txt00.model  

SET "svm=0" 
SET "kernel=1" 
SET "e=0.01" 
SET "c=1000" 
SET "g=0.001" 
SET "d=20" 
SET "r=1" 
C:\Test\svm-train.exe -s %svm% -t %kernel% -d %d% -r %r% -g %g% -e %e% -c %c% -q C:\Test\SVF.txt C:\Test\SVFTraining.txt01.model 

SET "svm=0" 
SET "kernel=2" 
SET "e=0.1" 
SET "c=50" 
SET "g=1" 
C:\Test\svm-train.exe -s %svm% -t %kernel% -g %g% -e %e% -c %c% -q C:\Test\SVF.txt C:\Test\SVFTraining.txt02.model 

SET "svm=0" 
SET "kernel=3" 
SET "c=50" 
SET "g=0.03" 
SET "r=0.1"
C:\Test\svm-train.exe -s %svm% -t %kernel% -r %r% -g %g% -c %c% -q C:\Test\SVF.txt C:\Test\SVFTraining.txt03.model 

SET "svm=1" 
SET "kernel=0" 
SET "e=0.05" 
SET "c=1" 
SET "n=0.4" 
C:\Test\svm-train.exe -s %svm% -t %kernel% -e %e% -c %c% -n %n% -q C:\Test\SVF.txt C:\Test\SVFTraining.txt10.model 

SET "svm=1" 
SET "kernel=1" 
SET "n=0.1" 
SET "d=1" 
SET "r=2" 
SET "g=1" 
SET "e=0.001" 
C:\Test\svm-train.exe -s %svm% -t %kernel% -d %d% -g %g% -n %n% -q C:\Test\SVF.txt C:\Test\SVFTraining.txt11.model 

SET "svm=1" 
SET "kernel=2" 
SET "g=0.7" 
C:\Test\svm-train.exe -s %svm% -t %kernel% -g %g% -q C:\Test\SVF.txt C:\Test\SVFTraining.txt12.model 

SET "svm=1" 
SET "kernel=3" 
SET "r=0.001" 
C:\Test\svm-train.exe -s %svm% -t %kernel% -r %r% -q C:\Test\SVF.txt C:\Test\SVFTraining.txt13.model 

echo Test 1 SET 1 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFTraining.txt00.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFTraining.txt01.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFTraining.txt02.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFTraining.txt03.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFTraining.txt10.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFTraining.txt11.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFTraining.txt12.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFTraining.txt13.model C:\Test\result 
echo Test 1 SET 3
C:\Test\svm-predict.exe C:\Test\VF.txt C:\Test\SVFTraining.txt00.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\VF.txt C:\Test\SVFTraining.txt01.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\VF.txt C:\Test\SVFTraining.txt02.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\VF.txt C:\Test\SVFTraining.txt03.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\VF.txt C:\Test\SVFTraining.txt10.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\VF.txt C:\Test\SVFTraining.txt11.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\VF.txt C:\Test\SVFTraining.txt12.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\VF.txt C:\Test\SVFTraining.txt13.model C:\Test\result 
PAUSE>nul
