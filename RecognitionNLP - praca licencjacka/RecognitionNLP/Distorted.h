#pragma once

/* library C++ */
#include <vector>
#include <string>
#include <cstdarg>

using namespace std;

/* library OpenCV */
#include "opencv2\opencv.hpp"

using namespace cv;

enum Distortion {
	CONTRAST, BLUR, GAUSSIAN_BLUR, MEDIAN_BLUR, BILATERAL_FILTER, ERODE, DILATE, ZOOM, FILTR_TWO_D, AFFINE_TRANSFORMATIONS
};

class CDistorted{

	vector<int>	vDistorted;
	vector<int>	vDistortedValue;
	vector<int> vDistortedMissValue;
	
	Mat			orginalImg;
	Mat			distortedImg;


public:

	CDistorted() {}
	~CDistorted() { clearAll(); orginalImg.release(); distortedImg.release(); }

	void changeImage(Mat img) {

		orginalImg.release();
		distortedImg.release();

		orginalImg			= img.clone();
		distortedImg		= img.clone();
	}

	void resetImage() {

		changeImage(orginalImg);
	}

	void addDistortion(int distortion, vector<int> vDistortedValue, vector<int> vDistortedMissValue) {

		this->vDistorted.push_back(distortion);

		for (int i = 0; i < vDistortedValue.size(); i++)
			this->vDistortedValue.push_back(vDistortedValue[i]);

		for (int i = 0; i < vDistortedMissValue.size(); i++)
			this->vDistortedMissValue.push_back(vDistortedMissValue[i]);

		int h = 0;
		noisingFlag(distortedImg, distortion, vDistortedValue, vDistortedMissValue, h);
	}

	void clearAll() {

		vDistorted.clear();
		vDistortedValue.clear();
		vDistortedMissValue.clear();

		distortedImg = orginalImg.clone();
	}

	Mat getImage() { return distortedImg; }

	Mat getOrginalImg() { return orginalImg; }

	void distortingImg(Mat& image) {

		int position = 0;
		for (int i = 0; i < vDistorted.size(); i++) 
			noisingFlag(image, vDistorted[i], vDistortedValue, vDistortedMissValue, position);
		
	}

	Mat distortingImgage(Mat& image) {

		distortingImg(image);
		return image;
	}

#pragma region

	static void removeBackground(Mat& image) {


		int rows = image.rows;
		int cols = image.cols-1;
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
private:
	static void noiseContrast(Mat& image, int p1, int p2, int m1, int m2) {

		int alpha, beta, rand1, rand2;

		if (m1 == 0)
			rand1 = 0;
		else
			rand1 = rand() % m1;
		if (m2 == 0)
			rand2 = 0;
		else
			rand2 = rand() % m2;

		int plusMinus = rand() % 2;

		if (plusMinus) {
			alpha = p1 + rand1;
			beta = p2 + rand2;
		}
		else {
			alpha = p1 - rand1;
			beta = p2 - rand2;
		}

		if (beta < 0)
			beta = 0;
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

	static void noiseBlur(Mat& image, int p1, int m1) {

		int size, rand1;

		if (m1 == 0)
			rand1 = 0;
		else
			rand1 = rand() % m1;

		int plusMinus = rand() % 2;

		if (plusMinus) {
			size = p1 + rand1;
		}
		else {
			size = p1 - rand1;
		}

		if (size < 1)
			size = 1;
		if (size > 100)
			size = 100;

		blur(image, image, Size(size, size), Point(-1, -1));
	}

	static void noiseGaussianBlur(Mat& image, int p1, int m1) {

		int size, rand1;

		if (m1 == 0)
			rand1 = 0;
		else
			rand1 = rand() % m1;

		int plusMinus = rand() % 2;

		if (plusMinus) {
			size = p1 + rand1;
		}
		else {
			size = p1 - rand1;
		}

		if (size % 2 == 0)size++;

		if (size < 1)
			size = 1;
		if (size > 31)
			size = 31;


		GaussianBlur(image, image, Size(size, size), 0, 0);
	}

	static void noiseMedianBlur(Mat& image, int p1, int m1) {

		int size, rand1;

		if (m1 == 0)
			rand1 = 0;
		else
			rand1 = rand() % m1;

		int plusMinus = rand() % 2;

		if (plusMinus) {
			size = p1 + rand1;
		}
		else {
			size = p1 - rand1;
		}

		if (size < 1)
			size = 1;
		if (size > 100)
			size = 100;

		int i = size;
		if (i % 2 != 1) i++;
		medianBlur(image, image, i);
	}

	static void noiseBilateralFilter(Mat& image, int p1, int m1) {

		int size, rand1;

		if (m1 == 0)
			rand1 = 0;
		else
			rand1 = rand() % m1;

		int plusMinus = rand() % 2;

		if (plusMinus) {
			size = p1 + rand1;
		}
		else {
			size = p1 - rand1;
		}
		if (size % 2 == 0)size++;
		if (size < 1)
			size = 3;
		if (size > 31)
			size = 31;

		Mat im = image.clone();
		bilateralFilter(im, image, size, size * 2, size / 2);
	}

	static void noiseErode(Mat& image, int p1, int p2, int m1, int m2) {

		int x, operation, rand1, rand2;

		if (m1 == 0)
			rand1 = 0;
		else
			rand1 = rand() % m1;
		if (m2 == 0)
			rand2 = 0;
		else
			rand2 = rand() % m2;

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

		Mat element = getStructuringElement(operation, cv::Size(x  + 1, x + 1), cv::Point(x, x));
		erode(image, image, element);
	}

	static void noiseDilate(Mat& image, int p1, int p2, int m1, int m2) {

		int x, operation;
		int rand1, rand2;

		if (m1 == 0)
			rand1 = 0;
		else
			rand1 = rand() % m1;
		if (m2 == 0)
			rand2 = 0;
		else
			rand2 = rand() % m2;

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

		if (x < 1)
			x = 1;
		if (x > 3)
			x = 3;

		Mat element = getStructuringElement(operation, cv::Size(2 * x + 1, 2 * x + 1), cv::Point(x, x));
		dilate(image, image, element);
	}

	static void noiseZoom(Mat& image) {

		pyrUp(image, image, Size(image.cols * 2, image.rows * 2));
		pyrDown(image, image, Size(image.cols / 2, image.rows / 2));
	}

	static void noiseFiltrTwoD(Mat& image, int p1, int m1) {

		int size;
		int rand1;

		if (m1 == 0)
			rand1 = 0;
		else
			rand1 = rand() % m1;

		int plusMinus = rand() % 2;

		if (plusMinus) {
			size = p1 + rand1;
		}
		else {
			size = p1 - rand1;
		}

		if (size < 1)
			size = 1;
		if (size > 100)
			size = 100;

		int kernelSize = size;
		filter2D(image, image, -1, Mat::ones(kernelSize, kernelSize, CV_32F) / (float)(kernelSize * kernelSize), Point(-1, -1), 0, BORDER_DEFAULT);
	}
	public:
	static void noiseAffineTransformations(Mat& image, int p1, int p2, int p3, int p4, int p5, int p6, int m1, int m2, int m3, int m4, int m5, int m6) {

		double t[6], tm[6];
		if (m1 != 0)
			t[0] = (p1 + rand() % m1);
		else
			t[0] = p1;
		if (m2 != 0)
			t[1] = (p2 + rand() % m2);
		else
			t[1] = p2;
		if (m3 != 0)
			t[2] = (p3 + rand() % m3);
		else
			t[2] = p3;
		if (m4 != 0)
			t[3] = (p4 + rand() % m4);
		else
			t[3] = p4;
		if (m5 != 0)
			t[4] = (p5 + rand() % m5);
		else
			t[4] = p5;
		if (m6 != 0)
			t[5] = (p6 + rand() % m6);
		else
			t[5] = p6;

		for (int i = 0; i < 6; i++) {
			if (t[i] > 100)
				t[i] = 100;
			if (t[i] < 0)
				t[i] = 0;
			else
				t[i] /= 100;
		}

		Point2f srcTri[3];
		Point2f dstTri[3];

		Mat rot_mat(2, 3, CV_32FC1);
		Mat warp_mat(2, 3, CV_32FC1);
		Mat src, warp_dst, warp_rotate_dst;

		src = image;
		warp_dst = Mat::zeros(image.rows, image.cols, image.type());

		srcTri[0] = Point2f(0, 0);
		srcTri[1] = Point2f(image.cols - 1, 0);
		srcTri[2] = Point2f(0, image.rows - 1);


		dstTri[0] = Point2f(src.cols *  t[0], src.rows * t[1]);
		dstTri[1] = Point2f(src.cols*(1 - t[2]), src.rows*t[3]);
		dstTri[2] = Point2f(src.cols*t[4], src.rows*(1 - t[5]));


		warp_mat = getAffineTransform(srcTri, dstTri);
		warpAffine(image, warp_dst, warp_mat, warp_dst.size());
		Point center = Point(warp_dst.cols / 2, warp_dst.rows / 2);


		image = warp_dst;
	}

public:
	static void noisingFlag(Mat& image, int noising, vector<int> parametrs, vector<int> misstake, int& position) {
		/*
		Contrast
		Blur
		GaussianBlur
		MedianBlur
		BilateralFilter
		Erode
		Dilate
		Zoom
		FiltrTwoD
		AffineTransformations
		*/
		if(!image.empty()){
			switch (noising) {

			case 0:
				noiseContrast(image, parametrs[0], parametrs[1], misstake[0], misstake[1]);
				position += 2;
				break;
			case 1:
				noiseBlur(image, parametrs[0], misstake[0]);
				position += 1;
				break;
			case 2:
				noiseGaussianBlur(image, parametrs[0], misstake[0]);
				position += 1;
				break;
			case 3:
				noiseMedianBlur(image, parametrs[0], misstake[0]);
				position += 1;
				break;
			case 4:
				noiseBilateralFilter(image, parametrs[0], misstake[0]);
				position += 1;
				break;
			case 5:
				noiseErode(image, parametrs[0], parametrs[1], misstake[0], misstake[1]);
				position += 2;
				break;
			case 6:
				noiseDilate(image, parametrs[0], parametrs[1], misstake[0], misstake[1]);
				position += 2;
				break;
			case 7:
				noiseZoom(image);
				break;
			case 8:
				noiseFiltrTwoD(image, parametrs[0], misstake[0]);
				position += 1;
				break;
			case 9:
				noiseAffineTransformations(image, parametrs[0], parametrs[1], parametrs[2], parametrs[3], parametrs[4], parametrs[5], misstake[0], misstake[1], misstake[2], misstake[3], misstake[4], misstake[5]);
				position += 6;
				break;

			default:
				break;
			}
		}
	}

	static void noising(Mat& image, int noising, vector<int> parametrs, vector<int> misstake) {
		int i = 0;
		noisingFlag(image, noising, parametrs, misstake, i);
	}
#pragma endregion It is methods to noise a image
};

