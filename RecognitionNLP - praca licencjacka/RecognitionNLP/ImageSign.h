#pragma once

/* library C++ */
#include <string>

using namespace std;

/* library OpenCV */
#include "opencv2\opencv.hpp"

using namespace cv;


class CImageSign{

	Mat		image;
	string	sign;

public:

	CImageSign(Mat image, string sign):image(image), sign(sign) {}
	~CImageSign() { image.release(); }

	Mat getImage() { return image; }
	string getSign() { return sign; }
};

