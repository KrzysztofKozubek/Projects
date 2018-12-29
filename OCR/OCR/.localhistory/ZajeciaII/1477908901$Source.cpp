/* library OpenCV */
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"
#include <stdlib.h>
#include <stdio.h>

/* library VS */
#include <iostream>

using namespace cv;
using namespace std;

// Global variables

int threshold_value = 0;
int threshold_type = 3;
int threshold_size = 4;
int const max_value = 255;
int const max_type = 4;
int const max_size = 5;
int const max_BINARY_value = 255;

Mat src, src_gray, dst;
char* window_name = "Threshold Demo";

char* trackbar_type = "Type: \n 0: Binary \n 1: Binary Inverted \n 2: Truncate \n 3: To Zero \n 4: To Zero Inverted";
char* trackbar_value = "Value";
char* trackbar_size = "size";

void toBinary(Mat& image, int margin, int skip = 50) {

	int rows = image.rows;
	int cols = image.cols;
	for (int y = skip; y < rows - skip; y++) {
		for (int x = skip; x < cols - skip; x++) {
			if (image.at<uchar>(y, x) < margin)
				image.at<uchar>(y, x) = 255;
			else	image.at<uchar>(y, x) = 0;
		}
	}
}

void Threshold_Demo(int, void*)
{
	dst = src.clone();
	//resize(dst, dst, dst.size() * threshold_size);
	//threshold(dst, dst, 160, 255, 2);
	//threshold(dst, dst, 140, 255, 3);
	//threshold(dst, dst, threshold_value, max_BINARY_value, threshold_type);
	//toBinary(dst, threshold_value, 0);
	Mat element = getStructuringElement(type, Size(2 * size + 1, 2 * size + 1), Point(size, size));
	cv::dilate(image.clone(), image, element);

	imwrite("xx.jpg", dst);
	imshow(window_name, dst);
}

int main() {

	
	/*threshold(src, dst, 250, 255, 1);
	int typ = src.type();
	resize(dst, src, src.size()*2);
	imshow("Z", src);
	imshow("X", dst);
	waitKey();*/

	// Load an image
	src = imread("xx.jpg", 0);
	src_gray = src.clone();

	namedWindow(window_name, CV_WINDOW_AUTOSIZE);

	createTrackbar(trackbar_type,
		window_name, &threshold_type,
		max_type, Threshold_Demo);

	createTrackbar(trackbar_value,
		window_name, &threshold_value,
		max_value, Threshold_Demo);

	createTrackbar(trackbar_size,
		window_name, &threshold_size,
		max_size, Threshold_Demo);

	Threshold_Demo(0, 0);


	waitKey();
}

//Mat src, dst, newImage;
//int alpha, beta;
//int maxA = 3, maxB = 100, A, B, maxAngle = 360;
//
//void Contrast(int, void*) {
//
//	newImage = Mat::zeros(src.size(), src.type());
//	for (int y = 0; y < src.rows; y++) {
//		for (int x = 0; x < src.cols; x++) {
//			for (int c = 0; c < 3; c++) {
//				newImage.at<Vec3b>(y, x)[c] = saturate_cast<uchar>(A*(src.at<Vec3b>(y, x)[c]) + B);
//			}
//		}
//	}
//	imshow("Linear Blend", newImage);
//}
//
//void Brightness(int, void*) {
//
//	newImage = Mat::zeros(src.size(), src.type());
//	for (int y = 0; y < src.rows; y++) {
//		for (int x = 0; x < src.cols; x++) {
//			for (int c = 0; c < 3; c++) {
//				newImage.at<Vec3b>(y, x)[c] = saturate_cast<uchar>(A*(src.at<Vec3b>(y, x)[c]) + B);
//			}
//		}
//	}
//	imshow("Linear Blend", newImage);
//}
//
//int angle = 0;
//
//void Rotate(int, void*) {
//
//	Point2f src_center(src.cols / 2.0F, src.rows / 2.0F);
//	Mat rot_mat = getRotationMatrix2D(src_center, angle, 1.0);
//	warpAffine(src, dst, rot_mat, src.size());
//	imshow("Linear Blend", dst);
//}
//
//int countSumRow(Mat image, int row) {
//
//	int sum = 0;
//	for (int y = image.row; y < image.rows+1; y++) {
//		for (int x = 0; x < image.cols; x++) {
//			for (int c = 0; c < 3; c++) {
//				sum += image.at<Vec3b>(y, x)[c];
//			}
//		}
//	}
//	return sum;
//}
//
//double countSreRow(Mat image, int row) {
//
//	return countSumRow(image, row) / image.rows;
//}
//
//Mat cutImage(Mat image, int startRow, int endRow) {
//
//	cv::Rect myROI(10, 10, 100, 100);
//	cv::Mat croppedImage = image(myROI);
//}
//
//void CutImage(Mat image) {
//
//	int marginSum = 10;
//	int sum = 0;
//	bool open = 0, close = 0; 
//	int startRow, endRow;
//
//	for (int i = 0; i < image.rows; i++) {
//
//		sum = countSreRow(image, i);
//		if (sum > marginSum && open == 0) {
//			if (open == 0) {
//				open = 1;
//				startRow = i;
//			}
//		}
//		else {
//			if (open == 1 && sum < marginSum) {
//				endRow = i;
//				open = 0;
//
//
//			}
//		}
//	}
//}
//
//int main() {
//
//	src = imread("lena.jpg", 1);
//	/// Initialize values
//	A = 1;
//	B = 1;
//	angle = 0;
//	namedWindow("Linear Blend", 1);
//	
//	createTrackbar("Contrast", "Linear Blend", &A, maxA, Contrast);
//	createTrackbar("Brightness", "Linear Blend", &B, maxB, Brightness);
//	createTrackbar("Rotate", "Linear Blend", &angle, maxAngle, Rotate);
//
//	/// Show some stuff
//	Contrast(A, 0);
//	Brightness(B, 0);
//	Rotate(angle, 0);
//
//	/// Wait until user press some key
//	waitKey(0);
//}

///// Global variables
//
//int threshold_value = 0;
//int threshold_type = 3;
//int const max_value = 255;
//int const max_type = 4;
//int max_BINARY_value = 255;
//
//Mat src, src_gray, dst;
//char* window_name = "Threshold Demo";
//
//char* trackbar_type = "Type: \n 0: Binary \n 1: Binary Inverted \n 2: Truncate \n 3: To Zero \n 4: To Zero Inverted";
//char* trackbar_value = "Value";
//
///// Function headers
//void Threshold_Demo(int, void*);
//
///**
//* @function main
//*/
//int main(int argc, char** argv)
//{
//	/// Load an image
//	src = imread("digits.jpg", 1);
//	cvtColor(src, src_gray, CV_BGR2GRAY);
//	namedWindow(window_name, CV_WINDOW_AUTOSIZE);
//
//	createTrackbar(trackbar_type,		window_name, &threshold_type,		max_type, Threshold_Demo);
//
//	createTrackbar(trackbar_value,		window_name, &threshold_value,		max_value, Threshold_Demo);
//
//	createTrackbar("max",		window_name, &max_BINARY_value,		255, Threshold_Demo);
//
//
//
//	/// Call the function to initialize
//	Threshold_Demo(0, 0);
//
//	/// Wait until user finishes program
//	while (true)
//	{
//		int c;
//		c = waitKey(20);
//		if ((char)c == 27)
//		{
//			break;
//		}
//	}
//
//}
//
//
///**
//* @function Threshold_Demo
//*/
//void Threshold_Demo(int, void*)
//{
//	/* 0: Binary
//	1: Binary Inverted
//	2: Threshold Truncated
//	3: Threshold to Zero
//	4: Threshold to Zero Inverted
//	*/
//
//	threshold(src_gray, dst, threshold_value, max_BINARY_value, threshold_type);
//
//	imshow(window_name, dst);
//}

//
//#include "opencv2/imgproc/imgproc.hpp"
//#include "opencv2/highgui/highgui.hpp"
//#include "highgui.h"
//#include <stdlib.h>
//#include <stdio.h>
//
//
///// Global variables
//Mat src, erosion_dst, dilation_dst;
//
//int erosion_elem = 0;
//int erosion_size = 0;
//int dilation_elem = 0;
//int dilation_size = 0;
//int const max_elem = 2;
//int const max_kernel_size = 21;
//
///** Function Headers */
//void Erosion(int, void*);
//void Dilation(int, void*);
//
///** @function main */
//int main(int argc, char** argv)
//{
//	/// Load an image
//	src = imread("z.jpg");
//
//	if (!src.data)
//	{
//		return -1;
//	}
//
//	/// Create windows
//	namedWindow("Erosion Demo", CV_WINDOW_AUTOSIZE);
//	namedWindow("Dilation Demo", CV_WINDOW_AUTOSIZE);
//	cvMoveWindow("Dilation Demo", src.cols, 0);
//
//	/// Create Erosion Trackbar
//	createTrackbar("Element:\n 0: Rect \n 1: Cross \n 2: Ellipse", "Erosion Demo",
//		&erosion_elem, max_elem,
//		Erosion);
//
//	createTrackbar("Kernel size:\n 2n +1", "Erosion Demo",
//		&erosion_size, max_kernel_size,
//		Erosion);
//
//	/// Create Dilation Trackbar
//	createTrackbar("Element:\n 0: Rect \n 1: Cross \n 2: Ellipse", "Dilation Demo",
//		&dilation_elem, max_elem,
//		Dilation);
//
//	createTrackbar("Kernel size:\n 2n +1", "Dilation Demo",
//		&dilation_size, max_kernel_size,
//		Dilation);
//
//	/// Default start
//	Erosion(0, 0);
//	Dilation(0, 0);
//
//	waitKey(0);
//	return 0;
//}
//
///**  @function Erosion  */
//void Erosion(int, void*)
//{
//	int erosion_type;
//	if (erosion_elem == 0) { erosion_type = MORPH_RECT; }
//	else if (erosion_elem == 1) { erosion_type = MORPH_CROSS; }
//	else if (erosion_elem == 2) { erosion_type = MORPH_ELLIPSE; }
//
//	Mat element = getStructuringElement(erosion_type,
//		Size(2 * erosion_size + 1, 2 * erosion_size + 1),
//		Point(erosion_size, erosion_size));
//
//	/// Apply the erosion operation
//	erode(src, erosion_dst, element);
//	imshow("Erosion Demo", erosion_dst);
//}
//
///** @function Dilation */
//void Dilation(int, void*)
//{
//	int dilation_type;
//	if (dilation_elem == 0) { dilation_type = MORPH_RECT; }
//	else if (dilation_elem == 1) { dilation_type = MORPH_CROSS; }
//	else if (dilation_elem == 2) { dilation_type = MORPH_ELLIPSE; }
//
//	Mat element = getStructuringElement(dilation_type,
//		Size(2 * dilation_size + 1, 2 * dilation_size + 1),
//		Point(dilation_size, dilation_size));
//	/// Apply the dilation operation
//	dilate(src, dilation_dst, element);
//	imshow("Dilation Demo", dilation_dst);
//}