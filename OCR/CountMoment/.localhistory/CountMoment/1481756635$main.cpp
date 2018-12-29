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

	//vector<string> images = CWindows::getListFileFrom("digits\\");
	vector<cv::Mat> tmp;
	vector<cv::Mat> result;

	CPreProcessing* pp;
	CRecognition* r;
	cv::Mat image;

	for (int i = 1; i < argc; i++) {
		cout << string(argv[i]) << endl;
		image = cv::imread(string(argv[i]), 0);
		if (image.empty()) {
			cout << "ERROR!!! Zla sciezka do pliku !!!ERROR\n";
			cin >> argc;
			return 1;
		}
		cout << "ZXC";
		pp = new CPreProcessing(image);
		cout << "ZXC";
		pp->preProcessing(image);
		cout << "ZXC";

		tmp = pp->findSign(pp->getImage());
		cout << "ZXC";
		result.clear();
		cout << "ZXC";
		for each(cv::Mat varr in tmp) 
			result.push_back(varr.clone());

		cout << "ZXC";
		r = new CRecognition(result);

		cout << "ZXC";
		r->createFileOfMoments(string(argv[i]));

		cout << "ZXC";
	}
}