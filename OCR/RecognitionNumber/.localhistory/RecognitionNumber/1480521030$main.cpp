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
#include "Windows.h"

using namespace cv;
using namespace std;

int main() {

	Mat image = imread("34-352.jpeg", 0);
	imshow("Z", image);
	//waitKey();
	string pathToImage = "";
	//cin >> pathToImage;

	vector<string> images = CWindows::getListFileFrom("digits\\");

	CPreProcessing* pp;
	for each(string var in images) {
		pp = new CPreProcessing(imread(var));
		pp->preProcessing(imread(var));
	}


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