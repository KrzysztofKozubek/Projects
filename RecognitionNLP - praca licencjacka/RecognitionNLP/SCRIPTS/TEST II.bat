@echo OFF
echo Kernel = Linear, Test = II, C = 1: 
echo  
echo Kernel = RBF, Test = II, C = 1, g = 0.00195313:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 0.00390625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 0.0078125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 0.015625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 0.03125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 0.0625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 0.125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 0.25:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 0.5:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 1:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 2:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 4:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 8:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo  
echo Kernel = Linear, Test = II, C = 2: 
echo  
echo Kernel = RBF, Test = II, C = 2, g = 0.00195313:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 0.00390625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 0.0078125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 0.015625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 0.03125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 0.0625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 0.125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 0.25:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 0.5:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 1:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 2:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 4:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 8:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo  
echo Kernel = Linear, Test = II, C = 4: 
echo  
echo Kernel = RBF, Test = II, C = 4, g = 0.00195313:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 0.00390625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 0.0078125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 0.015625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 0.03125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 0.0625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 0.125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 0.25:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 0.5:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 1:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 2:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 4:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 8:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo  
echo Kernel = Linear, Test = II, C = 8: 
echo  
echo Kernel = RBF, Test = II, C = 8, g = 0.00195313:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 0.00390625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 0.0078125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 0.015625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 0.03125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 0.0625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 0.125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 0.25:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 0.5:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 1:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 2:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 4:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 8:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo  
echo Kernel = Linear, Test = II, C = 16: 
echo  
echo Kernel = RBF, Test = II, C = 16, g = 0.00195313:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 16 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 0.00390625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 16 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 0.0078125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 16 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 0.015625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 16 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 0.03125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 16 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 0.0625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 16 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 0.125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 16 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 0.25:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 16 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 0.5:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 16 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 1:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 16 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 2:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 16 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 4:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 16 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 8:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 16 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo  
echo Kernel = Linear, Test = II, C = 32: 
echo  
echo Kernel = RBF, Test = II, C = 32, g = 0.00195313:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 32 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 0.00390625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 32 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 0.0078125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 32 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 0.015625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 32 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 0.03125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 32 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 0.0625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 32 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 0.125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 32 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 0.25:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 32 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 0.5:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 32 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 1:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 32 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 2:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 32 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 4:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 32 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 8:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 32 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo  
echo Kernel = Linear, Test = II, C = 64: 
echo  
echo Kernel = RBF, Test = II, C = 64, g = 0.00195313:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 64 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 0.00390625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 64 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 0.0078125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 64 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 0.015625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 64 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 0.03125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 64 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 0.0625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 64 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 0.125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 64 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 0.25:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 64 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 0.5:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 64 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 1:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 64 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 2:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 64 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 4:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 64 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 8:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 64 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo  
echo Kernel = Linear, Test = II, C = 128: 
echo  
echo Kernel = RBF, Test = II, C = 128, g = 0.00195313:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 128 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 0.00390625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 128 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 0.0078125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 128 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 0.015625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 128 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 0.03125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 128 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 0.0625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 128 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 0.125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 128 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 0.25:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 128 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 0.5:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 128 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 1:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 128 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 2:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 128 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 4:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 128 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 8:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 128 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo  
echo Kernel = Linear, Test = II, C = 256: 
echo  
echo Kernel = RBF, Test = II, C = 256, g = 0.00195313:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 256 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 0.00390625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 256 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 0.0078125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 256 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 0.015625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 256 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 0.03125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 256 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 0.0625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 256 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 0.125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 256 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 0.25:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 256 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 0.5:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 256 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 1:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 256 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 2:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 256 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 4:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 256 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 8:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 256 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo  
echo Kernel = Linear, Test = II, C = 512: 
echo  
echo Kernel = RBF, Test = II, C = 512, g = 0.00195313:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 512 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 0.00390625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 512 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 0.0078125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 512 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 0.015625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 512 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 0.03125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 512 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 0.0625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 512 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 0.125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 512 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 0.25:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 512 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 0.5:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 512 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 1:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 512 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 2:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 512 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 4:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 512 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 8:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 512 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo  
echo Kernel = Linear, Test = II, C = 1024: 
echo  
echo Kernel = RBF, Test = II, C = 1024, g = 0.00195313:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1024 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 0.00390625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1024 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 0.0078125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1024 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 0.015625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1024 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 0.03125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1024 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 0.0625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1024 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 0.125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1024 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 0.25:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1024 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 0.5:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1024 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 1:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1024 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 2:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1024 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 4:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1024 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 8:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 1024 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo  
echo Kernel = Linear, Test = II, C = 2048: 
echo  
echo Kernel = RBF, Test = II, C = 2048, g = 0.00195313:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2048 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 0.00390625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2048 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 0.0078125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2048 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 0.015625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2048 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 0.03125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2048 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 0.0625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2048 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 0.125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2048 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 0.25:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2048 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 0.5:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2048 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 1:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2048 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 2:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2048 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 4:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2048 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 8:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 2048 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo  
echo Kernel = Linear, Test = II, C = 4096: 
echo  
echo Kernel = RBF, Test = II, C = 4096, g = 0.00195313:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4096 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 0.00390625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4096 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 0.0078125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4096 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 0.015625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4096 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 0.03125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4096 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 0.0625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4096 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 0.125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4096 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 0.25:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4096 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 0.5:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4096 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 1:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4096 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 2:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4096 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 4:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4096 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 8:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 4096 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo  
echo Kernel = Linear, Test = II, C = 8192: 
echo  
echo Kernel = RBF, Test = II, C = 8192, g = 0.00195313:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8192 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 0.00390625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8192 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 0.0078125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8192 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 0.015625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8192 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 0.03125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8192 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 0.0625:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8192 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 0.125:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8192 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 0.25:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8192 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 0.5:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8192 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 1:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8192 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 2:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8192 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 4:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8192 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 8:
..\SCRIPTS\libsvm\svm-train.exe -s 0 -t 2 -c 8192 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo  
