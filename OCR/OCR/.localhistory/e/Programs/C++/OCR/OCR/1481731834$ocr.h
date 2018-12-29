#ifndef OCR_H
#define OCR_H

/* library QT */
#include <QtWidgets/QMainWindow>
#include "ui_ocr.h"

/* library OpenCV */
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>

/* library VS */
#include <iostream>
#include <vector>

/* My Class */
#include "PreProcessing.h"
#include "Windows.h"

using namespace cv;
using namespace std;

#pragma region

inline string QStringToString(QString qString) {
	/*

	// Either this if you use UTF-8 anywhere
	std::string utf8_text = qs.toUtf8().constData();

	// or this if you on Windows :-)
	std::string current_locale_text = qs.toLocal8Bit().constData();

	*/
	return qString.toLocal8Bit().constData();
}

inline QString StringToQString(string str) {

	return QString::fromStdString(str);
}

inline QImage MatToQImage(const cv::Mat3b &src) {

	QImage dest(src.cols, src.rows, QImage::Format_ARGB32);
	for (int y = 0; y < src.rows; ++y) {
		const cv::Vec3b *srcrow = src[y];
		QRgb *destrow = (QRgb*)dest.scanLine(y);
		for (int x = 0; x < src.cols; ++x) {
			destrow[x] = qRgba(srcrow[x][2], srcrow[x][1], srcrow[x][0], 255);
		}
	}
	return dest;
}

inline string itos(double dbl) {
	std::ostringstream strs;
	strs << dbl;
	std::string str = strs.str();

	return str;
}



#pragma endregion Inline methods


class OCR : public QMainWindow {
	Q_OBJECT

public slots:

	void changeContrasOrBrightness();
	void rotate();
	void confirmChange();
	void loadImage();
	void saveImage();


	void loadImage2();

	void preProcessing();

	void SegmentationLoadImage();
	void SegmentationSaveImage();

	void SegmentationRow(Mat image);

	void SegmentationCell(Mat image);

	void SegmentationIncreaseIndexImageRow();
	void SegmentationReduceIndexImageRow();

	void SegmentationIncreaseIndexImageCell();

	void SegmentationReduceIndexImageCell();

	void SegmentationLoadImageRow();

	void SegmentationLoadImageCell();

	void SegmentationReduceIndexImageSign();

	void SegmentationIncreaseIndexImageSign();

	void MomentsLoadImage();

	void GenerationSkryptLibsvm();

	void createCombinationMoments();

	float * countMoment(Mat image, int without);

	float* countMoment(Mat image);

	void saveEffect();

public:
	OCR(QWidget *parent = 0);
	~OCR();

	void displayImageInLabel(Mat image, QLabel * label);

	Mat loadImageFrom(QString pathToImage, int flag);

private:
	Ui::OCRClass ui;

	Mat image;
	Mat showImage;

	Mat imageSign;
	Mat imageSignO;
	int indexImageRow = 0;
	vector<Mat> vImageSignRow;

	int indexImageCell = 0;
	vector<Mat> vImageSignCell;


	int indexImageSign = 0;
	vector<Mat> vImageSign;

	void displayImage(Mat image);

};

#endif // OCR_H
