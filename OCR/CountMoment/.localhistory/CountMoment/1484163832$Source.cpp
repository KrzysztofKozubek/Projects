#include <cv.h>
#include <highgui.h>
/* library OpenCV */
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>

/* library VS */
#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <stdio.h>

using namespace std;
using namespace cv;

/// Global Variables
const int alpha_slider_max = 100;
int alpha_slider;
double alpha;
double beta;

/// Matrices to store images
Mat src1;
Mat src2;
Mat dst;

/**
* @function on_trackbar
* @brief Callback for trackbar
*/
void on_trackbar(int, void*)
{


	imshow("Linear Blend", dst);
}

int main(int argc, char** argv)
{
	/// Read image ( same size, same type )
	src1 = imread(string("Z.jpg"), 0);

	/// Initialize values
	alpha_slider = 0;

	/// Create Windows
	namedWindow("Linear Blend", 1);

	/// Create Trackbars
	char TrackbarName[50];
	sprintf(TrackbarName, "Alpha x %d", alpha_slider_max);

	createTrackbar(TrackbarName, "Linear Blend", &alpha_slider, alpha_slider_max, on_trackbar);

	/// Show some stuff
	on_trackbar(alpha_slider, 0);

	/// Wait until user press some key
	waitKey(0);
	return 0;
}