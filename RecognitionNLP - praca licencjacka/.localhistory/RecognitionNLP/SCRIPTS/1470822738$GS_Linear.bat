echo @echo OFF
echo SET "svm=0"
echo SET "kernel=0"
echo libsvm\svm-train.exe -s %svm% -t %kernel% -c 1 -q Classifier\NVF_Training.txt Classifier\Model_Linear.model
echo Kernel = Linear, Test = I, C = 1:
echo ..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_Linear.model ..\SCRIPTS\Classifier\Result.txt