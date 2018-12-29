//#pragma once
///* out classes */
//#include "dirent.h"
//#include <Recognitionnlp.h>
//
//
///* library C++ */
//#include <vector>
//#include <string>
//#include <iostream>
//#include <math.h>
//#include <fstream>
//
//using namespace std;
//
//
///* library OpenCV */
//#include "opencv2\opencv.hpp"
//#include <opencv2/core.hpp>
//#include <opencv2/imgproc.hpp>
//#include "opencv2/imgcodecs.hpp"
//#include <opencv2/highgui.hpp>
//#include <opencv2/ml.hpp>
//
//using namespace cv;
//using namespace cv::ml;
//
//
///* library Qt */
//#include <qmessagebox.h>
//
//
///* library libsvm */
//
//
//class MatAStr {
//public:
//	MatAStr();
//	MatAStr(Mat image, string nameFile) :image(image), nameFile(nameFile) {}
//
//	string	nameFile;
//	Mat		image;
//};
//
//inline void showMessage(string str) {
//	QString s = QString::fromStdString(str);
//	QMessageBox msgBox;
//	msgBox.setText(s);
//	msgBox.setInformativeText("Do you want to save your changes?");
//	msgBox.setStandardButtons(QMessageBox::Save | QMessageBox::Discard | QMessageBox::Cancel);
//	msgBox.setDefaultButton(QMessageBox::Save);
//	int ret = msgBox.exec();
//}
//
//class CTest {
//
//	/* Neccessery value */
//
//	static const int	NUMBER_SYMBOL						= 35;			//number available signs in NLP(number licence plate)
//
//	char				sign[NUMBER_SYMBOL] = {
//		'0','1','2','3','4','5','6','7','8','9',	//10
//		'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',		//8
//		'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',		//8 
//		'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'	//9
//	};												//+: 35
//
//	const string		NAME_FILE_FEATURES_VECTOR			= "VF.txt";
//	const string		NAME_FILE_SCALING_PARAMETERS		= "SP.txt";
//	const string		NAME_FILE_SCALING_VECTOR			= "SVF.txt";
//	const string		NAME_FILE_RESULT					= "R.txt";
//
//	/* END Neccessery value */
//
//
//	/* Segmentation */
//
//	static const int	LIMIT_VALUE_LIGHT_BIT				= 1;			
//	static const int	NUMBER_COLUMN_GET_TO_SEGMENTATION	= 1;
//	static const int	LIMIT_VALUE_COLOR					= 100;
//
//	//standard size image(one sign) after segmentation
//	static const int	STANDARD_WIDTH						= 40;
//	static const int	STANDARD_HEIGHT						= 26;
//
//	vector<string>		vNameFilesNLP;
//
//	//vecotrs have vector feature(count moments)
//	vector<int>			vLabel;
//	vector<vector<float>>vTrainingData;
//
//	/* END Segmentation*/
//
//	vector<MatAStr>		vNumberLicencePlate;		//vector images plats
//	CListChange*		noising;					//list noising, use before segmentation
//	vector<Mat>			vSign;						//vector one sign (after segmentation)
//public:
//	double*				parameters;
//	vector<double>		parametrs;
//
//
//
//	CTest();
//	CTest(CListChange* noising, vector<double> parametrs, double* parameters);
//	~CTest();
//
//#pragma region
//
//	Mat noisingImage(Mat& image) {
//
//		int size = noising->change.size();
//		for (int i = 0; i < size; i++)
//			CListChange::noising(image, noising->change[i], noising->value[i], noising->valueMisstake[i]);
//		return image;
//	}
//
//#pragma endregion Noising
//
//
//#pragma region
//
//	vector<Mat> segmentationNLP(Mat& image, int LIMIT_VALUE_LIGHT_BIT = LIMIT_VALUE_LIGHT_BIT) {
//
//		introductoryProcessing(image, parametrs);
//		vector<Mat> result;
//		Mat tmp;
//
//		int cols = image.cols;
//		int rows = image.rows;
//
//		int cutStart = 0,	cutEnd = 0;	//information about level cutting
//		int fromCut = 0,	toCut = 0;	//save position column
//
//		int sum = 0;
//
//		for (int y = 0; y < cols - 1; y++) {
//			sum = sumColorColumn(image, y);
//
//			if (LIMIT_VALUE_LIGHT_BIT >= sum) {
//
//				if (cutStart == 0) fromCut = y;
//				if (cutStart == 1 && cutEnd == 0) { toCut = y; cutEnd = 1; }
//				if (cutStart == 1 && cutEnd == 1) {
//
//					tmp = image.clone();
//
//					cutImage(tmp, fromCut, 0, cols - toCut, 0);
//					normalaizedImage(tmp);
//
//					result.push_back(tmp);
//					tmp.release();
//
//					cutStart = toCut = cutEnd = 0;
//					fromCut = y;
//				}
//			}
//			else {
//				if (cutStart == 0) cutStart = 1;
//			}
//		}
//
//		return result;
//	}
//
//	void segmentationNLP() {
//
//		vector<Mat> tmp;
//		for each (MatAStr var in vNumberLicencePlate) {
//
//			tmp.clear();
//			tmp = segmentationNLP(var.image);
//			int sign = -1;
//			for (int i = 0; i < tmp.size() && i < var.nameFile.size(); i++) {
//				if((sign = getNumberSign(var.nameFile[i])) && sign != -1){
//					vLabel.push_back(sign);
//					vTrainingData.push_back(*countMoment(tmp[i]));
//				}
//			}
//		}
//	}
//
//#pragma endregion Segmentation
//
//
//#pragma region
//
//	void saveVectorToFile(int* labels, float** trainingData, string nameFile) {
//
//		fstream plik(nameFile, ios::out);
//		if (plik.good()) {
//
//			for (int i = 0; i < vNumberLicencePlate.size(); i++) {
//				plik << labels[i] + 1 << " ";
//				for (int j = 0; j < 31; j++) {
//					plik << j + 1 << ":" << trainingData[i][j] << " ";
//					plik.flush();
//				}
//				plik << endl;
//			}
//			plik.close();
//		}
//	}
//
//	void testByLibsvm(int typeSVM, int kernel, double degree, double gamma, double coef0, double cost, double nu, double epsilon, double cacheSize, double epsilonTolerant, int shrinking, int probablility_estimates, double weight) {
//		epsilon /= 100;
//		nu /= 10;
///*
//		Usage: svm-train [options] training_set_file [model_file]
//		options:
//		-s svm_type : set type of SVM (default 0)
//				0 -- C-SVC              (multi-class classification)
//				1 -- nu-SVC             (multi-class classification)
//				2 -- one-class SVM
//				3 -- epsilon-SVR        (regression)
//				4 -- nu-SVR             (regression)
//		-t kernel_type : set type of kernel function (default 2)
//				0 -- linear: u'*v
//				1 -- polynomial: (gamma*u'*v + coef0)^degree
//				2 -- radial basis function: exp(-gamma*|u-v|^2)
//				3 -- sigmoid: tanh(gamma*u'*v + coef0)
//				4 -- precomputed kernel (kernel values in training_set_file)
//		-d degree : set degree in kernel function (default 3)
//		-g gamma : set gamma in kernel function (default 1/num_features)
//		-r coef0 : set coef0 in kernel function (default 0)
//		-c cost : set the parameter C of C-SVC, epsilon-SVR, and nu-SVR (default 1)
//		-n nu : set the parameter nu of nu-SVC, one-class SVM, and nu-SVR (default 0.5)
//		-p epsilon : set the epsilon in loss function of epsilon-SVR (default 0.1)
//		-m cachesize : set cache memory size in MB (default 100)
//		-e epsilon : set tolerance of termination criterion (default 0.001)
//		-h shrinking : whether to use the shrinking heuristics, 0 or 1 (default 1)
//		-b probability_estimates : whether to train a SVC or SVR model for probability estimates, 0 or 1 (default 0)
//		-wi weight : set the parameter C of class i to weight*C, for C-SVC (default 1)
//		-v n: n-fold cross validation mode
//		-q : quiet mode (no outputs)
//*/
//		string commend;
//
//		//removing files NAME_FILE_SCALING_PARAMETERS + NAME_FILE_SCALING_VECTOR + NAME_FILE_RESULT
//		commend = "del libsvm\\" + NAME_FILE_SCALING_PARAMETERS + " /F /Q";
//		cmdRun(commend);
//
//		commend = "del libsvm\\" + NAME_FILE_SCALING_VECTOR + " /F /Q";
//		cmdRun(commend);
//
//		commend = "del libsvm\\" + NAME_FILE_RESULT + " /F /Q";
//		cmdRun(commend);
//
//		//scaling parameters
//		commend = "libsvm\\svm-scale.exe libsvm\\" + NAME_FILE_FEATURES_VECTOR + " >> libsvm\\" + NAME_FILE_SCALING_VECTOR;
//		cmdRun(commend);
//
//		//normalization features vectors
//		/*
//		commend = "libsvm\\svm-scale.exe -r libsvm\\" + NAME_FILE_SCALING_PARAMETERS + " libsvm\\" + NAME_FILE_FEATURES_VECTOR + " >> libsvm\\" + NAME_FILE_SCALING_VECTOR;
//		cmdRun(commend);
//		*/
//		//predict 
//		commend = "libsvm\\svm-train.exe -s " + itos(typeSVM) + " -t " + itos(kernel) + " -d " + itos(degree) + " -g " + itos(gamma) + " -r " + itos(coef0) + " -c " + itos(cost) + " -n " + itos(nu) + " -p " + itos(epsilon) + " -m " + itos(cacheSize) + " -e " + itos(epsilonTolerant) + " -h " + itos(shrinking) + " -b " + itos(probablility_estimates) + " -wi " + itos(weight) + " -v 5 -q libsvm\\" + NAME_FILE_SCALING_VECTOR + " >> libsvm\\" + NAME_FILE_RESULT + " 2>&1";
//		cmdRun(commend);
//	}
//
//#pragma endregion Test
//
//
//#pragma region
//
//	vector<string> getListFileFrom(string path) {
//
//		vector<string> direcroriesName;
//
//		const char* chPath = path.c_str();
//		struct dirent* file;
//		DIR* directories;
//		if (directories = opendir(chPath)) {
//			while (file = readdir(directories)) {
//				if (file->d_name[0] != '.')
//
//					direcroriesName.push_back(file->d_name);
//			}
//		}
//
//		return direcroriesName;
//	}
//
//	void loadImageToVector(string path) {
//
//		if ('\\' != path[path.length()])
//			path += "\\";
//
//		vNameFilesNLP = getListFileFrom(path);
//		for each (string var in vNameFilesNLP) 
//			vNumberLicencePlate.push_back(MatAStr(noisingImage(imread(path + var)), var));
//		
//	}
//
//	vector<float>* countMoment(Mat image) {
//	
//		vector<float>* trainingData = new vector<float>();
//		double hu[7];
//
//		if (CV_RGB2GRAY != image.type()) {
//
//			//cvtColor(image, image, CV_RGB2GRAY);
//		}
//
//		Moments m = moments(image);
//		HuMoments(m, hu);
//
//		trainingData->push_back(m.m00);
//		trainingData->push_back(m.m10);
//		trainingData->push_back(m.m01);
//		trainingData->push_back(m.m20);
//		trainingData->push_back(m.m11);
//		trainingData->push_back(m.m02);
//		trainingData->push_back(m.m30);
//		trainingData->push_back(m.m21);
//		trainingData->push_back(m.m12);
//		trainingData->push_back(m.m03);
//
//		trainingData->push_back(m.mu20);
//		trainingData->push_back(m.mu11);
//		trainingData->push_back(m.mu02);
//		trainingData->push_back(m.mu30);
//		trainingData->push_back(m.mu21);
//		trainingData->push_back(m.mu12);
//		trainingData->push_back(m.mu03);
//
//		trainingData->push_back(m.nu20);
//		trainingData->push_back(m.nu11);
//		trainingData->push_back(m.nu02);
//		trainingData->push_back(m.nu30);
//		trainingData->push_back(m.nu21);
//		trainingData->push_back(m.nu12);
//		trainingData->push_back(m.nu03);
//
//		trainingData->push_back(hu[0]);
//		trainingData->push_back(hu[1]);
//		trainingData->push_back(hu[2]);
//		trainingData->push_back(hu[3]);
//		trainingData->push_back(hu[4]);
//		trainingData->push_back(hu[5]);
//		trainingData->push_back(hu[6]);
//
//		return trainingData;
//	}
//
//	static int sumColorColumn(const Mat& image, int column, int NUMBER_COLUMN_GET_TO_SEGMENTATION = NUMBER_COLUMN_GET_TO_SEGMENTATION) {
//
//		int rows = image.rows;
//		int cols = image.cols;
//		int sum = 0;
//
//		for (int x = column; x < column + NUMBER_COLUMN_GET_TO_SEGMENTATION && x < cols; x++) {
//			for (int y = 0; y < rows; y++)
//				sum += image.at<uchar>(y, x);
//		}
//
//		return sum;
//	}
//
//	inline string itos(double dbl) {
//		std::ostringstream strs;
//		strs << dbl;
//		std::string str = strs.str();
//
//		return str;
//	}
//
//	inline string itos(int i) {
//		std::stringstream ss;
//		std::string str;
//		ss << i;
//		ss >> str;
//
//		return str;
//	}
//
//	static void cmdRun(string commend) {
//
//		const char* charCommend = commend.c_str();
//		system(charCommend);
//	}
//
//	int getNumberSign(char sign) {
//
//		for (int i = 0; i < NUMBER_SYMBOL; i++) {
//			if (this->sign[i] == sign)
//				return i;
//		}
//
//		return -1;
//	}
//
//#pragma endregion Help methods
//
//
//
//
//
//	void test() {
//		
//		/* REWRITE VALUE FROM VECTOR TO ARRAY */
//		int* labels				= new int[vLabel.size()];
//		float** trainingData	= new float*[vLabel.size()];
//
//		for (int i = 0; i < vTrainingData.size();i++) 
//			trainingData[i] = new float[31];
//		
//		for (int i = 0; i < vTrainingData.size(); i++) {
//			labels[i] = vLabel[i];
//			for (int j = 0; j < vTrainingData[i].size(); j++) {
//				trainingData[i][j] = vTrainingData[i][j];
//			}
//		}
//		/* END REWRITE VALUE FROM VECTOR TO ARRAY END */
//
//		saveVectorToFile(labels, trainingData, "libsvm\\" + NAME_FILE_FEATURES_VECTOR);
//		testByLibsvm(parameters[0], parameters[1], parameters[2], parameters[3], parameters[4], parameters[5], parameters[6], parameters[7], parameters[8], parameters[9], parameters[10], parameters[11], parameters[12]);
//	}
//
//};
//
