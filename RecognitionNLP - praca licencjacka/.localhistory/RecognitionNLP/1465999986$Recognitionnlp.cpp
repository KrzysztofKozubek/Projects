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


	/*
SET "c=50" 
SET "g=0.03"
SET "r=0.1
"*/




	if(1)
	for (double c = 100000; c > 0.0001; c /= 10) {
		for (double g = 100; g > 0.0001; g /= 10) {
			for (double r = 10; r > 0.001; r /= 10){
				//CSVM::cmdRun("echo " + itos(c) + /*" "  itos(g) + /*" " + itos(r) +*/ " >> C:\\Test\\rbf.bat");

				CSVM::cmdRun("echo C:\\Test\\svm-train.exe -s 0 -t 2 -c " + itos(c) + " -g " + itos(g) + "-r " + itos(r) + " -q C:\\Test\\SVF.txt C:\\Test\\SVFTraining.txt00.model >> C:\\Test\\rbf.bat");
				//CSVM::cmdRun("echo echo svm-train.exe -s 0 -t 1 -c " + itos(c) + " \>\> C:\\Test\\r.txt >> C:\\Test\\rbf.bat");
				CSVM::cmdRun("echo C:\\Test\\svm-predict.exe C:\\Test\\SVFT1Zb1.txt C:\\Test\\SVFTraining.txt00.model C:\\Test\\result \>\> C:\\Test\\r.txt >> C:\\Test\\rbf.bat");
				CSVM::cmdRun("echo C:\\Test\\svm-predict.exe C:\\Test\\VF.txt C:\\Test\\SVFTraining.txt00.model C:\\Test\\result \>\> C:\\Test\\r.txt >> C:\\Test\\rbf.bat");
			}
		}
	}
}


void RecognitionNLP::myTest() {

	static const int	NUMBER_SYMBOL = 35;

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


	/* LOAD DATA */

	string path = convertQStringToString(ui.inputLoadPath->text());
	if ('\\' != path[path.length()])
		path += "\\";

	vector<CImageSign>	vNLP;
	vector<string>		filesList = getListFileFrom(path);
	for each(string var in filesList)
		vNLP.push_back(CImageSign(imread(path + var), var));

	vector<string> fileToRemove = getListFileFrom("D:\\Segmentation\\Test1\\");
	string fileToRemoveTmp;
	for each(string var in fileToRemove) {
		fileToRemoveTmp = "D:\\Segmentation\\Test1\\" + var;
		const char* tmpChar = fileToRemoveTmp.c_str();
		remove(tmpChar);
	}
	fileToRemove.clear();
	fileToRemove = getListFileFrom("D:\\Segmentation\\Test2\\");
	for each(string var in fileToRemove) {
		fileToRemoveTmp = "D:\\Segmentation\\Test2\\" + var;
		const char* tmpChar = fileToRemoveTmp.c_str();
		remove(tmpChar);
	}
	fileToRemove.clear();
	fileToRemove = getListFileFrom("D:\\Segmentation\\Training1\\");
	for each(string var in fileToRemove) {
		fileToRemoveTmp = "D:\\Segmentation\\Training1\\" + var;
		const char* tmpChar = fileToRemoveTmp.c_str();
		remove(tmpChar);
	}
	fileToRemove.clear();
	fileToRemove = getListFileFrom("D:\\Segmentation\\Training2\\");
	for each(string var in fileToRemove) {
		fileToRemoveTmp = "D:\\Segmentation\\Training2\\" + var;
		const char* tmpChar = fileToRemoveTmp.c_str();
		remove(tmpChar);
	}
	fileToRemove.clear();
	fileToRemove = getListFileFrom("D:\\Segmentation\\All\\");
	for each(string var in fileToRemove) {
		fileToRemoveTmp = "D:\\Segmentation\\All\\" + var;
		const char* tmpChar = fileToRemoveTmp.c_str();
		remove(tmpChar);
	}
	fileToRemove.clear();

	/* SEGMENTATION */

	vector<Mat> tmp;
	Mat			tmp2;
	string		help;
	CSegmentation segmentation(&distorted, vParameters);

	vector<int>				vLabel;
	vector<vector<float>>	vTrainingData;
	string					tmpName;
	int						nrSSign = 0;
	vector<Mat>				allSign;

	for each (CImageSign var in vNLP) {

		tmp.clear();
		tmp2 = var.getImage();

		distorted.distortingImg(tmp2);
		tmp = segmentation.segmentationNLP(tmp2, vParameters, vParameters[10]);
		
		int numberSign = -1;

		for (int i = 0; i < tmp.size() && i < var.getSign().size() - 4; i++) {

			for (int j = 0; j < NUMBER_SYMBOL; j++) {
				if (sign[j] == var.getSign()[i])
					numberSign = j;
			}

			if (numberSign != -1) {

				vLabel.push_back(numberSign);
				vTrainingData.push_back(*countMoment(tmp[i]));
				allSign.push_back(tmp[i]);
				
				nrSign[numberSign]++;
				tmpName = "D:\\Segmentation\\All\\";
				tmpName += var.getSign()[i];
				tmpName += "_" + itos(nrSign[numberSign]);
				tmpName += ".png";
				imwrite(tmpName, tmp[i]);
				
			}
		}
	}

	/* SPLIT VECTORS FEATURES */

	int limitSignT1 = 5;
	int	nrSignT1[NUMBER_SYMBOL] = {
		0,0,0,0,0,0,0,0,0,0,	//10
		0,0,0,0,0,0,0,0,		//8
		0,0,0,0,0,0,0,0,		//8 
		0,0,0,0,0,0,0,0,0	//9
	};

	int limitSignT2 = 100;
	int	nrSignT2[NUMBER_SYMBOL] = {
		0,0,0,0,0,0,0,0,0,0,	//10
		0,0,0,0,0,0,0,0,		//8
		0,0,0,0,0,0,0,0,		//8 
		0,0,0,0,0,0,0,0,0	//9
	};

	//training test 1
	int*	labelT1Training			= new int[limitSignT1 * NUMBER_SYMBOL];
	float** trainingDataT1Training	= new float*[limitSignT1 * NUMBER_SYMBOL];
	int		nrT1Training			= 0;
	//set 1 test 1
	int*	labelT1Zb1				= new int[vLabel.size() / 2];
	float** trainingDataT1Zb1		= new float*[vLabel.size() / 2];
	int		nrT1Zb1					= 0;
	//set 2 test 1
	int*	labelT1Zb2				= new int[vLabel.size() / 2];
	float** trainingDataT1Zb2		= new float*[vLabel.size() / 2];
	int		nrT1Zb2					= 0;


	//training test 2
	int*	labelT2Training			= new int[limitSignT2 * NUMBER_SYMBOL];
	float** trainingDataT2Training	= new float*[limitSignT2 * NUMBER_SYMBOL];
	int		nrT2Training			= 0;
	//set 1 test 2
	int*	labelT2Zb1				= new int[vLabel.size() / 2];
	float** trainingDataT2Zb1		= new float*[vLabel.size() / 2];
	int		nrT2Zb1					= 0;
	//set 2 test 2
	int*	labelT2Zb2				= new int[vLabel.size() / 2];
	float** trainingDataT2Zb2		= new float*[vLabel.size() / 2];
	int		nrT2Zb2					= 0;

	
	for (int i = 0; i < (vLabel.size() / 2) * 2; i++) {
		
		if (limitSignT1 > nrSignT1[vLabel[i]]) {
			
			labelT1Training[nrT1Training] = vLabel[i];
			trainingDataT1Training[nrT1Training] = new float[vTrainingData[i].size()];
			for (int j = 0; j < vTrainingData[i].size(); j++)
				trainingDataT1Training[nrT1Training][j] = vTrainingData[i][j];
			help = "D:\\Segmentation\\Training1\\";
			help += sign[vLabel[i]];
			help += "_" + itos(i) + ".png";
			imwrite(help, allSign[i]);
			nrT1Training++;
			nrSignT1[vLabel[i]]++;
		}
		else {
			if (i % 2) {

				labelT1Zb1[nrT1Zb1] = vLabel[i];
				trainingDataT1Zb1[nrT1Zb1] = new float[vTrainingData[i].size()];
				for (int j = 0; j < vTrainingData[i].size(); j++)
					trainingDataT1Zb1[nrT1Zb1][j] = vTrainingData[i][j];
				nrT1Zb1++;
			}
			else {

				labelT1Zb2[nrT1Zb2] = vLabel[i];
				trainingDataT1Zb2[nrT1Zb2] = new float[vTrainingData[i].size()];
				for (int j = 0; j < vTrainingData[i].size(); j++)
					trainingDataT1Zb2[nrT1Zb2][j] = vTrainingData[i][j];
				nrT1Zb2++;
			}
		}

		if (limitSignT2 > nrSignT2[vLabel[i]]) {

			labelT2Training[nrT2Training] = vLabel[i];
			trainingDataT2Training[nrT2Training] = new float[vTrainingData[i].size()];
			for (int j = 0; j < vTrainingData[i].size(); j++)
				trainingDataT2Training[nrT2Training][j] = vTrainingData[i][j];

			help = "D:\\Segmentation\\Training2\\";
			help += sign[vLabel[i]];
			help += "_" + itos(i) + ".png";
			imwrite(help, allSign[i]);
			nrT2Training++;
			nrSignT2[vLabel[i]]++;
		}
		else {
			if (i % 2) {

				labelT2Zb2[nrT2Zb1] = vLabel[i];
				trainingDataT2Zb1[nrT2Zb1] = new float[vTrainingData[i].size()];
				for (int j = 0; j < vTrainingData[i].size(); j++)
					trainingDataT2Zb1[nrT2Zb1][j] = vTrainingData[i][j];
				nrT2Zb1++;
				help = "D:\\Segmentation\\Test1\\";
			help += sign[vLabel[i]];
				help += "_" + itos(i) + ".png";
				imwrite(help, allSign[i]);
			}
			else {

				labelT2Zb2[nrT2Zb2] = vLabel[i];
				trainingDataT2Zb2[nrT2Zb2] = new float[vTrainingData[i].size()];
				for (int j = 0; j < vTrainingData[i].size(); j++)
					trainingDataT2Zb2[nrT2Zb2][j] = vTrainingData[i][j];
				nrT2Zb2++;
				help = "D:\\Segmentation\\Test2\\";
				help += sign[vLabel[i]];
				help += "_" + itos(i) + ".png";
				imwrite(help, allSign[i]);
			}
		}

	}

	/* SAVE VECTOR FEAUTERS TO FILE */
	string pathTest			= "C:\\Test\\";

	string test1Training	= "SVFT1Training.txt";
	string test2Training	= "SVFT2Training.txt";

	string test1Zb1			= "SVFT1Zb1.txt";
	string test1Zb2			= "SVFT1Zb2.txt";

	string test2Zb1			= "SVFT2Zb1.txt";
	string test2Zb2			= "SVFT2Zb2.txt";


	CSVM nu_svm;
	//save test 1 SVF training
	nu_svm.saveVectorToFile(labelT1Training, trainingDataT1Training, pathTest + test1Training, nrT1Training, false);
	//save test 2 SVF training
	nu_svm.saveVectorToFile(labelT2Training, trainingDataT2Training, pathTest + test2Training, nrT2Training, false);

	//save test 1 SVF set 1
	nu_svm.saveVectorToFile(labelT1Zb1, trainingDataT1Zb1, pathTest + test1Zb1, nrT1Zb1, false);
	//save test 1 SVF set 2
	nu_svm.saveVectorToFile(labelT1Zb2, trainingDataT1Zb2, pathTest + test1Zb2, nrT1Zb2, false);

	//save test 2 SVF set 1
	nu_svm.saveVectorToFile(labelT2Zb1, trainingDataT2Zb1, pathTest + test2Zb1, nrT2Zb1, false);
	//save test 2 SVF set 2
	nu_svm.saveVectorToFile(labelT2Zb2, trainingDataT2Zb2, pathTest + test2Zb2, nrT2Zb2, false);


	/* CREATE MODELS */
	CSVM::cmdRun("echo @ECHO OFF >> " + pathTest + "skrypt.bat");


	CSVM::cmdRun("echo SET \"svm=0\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"kernel=0\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"e=1\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"c=1\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-train.exe -s %svm% -t %kernel% -e %e% -c %c% -q " + pathTest + test1Training + " " + pathTest + test1Training + "00.model >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-train.exe -s %svm% -t %kernel% -e %e% -c %c% -q " + pathTest + test2Training + " " + pathTest + test2Training + "00.model >> " + pathTest + "skrypt.bat");

	CSVM::cmdRun("echo SET \"kernel=1\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"e=0.001\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"c=2\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"g=0.5\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"d=2\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"r=2\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-train.exe -s %svm% -t %kernel% -d %d% -r %r% -g %g% -e %e% -c %c% -q " + pathTest + test1Training + " " + pathTest + test1Training + "01.model >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-train.exe -s %svm% -t %kernel% -d %d% -r %r% -g %g% -e %e% -c %c% -q " + pathTest + test2Training + " " + pathTest + test2Training + "01.model >> " + pathTest + "skrypt.bat");

	CSVM::cmdRun("echo SET \"kernel=2\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"e=0.002\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"c=4\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"g=1\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-train.exe -s %svm% -t %kernel% -g %g% -e %e% -c %c% -q " + pathTest + test1Training + " " + pathTest + test1Training + "02.model >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-train.exe -s %svm% -t %kernel% -g %g% -e %e% -c %c% -q " + pathTest + test2Training + " " + pathTest + test2Training + "02.model >> " + pathTest + "skrypt.bat");

	CSVM::cmdRun("echo SET \"kernel=3\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"n=0.1\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"c=20\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"g=0.5\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-train.exe -s %svm% -t %kernel% -r %r% -g %g% -c %c% -q " + pathTest + test1Training + " " + pathTest + test1Training + "03.model >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-train.exe -s %svm% -t %kernel% -r %r% -g %g% -c %c% -q " + pathTest + test2Training + " " + pathTest + test2Training + "03.model >> " + pathTest + "skrypt.bat");


	CSVM::cmdRun("echo SET \"svm=1\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"kernel=0\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"e=2\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"c=10\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"n=0.0002\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-train.exe -s %svm% -t %kernel% -e %e% -c %c% -n %n% -q " + pathTest + test1Training + " " + pathTest + test1Training + "10.model >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-train.exe -s %svm% -t %kernel% -e %e% -c %c% -n %n% -q " + pathTest + test2Training + " " + pathTest + test2Training + "10.model >> " + pathTest + "skrypt.bat");

	CSVM::cmdRun("echo SET \"kernel=1\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"n=0.1\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"d=5\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"r=1\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"g=0.01\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-train.exe -s %svm% -t %kernel% -d %d% -r %r% -g %g% -n %n% -q " + pathTest + test1Training + " " + pathTest + test1Training + "11.model >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-train.exe -s %svm% -t %kernel% -d %d% -r %r% -g %g% -n %n% -q " + pathTest + test2Training + " " + pathTest + test2Training + "11.model >> " + pathTest + "skrypt.bat");
	
	CSVM::cmdRun("echo SET \"kernel=2\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"e=0.000001\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"c=1\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"g=0.6\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-train.exe -s %svm% -t %kernel% -g %g% -e %e% -c %c% -q " + pathTest + test1Training + " " + pathTest + test1Training + "12.model >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-train.exe -s %svm% -t %kernel% -g %g% -e %e% -c %c% -q " + pathTest + test2Training + " " + pathTest + test2Training + "12.model >> " + pathTest + "skrypt.bat");

	CSVM::cmdRun("echo SET \"kernel=3\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"n=0.000001\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"g=0.001\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"r=0\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo SET \"e=0.000001\" >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-train.exe -s %svm% -t %kernel% -r %r% -g %g% -e %e% -n %n% -q " + pathTest + test1Training + " " + pathTest + test1Training + "13.model >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-train.exe -s %svm% -t %kernel% -r %r% -g %g% -e %e% -n %n% -q " + pathTest + test2Training + " " + pathTest + test2Training + "13.model >> " + pathTest + "skrypt.bat");


	CSVM::cmdRun("echo echo Test 1 SET 1 >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb1 + " " + pathTest + test1Training + "00.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb1 + " " + pathTest + test1Training + "01.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb1 + " " + pathTest + test1Training + "02.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb1 + " " + pathTest + test1Training + "03.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb1 + " " + pathTest + test1Training + "10.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb1 + " " + pathTest + test1Training + "11.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb1 + " " + pathTest + test1Training + "12.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb1 + " " + pathTest + test1Training + "13.model " + pathTest + "result >> " + pathTest + "skrypt.bat");

	CSVM::cmdRun("echo echo Test 1 SET 2 >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb2 + " " + pathTest + test1Training + "00.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb2 + " " + pathTest + test1Training + "01.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb2 + " " + pathTest + test1Training + "02.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb2 + " " + pathTest + test1Training + "03.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb2 + " " + pathTest + test1Training + "10.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb2 + " " + pathTest + test1Training + "11.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb2 + " " + pathTest + test1Training + "12.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test1Zb2 + " " + pathTest + test1Training + "13.model " + pathTest + "result >> " + pathTest + "skrypt.bat");

	CSVM::cmdRun("echo echo Test 2 SET 1 >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test2Zb1 + " " + pathTest + test2Training + "00.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test2Zb1 + " " + pathTest + test2Training + "01.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test2Zb1 + " " + pathTest + test2Training + "02.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test2Zb1 + " " + pathTest + test2Training + "03.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test2Zb1 + " " + pathTest + test2Training + "10.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test2Zb1 + " " + pathTest + test2Training + "11.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test2Zb1 + " " + pathTest + test2Training + "12.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test2Zb1 + " " + pathTest + test2Training + "13.model " + pathTest + "result >> " + pathTest + "skrypt.bat");

	CSVM::cmdRun("echo echo Test 2 SET 2 >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test2Zb2 + " " + pathTest + test2Training + "00.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test2Zb2 + " " + pathTest + test2Training + "01.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test2Zb2 + " " + pathTest + test2Training + "02.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test2Zb2 + " " + pathTest + test2Training + "03.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test2Zb2 + " " + pathTest + test2Training + "10.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test2Zb2 + " " + pathTest + test2Training + "11.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test2Zb2 + " " + pathTest + test2Training + "12.model " + pathTest + "result >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun("echo " + pathTest + "svm-predict.exe " + pathTest + test2Zb2 + " " + pathTest + test2Training + "13.model " + pathTest + "result >> " + pathTest + "skrypt.bat");

	CSVM::cmdRun("echo PAUSE \>nul >> " + pathTest + "skrypt.bat");
	CSVM::cmdRun(pathTest + "skrypt.bat");
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

	for each (string var in filesList)
		ui.listLoadData->addItem(convertStringToQString(var));

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
	p.push_back(20);
	mv.push_back(0);
	mv.push_back(20);
	distorted.addDistortion(0, p, mv);
	ui.listPropertysNoising->addItem("Contrast");
	p.clear();
	mv.clear();

	p.push_back(11);
	mv.push_back(5);
	distorted.addDistortion(2, p, mv);
	ui.listPropertysNoising->addItem("Gaussian Blur");
	p.clear();
	mv.clear();

	p.push_back(3);
	mv.push_back(15);
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
	distorted.addDistortion(9, p, mv);
	ui.listPropertysNoising->addItem("Affine Transformations");
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
	nu_svm.saveVectorToFile(label, trainingData, "libsvm\\VF.txt", vLabel.size());
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
	vParameters.push_back(2);
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
