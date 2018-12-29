@echo OFF
SET "svm=0"
SET "kernel=2"
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 16 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 16, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 16 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 16, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 16 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 16, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 16 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 16, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 16 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 16, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 16 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 16, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 16 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 16, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 16 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 16, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 16 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 16, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 16 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 16, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 16 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 16, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 16 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 16, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 16 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 16, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 16, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 32 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 32, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 32 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 32, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 32 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 32, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 32 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 32, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 32 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 32, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 32 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 32, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 32 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 32, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 32 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 32, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 32 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 32, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 32 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 32, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 32 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 32, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 32 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 32, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 32 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 32, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 32, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 64 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 64, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 64 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 64, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 64 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 64, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 64 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 64, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 64 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 64, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 64 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 64, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 64 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 64, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 64 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 64, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 64 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 64, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 64 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 64, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 64 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 64, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 64 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 64, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 64 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 64, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 64, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 128 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 128, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 128 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 128, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 128 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 128, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 128 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 128, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 128 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 128, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 128 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 128, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 128 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 128, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 128 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 128, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 128 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 128, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 128 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 128, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 128 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 128, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 128 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 128, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 128 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 128, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 128, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 256 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 256, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 256 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 256, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 256 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 256, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 256 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 256, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 256 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 256, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 256 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 256, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 256 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 256, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 256 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 256, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 256 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 256, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 256 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 256, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 256 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 256, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 256 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 256, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 256 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 256, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 256, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 512 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 512, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 512 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 512, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 512 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 512, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 512 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 512, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 512 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 512, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 512 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 512, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 512 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 512, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 512 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 512, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 512 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 512, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 512 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 512, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 512 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 512, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 512 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 512, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 512 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 512, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 512, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1024, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1024, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1024, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1024, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1024, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1024, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1024, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1024, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1024, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1024, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1024, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1024, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 1024 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 1024, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 1024, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2048, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2048, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2048, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2048, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2048, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2048, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2048, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2048, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2048, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2048, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2048, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2048, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 2048 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 2048, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 2048, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4096, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4096, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4096, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4096, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4096, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4096, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4096, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4096, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4096, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4096, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4096, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4096, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 4096 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 4096, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 4096, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 0.00195313 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8192, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 0.00195313:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 0.00390625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8192, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 0.00390625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 0.0078125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8192, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 0.0078125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 0.015625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8192, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 0.015625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 0.03125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8192, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 0.03125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 0.0625 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8192, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 0.0625:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 0.125 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8192, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 0.125:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 0.25 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8192, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 0.25:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 0.5 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8192, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 0.5:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 1 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8192, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 1:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 2 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8192, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 2:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 4 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8192, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 4:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
..\SCRIPTS\libsvm\svm-train.exe -s %svm% -t %kernel% -c 8192 -g 8 -q ..\SCRIPTS\Classifier\NVF_Training.txt ..\SCRIPTS\Classifier\Model_RBF
echo Kernel = RBF, Test = I, C = 8192, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_I.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
echo Kernel = RBF, Test = II, C = 8192, g = 8:
..\SCRIPTS\libsvm\svm-predict.exe ..\SCRIPTS\Classifier\NVF_Test_II.txt ..\SCRIPTS\Classifier\Model_RBF ..\SCRIPTS\Classifier\Result.txt
