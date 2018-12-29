#pragma once
/* out classes */
#include <BasicInformations.h>

/* library C++ */
#include <vector>

using namespace std;

/* library OpenCV */
#include "opencv2\opencv.hpp"

using namespace cv;


class CPreProcessing : public CBasicInformations{

public:
	CPreProcessing() {}
	~CPreProcessing() {}

#pragma region

	static void introductoryProcessing(Mat& image, vector<int> parameters) {

		erode(image, parameters[0], parameters[1]);
		imshow("erode:", image);
		contrast(image, parameters[2], parameters[3]);
		imshow("contrast:", image);

		threshold(image, image, parameters[4], 255, 3);
		blackAndWhite(image, parameters[4]);
		//convertRGBToHSV(image, 1);
		//imshow("convertRGBToHSV:", image);

		//Mat element = getStructuringElement(1, cv::Size(2 + 1, 2 + 1), cv::Point(2, 2));
		//dilate(image, image, element);
		imshow("threshold:", image);

		cutImage(image, parameters[5], parameters[6], parameters[7], parameters[8]);
		imshow("cutImage:", image);
		negative(image, parameters[9]);
		imshow("negative:", image);
		removeBackground(image);

	}

	static void BrightnessAndContrastAuto(Mat &src, cv::Mat &dst, float clipHistPercent = 0){

		CV_Assert(clipHistPercent >= 0);
		CV_Assert((src.type() == CV_8UC1) || (src.type() == CV_8UC3) || (src.type() == CV_8UC4));

		int histSize = 256;
		float alpha, beta;
		double minGray = 0, maxGray = 0;

		//to calculate grayscale histogram
		cv::Mat gray;
		if (src.type() == CV_8UC1) gray = src;
		else if (src.type() == CV_8UC3) cvtColor(src, gray, CV_BGR2GRAY);
		else if (src.type() == CV_8UC4) cvtColor(src, gray, CV_BGRA2GRAY);
		if (clipHistPercent == 0)
		{
			// keep full available range
			cv::minMaxLoc(gray, &minGray, &maxGray);
		}
		else
		{
			cv::Mat hist; //the grayscale histogram

			float range[] = { 0, 256 };
			const float* histRange = { range };
			bool uniform = true;
			bool accumulate = false;
			calcHist(&gray, 1, 0, cv::Mat(), hist, 1, &histSize, &histRange, uniform, accumulate);

			// calculate cumulative distribution from the histogram
			std::vector<float> accumulator(histSize);
			accumulator[0] = hist.at<float>(0);
			for (int i = 1; i < histSize; i++)
			{
				accumulator[i] = accumulator[i - 1] + hist.at<float>(i);
			}

			// locate points that cuts at required value
			float max = accumulator.back();
			clipHistPercent *= (max / 100.0); //make percent as absolute
			clipHistPercent /= 2.0; // left and right wings
									// locate left cut
			minGray = 0;
			while (accumulator[minGray] < clipHistPercent)
				minGray++;

			// locate right cut
			maxGray = histSize - 1;
			while (accumulator[maxGray] >= (max - clipHistPercent))
				maxGray--;
		}

		// current range
		float inputRange = maxGray - minGray;

		alpha = (histSize - 1) / inputRange;   // alpha expands current range to histsize range
		beta = -minGray * alpha;             // beta shifts current range so that minGray will go to 0

											 // Apply brightness and contrast normalization
											 // convertTo operates with saurate_cast
		src.convertTo(dst, -1, alpha, beta);

		// restore alpha channel from source 
		if (dst.type() == CV_8UC4)
		{
			int from_to[] = { 3, 3 };
			cv::mixChannels(&src, 4, &dst, 1, from_to, 1);
		}
		imshow("D", dst);
		imshow("I", src);

		return;
	}

	static void contrast(Mat& image, int p1, int p2) {
		
		int alpha = p1, beta = p2;

		if (p1 != 0 && p2 != 0) {
			if (beta < 1)
				beta = 1;
			if (beta > 100)
				beta = 100;

			if (alpha < 1)
				alpha = 1;
			if (alpha > 3)
				alpha = 3;

			for (int y = 0; y < image.rows; y++) {
				for (int x = 0; x < image.cols; x++) {
					for (int c = 0; c < 3; c++) {
						image.at<Vec3b>(y, x)[c] = saturate_cast<uchar>(alpha*(image.at<Vec3b>(y, x)[c]) + beta);
					}
				}
			}
		}
	}

	static void erode(Mat& image, int p1, int p2) {

		int x, operation;
		int rand1 = 0, rand2 = 0;
		if (p1 != 0) {

			int plusMinus = rand() % 2;

			if (plusMinus) {
				x = p1 + rand1;
				operation = p2 + rand2;
			}
			else {
				x = p1 - rand1;
				operation = p2 - rand2;
			}

			if (operation < 1)
				operation = 1;
			if (operation > 100)
				operation = 100;

			if (x < 0)
				x = 0;
			if (x > 2)
				x = 2;

			Mat element = getStructuringElement(operation, cv::Size(x * 2 + 1, x * 2 + 1), cv::Point(x, x));
			cv::erode(image, image, element);
		}
	}

	static void convertRGBToHSV(Mat& image, int parameters) {

		if (parameters == 1)
			cvtColor(image, image, CV_BGR2HSV);

	}

	static void blackAndWhite(Mat& image, int parameters) {

		int rows = image.rows;
		int cols = image.cols;
		int sum = 0;

		for (int x = 0; x < cols; x++) {
			for (int y = 0; y < rows; y++) {
				sum = 0;

				for (int c = 0; c < 3; c++)
					sum += saturate_cast<uchar>(image.at<Vec3b>(y, x)[c]);

				if (parameters < sum)
					//image.at<uchar>(y, x) = 255;
					image.at<Vec3b>(y, x)[0] = image.at<Vec3b>(y, x)[1] = image.at<Vec3b>(y, x)[2] = 255;
				else
					//image.at<uchar>(y, x) = 0;
					image.at<Vec3b>(y, x)[0] = image.at<Vec3b>(y, x)[1] = image.at<Vec3b>(y, x)[2] = 0;
			}
		}


		cvtColor(image, image, CV_RGB2GRAY);
	}

	static void cutImage(Mat& image, const int cutLeft = 20, const int cutTop = 5, const int cutRight = 2, const int cutBottom = 5) {

		const int rows = image.rows;
		const int cols = image.cols;

		image = image(Rect(cutLeft, cutTop, cols - cutLeft - cutRight, rows - cutTop - cutBottom));

	}

	static void negative(Mat& image, int parameters) {

		if (parameters == 1) {
			int rows = image.rows;
			int cols = image.cols;
			int suma = 0;

			for (int x = 0; x < cols; x++) {
				for (int y = 0; y < rows; y++) {
					image.at<uchar>(y, x) = 255 - image.at<uchar>(y, x);
				}
			}
		}
	}

	static void removeBackground(Mat& image) {


		int rows = image.rows;
		int cols = image.cols - 1;
		bool out = false;

		for (int y = 0; y < rows; y++) {

			out = false;
			for (int x = 0; x < cols; x++) {

				if (out == true)
					break;

				if (image.at<uchar>(y, x) > 0 || x < 4) {
					image.at<uchar>(y, x) = 0;
				}
				else { out = true; }
			}

			out = false;
			for (int x = cols; x >= 0; x--) {

				if (out == true)
					break;

				if (image.at<uchar>(y, x) > 0 || x > cols - 4) {
					image.at<uchar>(y, x) = 0;
				}
				else { out = true; }
			}
		}
	}

	/* remove color */
	/*
	Mat channels[4];
	split(image, channels);

	Scalar min_color(0, 0, 0);
	Scalar max_color(255, 255, 0);
	inRange(image, min_color, max_color, channels[3]);
	merge(channels, 4, image);
	*/

	/* darknes image */
	/*
	image = image + Scalar(beta, beta, beta);
	*/


#pragma endregion It is methods intro processing

};

