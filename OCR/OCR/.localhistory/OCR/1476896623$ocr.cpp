#include "ocr.h"

OCR::OCR(QWidget *parent) : QMainWindow(parent) {

	/* Kontrast & Jasnoœæ & Obrót */

	ui.setupUi(this);
	this->image = imread("lena.jpg", 1);
	showImage = image.clone();

	connect(ui.HSContrast1,		SIGNAL(sliderReleased()), this, SLOT(changeContrasOrBrightness()));
	connect(ui.HSBrightness1,	SIGNAL(sliderReleased()), this, SLOT(changeContrasOrBrightness()));
	connect(ui.HSRotate1,		SIGNAL(sliderReleased()), this, SLOT(rotate()));

	connect(ui.BConfirmChange1, SIGNAL(clicked()), this, SLOT(confirmChange()));
	connect(ui.BLoadImage1,		SIGNAL(clicked()), this, SLOT(loadImage()));
	connect(ui.BSaveImage1,		SIGNAL(clicked()), this, SLOT(saveImage()));


	connect(ui.BLoadImage3, SIGNAL(clicked()), this, SLOT(SegmentationLoadImage()));


	connect(ui.BLeftImageRow2,	SIGNAL(clicked()), this, SLOT(SegmentationIncreasIndexImageRow()));
	connect(ui.BRightImageRow2, SIGNAL(clicked()), this, SLOT(SegmentationReduceIndexImageRow()));

	connect(ui.BRightImageCell2,	SIGNAL(clicked()), this, SLOT(SegmentationIncreaseIndexImageCell()));
	connect(ui.BLeftImageCell2,		SIGNAL(clicked()), this, SLOT(SegmentationReduceIndexImageCell()));

	displayImage(this->image.clone());

	/* END Kontrast & Jasnoœæ & Obrót END */

	/* Segmentation */

	this->imageSign = imread("digits.jpg", 1);

	SegmentationRow(imageSign);

	/* END Segmentation END */
}

OCR::~OCR() {}

#pragma region

void displayImageInLabel(Mat image, QLabel* label) {

	QImage imdisplay((uchar*)image.data, image.cols, image.rows, image.step, QImage::Format_RGB888);
	label->setPixmap(QPixmap::fromImage(imdisplay));
}

Mat loadImageFrom(QString pathToImage, int flag = 1) {

	return imread(QStringToString(pathToImage), flag);
}

void cutImage(Mat& image, const int cutLeft = 20, const int cutTop = 5, const int cutRight = 2, const int cutBottom = 5) {

	const int rows = image.rows;
	const int cols = image.cols;

	image = image(Rect(cutLeft, cutTop, cols - cutLeft - cutRight, rows - cutTop - cutBottom));
}

void sumColumn(Mat image, int row, int NUMBER_MARGIN_MISSTAKE) {

	int sum = 0;
	for (int x = row; x < image.rows&&x < row + NUMBER_MARGIN_MISSTAKE; x++) {
		for (int y = 0; y < image.cols; y++) {
			sum += image.at<uchar>(y, x);
		}
	}
}
#pragma endregion Unversal method


#pragma region

void OCR::rotate() {

	Point2f src_center(image.cols / 2.0F, image.rows / 2.0F);
	Mat rot_mat = getRotationMatrix2D(src_center, ui.HSRotate1->value(), 1.0);
	warpAffine(image, showImage, rot_mat, showImage.size());

	displayImage(showImage);
}

void OCR::changeContrasOrBrightness() {

	double alpha	= ui.HSContrast1->value();
	int beta		= ui.HSBrightness1->value();

	showImage = Mat::zeros(image.size(), image.type());
	for (int y = 0; y < image.rows; y++) {
		for (int x = 0; x < image.cols; x++) {
			for (int c = 0; c < 3; c++) {
				showImage.at<Vec3b>(y, x)[c] = saturate_cast<uchar>(alpha*(image.at<Vec3b>(y, x)[c]) + beta);
			}
		}
	}

	displayImage(showImage);
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



#pragma endregion Przetwarzanie wstêpne


#pragma region

void OCR::SegmentationDisplayImage(Mat image) {

	QImage imdisplay((uchar*)image.data, image.cols, image.rows, image.step, QImage::Format_RGB888);
	ui.LImage2->setPixmap(QPixmap::fromImage(imdisplay));
}


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


void OCR::SegmentationCutImage(Mat& image, const int cutLeft = 20, const int cutTop = 5, const int cutRight = 2, const int cutBottom = 5) {

	const int rows = image.rows;
	const int cols = image.cols;

	image = image(Rect(cutLeft, cutTop, cols - cutLeft - cutRight, rows - cutTop - cutBottom));
}

int OCR::SegmentationSum(Mat image, int row, int NUMBER_COLUMN_GET_TO_SEGMENTATION) {

	double sum = 0;
	for (int y = row; y < row + NUMBER_COLUMN_GET_TO_SEGMENTATION && y < image.rows; y++) {
		for (int x = 0; x < image.cols; x++) {
			sum += image.at<uchar>(y, x);
		}
	}
	

	return sum;
}

double OCR::SegmentationAverage(Mat image, int row, int NUMBER_COLUMN_GET_TO_SEGMENTATION) {

	return SegmentationSum(image, row, NUMBER_COLUMN_GET_TO_SEGMENTATION) / image.rows;
}

void OCR::SegmentationRow(Mat image) {
	
	Mat tmp = imageSign.clone();

	threshold(tmp, imageSign, 220, 255, 1);
	tmp = imageSign.clone();
	Point2f src_center(imageSign.cols / 2.0F, imageSign.rows / 2.0F);
	Mat rot_mat = getRotationMatrix2D(src_center, -0.5, 1.0);
	warpAffine(tmp, imageSign, rot_mat, imageSign.size());

	SegmentationDisplayImage(imageSign);

	int LIMIT_VALUE_LIGHT_BIT = 5;

	vImageSignRow.clear();

	int cols = image.cols;
	int rows = image.rows;

	int cutStart = 0, cutEnd = 0;	//information about level cutting
	int fromCut = 0, toCut = 0;	//save position column

	double sum = 0;

	for (int y = 0; y < rows - 1; y++) {
		sum = SegmentationAverage(image, y,3);
		
		if (LIMIT_VALUE_LIGHT_BIT >= sum) {

			if (cutStart == 0) fromCut = y;
			if (cutStart == 1 && cutEnd == 0) { toCut = y; cutEnd = 1; }
			if (cutStart == 1 && cutEnd == 1) {

				tmp = image.clone();
				SegmentationCutImage(tmp, 0, fromCut, 0, tmp.rows - toCut);
				vImageSignRow.push_back(tmp);
				imwrite("z.jpg", tmp);
				tmp.release();

				cutStart = toCut = cutEnd = 0;
				fromCut = y;
			}
		}
		else {
			if (cutStart == 0) cutStart = 1;
		}
	}
	SegmentationLoadImageRow();
}

void OCR::SegmentationCell(Mat image) {

	int LIMIT_VALUE_LIGHT_BIT = 450;
	Mat tmp;
	vImageSignCell.clear();

	int cols = image.cols;
	int rows = image.rows;

	int cutStart = 0, cutEnd = 0;	//information about level cutting
	int fromCut = 0, toCut = 0;	//save position column

	int sum = 0;
	
	for (int y = 0; y < cols - 1; y++) {
		sum = SegmentationAverage(image, y, 3);
		
		if (LIMIT_VALUE_LIGHT_BIT >= sum) {

			if (cutStart == 0) fromCut = y;
			if (cutStart == 1 && cutEnd == 0) { toCut = y; cutEnd = 1; }
			if (cutStart == 1 && cutEnd == 1) {

				tmp = image.clone();
				SegmentationCutImage(tmp, fromCut, 0, tmp.cols - toCut, 0);
				imshow("z", tmp);
				waitKey();
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
	Mat image = vImageSignRow[indexImageRow].clone();
	QImage imdisplay((uchar*)image.data, image.cols, image.rows, image.step, QImage::Format_RGB888);
	ui.LImageRow2->setPixmap(QPixmap::fromImage(imdisplay));
	SegmentationCell(vImageSignRow[indexImageRow].clone());
}

void OCR::SegmentationLoadImageCell() {

	ui.LImageCell2->clear();
	Mat image = vImageSignCell[indexImageCell].clone();
	QImage imdisplay((uchar*)image.data, image.cols, image.rows, image.step, QImage::Format_RGB888);
	ui.LImageCell2->setPixmap(QPixmap::fromImage(imdisplay));
}
#pragma endregion Segmentation