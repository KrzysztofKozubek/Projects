#pragma once

/* library OpenCV */
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>

/* library VS */
#include <iostream>
#include <stdlib.h>
#include <stdio.h>

using namespace cv;
using namespace std;

class CPreProcessing {

public:

	CPreProcessing();
	~CPreProcessing();

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

	static void erode(Mat& image, int size) {

		Mat element = getStructuringElement(MORPH_CROSS, Size(2 * size + 1, 2 * size + 1), Point(size, size));
		dilate(image.clone(), image, element);
	}

	static void toBinary(Mat& image, int margin) {


	}

	static void autoRotate(Mat& image) {

		Mat tmp = image.clone();
		erode(tmp, 2);


	}


};

