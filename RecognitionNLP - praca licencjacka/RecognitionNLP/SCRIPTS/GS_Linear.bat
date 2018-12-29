@echo OFF
SET "svm=0"
SET "kernel=0"
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 16 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 16:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 16:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 32 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 32:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 32:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 64 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 64:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 64:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 128 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 128:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 128:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 256 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 256:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 256:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 512 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 512:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 512:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1024 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 1024:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 1024:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2048 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 2048:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 2048:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4096 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 4096:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 4096:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8192 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 8192:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 8192:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
