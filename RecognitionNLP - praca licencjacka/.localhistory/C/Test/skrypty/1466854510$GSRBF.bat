@echo OFF 
SET "svm=0" 
SET "kernel=1" 
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1 -g 0.001 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1 -g 0.002 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1 -g 0.004 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1 -g 0.008 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1 -g 0.016 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1 -g 0.032 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1 -g 0.064 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1 -g 0.128 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1 -g 0.256 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1 -g 0.512 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1 -g 1.024 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1 -g 2.048 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1 -g 4.096 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1 -g 8.192 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2 -g 0.001 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2 -g 0.002 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2 -g 0.004 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2 -g 0.008 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2 -g 0.016 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2 -g 0.032 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2 -g 0.064 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2 -g 0.128 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2 -g 0.256 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2 -g 0.512 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2 -g 1.024 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2 -g 2.048 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2 -g 4.096 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2 -g 8.192 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4 -g 0.001 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4 -g 0.002 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4 -g 0.004 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4 -g 0.008 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4 -g 0.016 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4 -g 0.032 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4 -g 0.064 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4 -g 0.128 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4 -g 0.256 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4 -g 0.512 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4 -g 1.024 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4 -g 2.048 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4 -g 4.096 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4 -g 8.192 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8 -g 0.001 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8 -g 0.002 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8 -g 0.004 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8 -g 0.008 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8 -g 0.016 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8 -g 0.032 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8 -g 0.064 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8 -g 0.128 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8 -g 0.256 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8 -g 0.512 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8 -g 1.024 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8 -g 2.048 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8 -g 4.096 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8 -g 8.192 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 16 -g 0.001 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 16 -g 0.002 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 16 -g 0.004 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 16 -g 0.008 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 16 -g 0.016 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 16 -g 0.032 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 16 -g 0.064 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 16 -g 0.128 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 16 -g 0.256 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 16 -g 0.512 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 16 -g 1.024 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 16 -g 2.048 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 16 -g 4.096 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 16 -g 8.192 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 32 -g 0.001 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 32 -g 0.002 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 32 -g 0.004 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 32 -g 0.008 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 32 -g 0.016 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 32 -g 0.032 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 32 -g 0.064 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 32 -g 0.128 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 32 -g 0.256 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 32 -g 0.512 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 32 -g 1.024 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 32 -g 2.048 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 32 -g 4.096 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 32 -g 8.192 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 64 -g 0.001 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 64 -g 0.002 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 64 -g 0.004 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 64 -g 0.008 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 64 -g 0.016 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 64 -g 0.032 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 64 -g 0.064 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 64 -g 0.128 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 64 -g 0.256 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 64 -g 0.512 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 64 -g 1.024 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 64 -g 2.048 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 64 -g 4.096 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 64 -g 8.192 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 128 -g 0.001 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 128 -g 0.002 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 128 -g 0.004 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 128 -g 0.008 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 128 -g 0.016 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 128 -g 0.032 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 128 -g 0.064 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 128 -g 0.128 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 128 -g 0.256 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 128 -g 0.512 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 128 -g 1.024 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 128 -g 2.048 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 128 -g 4.096 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 128 -g 8.192 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 256 -g 0.001 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 256 -g 0.002 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 256 -g 0.004 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 256 -g 0.008 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 256 -g 0.016 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 256 -g 0.032 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 256 -g 0.064 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 256 -g 0.128 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 256 -g 0.256 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 256 -g 0.512 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 256 -g 1.024 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 256 -g 2.048 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 256 -g 4.096 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 256 -g 8.192 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 512 -g 0.001 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 512 -g 0.002 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 512 -g 0.004 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 512 -g 0.008 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 512 -g 0.016 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 512 -g 0.032 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 512 -g 0.064 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 512 -g 0.128 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 512 -g 0.256 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 512 -g 0.512 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 512 -g 1.024 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 512 -g 2.048 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 512 -g 4.096 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 512 -g 8.192 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 0.001 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 0.002 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 0.004 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 0.008 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 0.016 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 0.032 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 0.064 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 0.128 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 0.256 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 0.512 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 1.024 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 2.048 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 4.096 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 8.192 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 0.001 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 0.002 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 0.004 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 0.008 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 0.016 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 0.032 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 0.064 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 0.128 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 0.256 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 0.512 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 1.024 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 2.048 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 4.096 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 8.192 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 0.001 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 0.002 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 0.004 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 0.008 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 0.016 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 0.032 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 0.064 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 0.128 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 0.256 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 0.512 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 1.024 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 2.048 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 4.096 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 8.192 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 0.001 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 0.002 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 0.004 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 0.008 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 0.016 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 0.032 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 0.064 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 0.128 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 0.256 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 0.512 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 1.024 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 2.048 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 4.096 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 8.192 -q C:\Test\skrypty\SVFT1Training.txt02.model 
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
C:\Test\skrypty\svm-predict.exe C:\Test\skrypty\SVFT1Zb1.txt C:\Test\skrypty\SVFT1Training.txt02.model R.txt  
