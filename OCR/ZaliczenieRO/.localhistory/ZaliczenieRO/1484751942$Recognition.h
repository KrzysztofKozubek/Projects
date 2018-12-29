#pragma once

/* library OpenCV */
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>

/* library VS */
#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <stdio.h>
#include <vector>
#include <string>
#include <vector>

/* My Class */
#include "Windows.h";

using namespace cv;
using namespace std;

inline string itos(double dbl) {
	std::ostringstream strs;
	strs << dbl;
	std::string str = strs.str();

	return str;
}

class CRecognition {

	Mat image;
	vector<Mat> images;

public:

	CRecognition(Mat image) : image(image) {};
	CRecognition(vector<Mat> images) : images(images) {};
	~CRecognition() { image.release(); for (int i = 0; i < images.size(); i++) images[i].release(); images.clear(); };

	static void addToFileMoments(string file, vector<Mat> image) {

		vector<string> labels = CWindows::getListFileFrom("digits\\");

		int*	label = new int[labels.size() * 5];
		float** data = new float*[image.size()];

		int c = 0;
		for (int i = 0; i < labels.size(); i++) {
			for (int j = 1; j < 6; j++) {
				//label[c] = sToi(labels[i].substr(j, 1));
				//cout << label[c] << endl;
				c++;
			}
		}
		for (int i = 0; i < image.size(); i++) data[i] = countMoment(image[i]);
		for (int i = 0; i < image.size(); i++) imwrite("digit\\" + itos(label[i]) + "_" + itos(i) + ".jpg", image[i]);

		CWindows::saveVectorToFile(label, data, "SCRIPTS//Classifier//NVF_Training.txt", image.size(), 1);
		//GenerationSkryptLibsvm();
	}

	void createFileOfMoments() {

		vector<string> labels = CWindows::getListFileFrom("digits\\");

		int*	label = new int[labels.size() * 5];
		float** data = new float*[images.size()];

		int c = 0;
		for (int i = 0; i < labels.size(); i++) {
			for (int j = 1; j < 6; j++) {
				label[c] = sToi(labels[i].substr(j, 1));
				//cout << label[c] << endl;
				c++;
			}
		}
		for (int i = 0; i < images.size(); i++) data[i] = countMoment(images[i]);
		for (int i = 0; i < images.size(); i++) imwrite("digit\\" + itos(label[i]) + "_" + itos(i) + ".jpg", images[i]);

		CWindows::saveVectorToFile(label, data, "SCRIPTS//Classifier//NVF_Training.txt", images.size(), 1);
		GenerationSkryptLibsvm();
	}

	string recognition(string nameFile, string outputFile) {

		int*	label	= new int[images.size()];
		float** data	= new float*[images.size()];

		for (int i = 0; i < images.size(); i++)		label[i]	= 0;
		for (int i = 0; i < images.size(); i++)		data[i]		= countMoment(images[i]);

		CWindows::saveVectorToFile(label, data, "Kozubek\\NVF_Test.txt", images.size(), 1);
		
		//CWindows::cmdRun("Kozubek\\libsvm\\predict.exe Kozubek\\NVF_Test.txt Kozubek\\libsvm\\model.model " + outputFile);
	}

	static string recognition(vector<Mat> image) {

		string result	= "Kozubek\\result.txt";
		int*	label	= new int[image.size()];
		float** data	= new float*[image.size()];

		for (int i = 0; i < image.size(); i++)		label[i]	= 0;
		for (int i = 0; i < image.size(); i++)		data[i]		= countMoment(image[i]);

		CWindows::saveVectorToFile(label, data, "Kozubek\\NVF_Test.txt", image.size(), 1);
		CWindows::cmdRun("Kozubek\\libsvm\\predict.exe Kozubek\\NVF_Test.txt Kozubek\\libsvm\\Model_RBF " + result);

		ifstream infile(result);
		vector<int> vResult;
		int a;
		while (infile >> a) vResult.push_back(a-1);
		
		result = "";
		string tmp;
		a = 0;
		char* charResult = new char[vResult.size() + 1];
		for (int i = 0, j = 0; i < vResult.size()+1; i++) {
			if (i != 2){
				charResult[i] = vResult[j]+48; j++;
			}else
				charResult[i] = '-';
		}
		string res(charResult);
		return res;
	}

private:

	int sToi(string s) {
		int i;
		istringstream iss(s);
		iss >> i;
		//cout << s << "->" << i << endl;
		return i;
	}

	static string itos(double dbl) {
		std::ostringstream strs;
		strs << dbl;
		std::string str = strs.str();

		return str;
	}

	void GenerationSkryptLibsvm() {

		/* Path to main dictionary */
		const string PATH_SCRIPTS = "SCRIPTS\\";
		const string PATH_SET = "SET\\";
		const string PATH_ALL_PLATE = PATH_SET + "NLP\\";
		const string PATH_CAM_PLATE = PATH_SET + "NLP_Camera\\";

		/* Path to dictionary libsvm */
		const string PATH_LIBSVM = PATH_SCRIPTS + "libsvm\\";
		const string PATH_CLASSIFIER = PATH_SCRIPTS + "Classifier\\";

		/* Path to dictionary training data */
		const string PATH_TRAINING = PATH_SET + "Training\\";

		/* Path to dictionary test data */
		const string PATH_SET_ONE = PATH_SET + "Test_I\\";
		const string PATH_SET_TWO = PATH_SET + "Test_II\\";

		/* FILE TO SAVE ANSWER CLASSIFIER */
		const string RESULT_FILE = PATH_CLASSIFIER + "Result.txt";

		/* PATH FILE TO TRAINING AND CALASSIFICATION */
		const string PATH_VF_TRAINING = PATH_CLASSIFIER + "VF_Training.txt";
		const string PATH_VF_TEST_I = PATH_CLASSIFIER + "VF_Test_I.txt";
		const string PATH_VF_TEST_II = PATH_CLASSIFIER + "VF_Test_II.txt";
		const string PATH_NVF_TRAINING = PATH_CLASSIFIER + "NVF_Training.txt";
		const string PATH_NVF_TEST_I = PATH_CLASSIFIER + "NVF_Test_I.txt";
		const string PATH_NVF_TEST_II = PATH_CLASSIFIER + "NVF_Test_II.txt";

		/* NAME NEED FILE TO TRAINING AND CALASSIFICATION */
		const string VF_TRAINING = "VF_Training.txt";
		const string VF_TEST_I = "VF_Test_I.txt";
		const string VF_TEST_II = "VF_Test_II.txt";
		const string NVF_TRAINING = "NVF_Training.txt";
		const string NVF_TEST_I = "NVF_Test_I.txt";
		const string NVF_TEST_II = "NVF_Test_II.txt";

		/* PATH MODEL FILE TO PREDICT */
		const string PATH_MODEL_LINEAR = PATH_CLASSIFIER + "Model_Linear.model";
		const string PATH_MODEL_RBF = PATH_CLASSIFIER + "Model_RBF";

		/* MODEL FILE TO PREDICT */
		const string MODEL_LINEAR = "Model_Linear.model";
		const string MODEL_RBF = "Model_RBF";

		/* Name skripts to find best parameters (grid search) */
		const string GS_LINEAR = PATH_SCRIPTS + "GS_Linear.bat";
		const string GS_RBF = PATH_SCRIPTS + "GS_RBF.bat";

		/* CREAETE GRID SEARCH */

		//Linear
		CWindows::createFile(GS_LINEAR);
		CWindows::insertToFile(GS_LINEAR, "@echo OFF");
		CWindows::insertToFile(GS_LINEAR, "SET \"svm=0\"");
		CWindows::insertToFile(GS_LINEAR, "SET \"kernel=0\"");
		for (int c = 1; c < 10000; c *= 2) {
			CWindows::insertToFile(GS_LINEAR, "..\\" + PATH_LIBSVM + "svm-train.exe -s %svm% -t %kernel% -c " + itos(c) + " -q ..\\" + PATH_NVF_TRAINING + " ..\\" + PATH_MODEL_LINEAR);
			//CWindows::insertToFile(GS_LINEAR, "..\\" + PATH_LIBSVM + "svm-train.exe -s %svm% -t %kernel% -c " + itos(c) + " -v 5 -q ..\\" + PATH_NVF_TRAINING + " ..\\" + PATH_MODEL_LINEAR + " >> LinearResult.txt");
			CWindows::insertToFile(GS_LINEAR, "echo Kernel = Linear, Test = I, C = " + itos(c) + ": >> LinearResult.txt");
			CWindows::insertToFile(GS_LINEAR, "..\\" + PATH_LIBSVM + "svm-predict.exe ..\\" + PATH_NVF_TEST_I + " ..\\" + PATH_MODEL_LINEAR + " ..\\" + RESULT_FILE + " >> LinearResult.txt");
		}

		//RBF
		CWindows::createFile(GS_RBF);
		CWindows::insertToFile(GS_RBF, "@echo OFF");
		CWindows::insertToFile(GS_RBF, "SET \"svm=0\"");
		CWindows::insertToFile(GS_RBF, "SET \"kernel=2\"");
		for (int c = 1; c < 10000; c *= 2) {
			for (double g = 0.001953125; g < 10; g *= 2) {
				CWindows::insertToFile(GS_RBF, "..\\" + PATH_LIBSVM + "svm-train.exe -s %svm% -t %kernel% -c " + itos(c) + " -g " + itos(g) + " -q ..\\" + PATH_NVF_TRAINING + " ..\\" + PATH_MODEL_RBF);
				CWindows::insertToFile(GS_RBF, "..\\" + PATH_LIBSVM + "svm-train.exe -s %svm% -t %kernel% -c " + itos(c) + " -g " + itos(g) + " -v 5 -q ..\\" + PATH_NVF_TRAINING + " ..\\" + PATH_MODEL_RBF + " >>RBFResult.txt");
				CWindows::insertToFile(GS_RBF, "echo Kernel = RBF, Test = I, C = " + itos(c) + ", g = " + itos(g) + ": >> RBFResult.txt");
				CWindows::insertToFile(GS_RBF, "..\\" + PATH_LIBSVM + "svm-predict.exe ..\\" + PATH_NVF_TEST_I + " ..\\" + PATH_MODEL_RBF + " ..\\" + RESULT_FILE + " >> RBFResult.txt");
			}
		}

		/* END CREAETE GRID SEARCH */
	}

	static float* countMoment(Mat image) {

		float* trainingData = new float[31];
		double hu[7];
		int i = 0;
		Moments m = moments(image);
		HuMoments(m, hu);

		trainingData[i] = m.m00; i++;
		trainingData[i] = m.m10; i++;
		trainingData[i] = m.m01; i++;
		trainingData[i] = m.m20; i++;
		trainingData[i] = m.m11; i++;
		trainingData[i] = m.m02; i++;
		trainingData[i] = m.m30; i++;
		trainingData[i] = m.m21; i++;
		trainingData[i] = m.m12; i++;
		trainingData[i] = m.m03; i++;

		trainingData[i] = m.mu20; i++;
		trainingData[i] = m.mu11; i++;
		trainingData[i] = m.mu02; i++;
		trainingData[i] = m.mu30; i++;
		trainingData[i] = m.mu21; i++;
		trainingData[i] = m.mu12; i++;
		trainingData[i] = m.mu03; i++;
		trainingData[i] = m.nu20; i++;
		trainingData[i] = m.nu11; i++;
		trainingData[i] = m.nu02; i++;
		trainingData[i] = m.nu30; i++;
		trainingData[i] = m.nu21; i++;
		trainingData[i] = m.nu12; i++;
		trainingData[i] = m.nu03; i++;

		trainingData[i] = hu[0]; i++;
		trainingData[i] = hu[1]; i++;
		trainingData[i] = hu[2]; i++;
		trainingData[i] = hu[3]; i++;
		trainingData[i] = hu[4]; i++;
		trainingData[i] = hu[5]; i++;
		trainingData[i] = hu[6]; i++;

		return trainingData;
	}

};