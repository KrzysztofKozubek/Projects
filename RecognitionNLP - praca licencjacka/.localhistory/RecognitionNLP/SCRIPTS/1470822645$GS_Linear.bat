echo @echo OFF
echo SET "svm=0"
echo SET "kernel=0"
echo libsvm\svm-train.exe -s %svm% -t %kernel% -c 1 -q Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 1:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 1:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo ..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 2:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 2:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo ..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 4:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 4:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo ..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 8:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 8:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo ..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 16 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 16:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 16:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo ..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 32 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 32:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 32:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo ..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 64 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 64:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 64:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo ..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 128 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 128:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 128:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo ..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 256 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 256:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 256:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo ..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 512 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 512:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 512:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo ..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1024 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 1024:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 1024:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo ..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2048 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 2048:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 2048:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo ..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4096 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 4096:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 4096:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo ..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8192 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 8192:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
echo Kernel = Linear, Test = II, C = 8192:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt
