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

	static void cutImage(Mat& image, const int cutLeft = 20, const int cutTop = 5, const int cutRight = 2, const int cutBottom = 5) {

		const int rows = image.rows;
		const int cols = image.cols;

		image = image(Rect(cutLeft, cutTop, cols - cutLeft - cutRight, rows - cutTop - cutBottom));
	}


	static void toBinary(Mat& image, int margin, int skip = 50) {

		
		int rows = image.rows;
		int cols = image.cols;
		for (int y = skip; y < rows - skip; y++) {
			for (int x = skip; x < cols - skip; x++) {
				if (image.at<uchar>(y, x) < margin) 
						image.at<uchar>(y, x) = 255;
				else	image.at<uchar>(y, x) = 0;
			}
		}

		if (skip > 0)
			cutImage(image, skip, skip, skip, skip);
	}

	static void removeBlackBackground(Mat& image) {

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

		cutImage(image, left, up, right, bottom);
	}



	static void autoRotate(Mat& image) {

		Mat tmp = image.clone();
		Mat tmpC = tmp.clone();
		erode(tmp, 0, 1);

		int y = 0; int x = tmp.cols / 2;
		while (!(y < image.rows && image.at<uchar>(y, x) > 0 && image.at<uchar>(y, x + 1) > 0 && image.at<uchar>(y + 1, x) > 0)) { y++; }

		double begin = -1, end = 1, precision = 0.1;
		int sum = sumRow(tmp, y, 1), v = begin, tmpSum = 0;
		
		for (double a = begin; a <= end; a += precision) {
			
			tmp = tmpC.clone();
			rotate(tmp, a);
			tmpSum = sumRow(tmp, y, 2);

			if (tmpSum > sum) {
				sum = tmpSum;
				v = a;
			}
		}
		imshow("Zz", image);
		rotate(image, v);
		imshow("Zz2", image);
		waitKey();
	}


};

