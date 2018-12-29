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

int main1(int argc, char* argv[]) {

	string nameFileResult = "result.txt";
	string path = "digits";
	if (path[path.length() - 2] != '\\') path = path += '\\';
	if (path[path.length() - 2] != '\\') path = path += '\\';
	

	vector<string> images = CWindows::getListFileFrom(path);
	vector<Mat> tmp;
	vector<Mat> result;

	CPreProcessing* pp;
	Mat image;
	for each(string var in images) {
		cout << var << endl;
		clear();
		result.clear();
		image = imread(path + var, 0);
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
				pp = new CPreProcessing(image);
				pp->preProcessingB(image);
				tmp = pp->findSignB(pp->getImage());

				for each(Mat varr in tmp) {
					result.push_back(varr.clone());
				}
			}
		}
		CWindows::cmdRun("echo " + var.substr(0, var.length()-4) + " " + CRecognition::recognition(result) + " >> " + nameFileResult);
	}
}