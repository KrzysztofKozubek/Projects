#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"
#include <stdlib.h>
#include <stdio.h>


using namespace cv;
using namespace std;

vector<Mat> vImageSignCell;

inline string itos(int i) {
	std::stringstream ss;
	std::string str;
	ss << i;
	ss >> str;

	return str;
}

int SegmentationSum(Mat image, int row, int NUMBER_COLUMN_GET_TO_SEGMENTATION) {

	double sum = 0;
	for (int y = row; y < row + NUMBER_COLUMN_GET_TO_SEGMENTATION && y < image.rows; y++) {
		for (int x = 0; x < image.cols; x++) {
			sum += image.at<uchar>(y, x);
		}
	}


	return sum;
}

double SegmentationAverage(Mat image, int row, int NUMBER_COLUMN_GET_TO_SEGMENTATION) {

	return SegmentationSum(image, row, NUMBER_COLUMN_GET_TO_SEGMENTATION) / image.rows;
}

void SegmentationCutImage(Mat& image, const int cutLeft = 20, const int cutTop = 5, const int cutRight = 2, const int cutBottom = 5) {

	const int rows = image.rows;
	const int cols = image.cols;

	image = image(Rect(cutLeft, cutTop, cols - cutLeft - cutRight, rows - cutTop - cutBottom));
}

Mat normalaizedImage(Mat imageT) {

	Mat image = imageT.clone();
	int width = image.cols;
	int height = image.rows;

	if (100 != width) {
		resize(image, image, Size(height, 100));
		width = 100;
	}
	if (100 != height) {
		resize(image, image, Size(100, width));
		height = 100;
	}
	return image;
}

Mat image;
int LIMIT_VALUE_LIGHT_BIT;
int maxA = 1000;


void SegmentationCell(int, void*) {

	Mat tmp;
	vImageSignCell.clear();

	int cols = image.cols;
	int rows = image.rows;

	int cutStart = 0, cutEnd = 0;	//information about level cutting
	int fromCut = 0, toCut = 0;	//save position column

	int sum = 0;
	int pomoc = 0;

	for (int y = 0; y < cols - 1; y++) {
		sum = SegmentationAverage(image, y, 3);

		if (LIMIT_VALUE_LIGHT_BIT >= sum) {

			if (cutStart == 0) fromCut = y;
			if (cutStart == 1 && cutEnd == 0) { toCut = y; cutEnd = 1; }
			if (cutStart == 1 && cutEnd == 1) {

				tmp = image.clone();
				SegmentationCutImage(tmp, fromCut, 0, tmp.cols - toCut, 0);
				if (pomoc == 1)
					imshow("1", normalaizedImage(tmp));
				if (pomoc == 2)
					imshow("2", normalaizedImage(tmp));
				if (pomoc == 3)
					imshow("3", normalaizedImage(tmp));
				if (pomoc == 4)
					imshow("4", normalaizedImage(tmp));
				vImageSignCell.push_back(tmp);
				tmp.release();

				cutStart = toCut = cutEnd = 0;
				fromCut = y;
				pomoc++;
			}
		}
		else {
			if (cutStart == 0) cutStart = 1;
		}
	}
}

std::vector<cv::Rect> detectLetters(cv::Mat img) {

	std::vector<cv::Rect> boundRect;
	cv::Mat img_gray, img_sobel, img_threshold, element;
	cvtColor(img, img_gray, CV_BGR2GRAY);
	cv::Sobel(img_gray, img_sobel, CV_8U, 1, 0, 3, 1, 0, cv::BORDER_DEFAULT);
	cv::threshold(img_sobel, img_threshold, 0, 255, CV_THRESH_OTSU + CV_THRESH_BINARY);
	element = getStructuringElement(cv::MORPH_RECT, cv::Size(17, 3));
	cv::morphologyEx(img_threshold, img_threshold, CV_MOP_CLOSE, element); //Does the trick
	std::vector< std::vector< cv::Point> > contours;
	cv::findContours(img_threshold, contours, 0, 1);
	std::vector<std::vector<cv::Point> > contours_poly(contours.size());
	for (int i = 0; i < contours.size(); i++)
		if (contours[i].size()>100)
		{
			cv::approxPolyDP(cv::Mat(contours[i]), contours_poly[i], 3, true);
			cv::Rect appRect(boundingRect(cv::Mat(contours_poly[i])));
			if (appRect.width>appRect.height)
				boundRect.push_back(appRect);
		}
	return boundRect;
}

int main() {

	//Read
	cv::Mat img1 = cv::imread("z.jpg");
	int erosion_elem = 2;
	int erosion_size = 1;
	Mat im = img1.clone();
	int erosion_type;
	if (erosion_elem == 0) { erosion_type = MORPH_RECT; }
	else if (erosion_elem == 1) { erosion_type = MORPH_CROSS; }
	else if (erosion_elem == 2) { erosion_type = MORPH_ELLIPSE; }
	
	Mat element = getStructuringElement(erosion_type,
		Size(2 * erosion_size + 1, 2 * erosion_size + 1),
		Point(erosion_size, erosion_size));
	
	/// Apply the erosion operation
	erode(src, erosion_dst, element);

	//Detect
	std::vector<cv::Rect> letterBBoxes1 = detectLetters(img1);
	//Display
	for (int i = 0; i< letterBBoxes1.size(); i++)
		cv::rectangle(img1, letterBBoxes1[i], cv::Scalar(0, 255, 0), 3, 8, 0);
	cv::imwrite("imgOut1.jpg", img1);
	waitKey(0);


	/*image = imread("z.jpg");
	int A = 0;
	LIMIT_VALUE_LIGHT_BIT = 245;
	namedWindow("0", 1);
	namedWindow("1", 1);
	namedWindow("2", 1);
	namedWindow("3", 1);
	namedWindow("4", 1);
	createTrackbar("Value", "0", &A, maxA, SegmentationCell);
	imshow("0", (image));
	SegmentationCell(A, 0);
	waitKey(0);*/
}