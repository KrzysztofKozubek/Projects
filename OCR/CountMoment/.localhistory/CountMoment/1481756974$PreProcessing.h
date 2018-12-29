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

using namespace std;

class CPreProcessing {

	cv::Mat image;

public:

	CPreProcessing(cv::Mat image) : image(image) {};
	~CPreProcessing() { image.release(); };

	void SegmentationMaxSize(cv::Mat& image) {

		int left, right, top, bottom, sum;
		left = right = top = bottom = sum = 0;
		cv::Mat tmp = image.clone();


		for (int x = 0; x < tmp.cols; x++) {
			sum = CPreProcessing::advCol(tmp, x, 1);
			if (sum > 10) {
				left = x;
				x = tmp.cols;
			}
		}
		for (int x = tmp.cols - 1; x > 0; x--) {
			sum = CPreProcessing::advCol(tmp, x, 1);
			if (sum > 10) {
				right = x;
				x = 0;
			}
		}

		for (int y = 0; y < tmp.rows; y++) {
			sum = CPreProcessing::advRow(tmp, y, 1);
			if (sum > 10) {
				top = y;
				y = image.cols;
			}
		}
		for (int y = tmp.rows - 1; y > 0; y--) {
			sum = CPreProcessing::advRow(tmp, y, 1);
			if (sum > 10) {
				bottom = y;
				y = 0;
			}
		}

		CPreProcessing::cutImage(tmp, left, top, tmp.cols - right, tmp.rows - bottom);
		cv::resize(tmp, image, cv::Size(130, 130));
	}
	
	inline string itos(double dbl) {
		std::ostringstream strs;
		strs << dbl;
		std::string str = strs.str();

		return str;
	}

	void szkielet(cv::Mat& image) {
		cv::Mat skel(image.size(), CV_8UC1, cv::Scalar(0));
		cv::Mat temp;
		cv::Mat eroded;

		cv::Mat element = cv::getStructuringElement(cv::MORPH_CROSS, cv::Size(3, 3));

		bool done;
		do
		{
			cv::erode(image, eroded, element);
			cv::dilate(eroded, temp, element); // temp = open(img)
			cv::subtract(image, temp, temp);
			cv::bitwise_or(skel, temp, skel);
			eroded.copyTo(image);

			done = (cv::countNonZero(image) == 0);
		} while (!done);
		image = skel.clone();
	}

	void preProcessing(cv::Mat image) {

		cv::Mat tmp = image.clone();
		cv::Mat imageSign = tmp.clone();

		//CPreProcessing::dilate(imageSign, 2, 2);
		//imshow("Z", imageSign);
		//waitKey();
		int size = 5;
		GaussianBlur(imageSign.clone(), imageSign, cv::Size(size, size), 0, 0);

		//Binary
		//threshold(tmp, imageSign, ui.HSBinaryKernel3->value(), 255, ui.HSBinaryElement3->value());
		CPreProcessing::toBinary(imageSign, 200, 0, 0, 0, 0);

		CPreProcessing::removeBlackBackground(imageSign);
		//Change angle
		//CPreProcessing::autoRotate(imageSign, 0);

		//Erode || Dilate
		//CPreProcessing::dilate(imageSign, ui.HSErodeElement3->value(), ui.HSErodeKernel3->value());
		image.release();
		this->image = imageSign.clone();
		imageSign.release();
	}

	vector<cv::Mat> findSign(cv::Mat image) {

		vector<cv::Mat> vImageSignCell;

		int LIMIT_VALUE_LIGHT_BIT = 170;
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
			sum = CPreProcessing::advCol(image, y, 5);

			if (LIMIT_VALUE_LIGHT_BIT <= sum) {

				if (cutStart == 0) fromCut = y;
				if (cutStart == 1 && cutEnd == 0) { toCut = y; cutEnd = 1; }
				if (cutStart == 1 && cutEnd == 1) {
					nImage++;
					if (nImage != 3) {
					tmp = image.clone();
					CPreProcessing::cutImage(tmp, fromCut, 0, tmp.cols - toCut, 0);
					CPreProcessing::cutImage(tmp, (tmp.cols / 2) - size, (tmp.rows / 2) - size, (tmp.cols / 2) - size, (tmp.rows / 2) - size);
					CPreProcessing::getCenterWeightImage(tmp);
					SegmentationMaxSize(tmp);
					szkielet(tmp);
					tmp = CPreProcessing::changeSize(tmp, 65, 65);
					CPreProcessing::getCenterWeightImage(tmp);
					
						vImageSignCell.push_back(tmp);
						string name = "digits\\" + itos(vImageSignCell.size()) + ".jpg";
						cv::imwrite(name, tmp);
					}
					imshow("Z", tmp);
					//	waitKey();
					tmp.release();

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

private:
#pragma region static methods

	static int sumRow(cv::Mat image, int row, int NUMBER_MARGIN_MISSTAKE) {

		int sum = 0;
		for (int y = row; y < image.rows && y < row + NUMBER_MARGIN_MISSTAKE; y++) {
			for (int x = 0; x < image.cols; x++) {
				sum += image.at<uchar>(y, x);
			}
		}
		return sum;
	}

	static int sumColumn(cv::Mat image, int col, int NUMBER_MARGIN_MISSTAKE) {

		int sum = 0;
		for (int x = col; x < image.cols && x < col + NUMBER_MARGIN_MISSTAKE; x++) {
			for (int y = 0; y < image.rows; y++) {
				sum += image.at<uchar>(y, x);
			}
		}
		return sum;
	}

	static double advRow(cv::Mat image, int row, int NUMBER_MARGIN_MISSTAKE) { return (sumRow(image, row, NUMBER_MARGIN_MISSTAKE) / (image.rows)); }

	static double advCol(cv::Mat image, int col, int NUMBER_MARGIN_MISSTAKE) { return (sumColumn(image, col, NUMBER_MARGIN_MISSTAKE) / (image.cols)); }

	static int getSkipLValue(cv::Mat image) {

		int skip = 0;
		int margin = 300;
		int result = 0;
		CPreProcessing::dilate(image, 2, 2);
		CPreProcessing::toBinary(image, 200, 0, 0, 0, 0);
		int sumControl = 0;
		for (int x = 20; x < image.cols / 2; x++) {
			sumControl = 0;
			for (int y = (image.rows / 2) - margin; y < (image.rows / 2) + margin; y++) {
				if (image.at<uchar>(y, x) > 0) sumControl++;
			}
			result = x;
			if (sumControl >(margin / 5)) { x = image.cols; }
		}

		for (int i = 1; i < 8 && result - i > 0; i++) result -= i;
		return result;
	}

	static int getSkipTValue(cv::Mat image) {

		int skip = 0;
		int margin = 300;
		int result = 0;
		CPreProcessing::dilate(image, 2, 2);
		CPreProcessing::toBinary(image, 200, 0, 0, 0, 0);
		int sumControl = 0;

		for (int y = 1; y < image.rows / 2; y++) {
			sumControl = 0;
			for (int x = (image.cols / 2) - margin; x < (image.cols / 2) + margin; x++) {
				if (image.at<uchar>(y, x) > 0) sumControl++;
			}
			result = y;
			if (sumControl >(margin / 5)) { y = image.cols; }
		}

		for (int i = 1; i < 8 && result - i > 0; i++) result -= i;
		return result;
	}

	static void rotate(cv::Mat& image, double angle) {

		cv::Mat tmp = image.clone();
		cv::Point2f src_center(image.cols / 2.0F, image.rows / 2.0F);
		cv::Mat rot_mat = getRotationMatrix2D(src_center, angle, 1.0);
		warpAffine(tmp, image, rot_mat, image.size());
	}

	static void changeContrasOrBrightness(cv::Mat& image, int alpha, int beta) {

		cv::Mat showImage = cv::Mat::zeros(image.size(), image.type());
		for (int y = 0; y < image.rows; y++) {
			for (int x = 0; x < image.cols; x++) {
				for (int c = 0; c < 3; c++) {
					image.at<cv::Vec3b>(y, x)[c] = cv::saturate_cast<uchar>(alpha*(image.at<cv::Vec3b>(y, x)[c]) + beta);
				}
			}
		}
	}

	static void dilate(cv::Mat& image, int type, int size) {

		cv::Mat element = cv::getStructuringElement(type, cv::Size(2 * size + 1, 2 * size + 1), cv::Point(size, size));
		cv::dilate(image.clone(), image, element);
	}

	static void erode(cv::Mat& image, int type, int size) {

		cv::Mat element = cv::getStructuringElement(type, cv::Size(2 * size + 1, 2 * size + 1), cv::Point(size, size));
		cv::erode(image.clone(), image, element);
	}

	static void cutImage(cv::Mat& image, int cutLeft = 20, int cutTop = 5, int cutRight = 2, int cutBottom = 5) {

		const int rows = image.rows;
		const int cols = image.cols;
		cutLeft		< 0 ? cutLeft = 0 : cutLeft = cutLeft;
		cutTop		< 0 ? cutTop = 0 : cutTop = cutTop;
		cutRight	< 0 ? cutRight = 0 : cutRight = cutRight;
		cutBottom	< 0 ? cutBottom = 0 : cutBottom = cutBottom;

		image = image(cv::Rect(cutLeft, cutTop, cols - cutLeft - cutRight, rows - cutTop - cutBottom));
	}


	static cv::Mat changeSize(cv::Mat image, int x, int y) {

		cv::Mat tmp = cv::Mat(y * 2, x * 2, 0);
		for (int i = 0; i < tmp.rows; i++) {
			for (int j = 0; j < tmp.cols; j++) {
				tmp.at<uchar>(i, j) = 0;
			}
		}

		for (int i = 0; i < image.rows; i++) {
			for (int j = 0; j < image.cols; j++) {
				tmp.at<uchar>(i, j) = image.at<uchar>(i, j);
			}
		}
		return tmp;
	}

	static void toBinary(cv::Mat& image, int margin, int skipL = 50, int skipT = 50, int skipR = 50, int skipB = 50) {

		int rows = image.rows;
		int cols = image.cols;
		for (int y = skipT; y < rows - skipB; y++) {
			for (int x = skipL; x < cols - skipR; x++) {
				if (image.at<uchar>(y, x) < margin)
					image.at<uchar>(y, x) = 255;
				else	image.at<uchar>(y, x) = 0;
				//cout << y << " " << x << endl;
			}
		}
	}

	static void removeBlackBackground(cv::Mat& image) {

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

	static void getCenterWeightImage(cv::Mat& image) {
		cv::Mat tmp = image.clone();
		int x = (image.cols / 2 - getXCenterWeight(image));
		int y = (image.rows / 2 - getYCenterWeight(image));

		cv::Mat trans_mat = (cv::Mat_<double>(2, 3) << 1, 0, x, 0, 1, y);
		warpAffine(tmp, image, trans_mat, tmp.size());
	}

	static double getXCenterWeight(cv::Mat& image) {

		cv::Moments m = moments(image);
		return m.m10 / m.m00;
	}

	static double getYCenterWeight(cv::Mat& image) {

		cv::Moments m = moments(image);
		return m.m01 / m.m00;
	}

	static void autoRotate(cv::Mat& image, int skip) {

		cv::Mat tmp = image.clone();
		cv::Mat tmpC;
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
		image.release();
		image = tmpC.clone();
		tmpC.release();
	}

#pragma endregion

public:
	cv::Mat getImage() { return image; }
};

