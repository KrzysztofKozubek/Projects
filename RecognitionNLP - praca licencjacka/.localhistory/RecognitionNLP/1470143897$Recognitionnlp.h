#ifndef RECOGNITIONNLP_H
#define RECOGNITIONNLP_H

/* out classes */
#include "dirent.h"
#include <SVM.h>
#include <Distorted.h>
#include <Segmentation.h>


/* library C++*/
#include <vector>
#include <string>
#include <iostream>
#include <math.h>
#include <fstream>
#include <stdio.h>

using namespace std;


/* library OpenCV */
#include "opencv2\opencv.hpp"
#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>
#include "opencv2/imgcodecs.hpp"
#include <opencv2/highgui.hpp>
#include <opencv2/ml.hpp>

using namespace cv;
using namespace cv::ml;


/*library Qt*/
#include <QtWidgets/QMainWindow>
#include "ui_recognitionnlp.h"
#include <qmessagebox.h>

//class CListChange {

//};

#pragma region

inline string convertQStringToString(QString qString) {
	/*

	// Either this if you use UTF-8 anywhere
	std::string utf8_text = qs.toUtf8().constData();

	// or this if you on Windows :-)
	std::string current_locale_text = qs.toLocal8Bit().constData();

	*/
	return qString.toLocal8Bit().constData();
}

inline QString convertStringToQString(string str) {

	return QString::fromStdString(str);
}

inline string itos(double dbl) {
	std::ostringstream strs;
	strs << dbl;
	std::string str = strs.str();

	return str;
}

inline string itos(int i) {
	std::stringstream ss;
	std::string str;
	ss << i;
	ss >> str;

	return str;
}

inline void showImage(Mat image) {
	imshow("image", image);
	waitKey();
}

inline QImage cvMatToQImage(const cv::Mat &inMat) {

	switch (inMat.type()) {
		// 8-bit, 4 channel
	case CV_8UC4: {
		QImage image(inMat.data, inMat.cols, inMat.rows, inMat.step, QImage::Format_RGB32);

		return image;
	}

	// 8-bit, 3 channel
	case CV_8UC3: {
		QImage image(inMat.data, inMat.cols, inMat.rows, inMat.step, QImage::Format_RGB888);

		return image.rgbSwapped();
	}

	// 8-bit, 1 channel
	case CV_8UC1: {
		static QVector<QRgb>  sColorTable;

		// only create our color table once
		if (sColorTable.isEmpty()) {
			for (int i = 0; i < 256; ++i)
				sColorTable.push_back(qRgb(i, i, i));
		}

		QImage image(inMat.data, inMat.cols, inMat.rows, inMat.step, QImage::Format_Indexed8);

		image.setColorTable(sColorTable);

		return image;
	}

	default:
		break;
	}

	return QImage();
}

inline QPixmap cvMatToQPixmap(const cv::Mat &inMat){

	return QPixmap::fromImage(cvMatToQImage(inMat));
}



#pragma endregion Inline methods


class RecognitionNLP : public QMainWindow {
	Q_OBJECT

public:
	RecognitionNLP(QWidget *parent = 0);
	~RecognitionNLP();

	

private slots:

/* TAB LOAD METHODS */
	void clickLoadData();
	void clickClearData();

/* TAB PROPERTYS METHODS */
	void clickAddNoising();
	void clickClearNoising();
	void clickGenerateNosingImage();
	void moveSlider();
	
	void selectRBContrast();
	void selectRBBlur();
	void selectRBGaussianBlur();
	void selectRBMedianBlur();
	void selectRBBilateralFilter();
	void selectRBErode();
	void selectRBDilate();
	void selectRBZoom();
	void selectRBFiltrTwoD();
	void selectRBAffineTransformations();

/* TAB SEGMENTATION METHODS */
	void clickSegmentationErode();
	void clickSegmentationContrast();
	void clickSegmentationBW();
	void clickSegmentationCutimage();
	void clickSegmentationNegative();
	void clickSegmentationSumControl(); 
	void preProcessing();
	void segmentation();
	void SegmentationUpDatevParameters();

/* TAB TEST METHOD */
	void runTest();
	void saveFileVectorFeauter();
	void training();

	void myTest();
	void test();
	void generatorSign();

private:
	Ui::RecognitionNLPClass ui;

	Mat						image;
	CDistorted				distorted;

	//tab load data
	

	//tab propertys
	vector<QRadioButton*>	vRBChanges;

	vector<QLabel*>			vLabelsValue;
	vector<QLabel*>			vLabelValueSlider;
	vector<QLabel*>			vLabelMisstakeValueSlider;

	vector<QSlider*>		vSliderValue;
	vector<QSlider*>		vSliderMisstakeValue;


	//tab segmentation
	vector<QRadioButton*>	vRBSegmentation;
	vector<QLabel*>			vLabelsSegmentation;
	vector<QLabel*>			vLabelsSegmetationValue;
	vector<QLabel*>			vLabelsSegmentationResult;
	vector<QSlider*>		vHSSegmentation;

	vector<int>				vParameters;

	//tab test
	vector<QLabel*>			vLabelTest;
	vector<QDoubleSpinBox*> vSpinBoxValueTest;

	/* MY TEST */

	vector<float>* countMoment(Mat image);

	void setParameters();

	Mat translateImg(Mat &img, int offsetx, int offsety);
	/* END MY TEST */


	/* METHODS PROPERTYS */

	void PropertysUpDateScens(vector<string> vValues, vector<int> vMin, vector<int> vMax, vector<int> vDefault);

	void PropertysShowResultImage(bool onRawFile = false);

	void UseDefaultValue();

	/* END METHODS PROPERTYS */

	/* METHODS SEGMENTATION */

	void SegmentationUpDateScens(vector<string> vValues, vector<int> vMin, vector<int> vMax, vector<int> vDefault);

	void SegmentationShowResultImages();

	//fill defauld value vParameters

	/* END METHODS SEGMENTATION */

	/* METHODS TEST */



	/* END METHODS TEST */

	void fillDefaultValue();
	double* getValueFromTest();

	/* HELP METHODS */
	void			createNameFile(string path, char sign, string number);

	void			clearFolder(string path);

	void			setVector(vector<string>& str, vector<int>& vmin, vector<int>& vmax, vector<int>& vval, string parametr, int min, int max, int val);

	void			setHorizontalSlider(QSlider * slider, int min, int max, int value);

	void			fillVectorValue();

	vector<string>	getListFileFrom(string path);

	bool			fileExists(const string& fileName);

	string			readFile(string path);
	/* END HELP METHODS */

};

#endif // RECOGNITIONNLP_H