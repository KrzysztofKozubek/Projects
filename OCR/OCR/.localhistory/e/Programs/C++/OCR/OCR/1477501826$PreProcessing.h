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

	void rotate(Mat& image, double angle) {

		Mat tmp = image.clone();
		Point2f src_center(image.cols / 2.0F, image.rows / 2.0F);
		Mat rot_mat = getRotationMatrix2D(src_center, angle, 1.0);
		warpAffine(tmp, image, rot_mat, image.size());
	}
};

