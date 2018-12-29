#include "ocr.h"
// TODO: 1. wyrownanie katu 2. erozja i dylatacja (moze filtr) pozbycie sie szumu 

// zmiana organizacji 
// 

OCR::OCR(QWidget *parent) : QMainWindow(parent) {

	/* Kontrast & Jasnoœæ & Obrót */

	ui.setupUi(this);
	this->image = imread("lena.jpg", 1);
	showImage = image.clone();

	connect(ui.HSContrast1,			SIGNAL(sliderReleased()), this, SLOT(changeContrasOrBrightness()));
	connect(ui.HSBrightness1,		SIGNAL(sliderReleased()), this, SLOT(changeContrasOrBrightness()));
	connect(ui.HSRotate1,			SIGNAL(sliderReleased()), this, SLOT(rotate()));

	connect(ui.BConfirmChange1,		SIGNAL(clicked()), this, SLOT(confirmChange()));
	connect(ui.BLoadImage1,			SIGNAL(clicked()), this, SLOT(loadImage()));
	connect(ui.BSaveImage1,			SIGNAL(clicked()), this, SLOT(saveImage()));


	connect(ui.BLoadImage3,			SIGNAL(clicked()), this, SLOT(loadImage2()));
	connect(ui.HSBinaryElement3,	SIGNAL(sliderReleased()), this, SLOT(preProcessing()));
	connect(ui.HSBinaryKernel3,		SIGNAL(sliderReleased()), this, SLOT(preProcessing()));
	connect(ui.HSErodeElement3,		SIGNAL(sliderReleased()), this, SLOT(preProcessing()));
	connect(ui.HSErodeKernel3,		SIGNAL(sliderReleased()), this, SLOT(preProcessing()));

	
	connect(ui.BRightImageRow2,		SIGNAL(clicked()), this, SLOT(SegmentationIncreaseIndexImageRow()));
	connect(ui.BLeftImageRow2,		SIGNAL(clicked()), this, SLOT(SegmentationReduceIndexImageRow()));

	connect(ui.BRightImageCell2, SIGNAL(clicked()), this, SLOT(SegmentationIncreaseIndexImageCell()));
	connect(ui.BLeftImageCell2, SIGNAL(clicked()), this, SLOT(SegmentationReduceIndexImageCell()));


	connect(ui.BSaveImages2, SIGNAL(clicked()), this, SLOT(saveEffect()));

	connect(ui.BRightImageCell4, SIGNAL(clicked()), this, SLOT(SegmentationIncreaseIndexImageSign()));
	connect(ui.BLeftImageCell4, SIGNAL(clicked()), this, SLOT(SegmentationReduceIndexImageSign()));


	displayImage(this->image.clone());

	/* END Kontrast & Jasnoœæ & Obrót END */

	/* Przetwarzanie wstpne */
	// 12 11 6
	this->imageSign		= imread("digit//digits05.jpg", 0);
	this->imageSignO	= imageSign.clone();

	preProcessing();
	MomentsLoadImage();

	/* END Przetwarzanie wstpene */

	/* END Segmentation END */
}

OCR::~OCR() {}

#pragma region

void OCR::displayImageInLabel(Mat image, QLabel* label) {

	cvtColor(image, image, CV_GRAY2RGB);
	Size size(100, 100);
	QImage imdisplay((uchar*)image.data, image.cols, image.rows, image.step, QImage::Format_RGB888);
	QImage img2 = imdisplay.scaled(300, 1000, Qt::KeepAspectRatio);
	label->setPixmap(QPixmap::fromImage(img2));
}

Mat OCR::loadImageFrom(QString pathToImage, int flag = 1) {

	return imread(QStringToString(pathToImage), flag);
}

#pragma endregion Unversal method

#pragma region

void OCR::rotate() {

	Mat tmp = image.clone();
	CPreProcessing::rotate(tmp, ui.HSRotate1->value());

	displayImage(tmp);
}

void OCR::changeContrasOrBrightness() {

	Mat tmp = image.clone();
	CPreProcessing::changeContrasOrBrightness(tmp, ui.HSContrast1->value(), ui.HSBrightness1->value());

	displayImage(tmp);
}

void OCR::displayImage(Mat image) {

	cvtColor(image, image, CV_BGR2RGB);
	QImage imdisplay((uchar*)image.data, image.cols, image.rows, image.step, QImage::Format_RGB888);
	ui.LImage1->setPixmap(QPixmap::fromImage(imdisplay));
}

void OCR::confirmChange() {

	image.release();
	image = showImage.clone();
}

void OCR::loadImage() {

	Mat tmp = imread(QStringToString(ui.LEPathImageLoad1->text()), 1);
	if (!tmp.empty()) {
		image.release();
		showImage.release();
		image = tmp.clone();
		showImage = tmp.clone();

		displayImage(image);
	}
}

void OCR::saveImage() {

	imwrite(QStringToString(ui.LEPathImageSave1->text()), image);
}

#pragma endregion Tab Contrast & Brightness & Rotate

#pragma region

void OCR::loadImage2() {

	displayImageInLabel(loadImageFrom(ui.LEPathImageLoad3->text()), ui.LImage3);
}

void OCR::preProcessing() {

	Mat tmp = imageSignO.clone();
	imageSign = tmp.clone();


	//Find value skip
	int skipL = CPreProcessing::getSkipLValue(imageSign.clone());
	CPreProcessing::cutImage(imageSign, skipL, 20, 0, 0);
	int skipT = CPreProcessing::getSkipTValue(imageSign.clone());
	CPreProcessing::cutImage(imageSign, 0, skipT, 0, 0);
	int skipR = 250;
	int skipB = 0;
	CPreProcessing::cutImage(imageSign, 0, 0, skipR, skipB);

	//CPreProcessing::dilate(imageSign, 2, 2);
	//imshow("Z", imageSign);
	//waitKey();
	int size = 5;
	GaussianBlur(imageSign.clone(), imageSign, Size(size, size), 0,0);

	//Binary
	//threshold(tmp, imageSign, ui.HSBinaryKernel3->value(), 255, ui.HSBinaryElement3->value());
	CPreProcessing::toBinary(imageSign, ui.HSBinaryKernel3->value(), 0,0,0,0);

	//Change angle
	CPreProcessing::autoRotate(imageSign, skipT);

	//Erode || Dilate
	//CPreProcessing::dilate(imageSign, ui.HSErodeElement3->value(), ui.HSErodeKernel3->value());

	displayImageInLabel(imageSign.clone(), ui.LImage3);
	SegmentationRow(imageSign.clone());
}

#pragma endregion Przetwarzanie wstêpne


#pragma region

void OCR::SegmentationLoadImage() {

	Mat tmp = imread(QStringToString(ui.LEPathImageLoad3->text()), 1);
	if (!tmp.empty()) {
		image.release();
		showImage.release();
		image = tmp.clone();
		showImage = tmp.clone();

		displayImage(image);
	}
}

void OCR::SegmentationSaveImage() {

	imwrite(QStringToString(ui.LEPathImageSave1->text()), image);
}


void OCR::SegmentationRow(Mat image) {
	
	Mat tmp = imageSign.clone();

	int LIMIT_VALUE_LIGHT_BIT = 42;

	vImageSignRow.clear();

	int cols = image.cols;
	int rows = image.rows;

	int cutStart = 0, cutEnd = 0;	//information about level cutting
	int fromCut = 0, toCut = 0;	//save position column

	double sum = 0;

	for (int y = 0; y < rows - 1; y++) {

		sum = CPreProcessing::advRow(image, y, 15);
		if (LIMIT_VALUE_LIGHT_BIT >= sum) {

			if (cutStart == 0) fromCut = y;
			if (cutStart == 1 && cutEnd == 0) { toCut = y; cutEnd = 1; }
			if (cutStart == 1 && cutEnd == 1) {

				tmp = image.clone();
				CPreProcessing::cutImage(tmp, 0, fromCut, 0, tmp.rows - toCut);
				CPreProcessing::removeBlackBackground(tmp);
				vImageSignRow.push_back(tmp);
				tmp.release();

				cutStart = toCut = cutEnd = 0;
				fromCut = y;
			}
		}
		else {
			if (cutStart == 0) cutStart = 1;
		}
	}
	indexImageRow = 0;
	SegmentationLoadImageRow();
	
}

void OCR::SegmentationCell(Mat image) {

	int LIMIT_VALUE_LIGHT_BIT = 100;
	Mat tmp;
	vImageSignCell.clear();

	int cols = image.cols;
	int rows = image.rows;

	int cutStart = 0, cutEnd = 0;	//information about level cutting
	int fromCut = 0, toCut = 0;	//save position column

	int size = 65;
	string help;
	int sum = 0;
	
	for (int y = 0; y < cols - 1; y++) {
		sum = CPreProcessing::advCol(image, y, 5);
		
		if (LIMIT_VALUE_LIGHT_BIT <= sum) {

			if (cutStart == 0) fromCut = y;
			if (cutStart == 1 && cutEnd == 0) { toCut = y; cutEnd = 1; }
			if (cutStart == 1 && cutEnd == 1) {

				tmp = image.clone();
				CPreProcessing::cutImage(tmp, fromCut, 0, tmp.cols - toCut, 0);
				CPreProcessing::cutImage(tmp, (tmp.cols / 2) - size, (tmp.rows / 2) - size, (tmp.cols / 2) - size, (tmp.rows / 2) - size);
				vImageSignCell.push_back(tmp);
				tmp.release();

				cutStart = toCut = cutEnd = 0;
				fromCut = y;
			}
		}
		else {
			if (cutStart == 0) cutStart = 1;
		}
	}
	indexImageCell = 0;
	SegmentationLoadImageCell();
}

void OCR::SegmentationIncreaseIndexImageRow() {

	if (indexImageRow < vImageSignRow.size()-1) {
		indexImageRow++;
		SegmentationLoadImageRow();
	}
}

void OCR::SegmentationReduceIndexImageRow() {

	if (indexImageRow > 0) {
		indexImageRow--; 
		SegmentationLoadImageRow();
	}
}

void OCR::SegmentationIncreaseIndexImageCell() {

	if (indexImageCell < vImageSignCell.size()-1) {
		indexImageCell++;
		SegmentationLoadImageCell();
	}
}

void OCR::SegmentationReduceIndexImageCell() {

	if (indexImageCell > 0) {
		indexImageCell--;
		SegmentationLoadImageCell();
	}
}

void OCR::SegmentationLoadImageRow() {
	
	ui.LImageRow2->clear();
	if(indexImageRow < vImageSignRow.size()){
		
		Mat image = vImageSignRow[indexImageRow].clone();
		QImage imdisplay((uchar*)image.data, image.cols, image.rows, image.step, QImage::Format_Grayscale8);
		QImage img2 = imdisplay.scaled(600, 1000, Qt::KeepAspectRatio);
		ui.LImageRow2->setPixmap(QPixmap::fromImage(img2));
		SegmentationCell(vImageSignRow[indexImageRow].clone());
	}
}

void OCR::SegmentationLoadImageCell() {

	if(indexImageCell < vImageSignCell.size()){
		ui.LImageCell2->clear();
		Mat image = vImageSignCell[indexImageCell].clone();
		QImage imdisplay((uchar*)image.data, image.cols, image.rows, image.step, QImage::Format_Grayscale8);
		QImage img2 = imdisplay.scaled(400, 1000, Qt::KeepAspectRatio);
		ui.LImageCell2->setPixmap(QPixmap::fromImage(imdisplay));
	}
}


void OCR::SegmentationReduceIndexImageSign() {

	if (indexImageSign > 0) {
		indexImageSign--;
		ui.LImageCell4->clear();
		Mat image = vImageSign[indexImageSign].clone();
		QImage imdisplay((uchar*)image.data, image.cols, image.rows, image.step, QImage::Format_Grayscale8);
		QImage img2 = imdisplay.scaled(400, 1000, Qt::KeepAspectRatio);
		ui.LImageCell4->setPixmap(QPixmap::fromImage(imdisplay));
	}
}

void OCR::SegmentationIncreaseIndexImageSign() {

	if (indexImageSign < vImageSign.size()) {
		indexImageSign++;
		ui.LImageCell4->clear();
		Mat image = vImageSign[indexImageSign].clone();
		QImage imdisplay((uchar*)image.data, image.cols, image.rows, image.step, QImage::Format_Grayscale8);
		QImage img2 = imdisplay.scaled(400, 1000, Qt::KeepAspectRatio);
		ui.LImageCell4->setPixmap(QPixmap::fromImage(imdisplay));
	}
}



void OCR::MomentsLoadImage() {

	vImageSign.clear();

	vector<string> vImage = CWindows::getListFileFrom("digits//");
	for each(string var in vImage) vImageSign.push_back(imread("digits//" + var, 0));

	int* label = new int[vImageSign.size()];
	float** data = new float*[vImageSign.size()];
	for (int i = 0; i < vImageSign.size(); i++) data[i] = countMoment(vImageSign[i]);

	for (int i = 0; i < vImageSign.size(); i++) label[i] = atoi(vImage[i].substr(vImage[i].size()-5, vImage[i].size()-4).c_str());

	CWindows::saveVectorToFile(label, data, "libsvm//Data//SP.txt", vImageSign.size(), 1);

	vImage.clear();
	SegmentationIncreaseIndexImageSign();
}

void OCR::GenerationSkryptLibsvm() {

	const string GS_LINEAR = "";
	const string GS_RBF = "";
	const string GS_LINEAR = "";
	const string PATH_LIBSVM = "";
	const string PATH_NVF_TEST_I = "";

	/* CREAETE GRID SEARCH */

	//Linear
	CWindows::createFile(GS_LINEAR);
	CWindows::insertToFile(GS_LINEAR, "@echo OFF");
	CWindows::insertToFile(GS_LINEAR, "SET \"svm=0\"");
	CWindows::insertToFile(GS_LINEAR, "SET \"kernel=0\"");
	for (int c = 1; c < 10000; c *= 2) {
		CWindows::insertToFile(GS_LINEAR, "..\\" + PATH_LIBSVM + "svm-train.exe -s %svm% -t %kernel% -c " + itos(c) + " -q ..\\" + PATH_NVF_TRAINING + " ..\\" + PATH_MODEL_LINEAR);
		CWindows::insertToFile(GS_LINEAR, "echo Kernel = Linear, Test = I, C = " + itos(c) + ":");
		CWindows::insertToFile(GS_LINEAR, "..\\" + PATH_LIBSVM + "svm-predict.exe ..\\" + PATH_NVF_TEST_I + " ..\\" + PATH_MODEL_LINEAR + " ..\\" + RESULT_FILE);
	}

	//RBF
	CWindows::createFile(GS_RBF);
	CWindows::insertToFile(GS_RBF, "@echo OFF");
	CWindows::insertToFile(GS_RBF, "SET \"svm=0\"");
	CWindows::insertToFile(GS_RBF, "SET \"kernel=2\"");
	for (int c = 1; c < 10000; c *= 2) {
		for (double g = 0.001953125; g < 10; g *= 2) {
			CWindows::insertToFile(GS_RBF, "..\\" + PATH_LIBSVM + "svm-train.exe -s %svm% -t %kernel% -c " + itos(c) + " -g " + itos(g) + " -q ..\\" + PATH_NVF_TRAINING + " ..\\" + PATH_MODEL_RBF);
			CWindows::insertToFile(GS_RBF, "echo Kernel = RBF, Test = I, C = " + itos(c) + ", g = " + itos(g) + ":");
			CWindows::insertToFile(GS_RBF, "..\\" + PATH_LIBSVM + "svm-predict.exe ..\\" + PATH_NVF_TEST_I + " ..\\" + PATH_MODEL_RBF + " ..\\" + RESULT_FILE);
			CWindows::insertToFile(GS_RBF, "echo Kernel = RBF, Test = II, C = " + itos(c) + ", g = " + itos(g) + ":");
			CWindows::insertToFile(GS_RBF, "..\\" + PATH_LIBSVM + "svm-predict.exe ..\\" + PATH_NVF_TEST_II + " ..\\" + PATH_MODEL_RBF + " ..\\" + RESULT_FILE);
		}
	}

	/* END CREAETE GRID SEARCH */
}

float* OCR::countMoment(Mat image) {

	//vector<float>* trainingData = new vector<float>();
	float* trainingData = new float[31];
	double hu[7];
	
	Moments m = moments(image);
	HuMoments(m, hu);

	trainingData[0]=m.m00;
	trainingData[1]=m.m10;
	trainingData[2]=m.m01;
	trainingData[3]=m.m20;
	trainingData[4]=m.m11;
	trainingData[5]=m.m02;
	trainingData[6]=m.m30;
	trainingData[7]=m.m21;
	trainingData[8]=m.m12;
	trainingData[9]=m.m03;

	trainingData[10]=m.mu20;
	trainingData[11]=m.mu11;
	trainingData[12]=m.mu02;
	trainingData[13]=m.mu30;
	trainingData[14]=m.mu21;
	trainingData[15]=m.mu12;
	trainingData[16]=m.mu03;

	trainingData[17]=m.nu20;
	trainingData[18]=m.nu11;
	trainingData[19]=m.nu02;
	trainingData[20]=m.nu30;
	trainingData[21]=m.nu21;
	trainingData[22]=m.nu12;
	trainingData[23]=m.nu03;

	trainingData[24]=hu[0];
	trainingData[25]=hu[1];
	trainingData[26]=hu[2];
	trainingData[27]=hu[3];
	trainingData[28]=hu[4];
	trainingData[29]=hu[5];
	trainingData[30]=hu[6];

	return trainingData;
}

void OCR::saveEffect() {

	//Nazewnictwo znaków digit0_<user>_<probka>
	//<user> 		= {0..20}
	//<probka> 		= {0..9}

	/* images			~ it's whole image */
	/* vImageSignRow	~ it's row image */
	/* vImageSignCell	~ it's cell image */

	vector<Mat>		images;

	vector<string> vSImages = CWindows::getListFileFrom("digit//");
	for each (string var in vSImages) images.push_back(imread("digit//" + var, 0));

	int digit	= 0;
	int user	= 0;
	int sample	= 0;
	string fileName;

	for each (Mat im in images) {
		
		this->imageSign		= im.clone();
		this->imageSignO	= im.clone();
		preProcessing();

		digit = 0;
		for each (Mat imRow in vImageSignRow) {

			SegmentationCell(imRow);
			sample = 0;
			for each (Mat imCell in vImageSignCell) {

				fileName = "digits//digit" + (itos(user)) + "_" + (itos(digit)) + "_" + (itos(sample)) + ".jpg";
				imwrite(fileName, imCell);
				sample++;
			}
			digit++;
		}
		user++;
	}
	vSImages.clear();
	MomentsLoadImage();
}

#pragma endregion Segmentation