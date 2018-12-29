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

Mat image;
int LIMIT_VALUE_LIGHT_BIT = 450;

void SegmentationCell(int, void*){

	int LIMIT_VALUE_LIGHT_BIT = 450;
	Mat tmp;
	vImageSignCell.clear();

	int cols = image.cols;
	int rows = image.rows;

	int cutStart = 0, cutEnd = 0;	//information about level cutting
	int fromCut = 0, toCut = 0;	//save position column

	int sum = 0;

	for (int y = 0; y < cols - 1; y++) {
		sum = SegmentationAverage(image, y, 3);

		if (LIMIT_VALUE_LIGHT_BIT >= sum) {

			if (cutStart == 0) fromCut = y;
			if (cutStart == 1 && cutEnd == 0) { toCut = y; cutEnd = 1; }
			if (cutStart == 1 && cutEnd == 1) {

				tmp = image.clone();
				SegmentationCutImage(tmp, fromCut, 0, tmp.cols - toCut, 0);
				imshow(itos(y), tmp);
				waitKey();
				vImageSignCell.push_back(tmp);
				tmp.release();

				cutStart = toCut = cutEnd = 0;
				fromCut = y;
			}
		}
		else {
			if (cutStart == 0) cutStart = 1;
		}
	}
}

int main() {

	image = imread("z.jpg");
	SegmentationCell();
	namedWindow("Linear Blend", 1);
	createTrackbar("Contrast", "Linear Blend", &A, maxA, Contrast);
}