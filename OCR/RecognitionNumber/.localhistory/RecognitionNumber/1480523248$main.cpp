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

	vector<string> images = CWindows::getListFileFrom("digits\\");
	vector<Mat> tmp;
	vector<Mat> result;

	CPreProcessing* pp;
	Mat image;
	for each(string var in images) {
		image = imread("digits\\" + var); 
		
		pp = new CPreProcessing(image);
		
		pp->preProcessing(image);

		imshow("preProcessing", image);
		waitKey();

		tmp = pp->findSign(pp->getImage());
		for each(Mat varr in tmp) {
			result.push_back(varr.clone());
			imshow("Z", varr);
			waitKey();
		}
	}

	CRecognition* r = new CRecognition(result);
	r->createFileOfMoments();
}