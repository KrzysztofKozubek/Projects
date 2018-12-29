#include <cv.h>
#include <highgui.h>
/* library OpenCV */
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>

/* My Class */
#include "PreProcessing.h"

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

vector<cv::Mat> findSign2(cv::Mat image) {

	cv::imshow("Z", image);
	cv::waitKey();
	vector<cv::Mat> vImageSignCell;

	int LIMIT_VALUE_LIGHT_BIT = 10;
	cv::Mat tmp;
	vImageSignCell.clear();

	int cols = image.cols;
	int rows = image.rows;

	int cutStart = 0, cutEnd = 0;	//information about level cutting
	int fromCut = 0, toCut = 0;	//save position column

	int size = 45;
	string help;
	int sum = 0;
	int nImage = 0;

	for (int y = 0; y < cols - 1; y++) {
		sum = CPreProcessing::sumColumn(image, y, 3);

		if (LIMIT_VALUE_LIGHT_BIT <= sum) {

			if (cutStart == 0) fromCut = y;
			if (cutStart == 1 && cutEnd == 0) { toCut = y; cutEnd = 1; }
			if (cutStart == 1 && cutEnd == 1) {

				nImage++;
				if (nImage != 3 || 1 == 1) {

					tmp = image.clone();
					CPreProcessing::cutImage(tmp, fromCut, 0, tmp.cols - toCut, 0);
					//CPreProcessing::cutImage(tmp, (tmp.cols / 2) - size, (tmp.rows / 2) - size, (tmp.cols / 2) - size, (tmp.rows / 2) - size);
					//CPreProcessing::getCenterWeightImage(tmp);
					SegmentationMaxSize(tmp);
					//szkielet(tmp);
					tmp = CPreProcessing::changeSize(tmp, 65, 65);
					CPreProcessing::getCenterWeightImage(tmp);

					cv::imshow("Z", image);
					cv::waitKey();

					vImageSignCell.push_back(tmp);
					string name = "digits\\" + itos(vImageSignCell.size()) + ".jpg";
					cv::imwrite(name, tmp);
					tmp.release();
				}
				cutStart = toCut = cutEnd = 0;
				fromCut = y;
			}
		}
		else {
			if (cutStart == 0) cutStart = 1;
		}
	}
	return vImageSignCell;
}

void on_trackbar(int, void*)
{
	alpha = (double)alpha_slider / alpha_slider_max;
	beta = (1.0 - alpha);

	addWeighted(src1, alpha, src2, beta, 0.0, dst);

	imshow("Linear Blend", dst);
}

int main(int argc, char** argv)
{
	/// Read image ( same size, same type )
	src1 = imread("Z.jpg");
	src2 = imread("Z.jpg");

	if (!src1.data) { printf("Error loading src1 \n"); return -1; }
	if (!src2.data) { printf("Error loading src2 \n"); return -1; }

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