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
	
	Mat image = imread("1.png", 0);
	imshow("Z", image);
	waitKey();
	string pathToImage = "";
	//cin >> pathToImage;
	CPreProcessing* pp = new CPreProcessing(image);
	pp->preProcessing(image);
	vector<Mat> ims = pp->findSign(pp->getImage());
	

}