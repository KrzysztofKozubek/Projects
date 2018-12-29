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
#include <fstream>
#include <stdlib.h>
#include <stdio.h>

/* My Class */
#include "PreProcessing.h"

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

//
inline string itos(double dbl) {
	std::ostringstream strs;
	strs << dbl;
	std::string str = strs.str();

	return str;
}
//
//inline string itos(int i) {
//	std::stringstream ss;
//	std::string str;
//	ss << i;
//	ss >> str;
//
//	return str;
//}
//
//inline void showImage(Mat image) {
//	imshow("image", image);
//	waitKey();
//}
//
//inline QImage cvMatToQImage(const cv::Mat &inMat) {
//
//	switch (inMat.type()) {
//		// 8-bit, 4 channel
//	case CV_8UC4: {
//		QImage image(inMat.data, inMat.cols, inMat.rows, inMat.step, QImage::Format_RGB32);
//
//		return image;
//	}
//
//				  // 8-bit, 3 channel
//	case CV_8UC3: {
//		QImage image(inMat.data, inMat.cols, inMat.rows, inMat.step, QImage::Format_RGB888);
//
//		return image.rgbSwapped();
//	}
//
//				  // 8-bit, 1 channel
//	case CV_8UC1: {
//		static QVector<QRgb>  sColorTable;
//
//		// only create our color table once
//		if (sColorTable.isEmpty()) {
//			for (int i = 0; i < 256; ++i)
//				sColorTable.push_back(qRgb(i, i, i));
//		}
//
//		QImage image(inMat.data, inMat.cols, inMat.rows, inMat.step, QImage::Format_Indexed8);
//
//		image.setColorTable(sColorTable);
//
//		return image;
//	}
//
//	default:
//		break;
//	}
//
//	return QImage();
//}
//
//inline QPixmap cvMatToQPixmap(const cv::Mat &inMat) {
//
//	return QPixmap::fromImage(cvMatToQImage(inMat));
//}

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

	void changeBinaryOrErode();

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

	void displayImage(Mat image);

};

#endif // OCR_H
