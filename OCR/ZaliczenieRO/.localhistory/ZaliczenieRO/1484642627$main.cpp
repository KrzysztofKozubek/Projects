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
#include "Windows.h"
#include "PreProcessing.h"

using namespace cv;
using namespace std;

void clear() {

	CWindows::cmdRun("del Kozubek\\NVF_Test.txt");
	CWindows::cmdRun("del Kozubek\\libsvm\\tmp.txt");
	CWindows::cmdRun("del Kozubek\\result.txt");
}

int main(int argc, char* argv[]) {

	clear();
	vector<string> images = CWindows::getListFileFrom("digits\\");
	vector<Mat> tmp;
	vector<Mat> result;

	CPreProcessing* pp;
	CRecognition * reco = new CRecognition();
	Mat image;
	for each(string var in images) {
		image = imread("digits\\" + var, 0);
		if (var[0] == 'a') {
			pp = new CPreProcessing(image);
			pp->preProcessing(image);
			tmp = pp->findSign(pp->getImage());
			for each(Mat varr in tmp) {
				result.push_back(varr.clone());
			}
		}
		else {
			if (var[0] == 'b') {

			}
		}
		for each(Mat var in result)
			CRecognition::recognition(var);
	}
}