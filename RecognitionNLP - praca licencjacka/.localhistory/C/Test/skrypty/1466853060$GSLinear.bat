@echo OFF 
SET "svm=0" 
SET "kernel=0" 
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1 -q C:\Test\skrypty\SVFT1Training.txt C:\Test\skrypty\SVFT1Zb1.txt00.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2 -q C:\Test\skrypty\SVFT1Training.txt C:\Test\skrypty\SVFT1Zb1.txt00.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4 -q C:\Test\skrypty\SVFT1Training.txt C:\Test\skrypty\SVFT1Zb1.txt00.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8 -q C:\Test\skrypty\SVFT1Training.txt C:\Test\skrypty\SVFT1Zb1.txt00.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 16 -q C:\Test\skrypty\SVFT1Training.txt C:\Test\skrypty\SVFT1Zb1.txt00.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 32 -q C:\Test\skrypty\SVFT1Training.txt C:\Test\skrypty\SVFT1Zb1.txt00.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 64 -q C:\Test\skrypty\SVFT1Training.txt C:\Test\skrypty\SVFT1Zb1.txt00.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 128 -q C:\Test\skrypty\SVFT1Training.txt C:\Test\skrypty\SVFT1Zb1.txt00.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 256 -q C:\Test\skrypty\SVFT1Training.txt C:\Test\skrypty\SVFT1Zb1.txt00.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 512 -q C:\Test\skrypty\SVFT1Training.txt C:\Test\skrypty\SVFT1Zb1.txt00.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1024 -q C:\Test\skrypty\SVFT1Training.txt C:\Test\skrypty\SVFT1Zb1.txt00.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2048 -q C:\Test\skrypty\SVFT1Training.txt C:\Test\skrypty\SVFT1Zb1.txt00.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4096 -q C:\Test\skrypty\SVFT1Training.txt C:\Test\skrypty\SVFT1Zb1.txt00.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8192 -q C:\Test\skrypty\SVFT1Training.txt C:\Test\skrypty\SVFT1Zb1.txt00.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt00.model C:\Test\skrypty\SVFT1Training.txt 
