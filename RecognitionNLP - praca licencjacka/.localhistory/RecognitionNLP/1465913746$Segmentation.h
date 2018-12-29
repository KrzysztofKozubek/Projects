#pragma once
/* out classes */
#include <BasicInformations.h>
#include <Distorted.h>
#include <PreProcessing.h>
#include <ImageSign.h>
#include <SVM.h>

/* library C++ */
#include <vector>
#include <string>
#include <fstream>
#include <cstdlib>
#include <ctime>

using namespace std;

/* library OpenCV */
#include "opencv2\opencv.hpp"

using namespace cv;

inline string itoss(double dbl) {
	std::ostringstream strs;
	strs << dbl;
	std::string str = strs.str();

	return str;
}

class CSegmentation : public CBasicInformations {

	/* Segmentation */

	static const int	LIMIT_VALUE_LIGHT_BIT = 1;
	static const int	NUMBER_COLUMN_GET_TO_SEGMENTATION = 1;
	static const int	LIMIT_VALUE_COLOR = 100;

	//standard size image(one sign) after segmentation
	static const int	STANDARD_WIDTH = 40;
	static const int	STANDARD_HEIGHT = 26;

	vector<string>		vNameFilesNLP;

	//vecotrs have vector feature(count moments)
	vector<int>			vLabel;
	vector<vector<float>>vTrainingData;

	/* END Segmentation*/


	vector<int>			parameters;									//need to introductory processing
	CDistorted*			distorted;									//need to distorted image
	int z = 0;

	CSegmentation() {}
public:
	CSegmentation(CDistorted* distorted, vector<int> parameters) : distorted(distorted), parameters(parameters) {}
	~CSegmentation() {

		for (int i = 0; i < vTrainingData.size(); i++)
			vTrainingData[i].clear();
		vTrainingData.clear();
		vLabel.clear();
	}

	vector<int> getVLabel() { return vLabel; }

	vector<vector<float>> getVTraingData() { return vTrainingData; }



	void segmentationNLP(vector<CImageSign>	vNLP, int LIMIT_VALUE_LIGHT_BIT, bool withDistorting = true, bool withSegmentation = true, bool saveSegmentation = false) {
		
		int				nrSign[NUMBER_SYMBOL] = {
			0,0,0,0,0,0,0,0,0,0,	//10
			0,0,0,0,0,0,0,0,		//8
			0,0,0,0,0,0,0,0,		//8 
			0,0,0,0,0,0,0,0,0	//9
		};
		
		srand(time(NULL));
		if (saveSegmentation)
			system("mkdir Segmentation");

		clearTraingData();
		vector<Mat> tmp;
		Mat			tmp2;
		string		help;
		for each (CImageSign var in vNLP) {

			tmp.clear();
			tmp2 = var.getImage();

			if(withDistorting)
				distorted->distortingImg(tmp2);
			if (withSegmentation)
				tmp = segmentationNLP(tmp2, parameters, LIMIT_VALUE_LIGHT_BIT);
			else
				tmp.push_back(tmp2);

			int sign = -1;

			for (int i = 0; i < tmp.size() && i < var.getSign().size(); i++) {
				sign = getNumberSign(var.getSign()[i]);
				
				if (sign != -1 && nrSign[getNumberSign(var.getSign()[i])] < 101) {

					if (saveSegmentation) {
						CDistorted::noiseAffineTransformations(tmp[i], 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0);

						int angle = (rand() % 120) - 60;
						for (; angle < - 20 || angle > 20;)
							angle = (rand() % 90) - 45;

						Point2f sc(tmp[i].cols / 2.0F, tmp[i].rows / 2.0F);
						Mat rot_mat = getRotationMatrix2D(sc, angle, 1.0);
						Mat dst;
						warpAffine(tmp[i], dst, rot_mat, tmp[i].size());

						nrSign[sign]++;
						help = "D:\\Segmentation\\A\\";
						help += var.getSign()[i];
						help += "_" + itoss(nrSign[sign]);
						help += ".png";
						imwrite(help, dst);
					}

					vLabel.push_back(sign);
					vTrainingData.push_back(*countMoment(tmp[i]));
				}
				
			}
		}
	}

	vector<Mat> segmentationNLP(Mat& image, vector<int> parameters, int LIMIT_VALUE_LIGHT_BIT) {
		/*
		CPreProcessing::introductoryProcessing(image, parameters);
		CDistorted::removeBackground(image);
		//rotation(image);

		int cols = image.cols;
		int rows = image.rows;
		int from, to;

		int thresh = LIMIT_VALUE_LIGHT_BIT;
		Mat tmp;

		vector<Mat> vMat;

		Mat						threshold_output;
		vector<vector<Point>>	contours;
		vector<Vec4i>			hierarchy;

		threshold(image, threshold_output, thresh, 255, THRESH_TRUNC);
		findContours(threshold_output, contours, hierarchy, CV_RETR_EXTERNAL, CV_CHAIN_APPROX_SIMPLE, Point(0, 0));

		vector<vector<Point>> contours_poly(contours.size());
		vector<Rect> boundRect(contours.size());

		for (int i = 0; i < contours.size(); i++) {
			approxPolyDP(Mat(contours[i]), contours_poly[i], 3, true);
			boundRect[i] = boundingRect(Mat(contours_poly[i]));
		}

		int previous = -1, index = 0, value = 0;
		for (int i = 0; i < contours.size(); i++) {

			value = cols;
			index = 0;
			for (int j = 0; j < contours.size(); j++)
				if (value > boundRect[j].tl().x && previous + 5 < boundRect[j].tl().x) {
					value = boundRect[j].tl().x;
					index = j;
				}
			previous = boundRect[index].tl().x;

			tmp = image.clone();

			CPreProcessing::cutImage(tmp, (int)(boundRect[index].tl().x), 0, (int)(cols - boundRect[index].br().x), 0);
			normalaizedImage(tmp);
			vMat.push_back(tmp);
			tmp.release();
		}
		return vMat;
		*/
		
		CPreProcessing::introductoryProcessing(image, parameters);
		CDistorted::removeBackground(image);
		//rotation(image);

		vector<Mat> result;
		Mat tmp;

		int cols = image.cols;
		int rows = image.rows;

		int cutStart = 0, cutEnd = 0;	//information about level cutting
		int fromCut = 0, toCut = 0;	//save position column

		int sum = 0;

		for (int y = 0; y < cols - 1; y++) {
			sum = sumColorColumn(image, y, 2);

			if (LIMIT_VALUE_LIGHT_BIT >= sum) {

				if (cutStart == 0) fromCut = y;
				if (cutStart == 1 && cutEnd == 0) { toCut = y; cutEnd = 1; }
				if (cutStart == 1 && cutEnd == 1) {

					tmp = image.clone();

					CPreProcessing::cutImage(tmp, fromCut, 0, cols - toCut, 0);
					normalaizedImage(tmp);
					result.push_back(tmp);
					tmp.release();

					cutStart = toCut = cutEnd = 0;
					fromCut = y;
				}
			}
			else {
				if (cutStart == 0) cutStart = 1;
			}
		}

		return result;
		
	}

	void rotation(Mat& image) {

		Mat src = image.clone();
		bitwise_not(src, src);
		Size size = src.size();

		vector<cv::Vec4i> lines;
		HoughLinesP(src, lines, 1, CV_PI / 180, 100, size.width / 2.f, 20);
		Mat disp_lines(size, CV_8UC1, cv::Scalar(0, 0, 0));
		double angle = 0.;

		unsigned nb_lines = lines.size();
		for (unsigned i = 0; i < nb_lines; ++i) {

			line(disp_lines, cv::Point(lines[i][0], lines[i][1]),
			Point(lines[i][2], lines[i][3]), cv::Scalar(255, 0, 0));
			angle += atan2((double)lines[i][3] - lines[i][1], (double)lines[i][2] - lines[i][0]);
		}
		angle /= nb_lines; 

		angle *= 180;

		if (angle > 1) {
			CDistorted::noiseAffineTransformations(image, 0, 0, 0, 0, angle, 0, 0, 0, 0, 0, 0, 0);
		}
		if (angle < -1) {
			CDistorted::noiseAffineTransformations(image, angle, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
		}
	}


	
private:


	void clearTraingData() {

		vLabel.clear();
		for (int i = 0; i < vTrainingData.size(); i++)
			vTrainingData[i].clear();
		vTrainingData.clear();
	}

	int sumColorColumn(const Mat& image, int column, int NUMBER_COLUMN_GET_TO_SEGMENTATION = NUMBER_COLUMN_GET_TO_SEGMENTATION) {

		int rows = image.rows;
		int cols = image.cols;
		int sum = 0;

		for (int x = column; x < column + NUMBER_COLUMN_GET_TO_SEGMENTATION && x < cols; x++) {
			for (int y = 0; y < rows; y++)
				sum += image.at<uchar>(y, x);
		}

		return sum / rows;
	}

	void normalaizedImage(Mat& image) {

		int width = image.cols;
		int height = image.rows;

		if (STANDARD_WIDTH != width) {
			resize(image, image, Size(height, STANDARD_WIDTH));
			width = STANDARD_WIDTH;
		}
		if (STANDARD_HEIGHT != height) {
			resize(image, image, Size(STANDARD_HEIGHT, width));
			height = STANDARD_HEIGHT;
		}
	}

	void addBlackBord(Mat& image) {
		//, int top = 0, int right = 0, int bottom = 0, int left = 0
		int width = image.cols;
		int height = image.rows;

		Mat tmp(image);
		image.release();

		Mat tmpImage(STANDARD_WIDTH, STANDARD_HEIGHT, 16);

		for (int y = 0; y < tmpImage.rows; y++) {
			for (int x = 0; x < tmpImage.cols; x++) {
				for (int c = 0; c < 3; c++) {
					tmpImage.at<Vec3b>(y, x)[c] = 0;
				}
			}
		}

		for (int y = 0; y < height; y++) {
			for (int x = 0; x < width; x++) {
				for (int c = 0; c < 3; c++)
					tmpImage.at<Vec3b>(y, x)[c] = tmp.at<Vec3b>(y, x)[c];
			}
		}
		image = tmpImage;
	}

	vector<float>* countMoment(Mat image) {

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
};

