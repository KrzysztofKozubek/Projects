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
#include "Recognition.h"
#include "PreProcessing.h"

using namespace cv;
using namespace std;

int main() {
	double alpha = 0.5; double beta; double input;
	Mat src1, src2, dst;
	std::cout << " Simple Linear Blender " << std::endl;
	std::cout << "-----------------------" << std::endl;
	std::cout << "* Enter alpha [0-1]: ";
	input = 0;
	// We use the alpha provided by the user if it is between 0 and 1
	if (alpha >= 0 && alpha <= 1)
	{
		alpha = input;
	}
	src1 = imread("34-352.jpeg", 0);
	src2 = imread("34.jpeg", 0);
	if (src1.empty()) { std::cout << "Error loading src1" << std::endl; return -1; }
	if (src2.empty()) { std::cout << "Error loading src2" << std::endl; return -1; }
	beta = (1.0 - alpha);
	addWeighted(src1, alpha, src2, beta, 0.0, dst);
	imshow("Linear Blend", dst);
	waitKey(0);




	Mat image = imread("34-352.jpeg", 0);
	imshow("Z", image);
	waitKey();
	string pathToImage = "";
	//cin >> pathToImage;
	CPreProcessing* pp = new CPreProcessing(image);
	pp->preProcessing(image);
	vector<Mat> ims = pp->findSign(pp->getImage());
	for (int i = 0; i < ims.size(); i++) {
		imshow("Z", ims[i]);
		waitKey();
	}

	CRecognition* r = new CRecognition(ims);
	r->createFileOfMoments();
}