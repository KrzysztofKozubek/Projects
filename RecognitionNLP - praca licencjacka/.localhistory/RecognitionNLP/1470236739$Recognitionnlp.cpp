#include "Recognitionnlp.h"

RecognitionNLP::RecognitionNLP(QWidget *parent) : QMainWindow(parent) {

	ui.setupUi(this);
	setParameters();
	fillVectorValue();
	fillDefaultValue();

	//load data
	connect(ui.buttonLoadData,			SIGNAL(released()), this, SLOT(clickLoadData()));
	//clear list data
	connect(ui.buttonLoadClearData,		SIGNAL(released()), this, SLOT(clickClearData()));

	//show sliders noising
	connect(ui.rbPropertysContrast,				SIGNAL(released()), this, SLOT(selectRBContrast()));
	connect(ui.rbPropertysBlur,					SIGNAL(released()), this, SLOT(selectRBBlur()));
	connect(ui.rbPropertysGaussianBlur,			SIGNAL(released()), this, SLOT(selectRBGaussianBlur()));
	connect(ui.rbPropertysMedianBlur,			SIGNAL(released()), this, SLOT(selectRBMedianBlur()));
	connect(ui.rbPropertysBilateralFilter,		SIGNAL(released()), this, SLOT(selectRBBilateralFilter()));
	connect(ui.rbPropertysErode,				SIGNAL(released()), this, SLOT(selectRBErode()));
	connect(ui.rbPropertysDilate,				SIGNAL(released()), this, SLOT(selectRBDilate()));
	connect(ui.rbPropertysZoom,					SIGNAL(released()), this, SLOT(selectRBZoom()));
	connect(ui.rbPropertysFiltrTwoD,			SIGNAL(released()), this, SLOT(selectRBFiltrTwoD()));
	connect(ui.rbAffinePropertysTransformations,SIGNAL(released()), this, SLOT(selectRBAffineTransformations()));


	//change value next to slider 
	for each (QSlider* var in vSliderValue)
		connect(var, SIGNAL(sliderReleased()), this, SLOT(moveSlider()));
	
	for each (QSlider* var in vSliderMisstakeValue) 
		connect(var, SIGNAL(sliderReleased()), this, SLOT(moveSlider()));
	

	//add noising
	connect(ui.buttonPropertysAddNoising,		SIGNAL(released()), this, SLOT(clickAddNoising()));
	//clear noising
	connect(ui.buttonPropertysCleaerNoising,	SIGNAL(released()), this, SLOT(clickClearNoising()));
	//generate noising image
	connect(ui.buttonPropertysNoising,			SIGNAL(released()), this, SLOT(clickGenerateNosingImage()));

	//segmentation
	connect(ui.RBSegmetation1,					SIGNAL(released()), this, SLOT(clickSegmentationErode()));
	connect(ui.RBSegmetation2,					SIGNAL(released()), this, SLOT(clickSegmentationContrast()));
	connect(ui.RBSegmetation3,					SIGNAL(released()), this, SLOT(clickSegmentationBW()));
	connect(ui.RBSegmetation4,					SIGNAL(released()), this, SLOT(clickSegmentationCutimage()));
	connect(ui.RBSegmetation5,					SIGNAL(released()), this, SLOT(clickSegmentationNegative()));
	connect(ui.RBSegmetation6,					SIGNAL(released()), this, SLOT(clickSegmentationSumControl()));

	for each (QSlider* var in vHSSegmentation)
		connect(var, SIGNAL(sliderReleased()), this, SLOT(SegmentationUpDatevParameters()));
	
	//button pre processing
	connect(ui.buttonPreProcessing, SIGNAL(released()), this, SLOT(preProcessing()));
	//button segmentation
	connect(ui.buttonSegmentation, SIGNAL(released()), this, SLOT(segmentation()));

	//button training
	connect(ui.buttonRunTest, SIGNAL(released()), this, SLOT(training()));
	
	//buton test
	connect(ui.buttonPredicleRunTest, SIGNAL(released()), this, SLOT(runTest()));
	connect(ui.buttonCreatVF, SIGNAL(released()), this, SLOT(saveFileVectorFeauter()));

	connect(ui.myTest, SIGNAL(released()), this, SLOT(myTest()));
	connect(ui.buttonGeneratorSign, SIGNAL(released()), this, SLOT(generatorSign()));
}

RecognitionNLP::~RecognitionNLP() {}


#pragma region

void RecognitionNLP::setParameters() {

	//find CSVM linear
	if(0)
	for (double c = 100000; c > 0.0001; c/=2) {

		//CSVM::cmdRun("echo " + itos(c) + " >> C:\\Test\\linear.bat");

		CSVM::cmdRun("echo C:\\Test\\svm-train.exe -s 1 -t 0 -c " + itos(c) + " -q C:\\Test\\SVF.txt C:\\Test\\SVFTraining.txt00.model >> C:\\Test\\linear.bat");
		//CSVM::cmdRun("echo echo svm-train.exe -s 0 -t 0 -c " + itos(c) + " \>\> C:\\Test\\r.txt >> C:\\Test\\linear.bat");
		CSVM::cmdRun("echo C:\\Test\\svm-predict.exe C:\\Test\\SVFT1Zb1.txt C:\\Test\\SVFTraining.txt00.model C:\\Test\\result \>\> C:\\Test\\r.txt >> C:\\Test\\linear.bat");
		CSVM::cmdRun("echo C:\\Test\\svm-predict.exe C:\\Test\\VF.txt C:\\Test\\SVFTraining.txt00.model C:\\Test\\result \>\> C:\\Test\\r.txt >> C:\\Test\\linear.bat");

	}

	/*-g -r -d -c -e*/

	if (0) {
		for (double c = 100000; c > 0.0001; c /= 10) {
			for (double g = 100; g > 0.0001; g /= 10) {
				for (double d = 10; d > 0.01; d /= 10) {

					if (0)
						CSVM::cmdRun("echo " + itos(g) + " >> C:\\Test\\wielomian.bat");
					if (0)
						CSVM::cmdRun("echo " + itos(c) + " >> C:\\Test\\wielomian.bat");
					if (0)
						CSVM::cmdRun("echo " + itos(d) + " >> C:\\Test\\wielomian.bat");

					if (0) {
						CSVM::cmdRun("echo C:\\Test\\svm-train.exe -s 0 -t 2 -c " + itos(c) + " -g " + itos(g) + " -d " + itos(d) + " -q C:\\Test\\SVF.txt C:\\Test\\SVFTraining.txt00.model >> C:\\Test\\wielomian.bat");
						//CSVM::cmdRun("echo echo svm-train.exe -s 0 -t 1 -c " + itos(c) + " \>\> C:\\Test\\r.txt >> C:\\Test\\rbf.bat");
						CSVM::cmdRun("echo C:\\Test\\svm-predict.exe C:\\Test\\SVFT1Zb1.txt C:\\Test\\SVFTraining.txt00.model C:\\Test\\result \>\> C:\\Test\\r.txt >> C:\\Test\\wielomian.bat");
						CSVM::cmdRun("echo C:\\Test\\svm-predict.exe C:\\Test\\VF.txt C:\\Test\\SVFTraining.txt00.model C:\\Test\\result \>\> C:\\Test\\r.txt >> C:\\Test\\wielomian.bat");
					}
				}
			}
		}
	}

	/*
SET "c=50" 
SET "g=0.03"
SET "r=0.1
"*/
	if(0)
	for (double c = 100000; c > 0.0001; c /= 10) {
		for (double g = 100; g > 0.0001; g /= 10) {

				if(0)
				CSVM::cmdRun("echo " + itos(g) + " >> C:\\Test\\rbf.bat");
				if (0)
				CSVM::cmdRun("echo " + itos(c) + " >> C:\\Test\\rbf.bat");

				if (1){
					CSVM::cmdRun("echo C:\\Test\\svm-train.exe -s 1 -t 2 -c " + itos(c) + " -g " + itos(g) + " -q C:\\Test\\SVF.txt C:\\Test\\SVFTraining.txt00.model >> C:\\Test\\rbf.bat");
					//CSVM::cmdRun("echo echo svm-train.exe -s 0 -t 1 -c " + itos(c) + " \>\> C:\\Test\\r.txt >> C:\\Test\\rbf.bat");
					CSVM::cmdRun("echo C:\\Test\\svm-predict.exe C:\\Test\\SVFT1Zb1.txt C:\\Test\\SVFTraining.txt00.model C:\\Test\\result \>\> C:\\Test\\r.txt >> C:\\Test\\rbf.bat");
					CSVM::cmdRun("echo C:\\Test\\svm-predict.exe C:\\Test\\VF.txt C:\\Test\\SVFTraining.txt00.model C:\\Test\\result \>\> C:\\Test\\r.txt >> C:\\Test\\rbf.bat");
				}
		}
	}

}

void RecognitionNLP::test() {

	static const int	NUMBER_SYMBOL			= 35;
	char				SIGN[NUMBER_SYMBOL]		= {
		'0','1','2','3','4','5','6','7','8','9',	//10
		'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',		//8
		'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',		//8 
		'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'	//9
	};
	int					NUMBER_SIGN_TRAINING[NUMBER_SYMBOL] = {
		0,0,0,0,0,0,0,0,0,0,	//10
		0,0,0,0,0,0,0,0,		//8
		0,0,0,0,0,0,0,0,		//8 
		0,0,0,0,0,0,0,0,0	//9
	};
	int					NUMBER_SIGN_TEST_I[NUMBER_SYMBOL] = {
		0,0,0,0,0,0,0,0,0,0,	//10
		0,0,0,0,0,0,0,0,		//8
		0,0,0,0,0,0,0,0,		//8 
		0,0,0,0,0,0,0,0,0	//9
	};
	int					NUMBER_SIGN_TEST_II[NUMBER_SYMBOL] = {
		0,0,0,0,0,0,0,0,0,0,	//10
		0,0,0,0,0,0,0,0,		//8
		0,0,0,0,0,0,0,0,		//8 
		0,0,0,0,0,0,0,0,0	//9
	};
	
	int					NUMBER_SAMPLES_TRAINING = 0;
	int					NUMBER_SAMPLES_TEST_I	= 0;
	int					NUMBER_SAMPLES_TEST_II	= 0;
#pragma region
	/* Path to main dictionary */
	const string PATH_SCRIPTS	= "SCRIPTS\\";
	const string PATH_SET		= "SET\\";
	const string PATH_ALL_PLATE = PATH_SET + "NLP\\";
	const string PATH_CAM_PLATE = PATH_SET + "NLP_Camera\\";

	/* Path to dictionary libsvm */
	const string PATH_LIBSVM	= PATH_SCRIPTS + "libsvm\\";
	const string PATH_CLASSIFIER = PATH_SCRIPTS + "Classifier\\";

	/* Path to dictionary training data */
	const string PATH_TRAINING	= PATH_SET + "Training\\";

	/* Path to dictionary test data */
	const string PATH_SET_ONE	= PATH_SET + "Test_I\\";
	const string PATH_SET_TWO	= PATH_SET + "Test_II\\";

	/* FILE TO SAVE ANSWER CLASSIFIER */
	const string RESULT_FILE	= PATH_CLASSIFIER + "Result.txt";

	/* PATH FILE TO TRAINING AND CALASSIFICATION */
	const string PATH_VF_TRAINING	= PATH_CLASSIFIER + "VF_Training.txt";
	const string PATH_VF_TEST_I		= PATH_CLASSIFIER + "VF_Test_I.txt";
	const string PATH_VF_TEST_II	= PATH_CLASSIFIER + "VF_Test_II.txt";
	const string PATH_NVF_TRAINING	= PATH_CLASSIFIER + "NVF_Training.txt";
	const string PATH_NVF_TEST_I	= PATH_CLASSIFIER + "NVF_Test_I.txt";
	const string PATH_NVF_TEST_II	= PATH_CLASSIFIER + "NVF_Test_II.txt";

	/* NAME NEED FILE TO TRAINING AND CALASSIFICATION */
	const string VF_TRAINING	= "VF_Training.txt";
	const string VF_TEST_I		= "VF_Test_I.txt";
	const string VF_TEST_II		= "VF_Test_II.txt";
	const string NVF_TRAINING	= "NVF_Training.txt";
	const string NVF_TEST_I		= "NVF_Test_I.txt";
	const string NVF_TEST_II	= "NVF_Test_II.txt";

	/* PATH MODEL FILE TO PREDICT */
	const string PATH_MODEL_LINEAR	= PATH_CLASSIFIER + "Model_Linear.model";
	const string PATH_MODEL_RBF		= PATH_CLASSIFIER + "Model_RBF";

	/* MODEL FILE TO PREDICT */
	const string MODEL_LINEAR	= "Model_Linear.model";
	const string MODEL_RBF		= "Model_RBF";

	/* Name skripts to find best parameters (grid search) */
	const string GS_LINEAR		= PATH_SCRIPTS + "GS_Linear.bat";
	const string GS_RBF			= PATH_SCRIPTS + "GS_RBF.bat";
#pragma endregion path & directory

	/* PARAMETERS TEST */
	static const int LIMIT_SAMPLES_TRAINING = 100;


	/* NEED VARIABLES */
	vector<string> fileList;

	Mat imageTMP;
	vector<Mat> imagesTMP;
	int numberSign = -1;

	vector<int>				vLabelTrain;
	vector<vector<float>>	vDataTraining;

	vector<int>				vLabelTestI;
	vector<vector<float>>	vDataTestI;

	vector<int>				vLabelTestII;
	vector<vector<float>>	vDataTestII;


	int*	labelTraining;
	float** dataTraining;
	int		numberDataTraining = 0;

	int*	labelTestI;
	float** dataTestI;
	int		numberDataTestI = 0;

	int*	labelTestII;
	float** dataTestII;
	int		numberDataTestII = 0;

	CDistorted distorted; 

	vector<int> distortedParametersTMP;
	vector<int> distortedMissParameTMP;
	vector<int> parametersSegmentationTMP;

	/* CLEAR OLD DATA IN DICTIONARY */
	clearFolder(PATH_SCRIPTS);
	clearFolder(PATH_CLASSIFIER);
	clearFolder(PATH_TRAINING);
	clearFolder(PATH_SET_ONE);
	clearFolder(PATH_SET_TWO);

#pragma region
	/* PREAPEAR DISTORTED TEST I */
	distortedParametersTMP.push_back(1);
	distortedParametersTMP.push_back(10);
	distortedMissParameTMP.push_back(0);
	distortedMissParameTMP.push_back(5);
	distorted.addDistortion(0, distortedParametersTMP, distortedMissParameTMP);
	ui.listPropertysNoising->addItem("Contrast");
	distortedParametersTMP.clear();
	distortedMissParameTMP.clear();

	distortedParametersTMP.push_back(6);
	distortedMissParameTMP.push_back(0);
	distorted.addDistortion(2, distortedParametersTMP, distortedMissParameTMP);
	ui.listPropertysNoising->addItem("Gaussian Blur");
	distortedParametersTMP.clear();
	distortedMissParameTMP.clear();

	distortedParametersTMP.push_back(3);
	distortedMissParameTMP.push_back(3);
	distorted.addDistortion(4, distortedParametersTMP, distortedMissParameTMP);
	ui.listPropertysNoising->addItem("BILATERAL FILTER");
	distortedParametersTMP.clear();
	distortedMissParameTMP.clear();

	distorted.addDistortion(7, distortedParametersTMP, distortedMissParameTMP);
	ui.listPropertysNoising->addItem("Zoom");
	distortedParametersTMP.clear();
	distortedMissParameTMP.clear();

	/* PREAPEAR PARAMETERS NEED TO SEGMENTATION TEST I */
	//ERODE
	parametersSegmentationTMP.push_back(0);
	parametersSegmentationTMP.push_back(0);
	//CONSTRAST
	parametersSegmentationTMP.push_back(0);
	parametersSegmentationTMP.push_back(0);
	//B&W
	parametersSegmentationTMP.push_back(100);
	//CUT IMAGE
	parametersSegmentationTMP.push_back(20);
	parametersSegmentationTMP.push_back(5);
	parametersSegmentationTMP.push_back(0);
	parametersSegmentationTMP.push_back(5);
	//NEGATIVE
	parametersSegmentationTMP.push_back(1);
	//SUM CONTROL
	parametersSegmentationTMP.push_back(1);
#pragma endregion create propertys segmentation 

	CSegmentation segmentation(&distorted, parametersSegmentationTMP);

	/* LOAD DATA TEST I */
	fileList = getListFileFrom(PATH_ALL_PLATE);

	/* SEGMENTATION AND DISTORTED TEST I */
	for each (string nameFile in fileList){
		
		imageTMP = imread(PATH_ALL_PLATE + nameFile);
		distorted.distortingImg(imageTMP);
		imagesTMP = segmentation.segmentationNLP(imageTMP, parametersSegmentationTMP, parametersSegmentationTMP[10]);

		for (int i = 0; i < imagesTMP.size() && i < nameFile.size() - 4; i++) {

			numberSign = -1;
			for (int j = 0; j < NUMBER_SYMBOL && numberSign == -1; j++) {
				if (SIGN[j] == nameFile[i])
					numberSign = j;
			}

			if (numberSign != -1) {

				if (LIMIT_SAMPLES_TRAINING > NUMBER_SIGN_TRAINING[numberSign]) {

					Mat result = segmentation.addAngle(imagesTMP[i]);
					NUMBER_SIGN_TRAINING[numberSign]++;
					//imwrite(createNameFile(PATH_TRAINING, SIGN[numberSign], "_" + itos(NUMBER_SIGN_TRAINING[numberSign]) + ".png"), result);

					NUMBER_SAMPLES_TRAINING++;
					numberDataTraining++;

					vLabelTrain.push_back(numberSign);
					vDataTraining.push_back(*countMoment(result));
				}
				else {

					Mat result = segmentation.addAngle(imagesTMP[i], 1, 0);
					showImage(result);
					NUMBER_SIGN_TEST_I[numberSign]++;
					//imwrite(createNameFile(PATH_SET_ONE, SIGN[numberSign], "_" + itos(NUMBER_SIGN_TEST_I[numberSign]) + ".png"), result);
					
					NUMBER_SAMPLES_TEST_I++;
					numberDataTestI++;

					vLabelTestI.push_back(numberSign);
					vDataTestI.push_back(*countMoment(result));
				}
			}
		}
	}

	/* PREPEAR DATA TO TRAINING AND TEST I */
	labelTraining	= new int[vLabelTrain.size()];
	dataTraining	= new float*[vLabelTrain.size()];

	labelTestI		= new int[vLabelTestI.size()];
	dataTestI		= new float*[vLabelTestI.size()];

	for (int i = 0; i < vLabelTrain.size(); i++) {
		labelTraining[i] = vLabelTrain[i];
		dataTraining[i] = new float[vDataTraining[i].size()];
		for (int j = 0; j < vDataTraining[i].size(); j++)
			dataTraining[i][j] = vDataTraining[i][j];
	}

	for (int i = 0; i < vLabelTest.size(); i++) {
		labelTestI[i] = vLabelTestI[i];
		dataTestI[i] = new float[vDataTestI[i].size()];
		for (int j = 0; j < vDataTestI[i].size(); j++)
			dataTestI[i][j] = vDataTestI[i][j];
	}
	


#pragma region
	/* PREAPEAR PARAMETERS NEED TO SEGMENTATION TEST II */
	distorted.clearAll();
	parametersSegmentationTMP.clear();
	//ERODE
	parametersSegmentationTMP.push_back(0);
	parametersSegmentationTMP.push_back(0);
	//CONSTRAST
	parametersSegmentationTMP.push_back(0);
	parametersSegmentationTMP.push_back(0);
	//B&W
	parametersSegmentationTMP.push_back(80);
	//CUT IMAGE
	parametersSegmentationTMP.push_back(20);
	parametersSegmentationTMP.push_back(5);
	parametersSegmentationTMP.push_back(0);
	parametersSegmentationTMP.push_back(5);
	//NEGATIVE
	parametersSegmentationTMP.push_back(1);
	//SUM CONTROL
	parametersSegmentationTMP.push_back(40);
#pragma endregion create parameters segmentation

	CSegmentation segmentationII(&distorted, parametersSegmentationTMP);

	fileList.clear();
	fileList = getListFileFrom(PATH_CAM_PLATE);	

	/* SEGMENTATION AND DISTORTED TEST II */
	for each (string nameFile in fileList) {

		imageTMP = imread(PATH_CAM_PLATE + nameFile);
		distorted.distortingImg(imageTMP);
		imagesTMP = segmentationII.segmentationNLP(imageTMP, parametersSegmentationTMP, parametersSegmentationTMP[10]);

		for (int i = 0; i < imagesTMP.size() && i < nameFile.size() - 4; i++) {

			numberSign = -1;
			for (int j = 0; j < NUMBER_SYMBOL && numberSign == -1; j++) {
				if (SIGN[j] == nameFile[i])
					numberSign = j;
			}

			if (numberSign != -1) {

				Mat result = segmentationII.addAngle(imagesTMP[i], false, false);
				NUMBER_SIGN_TEST_II[numberSign]++;
				imwrite(createNameFile(PATH_SET_TWO, SIGN[numberSign], "_" + itos(NUMBER_SIGN_TEST_II[numberSign]) + ".png"), result);

				NUMBER_SAMPLES_TEST_II++;
				numberDataTestII++;

				vLabelTestII.push_back(numberSign);
				vDataTestII.push_back(*countMoment(result));
			}
		}
	}

	/* PREPEAR DATA TO TEST II */
	labelTestII = new int[vLabelTestII.size()];
	dataTestII	= new float*[vLabelTestII.size()];

	for (int i = 0; i < vLabelTestII.size(); i++) {
		labelTestII[i] = vLabelTestII[i];
		dataTestII[i] = new float[vDataTestII[i].size()];
		for (int j = 0; j < vDataTestII[i].size(); j++)
			dataTestII[i][j] = vDataTestII[i][j];
	}

	CSVM nu_svm;
	/* SAVE TRAINING VF */
	nu_svm.saveVectorToFile(labelTraining, dataTraining, PATH_CLASSIFIER, VF_TRAINING, PATH_LIBSVM, PATH_CLASSIFIER, vLabelTrain.size());
	/* SAVE TEST I VF */
	nu_svm.saveVectorToFile(labelTestI, dataTestI, PATH_CLASSIFIER, VF_TEST_I, PATH_LIBSVM, PATH_CLASSIFIER, vLabelTestI.size());
	/* SAVE TEST II VF */
	nu_svm.saveVectorToFile(labelTestII, dataTestII, PATH_CLASSIFIER, VF_TEST_II, PATH_LIBSVM, PATH_CLASSIFIER, vLabelTestII.size());


	/* CREAETE GRID SEARCH */
	createFile(GS_LINEAR);
	insertToFile(GS_LINEAR, "echo @echo OFF");
	insertToFile(GS_LINEAR, "echo SET \"svm=0\"");
	insertToFile(GS_LINEAR, "echo SET \"kernel=0\"");
	//Linear
	for (int c = 1; c < 10000; c *= 2) {
		insertToFile(GS_LINEAR, "echo ..\\" + PATH_LIBSVM + "svm-train.exe -s %svm% -t %kernel% -c " + itos(c) + " -q ..\\" + PATH_NVF_TRAINING + " ..\\" + PATH_MODEL_LINEAR);
		insertToFile(GS_LINEAR, "echo Kernel = Linear, Test = I, C = " + itos(c) + ":");
		insertToFile(GS_LINEAR, "echo ..\\" + PATH_LIBSVM + "svm-predict.exe ..\\" + PATH_NVF_TEST_I + " ..\\" + PATH_MODEL_LINEAR + " ..\\" + RESULT_FILE);
		insertToFile(GS_LINEAR, "echo Kernel = Linear, Test = II, C = " + itos(c) + ":");
		insertToFile(GS_LINEAR, "echo ..\\" + PATH_LIBSVM + "svm-predict.exe ..\\" + PATH_NVF_TEST_II + " ..\\" + PATH_MODEL_LINEAR + " ..\\" + RESULT_FILE);
	}
	//RBF
	createFile(GS_RBF);
	insertToFile(GS_RBF, "echo @echo OFF");
	insertToFile(GS_RBF, "echo SET \"svm=0\"");
	insertToFile(GS_RBF, "echo SET \"kernel=2\"");
	for (int c = 1; c < 10000; c *= 2) {
		for (double g = 0.001953125; g < 10; g *= 2) {
			insertToFile(GS_RBF, "echo ..\\" + PATH_LIBSVM + "svm-train.exe -s %svm% -t %kernel% -c " + itos(c) + " -g " + itos(g) + " -q ..\\" + PATH_NVF_TRAINING + " ..\\" + PATH_MODEL_RBF);
			insertToFile(GS_RBF, "echo Kernel = RBF, Test = I, C = " + itos(c) + ", g = " + itos(g) + ":");
			insertToFile(GS_RBF, "echo ..\\" + PATH_LIBSVM + "svm-predict.exe ..\\" + PATH_NVF_TEST_I + " ..\\" + PATH_MODEL_RBF + " ..\\" + RESULT_FILE);
			insertToFile(GS_RBF, "echo Kernel = RBF, Test = II, C = " + itos(c) + ", g = " + itos(g) + ":");
			insertToFile(GS_RBF, "echo ..\\" + PATH_LIBSVM + "svm-predict.exe ..\\" + PATH_NVF_TEST_II + " ..\\" + PATH_MODEL_RBF + " ..\\" + RESULT_FILE);
		}
	}

	//Test I
	createFile("TEST I.bat");
	for (int c = 1; c < 10000; c *= 2) {

		insertToFile("TEST I.bat", "echo Kernel = Linear, Test = I, C = " + itos(c) + ": ");
		insertToFile("TEST I.bat", "echo ..\\" + PATH_LIBSVM + "svm-train.exe -s 0 -t 0 -c " + itos(c) + " -q ..\\" + PATH_NVF_TRAINING + " ..\\" + PATH_MODEL_LINEAR);
		insertToFile("TEST I.bat", "echo ..\\" + PATH_LIBSVM + "svm-predict.exe ..\\" + PATH_NVF_TEST_I + " ..\\" + PATH_MODEL_LINEAR + " ..\\" + RESULT_FILE);
		insertToFile("TEST I.bat", "echo  ");
		for (double g = 0.001953125; g < 10; g *= 2) {

			insertToFile("TEST I.bat", "echo Kernel = RBF, Test = I, C = " + itos(c) + ", g = " + itos(g) + ":");
			insertToFile("TEST I.bat", "echo ..\\" + PATH_LIBSVM + "svm-train.exe -s 0 -t 2 -c " + itos(c) + " -g " + itos(g) + " -q ..\\" + PATH_NVF_TRAINING + " ..\\" + PATH_MODEL_RBF);
			insertToFile("TEST I.bat", "echo ..\\" + PATH_LIBSVM + "svm-predict.exe ..\\" + PATH_NVF_TEST_I + " ..\\" + PATH_MODEL_RBF + " ..\\" + RESULT_FILE);
		}
		insertToFile("TEST I.bat", "echo  ");
	}

	//Test II
	createFile("TEST II.bat");
	for (int c = 1; c < 10000; c *= 2) {

		insertToFile("TEST II.bat", "echo Kernel = Linear, Test = II, C = " + itos(c) + ": ");
		insertToFile("TEST II.bat", "echo ..\\" + PATH_LIBSVM + "svm-train.exe -s 0 -t 0 -c " + itos(c) + " -q ..\\" + PATH_NVF_TRAINING + " ..\\" + PATH_MODEL_LINEAR);
		insertToFile("TEST II.bat", "echo ..\\" + PATH_LIBSVM + "svm-predict.exe ..\\" + PATH_NVF_TEST_II + " ..\\" + PATH_MODEL_LINEAR + " ..\\" + RESULT_FILE);
		insertToFile("TEST II.bat", "echo  ");
		for (double g = 0.001953125; g < 10; g *= 2) {

			insertToFile("TEST II.bat", "echo Kernel = RBF, Test = II, C = " + itos(c) + ", g = " + itos(g) + ":");
			insertToFile("TEST II.bat", "echo ..\\" + PATH_LIBSVM + "svm-train.exe -s 0 -t 2 -c " + itos(c) + " -g " + itos(g) + " -q ..\\" + PATH_NVF_TRAINING + " ..\\" + PATH_MODEL_RBF);
			insertToFile("TEST II.bat", "echo ..\\" + PATH_LIBSVM + "svm-predict.exe ..\\" + PATH_NVF_TEST_II + " ..\\" + PATH_MODEL_RBF + " ..\\" + RESULT_FILE);
		}
		insertToFile("TEST II.bat", "echo  ");
	}


	// TO DO: dodac test II oraz dopisac zapisanie skryptu 
}

void RecognitionNLP::myTest() {
	test();
	static const int	NUMBER_SYMBOL = 35;
	const string PATH_TRAIN = "C:\\Test\\zbiory\\uczacy\\";
	const string PATH_TESTI = "C:\\Test\\zbiory\\testI\\";
	const string PATH_TESII = "C:\\Test\\zbiory\\testII\\";
	char				sign[NUMBER_SYMBOL] = {
		'0','1','2','3','4','5','6','7','8','9',	//10
		'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',		//8
		'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',		//8 
		'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'	//9
	};	
	int					nrSign[NUMBER_SYMBOL] = {
		0,0,0,0,0,0,0,0,0,0,	//10
		0,0,0,0,0,0,0,0,		//8
		0,0,0,0,0,0,0,0,		//8 
		0,0,0,0,0,0,0,0,0	//9
	};

	clearFolder("C:\\Test\\zbiory\\all\\");
	clearFolder(PATH_TRAIN);
	clearFolder(PATH_TESTI);
	clearFolder(PATH_TESII);
	vector<Mat> tmp;
	Mat			tmp2;
	string		help;
	CSegmentation segmentation(&distorted, vParameters);

	string					tmpName;
	int limitSignT1 = 100;
	int	nrSignT1[NUMBER_SYMBOL] = {
		0,0,0,0,0,0,0,0,0,0,	//10
		0,0,0,0,0,0,0,0,		//8
		0,0,0,0,0,0,0,0,		//8 
		0,0,0,0,0,0,0,0,0	//9
	};
	int numberOfSign = 0;
	vector<int>				vLabelTrain;
	vector<vector<float>>	vTrainingTrain;
	int						nrT1Training	= 0;
	vector<int>				vLabelTest;
	vector<vector<float>>	vTrainingTest;
	int						nrT1Zb1			= 0;
	string path = convertQStringToString(ui.inputLoadPath->text());
	if ('\\' != path[path.length()])
		path += "\\";
	vector<string>		filesList = getListFileFrom(path);
	for each(string var in filesList) {

		tmp.clear();
		tmp2 = imread(path + var);
		
		distorted.distortingImg(tmp2);
		tmp = segmentation.segmentationNLP(tmp2, vParameters, vParameters[10]);
		imshow("MAIN", tmp2);
		int numberSign = -1;
		int ntmp = 0;
		for (int i = 0; i < tmp.size() && i < var.size() - 4; i++) {

			for (int j = 0; j < NUMBER_SYMBOL; j++) {
				if (sign[j] == var[i])
					numberSign = j;
			}

			if (numberSign != -1) {

				if (limitSignT1 > nrSignT1[numberSign]) {

					Mat result = segmentation.addAngle(tmp[i]);

					nrSignT1[numberSign]++;
					help = PATH_TRAIN;
					help += sign[numberSign];
					help += "_" + itos(nrT1Training) + "_" + itos(numberOfSign) + ".png";
					imwrite(help, result);
					nrT1Training++;
					imshow(itos(ntmp), result);
					ntmp++;
					vLabelTrain.push_back(numberSign);
					vTrainingTrain.push_back(*countMoment(result));
				}
				else {

					Mat result = segmentation.addAngle(tmp[i], 1, 0);
					help = PATH_TESTI;
					help += sign[numberSign];
					help += "_" + itos(nrT1Zb1) + "_" + itos(numberOfSign) + ".png";
					imwrite(help, result);
					nrT1Zb1++;

					imshow(itos(ntmp), result);
					ntmp++;
					vLabelTest.push_back(numberSign);
					vTrainingTest.push_back(*countMoment(result));
				}

				Mat result = segmentation.addAngle(tmp[i], 1, 0);
				tmpName = "C:\\Test\\zbiory\\all\\";
				tmpName += itos(i);
				tmpName += ".png";
				imwrite(tmpName, result);
				
			}
		}
		numberOfSign++;
		//waitKey();
	}

	
	//training test 1
	int*	labelT1Training			= new int[vLabelTrain.size()];
	float** trainingDataT1Training	= new float*[vLabelTrain.size()];
	//set 1 test 1
	int*	labelT1Zb1				= new int[vLabelTest.size()];
	float** trainingDataT1Zb1		= new float*[vLabelTest.size()];
		
	for (int i = 0; i < vLabelTrain.size(); i++) {
		labelT1Training[i] = vLabelTrain[i];
		trainingDataT1Training[i] = new float[vTrainingTrain[i].size()];
		for (int j = 0; j < vTrainingTrain[i].size(); j++)
			trainingDataT1Training[i][j] = vTrainingTrain[i][j];
	}

	for (int i = 0; i < vLabelTest.size(); i++) {
		labelT1Zb1[i] = vLabelTest[i];
		trainingDataT1Zb1[i] = new float[vTrainingTest[i].size()];
		for (int j = 0; j < vTrainingTest[i].size(); j++)
			trainingDataT1Zb1[i][j] = vTrainingTest[i][j];
	}


	/* SAVE VECTOR FEAUTERS TO FILE */
	string pathTest			= "C:\\Test\\skrypty\\";

	string test1Training	= "SVFT1Training.txt";
	string test1Zb1			= "SVFT1Zb1.txt";
	string test1Zb2			= "SVFT1Zb2.txt";


	CSVM nu_svm;
	//save test 1 SVF training
	nu_svm.saveVectorToFile(labelT1Training, trainingDataT1Training, pathTest + test1Training, pathTest, nrT1Training);
	//save test 2 SVF training
	//nu_svm.saveVectorToFile(labelT2Training, trainingDataT2Training, pathTest + test2Training, nrT2Training, false);

	//save test 1 SVF set 1
	nu_svm.saveVectorToFile(labelT1Zb1, trainingDataT1Zb1, pathTest + test1Zb1, pathTest, nrT1Zb1);
	//save test 1 SVF set 2
	//nu_svm.saveVectorToFile(labelT1Zb1, trainingDataT1Zb1, pathTest + test1Zb2, nrT1Zb1, false);

	//save test 2 SVF set 1
	//nu_svm.saveVectorToFile(labelT2Zb1, trainingDataT2Zb1, pathTest + test2Zb1, nrT2Zb1, false);
	//save test 2 SVF set 2
	//nu_svm.saveVectorToFile(labelT2Zb2, trainingDataT2Zb2, pathTest + test2Zb2, nrT2Zb2, false);


	/* CREAETE GRID SEARCH */

	string GS_Linear	= pathTest + "GSLinear.bat";
	string GS_RBF		= pathTest + "GSRBF.bat";

	//Linear
	CSVM::cmdRun("echo @echo OFF >> " + GS_Linear);
	CSVM::cmdRun("echo SET \"svm=0\" >> " + GS_Linear);
	CSVM::cmdRun("echo SET \"kernel=0\" >> " + GS_Linear);
	for (int c = 1; c < 10000; c *= 2) {
		CSVM::cmdRun("echo " + pathTest + "svm-train.exe -s %svm% -t %kernel% -c " + itos(c) + " -q " + pathTest + test1Training + " " + pathTest + test1Training + "00.model >> " + GS_Linear);
		CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb1 + " " + pathTest + test1Training + "00.model R.txt " + " >> " + GS_Linear);
		CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb2 + " " + pathTest + test1Training + "00.model R.txt " + " >> " + GS_Linear);
	}

	//RBF
	CSVM::cmdRun("echo @echo OFF >> " + GS_RBF);
	CSVM::cmdRun("echo SET \"svm=0\" >> " + GS_RBF);
	CSVM::cmdRun("echo SET \"kernel=1\" >> " + GS_RBF);
	for (int c = 1; c < 10000; c *= 2) {
		for (double g = 0.001; g < 10; g *= 2) {
			CSVM::cmdRun("echo " + pathTest + "svm-train.exe -s %svm% -t %kernel% -c " + itos(c) + " -g " + itos(g) + " -q " + pathTest + test1Training + " " + pathTest + test1Training + "02.model >> " + GS_RBF);
			CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb1 + " " + pathTest + test1Training + "02.model R.txt " + " >> " + GS_RBF);
			CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb2 + " " + pathTest + test1Training + "02.model R.txt " + " >> " + GS_RBF);
		}
	}


	/* CREATE MODELS *//*
	CSVM::cmdRun("echo @ECHO OFF >> " + pathTest + "skrypt.bat");


	CSVM::cmdRun("echo SET \"svm=0\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"kernel=0\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"e=1\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"c=1\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-train.exe -s %svm% -t %kernel% -e %e% -c %c% -q " + pathTest + test1Training + " " + pathTest + test1Training + "00.model >> " + pathTest + "skrypt.bat");

	CSVM::cmdRun("echo SET \"kernel=2\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"e=0.002\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"c=4\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"g=1\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-train.exe -s %svm% -t %kernel% -g %g% -e %e% -c %c% -q " + pathTest + test1Training + " " + pathTest + test1Training + "02.model >> " + pathTest + "skrypt.bat");


	CSVM::cmdRun("echo echo Test 1 SET 1 >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb1 + " " + pathTest + test1Training + "00.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb2 + " " + pathTest + test1Training + "02.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	
	CSVM::cmdRun("echo echo Test 2 SET 1 >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb1 + " " + pathTest + test1Training + "00.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb2 + " " + pathTest + test1Training + "02.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	
	CSVM::cmdRun("echo PAUSE \>nul >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun(pathTest + "skrypt.bat");
	*/
}

vector<float>* RecognitionNLP::countMoment(Mat image) {

	vector<float>* trainingData = new vector<float>();
	double hu[7];

	if (CV_RGB2GRAY != image.type()) {

		//cvtColor(image, image, CV_RGB2GRAY);
	}

	Moments m = moments(image);
	HuMoments(m, hu);

	trainingData->push_back(m.m00);
	trainingData->push_back(m.m10);
	trainingData->push_back(m.m01);
	trainingData->push_back(m.m20);
	trainingData->push_back(m.m11);
	trainingData->push_back(m.m02);
	trainingData->push_back(m.m30);
	trainingData->push_back(m.m21);
	trainingData->push_back(m.m12);
	trainingData->push_back(m.m03);

	trainingData->push_back(m.mu20);
	trainingData->push_back(m.mu11);
	trainingData->push_back(m.mu02);
	trainingData->push_back(m.mu30);
	trainingData->push_back(m.mu21);
	trainingData->push_back(m.mu12);
	trainingData->push_back(m.mu03);

	trainingData->push_back(m.nu20);
	trainingData->push_back(m.nu11);
	trainingData->push_back(m.nu02);
	trainingData->push_back(m.nu30);
	trainingData->push_back(m.nu21);
	trainingData->push_back(m.nu12);
	trainingData->push_back(m.nu03);

	trainingData->push_back(hu[0]);
	trainingData->push_back(hu[1]);
	trainingData->push_back(hu[2]);
	trainingData->push_back(hu[3]);
	trainingData->push_back(hu[4]);
	trainingData->push_back(hu[5]);
	trainingData->push_back(hu[6]);

	return trainingData;
}

void RecognitionNLP::generatorSign() {

	string path = convertQStringToString(ui.inputLoadPath->text());
	if ('\\' != path[path.length()])
		path += "\\";

	vector<CImageSign>	vNLP;
	vector<string>		filesList = getListFileFrom(path);
	for each(string var in filesList)
		vNLP.push_back(CImageSign(imread(path + var), var));

	CSegmentation segmentation(&distorted, vParameters);
	Mat tmpMat;
	string tmpPath = "";
	path = "D:\\Segmentation\\Result\\";
	for (int j = 0; j < 100; j++)
		segmentation.segmentationNLP(vNLP, vParameters[10], 1, 0, 1);
	


}

#pragma endregion My test


#pragma region

void RecognitionNLP::clickClearData() {

	ui.listLoadData->clear();
	distorted.clearAll();
	ui.listPropertysNoising->clear();
}

void RecognitionNLP::clickLoadData() {

	clickClearData();
	string path = convertQStringToString(ui.inputLoadPath->text());
	if ('\\' != path[path.length()])
		path += "\\";

	vector<string> filesList = getListFileFrom(path);
	image = imread(path + filesList[0]);

	int i = 1;
	for each (string var in filesList){
		ui.listLoadData->addItem(convertStringToQString(itos(i)+ var));
		i++;
	}

	//turn on all scens
	ui.GBSegmentation->setEnabled(true);
	ui.GBPropertys->setEnabled(true);
	ui.GBTest->setEnabled(true);
	ui.GBPredict->setEnabled(true);
	
	distorted.changeImage(image.clone());

	UseDefaultValue();
	SegmentationUpDateScens(vector<string>(0), vector<int>(0), vector<int>(0), vector<int>(0));
	PropertysUpDateScens(vector<string>(0), vector<int>(0), vector<int>(0), vector<int>(0));
	PropertysShowResultImage();
}

#pragma endregion It is tab LOAD DATA


#pragma region

void RecognitionNLP::PropertysUpDateScens(vector<string> vValues, vector<int> vMin, vector<int> vMax, vector<int> vDefault) {

	/* TAB PROPERTYS */
	//hiding all sliders
	for (int i = 0; i < vLabelsValue.size(); i++) {
		vSliderValue[i]->hide();
		vSliderMisstakeValue[i]->hide();
		vLabelsValue[i]->hide();
		vLabelValueSlider[i]->hide();
		vLabelMisstakeValueSlider[i]->hide();
	}

	//show only this slider what is need
	for (int i = 0; i < vValues.size(); i++) {

		vSliderValue[i]->show();
		vSliderMisstakeValue[i]->show();
		vLabelsValue[i]->show();
		vLabelValueSlider[i]->show();
		vLabelMisstakeValueSlider[i]->show();
	}

	//set max and min value and text
	for (int i = 0; i < vValues.size(); i++) {

		vSliderValue[i]->setMinimum(vMin[i]);
		vSliderValue[i]->setMaximum(vMax[i]);
		vSliderValue[i]->setValue(vDefault[i]);

		vSliderMisstakeValue[i]->setMinimum(0);
		vSliderMisstakeValue[i]->setMaximum(vMax[i]);
		vSliderMisstakeValue[i]->setValue(0);

		vLabelsValue[i]->setText(convertStringToQString(vValues[i]));
		vLabelValueSlider[i]->setText(convertStringToQString(itos(vDefault[i])));
		vLabelMisstakeValueSlider[i]->setText(convertStringToQString(itos(0)));
	}
	/* END TAB PROPERTYS */
}

void RecognitionNLP::PropertysShowResultImage(bool onRawFile) {

	Mat img;
	if (onRawFile)
		img = distorted.getImage();
	else
		img = distorted.getImage().clone();

	vector<int> vValue;
	vector<int> vMissValue;

	for (int i = 0; i < 6; i++) {
		if (vSliderValue[i]->isEnabled()) {
			vValue.push_back(vSliderValue[i]->value());
			vMissValue.push_back(vSliderMisstakeValue[i]->value());
		}
	}

	if (ui.rbAffinePropertysTransformations->isChecked()) {

		CDistorted::noising(img, 9, vValue, vMissValue);
		if (onRawFile) {
			distorted.addDistortion(9, vValue, vMissValue);
			ui.listPropertysNoising->addItem("Affine Transformations");
		}
	}
	if (ui.rbPropertysBilateralFilter->isChecked()) {

		CDistorted::noising(img, 4, vValue, vMissValue);
		if (onRawFile) {
			distorted.addDistortion(4, vValue, vMissValue);
			ui.listPropertysNoising->addItem("Bilateral Filter");
		}
	}
	if (ui.rbPropertysBlur->isChecked()) {

		CDistorted::noising(img, 1, vValue, vMissValue);
		if (onRawFile) {
			distorted.addDistortion(1, vValue, vMissValue);
			ui.listPropertysNoising->addItem("Blur");
		}
	}
	if (ui.rbPropertysContrast->isChecked()) {

		CDistorted::noising(img, 0, vValue, vMissValue);
		if (onRawFile) {
			distorted.addDistortion(0, vValue, vMissValue);
			ui.listPropertysNoising->addItem("Contrast");
		}
	}
	if (ui.rbPropertysDilate->isChecked()) {

		CDistorted::noising(img, 6, vValue, vMissValue);
		if (onRawFile) {
			distorted.addDistortion(6, vValue, vMissValue);
			ui.listPropertysNoising->addItem("Dilate");
		}
	}
	if (ui.rbPropertysErode->isChecked()) {

		CDistorted::noising(img, 5, vValue, vMissValue);
		if (onRawFile) {
			distorted.addDistortion(5, vValue, vMissValue);
			ui.listPropertysNoising->addItem("Erode");
		}
	}
	if (ui.rbPropertysFiltrTwoD->isChecked()) {

		CDistorted::noising(img, 8, vValue, vMissValue);
		if (onRawFile) {
			distorted.addDistortion(8, vValue, vMissValue);
			ui.listPropertysNoising->addItem("Filtr TwoD");
		}
	}
	if (ui.rbPropertysGaussianBlur->isChecked()) {

		CDistorted::noising(img, 2, vValue, vMissValue);
		if (onRawFile) {
			distorted.addDistortion(2, vValue, vMissValue);
			ui.listPropertysNoising->addItem("Gaussian Blur");
		}
	}
	if (ui.rbPropertysMedianBlur->isChecked()) {

		CDistorted::noising(img, 3, vValue, vMissValue);
		if (onRawFile) {
			distorted.addDistortion(3, vValue, vMissValue);
			ui.listPropertysNoising->addItem("Median Blur");
		}
	}
	if (ui.rbPropertysZoom->isChecked()) {

		CDistorted::noising(img, 7, vValue, vMissValue);
		if (onRawFile) {
			distorted.addDistortion(7, vValue, vMissValue);
			ui.listPropertysNoising->addItem("Zoom");
		}
	}
	
	//imshow("A", img);
	QPixmap pix = cvMatToQPixmap(img);
	ui.labelPropertysResultImage->clear();
	ui.labelPropertysResultImage->setPixmap(pix);
	img.release();
	if (onRawFile) PropertysShowResultImage();
}

void RecognitionNLP::UseDefaultValue(){

	vector<int> p, mv;

	p.push_back(1);
	p.push_back(10);
	mv.push_back(0);
	mv.push_back(5);
	distorted.addDistortion(0, p, mv);
	ui.listPropertysNoising->addItem("Contrast");
	p.clear();
	mv.clear();

	p.push_back(6);
	mv.push_back(0);
	distorted.addDistortion(2, p, mv);
	ui.listPropertysNoising->addItem("Gaussian Blur");
	p.clear();
	mv.clear();

	p.push_back(3);
	mv.push_back(3);
	distorted.addDistortion(4, p, mv);
	ui.listPropertysNoising->addItem("BILATERAL FILTER");
	p.clear();
	mv.clear();

	distorted.addDistortion(7, p, mv);
	ui.listPropertysNoising->addItem("Zoom");

	int min = 0;
	int max = 0;

	p.push_back(min);
	p.push_back(min);
	p.push_back(min);
	p.push_back(min);
	p.push_back(min);
	p.push_back(min);
	mv.push_back(max);
	mv.push_back(max);
	mv.push_back(max);
	mv.push_back(max);
	mv.push_back(max);
	mv.push_back(max);
	//distorted.addDistortion(9, p, mv);
	//ui.listPropertysNoising->addItem("Affine Transformations");
	p.clear();
	mv.clear();
}

/* CLICK METHODS */

void RecognitionNLP::clickAddNoising() {
	
	PropertysShowResultImage(true);
	SegmentationShowResultImages();

}
void RecognitionNLP::clickClearNoising() {

	ui.listPropertysNoising->clear();
	distorted.clearAll();

	PropertysShowResultImage();
}
void RecognitionNLP::moveSlider() {

	PropertysShowResultImage();
}

void RecognitionNLP::clickGenerateNosingImage() {

	/* LOAD DATA */

	string path = convertQStringToString(ui.inputLoadPath->text());
	if ('\\' != path[path.length()])
		path += "\\";

	vector<CImageSign>	NLP;
	vector<string>		filesList = getListFileFrom(path);

	system("mkdir distorted");

	for (int i = 1; i < filesList.size(); i++) 
		imwrite("distorted\\" + filesList[i], distorted.distortingImgage(imread(path + filesList[i])));
}

void RecognitionNLP::selectRBContrast() {

	vector<string> v;

	vector<int> max;
	vector<int> min;
	vector<int> def;

	setVector(v, min, max, def, "Alpha", 1, 3, 1);
	setVector(v, min, max, def, "Beta", 1, 100, 1);
	PropertysUpDateScens(v, min, max, def);
	PropertysShowResultImage();
}
void RecognitionNLP::selectRBBlur() {

	vector<string> v;

	vector<int> max;
	vector<int> min;
	vector<int> def;

	setVector(v, min, max, def, "Size", 1, 100, 1);
	PropertysUpDateScens(v, min, max, def);
	PropertysShowResultImage();
}
void RecognitionNLP::selectRBGaussianBlur() {

	vector<string> v;

	vector<int> max;
	vector<int> min;
	vector<int> def;

	setVector(v, min, max, def, "Size", 1, 31, 1);
	PropertysUpDateScens(v, min, max, def);
	PropertysShowResultImage();
}
void RecognitionNLP::selectRBMedianBlur() {

	vector<string> v;

	vector<int> max;
	vector<int> min;
	vector<int> def;
	//tylko parzyste
	setVector(v, min, max, def, "Size", 1, 6, 1);
	PropertysUpDateScens(v, min, max, def);
	PropertysShowResultImage();
}
void RecognitionNLP::selectRBBilateralFilter() {

	vector<string> v;

	vector<int> max;
	vector<int> min;
	vector<int> def;

	setVector(v, min, max, def, "Sigma", 1, 31, 1);
	PropertysUpDateScens(v, min, max, def);
	PropertysShowResultImage();
}
void RecognitionNLP::selectRBErode() {

	vector<string> v;

	vector<int> max;
	vector<int> min;
	vector<int> def;

	setVector(v, min, max, def, "Size", 1, 100, 1);
	setVector(v, min, max, def, "Operation", 0, 2, 0);
	PropertysUpDateScens(v, min, max, def);
	PropertysShowResultImage();
}
void RecognitionNLP::selectRBDilate() {

	vector<string> v;

	vector<int> max;
	vector<int> min;
	vector<int> def;

	setVector(v, min, max, def, "Size", 1, 100, 1);
	setVector(v, min, max, def, "Operation", 0, 2, 0);
	PropertysUpDateScens(v, min, max, def);
	PropertysShowResultImage();
}
void RecognitionNLP::selectRBZoom() {

	vector<string> v;

	vector<int> max;
	vector<int> min;
	vector<int> def;

	setVector(v, min, max, def, "Zoom", 2, 2, 2);
	PropertysUpDateScens(v, min, max, def);
	PropertysShowResultImage();
}
void RecognitionNLP::selectRBFiltrTwoD() {

	vector<string> v;

	vector<int> max;
	vector<int> min;
	vector<int> def;

	setVector(v, min, max, def, "Size", 1, 100, 1);
	PropertysUpDateScens(v, min, max, def);
	PropertysShowResultImage();
}
void RecognitionNLP::selectRBAffineTransformations() {

	vector<string> v;

	vector<int> max;
	vector<int> min;
	vector<int> def;

	setVector(v, min, max, def, "Size", 1, 100, 1);
	setVector(v, min, max, def, "Size", 1, 100, 1);
	setVector(v, min, max, def, "Size", 1, 100, 1);
	setVector(v, min, max, def, "Size", 1, 100, 1);
	setVector(v, min, max, def, "Size", 1, 100, 1);
	setVector(v, min, max, def, "Size", 1, 100, 1);
	PropertysUpDateScens(v, min, max, def);
	PropertysShowResultImage();
}


/* END CLICK METHODS */


#pragma endregion It is tab PROPERTYS


#pragma region

void RecognitionNLP::SegmentationUpDateScens(vector<string> vValues, vector<int> vMin, vector<int> vMax, vector<int> vDefault) {

	/* TAB SEGMENTATION */
	//hiding all sliders
	for (int i = 0; i < 4; i++) {
		vLabelsSegmentation[i]->hide();
		vLabelsSegmetationValue[i]->hide();
		vHSSegmentation[i]->hide();
	}

	//show only this slider what is need
	for (int i = 0; i < vValues.size(); i++) {

		vLabelsSegmentation[i]->show();
		vLabelsSegmetationValue[i]->show();
		vHSSegmentation[i]->show();
	}

	//set max and min value and text
	for (int i = 0; i < vValues.size(); i++) {

		vHSSegmentation[i]->setMinimum(vMin[i]);
		vHSSegmentation[i]->setMaximum(vMax[i]);
		vHSSegmentation[i]->setValue(vDefault[i]);

		vLabelsSegmentation[i]->setText(convertStringToQString(vValues[i]));
	}
	/* END TAB SEGMENTATION */
	SegmentationShowResultImages();
}

void RecognitionNLP::SegmentationShowResultImages() {

	vector<Mat> imageAfterSegmentation;
	CSegmentation segmentation(&distorted, vParameters);

	imageAfterSegmentation = segmentation.segmentationNLP(distorted.getImage().clone(), vParameters, vParameters[10]);
	for (int i = 0; i < 7; i++) {
		if(i < vLabelsSegmentationResult.size() && i < imageAfterSegmentation.size()){
			QPixmap pix = cvMatToQPixmap(imageAfterSegmentation[i]);
			vLabelsSegmentationResult[i]->setText("");
			vLabelsSegmentationResult[i]->clear();
			vLabelsSegmentationResult[i]->setPixmap(pix);
			imageAfterSegmentation[i].release();
		}
		else {
			vLabelsSegmentationResult[i]->setText("Error");
			vLabelsSegmentationResult[i]->clear();
		}
	}
	segmentation.~CSegmentation();
}

/* CLICK METHODS */

void RecognitionNLP::clickSegmentationErode() {

	vector<string> v;

	vector<int> max;
	vector<int> min;
	vector<int> val;

	setVector(v, min, max, val, "Size", 0, 100, vParameters[0]);
	setVector(v, min, max, val, "Operation", 0, 2, vParameters[1]);
	SegmentationUpDateScens(v, min, max, val);
	SegmentationShowResultImages();
}
void RecognitionNLP::clickSegmentationContrast() {

	vector<string> v;

	vector<int> max;
	vector<int> min;
	vector<int> val;

	setVector(v, min, max, val, "Beta", 0, 100, vParameters[2]);
	setVector(v, min, max, val, "Alpha", 0, 2, vParameters[3]);
	SegmentationUpDateScens(v, min, max, val);
	SegmentationShowResultImages();
}
void RecognitionNLP::clickSegmentationBW() {

	vector<string> v;

	vector<int> max;
	vector<int> min;
	vector<int> val;

	setVector(v, min, max, val, "Sum light pix", 1, 255, vParameters[4]);
	SegmentationUpDateScens(v, min, max, val);
	SegmentationShowResultImages();
}
void RecognitionNLP::clickSegmentationCutimage() {

	vector<string> v;

	vector<int> max;
	vector<int> min;
	vector<int> val;

	setVector(v, min, max, val, "Left", 0, 40, vParameters[5]);
	setVector(v, min, max, val, "Top", 0, 40, vParameters[6]);
	setVector(v, min, max, val, "Right", 0, 40, vParameters[7]);
	setVector(v, min, max, val, "Bottom", 0, 40, vParameters[8]);
	SegmentationUpDateScens(v, min, max, val);
	SegmentationShowResultImages();
}
void RecognitionNLP::clickSegmentationNegative() {

	vector<string> v;

	vector<int> max;
	vector<int> min;
	vector<int> val;

	setVector(v, min, max, val, "Negative", 0, 1, vParameters[9]);
	SegmentationUpDateScens(v, min, max, val);
	SegmentationShowResultImages();
}
void RecognitionNLP::clickSegmentationSumControl() {

	vector<string> v;

	vector<int> max;
	vector<int> min;
	vector<int> val;

	setVector(v, min, max, val, "Value", -100, 300, vParameters[10]);
	SegmentationUpDateScens(v, min, max, val);
	SegmentationShowResultImages();
}

void RecognitionNLP::preProcessing() {

	/* LOAD DATA */

	string path = convertQStringToString(ui.inputLoadPath->text());
	if ('\\' != path[path.length()])
		path += "\\";

	vector<CImageSign>	NLP;
	vector<string>		filesList = getListFileFrom(path);
	Mat					matTmp;

	system("mkdir preProcessing");

	for (int i = 1; i < filesList.size(); i++) {
		matTmp = imread(path + filesList[i]);
		CPreProcessing::introductoryProcessing(matTmp, vParameters);
		imwrite("preProcessing\\" + filesList[i], matTmp);
		matTmp.release();
	}
}

void RecognitionNLP::segmentation() {

	clearFolder("Segmentation\\");

	/* LOAD DATA */

	string path = convertQStringToString(ui.inputLoadPath->text());
	if ('\\' != path[path.length()])
		path += "\\";

	vector<CImageSign>	NLP;
	vector<string>		filesList = getListFileFrom(path);
	for each(string var in filesList)
		NLP.push_back(CImageSign(imread(path + var), var));

	/* SEGMENTATION */

	CSegmentation segmentation(&distorted, vParameters);
	segmentation.segmentationNLP(NLP, vParameters[10], true, true, true);
	segmentation.~CSegmentation();
}

void RecognitionNLP::SegmentationUpDatevParameters() {

	if (vRBSegmentation[0]->isChecked()) {
		vParameters[0] = vHSSegmentation[0]->value();
		vParameters[1] = vHSSegmentation[1]->value();
	}
	if (vRBSegmentation[1]->isChecked()) {
		vParameters[2] = vHSSegmentation[0]->value();
		vParameters[3] = vHSSegmentation[1]->value();

	}
	if (vRBSegmentation[2]->isChecked()) {
		vParameters[4] = vHSSegmentation[0]->value();

	}
	if (vRBSegmentation[3]->isChecked()) {
		vParameters[5] = vHSSegmentation[0]->value();
		vParameters[6] = vHSSegmentation[1]->value();
		vParameters[7] = vHSSegmentation[2]->value();
		vParameters[8] = vHSSegmentation[3]->value();

	}
	if (vRBSegmentation[4]->isChecked()) {
		vParameters[9] = vHSSegmentation[0]->value();
	}
	if (vRBSegmentation[5]->isChecked()) {
		vParameters[10] = vHSSegmentation[0]->value();
	}
	SegmentationShowResultImages();
}
/* END CLICK METHODS */

#pragma endregion It is tab SEGMENTATION

//clibbord
#pragma region


void RecognitionNLP::fillDefaultValue() {
	/*						  s  t  d  g    r  c  n  p    m    e  h  b  wi */
	double defaultValue[] = { 1, 0, 2, 0.5, 2, 2, 1, 0.1, 100, 1, 1, 0, 5 };
	double minValue[] =		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, };
	double maxValue[] =		{ 4, 4, 10000, 10000, 10000, 10000, 10000, 100000, 100000, 10000, 1, 1, 1000 };


	for (int i = 0; i < 13; i++) {
		vSpinBoxValueTest[i]->setMinimum(minValue[i]);
		vSpinBoxValueTest[i]->setMaximum(maxValue[i]);
		vSpinBoxValueTest[i]->setValue(defaultValue[i]);
	}
}

void RecognitionNLP::saveFileVectorFeauter() {

	/* LOAD DATA */

	string path = convertQStringToString(ui.inputLoadPath->text());
	if ('\\' != path[path.length()])
		path += "\\";

	vector<CImageSign>	NLP;
	vector<string>		filesList = getListFileFrom(path);
	for each(string var in filesList)
		NLP.push_back(CImageSign(imread(path + var, 0), var));

	/* SEGMENTATION */

	CSegmentation segmentation(&distorted, vParameters);
	segmentation.segmentationNLP(NLP, vParameters[10], 0, 0);
	vector<int>				vLabel			= segmentation.getVLabel();
	vector<vector<float>>	vTrainingData	= segmentation.getVTraingData();
	segmentation.~CSegmentation();

	/* Training */

	int*	label			= new int[vLabel.size()];
	float** trainingData	= new float*[vTrainingData.size()];

	for (int i = 0; i < vLabel.size(); i++)
		label[i] = vLabel[i];

	for (int i = 0; i < vTrainingData.size(); i++) {
		trainingData[i] = new float[vTrainingData[i].size()];
		for (int j = 0; j < vTrainingData[i].size(); j++)
			trainingData[i][j] = vTrainingData[i][j];
	}

	CSVM nu_svm;
	nu_svm.saveVectorToFile(label, trainingData, "libsvm\\VF.txt", "", vLabel.size());
	nu_svm.~CSVM();
}

void RecognitionNLP::training() {

	saveFileVectorFeauter();

	/* Training */

	CSVM nu_svm;
	nu_svm.trainByLibsvm(vSpinBoxValueTest[0]->value(), vSpinBoxValueTest[1]->value(), vSpinBoxValueTest[2]->value(), vSpinBoxValueTest[3]->value(), vSpinBoxValueTest[4]->value(), vSpinBoxValueTest[5]->value(), vSpinBoxValueTest[6]->value(), vSpinBoxValueTest[7]->value(), vSpinBoxValueTest[8]->value(), vSpinBoxValueTest[9]->value(), vSpinBoxValueTest[10]->value(), vSpinBoxValueTest[11]->value(), vSpinBoxValueTest[12]->value());

	nu_svm.~CSVM();
}

void RecognitionNLP::runTest() {

	saveFileVectorFeauter();

	CSVM nu_svm;
	nu_svm.setLabel(ui.labelPredictResult);
	nu_svm.predict("SVF.txt");

	nu_svm.~CSVM();
}



double* RecognitionNLP::getValueFromTest() {

	double* parameters = new double[vSpinBoxValueTest.size()];
	for (int i = 0; i < vSpinBoxValueTest.size(); i++)
		parameters[i] = vSpinBoxValueTest[i]->value();

	return parameters;
}



#pragma endregion It is tab Test


#pragma region

void RecognitionNLP::insertToFile(string fileName, string valueInsert) {

	fstream file(fileName, ios::app);
	if (file.good()) {
		file << valueInsert;
		file.flush();
		file << endl;
	}
	file.close();
}

void RecognitionNLP::createFile(string fileName) {

	fstream file(fileName, ios::out);
	file.close();
}

string RecognitionNLP::createNameFile(string path, char sign, string number) {

	string tmp = "";
	tmp = path;
	tmp += sign;
	tmp += number;

	return tmp;
}

void RecognitionNLP::clearFolder(string path) {

	if ('\\' != path[path.length()])
		path += "\\";

	vector<string>	fileToRemove = getListFileFrom(path);
	string			fileToRemoveTmp;
	for each(string var in fileToRemove) {
		fileToRemoveTmp = path + var;
		const char* tmpChar = fileToRemoveTmp.c_str();
		remove(tmpChar);
	}
	fileToRemove.clear();
}

void RecognitionNLP::setVector(vector<string>& str, vector<int>& vmin, vector<int>& vmax, vector<int>& vval, string parametr, int min, int max, int val) {

	str.push_back(parametr);
	vmin.push_back(min);
	vmax.push_back(max);
	vval.push_back(val);
}

void RecognitionNLP::setHorizontalSlider(QSlider* slider, int min, int max, int value) {

	slider->setMinimum(min);
	slider->setMaximum(max);
	slider->setValue(value);
}

void RecognitionNLP::fillVectorValue() {

	/* tab propertys */
	
	vSliderValue.push_back(ui.HSPropertys1);
	vSliderValue.push_back(ui.HSPropertys2);
	vSliderValue.push_back(ui.HSPropertys3);
	vSliderValue.push_back(ui.HSPropertys4);
	vSliderValue.push_back(ui.HSPropertys5);
	vSliderValue.push_back(ui.HSPropertys6);

	vSliderMisstakeValue.push_back(ui.HSPropertys11);
	vSliderMisstakeValue.push_back(ui.HSPropertys22);
	vSliderMisstakeValue.push_back(ui.HSPropertys33);
	vSliderMisstakeValue.push_back(ui.HSPropertys44);
	vSliderMisstakeValue.push_back(ui.HSPropertys55);
	vSliderMisstakeValue.push_back(ui.HSPropertys66);

	vRBChanges.push_back(ui.rbPropertysContrast);
	vRBChanges.push_back(ui.rbPropertysBlur);
	vRBChanges.push_back(ui.rbPropertysGaussianBlur);
	vRBChanges.push_back(ui.rbPropertysMedianBlur);
	vRBChanges.push_back(ui.rbPropertysBilateralFilter);
	vRBChanges.push_back(ui.rbPropertysErode);
	vRBChanges.push_back(ui.rbPropertysDilate);
	vRBChanges.push_back(ui.rbPropertysFiltrTwoD);
	vRBChanges.push_back(ui.rbAffinePropertysTransformations);

	vLabelsValue.push_back(ui.labelPropertysV1);
	vLabelsValue.push_back(ui.labelPropertysV2);
	vLabelsValue.push_back(ui.labelPropertysV3);
	vLabelsValue.push_back(ui.labelPropertysV4);
	vLabelsValue.push_back(ui.labelPropertysV5);
	vLabelsValue.push_back(ui.labelPropertysV6);

	vLabelValueSlider.push_back(ui.labelPropertysVS1);
	vLabelValueSlider.push_back(ui.labelPropertysVS2);
	vLabelValueSlider.push_back(ui.labelPropertysVS3);
	vLabelValueSlider.push_back(ui.labelPropertysVS4);
	vLabelValueSlider.push_back(ui.labelPropertysVS5);
	vLabelValueSlider.push_back(ui.labelPropertysVS6);

	vLabelMisstakeValueSlider.push_back(ui.labelPropertysVS11);
	vLabelMisstakeValueSlider.push_back(ui.labelPropertysVS22);
	vLabelMisstakeValueSlider.push_back(ui.labelPropertysVS33);
	vLabelMisstakeValueSlider.push_back(ui.labelPropertysVS44);
	vLabelMisstakeValueSlider.push_back(ui.labelPropertysVS55);
	vLabelMisstakeValueSlider.push_back(ui.labelPropertysVS66);
	/*  END tab propertys */


	/* tab segmentation */
	//erode
	vParameters.push_back(0);
	vParameters.push_back(0);
	//ccontrast
	vParameters.push_back(0);
	vParameters.push_back(0);
	//B&W
	vParameters.push_back(100);
	//cut image
	vParameters.push_back(20);
	vParameters.push_back(5);
	vParameters.push_back(0);
	vParameters.push_back(5);
	//negative
	vParameters.push_back(1);
	//sum control
	vParameters.push_back(1);

	vRBSegmentation.push_back(ui.RBSegmetation1);
	vRBSegmentation.push_back(ui.RBSegmetation2);
	vRBSegmentation.push_back(ui.RBSegmetation3);
	vRBSegmentation.push_back(ui.RBSegmetation4);
	vRBSegmentation.push_back(ui.RBSegmetation5);
	vRBSegmentation.push_back(ui.RBSegmetation6);

	vLabelsSegmentation.push_back(ui.labelSegmentation1);
	vLabelsSegmentation.push_back(ui.labelSegmentation2);
	vLabelsSegmentation.push_back(ui.labelSegmentation3);
	vLabelsSegmentation.push_back(ui.labelSegmentation4);


	vLabelsSegmetationValue.push_back(ui.labelSegmentationValue1);
	vLabelsSegmetationValue.push_back(ui.labelSegmentationValue2);
	vLabelsSegmetationValue.push_back(ui.labelSegmentationValue3);
	vLabelsSegmetationValue.push_back(ui.labelSegmentationValue4);

	vHSSegmentation.push_back(ui.HSSegmentation1);
	vHSSegmentation.push_back(ui.HSSegmentation2);
	vHSSegmentation.push_back(ui.HSSegmentation3);
	vHSSegmentation.push_back(ui.HSSegmentation4);

	vLabelsSegmentationResult.push_back(ui.labelSegmentationResult1);
	vLabelsSegmentationResult.push_back(ui.labelSegmentationResult2);
	vLabelsSegmentationResult.push_back(ui.labelSegmentationResult3);
	vLabelsSegmentationResult.push_back(ui.labelSegmentationResult4);
	vLabelsSegmentationResult.push_back(ui.labelSegmentationResult5);
	vLabelsSegmentationResult.push_back(ui.labelSegmentationResult6);
	vLabelsSegmentationResult.push_back(ui.labelSegmentationResult7);


	/* END tab segmentation */


	/* tab test */
	vLabelTest.push_back(ui.labelParameter1);
	vLabelTest.push_back(ui.labelParameter2);
	vLabelTest.push_back(ui.labelParameter3);
	vLabelTest.push_back(ui.labelParameter4);
	vLabelTest.push_back(ui.labelParameter5);
	vLabelTest.push_back(ui.labelParameter6);
	vLabelTest.push_back(ui.labelParameter7);
	vLabelTest.push_back(ui.labelParameter8);
	vLabelTest.push_back(ui.labelParameter9);
	vLabelTest.push_back(ui.labelParameter10);
	vLabelTest.push_back(ui.labelParameter11);
	vLabelTest.push_back(ui.labelParameter12);
	vLabelTest.push_back(ui.labelParameter13);

	vSpinBoxValueTest.push_back(ui.SBTest1);
	vSpinBoxValueTest.push_back(ui.SBTest2);
	vSpinBoxValueTest.push_back(ui.SBTest3);
	vSpinBoxValueTest.push_back(ui.SBTest4);
	vSpinBoxValueTest.push_back(ui.SBTest5);
	vSpinBoxValueTest.push_back(ui.SBTest6);
	vSpinBoxValueTest.push_back(ui.SBTest7);
	vSpinBoxValueTest.push_back(ui.SBTest8);
	vSpinBoxValueTest.push_back(ui.SBTest9);
	vSpinBoxValueTest.push_back(ui.SBTest10);
	vSpinBoxValueTest.push_back(ui.SBTest11);
	vSpinBoxValueTest.push_back(ui.SBTest12);
	vSpinBoxValueTest.push_back(ui.SBTest13);
	/* END tab test */

}

vector<string> RecognitionNLP::getListFileFrom(string path) {

	vector<string> direcroriesName;

	const char* chPath = path.c_str();
	struct dirent* file;
	DIR* directories;
	if (directories = opendir(chPath)) {
		while (file = readdir(directories)) {
			if (file->d_name[0] != '.')

				direcroriesName.push_back(file->d_name);
		}
	}

	return direcroriesName;
}

bool RecognitionNLP::fileExists(const string& fileName) {

	fstream plik;
	plik.open(fileName.c_str(), ios::in | ios::_Nocreate);
	if (plik.is_open()) {

		plik.close();
		return true;
	}
	plik.close();
	return false;
}

string RecognitionNLP::readFile(string path) {

	ifstream file(path);
	string result((istreambuf_iterator<char>(file)), istreambuf_iterator<char>());
	return result;
}

#pragma endregion Methods Help
