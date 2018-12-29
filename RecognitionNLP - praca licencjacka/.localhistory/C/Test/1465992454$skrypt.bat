@ECHO OFF 

setlocal enabledelayedexpansion

SET "svm=0" 
SET "kernel=0" 

SET "c[0]=1000" 
SET "c[1]=100" 
SET "c[2]=10" 
SET "c[3]=1" 
SET "c[4]=0.1" 
SET "c[5]=0.01" 


for /l %%n in (0,1,5) do (
	echo !e[%%n]!
)
PASUE>nul
SET "c=1000" 

for /l %%n in (0,1,12) do (

echo !arrayline[%%n]!

)


SET "e=0.09" 
SET "c=1000" 
svm-train.exe -s %svm% -t %kernel% -e %e% -c %c% -q SVF.txt SVFTraining.txt00.model  
















SET "svm=0" 
SET "kernel=1" 
SET "e=0.01" 
SET "c=1000" 
SET "g=0.001" 
SET "d=20" 
SET "r=1" 
svm-train.exe -s %svm% -t %kernel% -d %d% -r %r% -g %g% -e %e% -c %c% -q SVF.txt SVFTraining.txt01.model 

SET "svm=0" 
SET "kernel=2" 
SET "e=0.1" 
SET "c=50" 
SET "g=1" 
svm-train.exe -s %svm% -t %kernel% -g %g% -e %e% -c %c% -q SVF.txt SVFTraining.txt02.model 

SET "svm=0" 
SET "kernel=3" 
SET "c=50" 
SET "g=0.03" 
SET "r=0.1"
svm-train.exe -s %svm% -t %kernel% -r %r% -g %g% -c %c% -q SVF.txt SVFTraining.txt03.model 

SET "svm=1" 
SET "kernel=0" 
SET "e=0.05" 
SET "c=1" 
SET "n=0.4" 
svm-train.exe -s %svm% -t %kernel% -e %e% -c %c% -n %n% -q SVF.txt SVFTraining.txt10.model 

SET "svm=1" 
SET "kernel=1" 
SET "n=0.1" 
SET "d=1" 
SET "r=2" 
SET "g=1" 
SET "e=0.001" 
svm-train.exe -s %svm% -t %kernel% -d %d% -g %g% -n %n% -q SVF.txt SVFTraining.txt11.model 

SET "svm=1" 
SET "kernel=2" 
SET "g=0.7" 
svm-train.exe -s %svm% -t %kernel% -g %g% -q SVF.txt SVFTraining.txt12.model 

SET "svm=1" 
SET "kernel=3" 
SET "r=0.001" 
svm-train.exe -s %svm% -t %kernel% -r %r% -q SVF.txt SVFTraining.txt13.model 

echo Test 1 SET 1 
svm-predict.exe SVFT1Zb1.txt SVFTraining.txt00.model result 
svm-predict.exe SVFT1Zb1.txt SVFTraining.txt01.model result 
svm-predict.exe SVFT1Zb1.txt SVFTraining.txt02.model result 
svm-predict.exe SVFT1Zb1.txt SVFTraining.txt03.model result 
svm-predict.exe SVFT1Zb1.txt SVFTraining.txt10.model result 
svm-predict.exe SVFT1Zb1.txt SVFTraining.txt11.model result 
svm-predict.exe SVFT1Zb1.txt SVFTraining.txt12.model result 
svm-predict.exe SVFT1Zb1.txt SVFTraining.txt13.model result 
echo Test 1 SET 3
svm-predict.exe VF.txt SVFTraining.txt00.model result 
svm-predict.exe VF.txt SVFTraining.txt01.model result 
svm-predict.exe VF.txt SVFTraining.txt02.model result 
svm-predict.exe VF.txt SVFTraining.txt03.model result 
svm-predict.exe VF.txt SVFTraining.txt10.model result 
svm-predict.exe VF.txt SVFTraining.txt11.model result 
svm-predict.exe VF.txt SVFTraining.txt12.model result 
svm-predict.exe VF.txt SVFTraining.txt13.model result 
PAUSE>nul
