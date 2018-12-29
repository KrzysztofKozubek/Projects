@ECHO OFF 



SET "svm=0" 
SET "kernel=0" 
SET "c=1" 
SET "e=1" 
SET "n=0.001" 
C:\Test\svm-train.exe -s %svm% -t %kernel%  -e %e% -c %c% -n %n% -q C:\Test\SVFT1Training.txt C:\Test\SVFT1Training.txt00.model 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFT1Training.txt00.model C:\Test\result 


SET "kernel=1" 
SET "e=0.001" 
SET "c=2" 
SET "g=0.5" 
SET "d=2" 
SET "r=2" 
C:\Test\svm-train.exe -s %svm% -t %kernel% -d %d% -r %r% -p %p% -m %m% -h %h% -wi %wi%  -g %g% -e %e% -c %c% -n %n% -q C:\Test\SVFT1Training.txt C:\Test\SVFT1Training.txt01.model 



SET "kernel=2" 
SET "e=0.002" 
SET "c=4" 
SET "g=1" 
C:\Test\svm-train.exe -s %svm% -t %kernel% -d %d% -r %r% -p %p% -m %m% -h %h% -wi %wi%  -g %g% -e %e% -c %c% -n %n% -q C:\Test\SVFT1Training.txt C:\Test\SVFT1Training.txt02.model 




SET "kernel=3" 
SET "n=0.1" 
SET "c=20" 
SET "g=0.3" 
C:\Test\svm-train.exe -s %svm% -t %kernel% -d %d% -r %r% -p %p% -m %m% -h %h% -wi %wi%  -g %g% -e %e% -c %c% -n %n% -q C:\Test\SVFT1Training.txt C:\Test\SVFT1Training.txt03.model 

echo Training 1 Set 1
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFT1Training.txt00.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFT1Training.txt01.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFT1Training.txt02.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFT1Training.txt03.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFT1Training.txt10.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFT1Training.txt11.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFT1Training.txt12.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFT1Training.txt13.model C:\Test\result 









SET "svm=1" 
SET "kernel=0" 
SET "e=2" 
SET "c=10" 
SET "n=0.0002" 
SET "g=5" 
SET "d=5" 
SET "r=1" 
SET "p=0.1" 
SET "m=1000" 
SET "h=1" 
SET "wi=5" 
C:\Test\svm-train.exe -s %svm% -t %kernel% -d %d% -r %r% -p %p% -m %m% -h %h% -wi %wi%  -g %g% -e %e% -c %c% -n %n% -q C:\Test\SVFT1Training.txt C:\Test\SVFT1Training.txt10.model 
C:\Test\svm-train.exe -s %svm% -t %kernel% -d %d% -r %r% -p %p% -m %m% -h %h% -wi %wi%  -g %g% -e %e% -c %c% -n %n% -q C:\Test\SVFT2Training.txt C:\Test\SVFT2Training.txt10.model 
SET "kernel=1" 
SET "n=0.1" 
SET "g=0.01" 
SET "d=5" 
SET "r=1" 
C:\Test\svm-train.exe -s %svm% -t %kernel% -d %d% -r %r% -p %p% -m %m% -h %h% -wi %wi%  -g %g% -e %e% -c %c% -n %n% -q C:\Test\SVFT1Training.txt C:\Test\SVFT1Training.txt11.model 
C:\Test\svm-train.exe -s %svm% -t %kernel% -d %d% -r %r% -p %p% -m %m% -h %h% -wi %wi%  -g %g% -e %e% -c %c% -n %n% -q C:\Test\SVFT2Training.txt C:\Test\SVFT2Training.txt11.model 
SET "kernel=2" 
SET "e=0.000001" 
SET "c=1" 
SET "n=0.001" 
SET "g=0.6" 
C:\Test\svm-train.exe -s %svm% -t %kernel% -d %d% -r %r% -p %p% -m %m% -h %h% -wi %wi%  -g %g% -e %e% -c %c% -n %n% -q C:\Test\SVFT1Training.txt C:\Test\SVFT1Training.txt12.model 
C:\Test\svm-train.exe -s %svm% -t %kernel% -d %d% -r %r% -p %p% -m %m% -h %h% -wi %wi%  -g %g% -e %e% -c %c% -n %n% -q C:\Test\SVFT2Training.txt C:\Test\SVFT2Training.txt12.model 
SET "kernel=3" 
SET "n=0.000001" 
SET "g=0.001" 
SET "r=0" 
SET "e=0.000001" 
C:\Test\svm-train.exe -s %svm% -t %kernel% -d %d% -r %r% -p %p% -m %m% -h %h% -wi %wi%  -g %g% -e %e% -c %c% -n %n% -q C:\Test\SVFT1Training.txt C:\Test\SVFT1Training.txt13.model 
C:\Test\svm-train.exe -s %svm% -t %kernel% -d %d% -r %r% -p %p% -m %m% -h %h% -wi %wi%  -g %g% -e %e% -c %c% -n %n% -q C:\Test\SVFT2Training.txt C:\Test\SVFT2Training.txt13.model 

echo Training 1 Set 1
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFT1Training.txt00.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFT1Training.txt01.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFT1Training.txt02.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFT1Training.txt03.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFT1Training.txt10.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFT1Training.txt11.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFT1Training.txt12.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb1.txt C:\Test\SVFT1Training.txt13.model C:\Test\result 

echo Training 1 Set 2
C:\Test\svm-predict.exe C:\Test\SVFT1Zb2.txt C:\Test\SVFT1Training.txt00.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb2.txt C:\Test\SVFT1Training.txt01.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb2.txt C:\Test\SVFT1Training.txt02.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb2.txt C:\Test\SVFT1Training.txt03.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb2.txt C:\Test\SVFT1Training.txt10.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb2.txt C:\Test\SVFT1Training.txt11.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb2.txt C:\Test\SVFT1Training.txt12.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT1Zb2.txt C:\Test\SVFT1Training.txt13.model C:\Test\result 

echo Training 2 Set 1
C:\Test\svm-predict.exe C:\Test\SVFT2Zb1.txt C:\Test\SVFT2Training.txt00.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT2Zb1.txt C:\Test\SVFT2Training.txt01.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT2Zb1.txt C:\Test\SVFT2Training.txt02.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT2Zb1.txt C:\Test\SVFT2Training.txt03.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT2Zb1.txt C:\Test\SVFT2Training.txt10.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT2Zb1.txt C:\Test\SVFT2Training.txt11.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT2Zb1.txt C:\Test\SVFT2Training.txt12.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT2Zb1.txt C:\Test\SVFT2Training.txt13.model C:\Test\result 

echo Training 2 Set 2
C:\Test\svm-predict.exe C:\Test\SVFT2Zb2.txt C:\Test\SVFT2Training.txt00.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT2Zb2.txt C:\Test\SVFT2Training.txt01.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT2Zb2.txt C:\Test\SVFT2Training.txt02.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT2Zb2.txt C:\Test\SVFT2Training.txt03.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT2Zb2.txt C:\Test\SVFT2Training.txt10.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT2Zb2.txt C:\Test\SVFT2Training.txt11.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT2Zb2.txt C:\Test\SVFT2Training.txt12.model C:\Test\result 
C:\Test\svm-predict.exe C:\Test\SVFT2Zb2.txt C:\Test\SVFT2Training.txt13.model C:\Test\result 
PAUSE 
