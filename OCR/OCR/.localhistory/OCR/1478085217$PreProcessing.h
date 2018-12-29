#pragma once

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
#include "dirent.h"

using namespace cv;
using namespace std;

class CPreProcessing {

public:

	CPreProcessing();
	~CPreProcessing();

	static int sumRow(Mat image, int row, int NUMBER_MARGIN_MISSTAKE) {

		int sum = 0;
		for (int y = row; y < image.rows && y < row + NUMBER_MARGIN_MISSTAKE; y++) {
			for (int x = 0; x < image.cols; x++) {
				sum += image.at<uchar>(y, x);
			}
		}
		return sum;
	}

	static int sumColumn(Mat image, int col, int NUMBER_MARGIN_MISSTAKE) {

		int sum = 0;
		for (int x = col; x < image.cols && x < col + NUMBER_MARGIN_MISSTAKE; x++) {
			for (int y = 0; y < image.rows; y++) {
				sum += image.at<uchar>(y, x);
			}
		}
		return sum;
	}

	static double advRow(Mat image, int row, int NUMBER_MARGIN_MISSTAKE) { return (sumRow(image, row, NUMBER_MARGIN_MISSTAKE) / (image.rows)); }

	static double advCol(Mat image, int col, int NUMBER_MARGIN_MISSTAKE) { return (sumColumn(image, col, NUMBER_MARGIN_MISSTAKE) / (image.cols)); }

	static int getSkipRValue(Mat image) {

		int skip = 0;
		int margin = 50;
		int result = 0;
		CPreProcessing::dilate(image, 2, 2);
		CPreProcessing::toBinary(image, 200, 0);

		for (int x = 0; x < image.cols / 4; x++) {
			for (int y = image.rows / 2 - margin; y < image.rows + margin; y++) {
				if (image.at<uchar>(y, x) > 0) result++;
			}
			if (result > margin / 5) { result = x; x = image.cols; }
		}
			
		return result;
	}

	static int getSkipTValue(Mat image) {

		int skip = 0;
		CPreProcessing::dilate(image, 2, 2);
		CPreProcessing::toBinary(image, 200, 0);

		int center[3];
		center[0] = image.cols / 2;
		center[1] = center[0] + 1;
		center[2] = center[0] - 1;

		while (skip < image.rows / 4 && ((image.at<uchar>(skip, center[0]) <= 0) || (image.at<uchar>(skip, center[1]) <= 0) || (image.at<uchar>(skip, center[2]) <= 0))) skip++;
		
		//min Sum{1;7} if is possible 
		for (int i = 1; i < 8 && skip - i > 0; i++) skip -= i;
		
		return skip;
	}

	static void rotate(Mat& image, double angle) {

		Mat tmp = image.clone();
		Point2f src_center(image.cols / 2.0F, image.rows / 2.0F);
		Mat rot_mat = getRotationMatrix2D(src_center, angle, 1.0);
		warpAffine(tmp, image, rot_mat, image.size());
	}

	static void changeContrasOrBrightness(Mat& image, int alpha, int beta) {

		Mat showImage = Mat::zeros(image.size(), image.type());
		for (int y = 0; y < image.rows; y++) {
			for (int x = 0; x < image.cols; x++) {
				for (int c = 0; c < 3; c++) {
					image.at<Vec3b>(y, x)[c] = saturate_cast<uchar>(alpha*(image.at<Vec3b>(y, x)[c]) + beta);
				}
			}
		}
	}

	static void dilate(Mat& image, int type, int size) {

		Mat element = getStructuringElement(type, Size(2 * size + 1, 2 * size + 1), Point(size, size));
		cv::dilate(image.clone(), image, element);
	}

	static void erode(Mat& image, int type,  int size) {

		Mat element = getStructuringElement(type, Size(2 * size + 1, 2 * size + 1), Point(size, size));
		cv::erode(image.clone(), image, element);
	}

	static void cutImage(Mat& image, int cutLeft = 20, int cutTop = 5, int cutRight = 2, int cutBottom = 5) {

		const int rows = image.rows;
		const int cols = image.cols;
		cutLeft		< 0	? cutLeft	= 0 : cutLeft	= cutLeft;
		cutTop		< 0 ? cutTop	= 0 : cutTop	= cutTop;
		cutRight	< 0 ? cutRight	= 0 : cutRight	= cutRight;
		cutBottom	< 0 ? cutBottom = 0 : cutBottom = cutBottom;

		image = image(Rect(cutLeft, cutTop, cols - cutLeft - cutRight, rows - cutTop - cutBottom));
	}


	static void toBinary(Mat& image, int margin, int skipL = 50, int skipT = 50, int skipR = 50, int skipB = 50) {

		int rows = image.rows;
		int cols = image.cols;
		for (int y = skipT; y < rows - skipB; y++) {
			for (int x = skipL; x < cols - skipR; x++) {
				if (image.at<uchar>(y, x) < margin) 
						image.at<uchar>(y, x) = 255;
				else	image.at<uchar>(y, x) = 0;
			}
		}
	}

	static void removeBlackBackground(Mat& image) {

		int margin = 5;
		//up
		int up = 0;
		while (margin > advRow(image, up, 1) && image.rows / 4 > up) up++;

		//bottom
		int bottom = 0;
		while (margin > advRow(image, image.rows - bottom - 1, 1) && image.rows / 4 > up) bottom++;

		cutImage(image, 0, up, 0, bottom);

		//right
		int right = 0;
		while (margin > advCol(image, image.cols - right - 1, 1) && image.cols / 4 > right) right++;

		//left
		int left = 0;
		while (margin > advCol(image, left, 1) && image.cols / 4 > left) left++;

		cutImage(image, left, 0, right, 0);
	}



	static void autoRotate(Mat& image, int skip) {

		Mat tmp = image.clone();
		Mat tmpC;
		erode(tmp, 0, 1);
		
		int y = skip; int x = tmp.cols / 2;
		while (!(y < image.rows && image.at<uchar>(y, x) > 0 && image.at<uchar>(y, x + 1) > 0 && image.at<uchar>(y + 1, x) > 0)) { y++; }

		double begin = -1, end = 1, precision = 0.2;
		unsigned long sum = 0;
		double v = begin, tmpSum = 0;
		
		for (double a = begin; a <= end; a += precision) {
			
			tmpC = tmp.clone();
			rotate(tmpC, a);
			tmpSum = sumRow(tmpC, y, 5);

			if (tmpSum > sum) {
				sum = tmpSum;
				v = a;
			}
		}
	}


	static vector<string> getListFileFrom(string path) {

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

};

