#include "ocr.h"

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
	connect(ui.HSBinaryElement3,	SIGNAL(sliderReleased()), this, SLOT(changeBinaryOrErode()));
	connect(ui.HSBinaryKernel3,		SIGNAL(sliderReleased()), this, SLOT(changeBinaryOrErode()));
	connect(ui.HSErodeElement3,		SIGNAL(sliderReleased()), this, SLOT(changeBinaryOrErode()));
	connect(ui.HSErodeKernel3,		SIGNAL(sliderReleased()), this, SLOT(changeBinaryOrErode()));

	
	connect(ui.BRightImageRow2,		SIGNAL(clicked()), this, SLOT(SegmentationIncreaseIndexImageRow()));
	connect(ui.BLeftImageRow2,		SIGNAL(clicked()), this, SLOT(SegmentationReduceIndexImageRow()));

	connect(ui.BRightImageCell2,	SIGNAL(clicked()), this, SLOT(SegmentationIncreaseIndexImageCell()));
	connect(ui.BLeftImageCell2,		SIGNAL(clicked()), this, SLOT(SegmentationReduceIndexImageCell()));

	displayImage(this->image.clone());

	/* END Kontrast & Jasnoœæ & Obrót END */

	/* Przetwarzanie wstpne */


	this->imageSign = imread("digits.jpg", CV_BGR2GRAY);
	this->imageSignO = imageSign.clone();
	changeBinaryOrErode();

	/* END Przetwarzanie wstpene */

	/* Segmentation */

	


	/* END Segmentation END */
}

OCR::~OCR() {}

#pragma region

void OCR::displayImageInLabel(Mat image, QLabel* label) {

	cvtColor(image, image, CV_GRAY2RGB);
	Size size(100, 100);
	image.reshape(100, 100);
	QImage imdisplay((uchar*)image.data, image.cols, image.rows, image.step, QImage::Format_RGB888);
	label->setPixmap(QPixmap::fromImage(imdisplay));
}

Mat OCR::loadImageFrom(QString pathToImage, int flag = 1) {

	return imread(QStringToString(pathToImage), flag);
}

void OCR::cutImage(Mat& image, const int cutLeft = 20, const int cutTop = 5, const int cutRight = 2, const int cutBottom = 5) {

	const int rows = image.rows;
	const int cols = image.cols;

	image = image(Rect(cutLeft, cutTop, cols - cutLeft - cutRight, rows - cutTop - cutBottom));
}

int OCR::sumRow(Mat image, int row, int NUMBER_MARGIN_MISSTAKE) {

	int sum = 0;
	for (int y = row; y < image.rows && y < row + NUMBER_MARGIN_MISSTAKE; y++) {
		for (int x = 0; x < image.cols; x++) {
			sum += image.at<uchar>(y, x);
		}
	}
	return sum;
}

int OCR::sumColumn(Mat image, int col, int NUMBER_MARGIN_MISSTAKE) {

	int sum = 0;
	for (int x = col; x < image.cols && x < col + NUMBER_MARGIN_MISSTAKE; x++) {
		for (int y = 0; y < image.rows; y++) {
			sum += image.at<uchar>(y, x);
		}
	}
	return sum;
}

double OCR::advRow(Mat image, int row, int NUMBER_MARGIN_MISSTAKE) { return (sumRow(image, row, NUMBER_MARGIN_MISSTAKE) / (image.rows)); }

double OCR::advCol(Mat image, int col, int NUMBER_MARGIN_MISSTAKE) { return (sumColumn(image, col, NUMBER_MARGIN_MISSTAKE) / (image.cols)); }

Mat OCR::removeBlackBackground(Mat image) {

	int margin = 500;
	//up
	int up = 0;
	while (margin > sumRow(image, up, 1) && image.rows > up) up++;

	//right
	int right = 0;
	while (margin > sumColumn(image, image.cols - right - 1, 1) && image.cols > right) right++;

	//bottom
	int bottom = 0;
	while (margin > sumRow(image, image.rows - bottom - 1, 1) && image.rows > up + bottom) bottom++;

	//left
	int left = 0;
	while (margin > sumColumn(image, left, 1) && image.cols > left + right) left++;

	Mat tmp = image.clone();
	cutImage(tmp, left, up, right, bottom);

	return tmp;
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

void OCR::loadImage2() {

	displayImageInLabel(loadImageFrom(ui.LEPathImageLoad3->text()), ui.LImage3);
}

void OCR::changeBinaryOrErode() {

	Mat tmp = imageSignO.clone();
	//Binary
	//threshold(tmp, imageSign, ui.HSBinaryKernel3->value(), 255, ui.HSBinaryElement3->value());

	for (int x = 0; x < tmp.cols; x++) {
		for (int y = 0; y < tmp.rows; y++) {
			
			if (tmp.at<uchar>(y, x) > ui.HSBinaryKernel3->value())
				imageSign.at<uchar>(y, x) = 0;
			else
				imageSign.at<uchar>(y, x) = 255;
		}
	}


	//Change angle
	tmp = imageSign.clone();
	Point2f src_center(imageSign.cols / 2.0F, imageSign.rows / 2.0F);
	Mat rot_mat = getRotationMatrix2D(src_center, -0.5, 1.0);
	warpAffine(tmp, imageSign, rot_mat, imageSign.size());

	//Erode
	int erosion_type = ui.HSErodeElement3->value();
	int erosion_size = ui.HSErodeKernel3->value();
	tmp = imageSign.clone();
	Mat element = getStructuringElement(erosion_type,
		Size(2 * erosion_size + 1, 2 * erosion_size + 1),
		Point(erosion_size, erosion_size)); 
	erode(tmp, imageSign, element);
	
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

	int LIMIT_VALUE_LIGHT_BIT = 32;

	vImageSignRow.clear();

	int cols = image.cols;
	int rows = image.rows;

	int cutStart = 0, cutEnd = 0;	//information about level cutting
	int fromCut = 0, toCut = 0;	//save position column

	double sum = 0;

	for (int y = 0; y < rows - 1; y++) {
		sum = advRow(image, y, 15);

		if (LIMIT_VALUE_LIGHT_BIT >= sum) {

			if (cutStart == 0) fromCut = y;
			if (cutStart == 1 && cutEnd == 0) { toCut = y; cutEnd = 1; }
			if (cutStart == 1 && cutEnd == 1) {

				tmp = image.clone();
				cutImage(tmp, 0, fromCut, 0, tmp.rows - toCut);
				vImageSignRow.push_back(removeBlackBackground(tmp));
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

	int LIMIT_VALUE_LIGHT_BIT = 55;
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
		sum = advCol(image, y, 5);
		
		if (LIMIT_VALUE_LIGHT_BIT <= sum) {

			if (cutStart == 0) fromCut = y;
			if (cutStart == 1 && cutEnd == 0) { toCut = y; cutEnd = 1; }
			if (cutStart == 1 && cutEnd == 1) {

				tmp = image.clone();
				cutImage(tmp, fromCut, 0, tmp.cols - toCut, 0);
				cutImage(tmp, (tmp.cols / 2) - size, (tmp.rows / 2) - size, (tmp.cols / 2) - size, (tmp.rows / 2) - size);
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
		ui.LImageRow2->setPixmap(QPixmap::fromImage(imdisplay));
		SegmentationCell(vImageSignRow[indexImageRow].clone());
	}
}

void OCR::SegmentationLoadImageCell() {

	if(indexImageCell < vImageSignCell.size()){
		ui.LImageCell2->clear();
		Mat image = vImageSignCell[indexImageCell].clone();
		QImage imdisplay((uchar*)image.data, image.cols, image.rows, image.step, QImage::Format_Grayscale8);
		ui.LImageCell2->setPixmap(QPixmap::fromImage(imdisplay));
	}
}

#pragma endregion Segmentation