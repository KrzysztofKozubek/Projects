@echo OFF
SET "svm=0"
SET "kernel=0"
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1 -v 5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model >> LinearResult.txt
echo Kernel = Linear, Test = I, C = 1: >> LinearResult.txt
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt >> LinearResult.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2 -v 5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model >> LinearResult.txt
echo Kernel = Linear, Test = I, C = 2: >> LinearResult.txt
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt >> LinearResult.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4 -v 5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model >> LinearResult.txt
echo Kernel = Linear, Test = I, C = 4: >> LinearResult.txt
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt >> LinearResult.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8 -v 5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model >> LinearResult.txt
echo Kernel = Linear, Test = I, C = 8: >> LinearResult.txt
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt >> LinearResult.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 16 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 16 -v 5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model >> LinearResult.txt
echo Kernel = Linear, Test = I, C = 16: >> LinearResult.txt
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt >> LinearResult.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 32 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 32 -v 5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model >> LinearResult.txt
echo Kernel = Linear, Test = I, C = 32: >> LinearResult.txt
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt >> LinearResult.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 64 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 64 -v 5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model >> LinearResult.txt
echo Kernel = Linear, Test = I, C = 64: >> LinearResult.txt
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt >> LinearResult.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 128 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 128 -v 5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model >> LinearResult.txt
echo Kernel = Linear, Test = I, C = 128: >> LinearResult.txt
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt >> LinearResult.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 256 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 256 -v 5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model >> LinearResult.txt
echo Kernel = Linear, Test = I, C = 256: >> LinearResult.txt
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt >> LinearResult.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 512 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 512 -v 5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model >> LinearResult.txt
echo Kernel = Linear, Test = I, C = 512: >> LinearResult.txt
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt >> LinearResult.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1024 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1024 -v 5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model >> LinearResult.txt
echo Kernel = Linear, Test = I, C = 1024: >> LinearResult.txt
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt >> LinearResult.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2048 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2048 -v 5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model >> LinearResult.txt
echo Kernel = Linear, Test = I, C = 2048: >> LinearResult.txt
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt >> LinearResult.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4096 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4096 -v 5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model >> LinearResult.txt
echo Kernel = Linear, Test = I, C = 4096: >> LinearResult.txt
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt >> LinearResult.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8192 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8192 -v 5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model >> LinearResult.txt
echo Kernel = Linear, Test = I, C = 8192: >> LinearResult.txt
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt >> LinearResult.txt
