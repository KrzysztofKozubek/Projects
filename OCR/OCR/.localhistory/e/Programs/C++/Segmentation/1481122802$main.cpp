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
#include "PreProcessing.h"
#include "Recognition.h"

using namespace std;

int main(int argc, char ** argv) {

	vector<string> images = CWindows::getListFileFrom("digits\\");
	vector<Mat> tmp;
	vector<Mat> result;

	CPreProcessing* pp;
	CRecognition* r;
	Mat image;

	for (int i = 0; i < argc; i++) {
		image = imread(string(argv[i]));
		if (image.empty()) {
			cout << "ERROR!!! Zla sciezka do pliku !!!ERROR\n";
			cin >> argc;
			return 1;
		}

		pp = new CPreProcessing(image);
		pp->preProcessing(image);

		tmp = pp->findSign(pp->getImage());
		result.clear();
		for each(Mat varr in tmp) 
			result.push_back(varr.clone());

		r = new CRecognition(result);
		r->createFileOfMoments(string(argv[i]));
	}
}