#pragma once

/* library VS */
#include <iostream>
#include <fstream>
#include <vector>
#include <sstream>

/* My Class */
#include "dirent.h"

using namespace std;

class CWindows {

public:
						/* Neccessery value */

	static const int	NUMBER_SYMBOL = 10;				//number available signs
	char				sign[NUMBER_SYMBOL]				= {'0','1','2','3','4','5','6','7','8','9'};
	int					nrSign[NUMBER_SYMBOL]			= {0,0,0,0,0,0,0,0,0,0};

	const string		NAME_FILE_FEATURES_VECTOR		= "VF.txt";
	const string		NAME_FILE_SCALING_PARAMETERS	= "SP.txt";
	const string		NAME_FILE_SCALING_VECTOR		= "SVF.txt";
	const string		NAME_FILE_RESULT				= "R.txt";

	const string		NAME_FILE_MODEL_SVM				= "SVM.model";

						/* END Neccessery value */

	CWindows();
	~CWindows();

	static vector<string> getListFileFrom(string path) {

		vector<string> direcroriesName;

		const char* chPath = path.c_str();
		struct dirent* file;
		DIR* directories;
		if (directories = opendir(chPath)) {
			while (file = readdir(directories)) {
				if (file->d_name[0] != '.')

					direcroriesName.push_back(file->d_name);
			}
		}

		return direcroriesName;
	}

	static void saveVectorToFile(int* labels, float** trainingData, string nameFile, int size, bool scale = true) {

		string tmp = "libsvm\\tmp.txt";
		if (!scale)
			tmp = nameFile;

		fstream plik(tmp, ios::out);
		if (plik.good()) {

			for (int i = 0; i < size; i++) {
				plik << labels[i] + 1 << " ";
				for (int j = 0; j < 31; j++) {
					plik << j + 1 << ":" << trainingData[i][j] << " ";
					plik.flush();
				}
				plik << endl;
			}
			plik.close();
		}

		string commend;

		if (scale) {
			//scaling parameters
			commend = "libsvm\\svm-scale.exe " + tmp + " >> " + nameFile;
			cmdRun(commend);
		}
	}

	static void createFile(string fileName) {

		fstream file(fileName, ios::out);
		file.close();
	}

	static void insertToFile(string fileName, string valueInsert) {

		fstream file(fileName, ios::app);
		if (file.good()) {
			file << valueInsert;
			file.flush();
			file << endl;
		}
		file.close();
	}

	void trainByLibsvm(int typeSVM, int kernel, double degree, double gamma, double coef0, double cost, double nu, double epsilon, double cacheSize, double epsilonTolerant, int shrinking, int probablility_estimates, double weight) {

		/*
		Usage: svm-train [options] training_set_file [model_file]
		options:
		-s svm_type : set type of SVM (default 0)
		0 -- C-SVC              (multi-class classification)
		1 -- nu-SVC             (multi-class classification)
		2 -- one-class SVM
		3 -- epsilon-SVR        (regression)
		4 -- nu-SVR             (regression)
		-t kernel_type : set type of kernel function (default 2)
		0 -- linear: u'*v
		1 -- polynomial: (gamma*u'*v + coef0)^degree
		2 -- radial basis function: exp(-gamma*|u-v|^2)
		3 -- sigmoid: tanh(gamma*u'*v + coef0)
		4 -- precomputed kernel (kernel values in training_set_file)
		-d degree : set degree in kernel function (default 3)
		-g gamma : set gamma in kernel function (default 1/num_features)
		-r coef0 : set coef0 in kernel function (default 0)
		-c cost : set the parameter C of C-SVC, epsilon-SVR, and nu-SVR (default 1)
		-n nu : set the parameter nu of nu-SVC, one-class SVM, and nu-SVR (default 0.5)
		-p epsilon : set the epsilon in loss function of epsilon-SVR (default 0.1)
		-m cachesize : set cache memory size in MB (default 100)
		-e epsilon : set tolerance of termination criterion (default 0.001)
		-h shrinking : whether to use the shrinking heuristics, 0 or 1 (default 1)
		-b probability_estimates : whether to train a SVC or SVR model for probability estimates, 0 or 1 (default 0)
		-wi weight : set the parameter C of class i to weight*C, for C-SVC (default 1)
		-v n: n-fold cross validation mode
		-q : quiet mode (no outputs)
		*/
		string commend;

		//removing files NAME_FILE_MODEL_SVM
		commend = "del libsvm\\" + NAME_FILE_MODEL_SVM + " /F /Q";
		cmdRun(commend);

		//scaling parameters
		commend = "libsvm\\svm-scale.exe libsvm\\" + NAME_FILE_FEATURES_VECTOR + " >> libsvm\\" + NAME_FILE_SCALING_VECTOR;
		cmdRun(commend);

		//training and save to SVM.model
		commend = "libsvm\\svm-train.exe -s " + itos(typeSVM) + " -t " + itos(kernel) + " -d " + itos(degree) + " -g " + itos(gamma) + " -r " + itos(coef0) + " -c " + itos(cost) + " -n " + itos(nu) + " -p " + itos(epsilon) + " -m " + itos(cacheSize) + " -e " + itos(epsilonTolerant) + " -h " + itos(shrinking) + " -b " + itos(probablility_estimates) + " -wi " + itos(weight) + " libsvm\\" + NAME_FILE_SCALING_VECTOR + " libsvm\\" + NAME_FILE_MODEL_SVM;
		cmdRun(commend);
	}

	void predict(string NAME_FILE) {

		string commend;

		commend = "libsvm\\svm-predict.exe libsvm\\" + NAME_FILE_SCALING_VECTOR + " libsvm\\" + NAME_FILE_MODEL_SVM + " libsvm\\" + NAME_FILE_RESULT + " >> libsvm\\Error.txt 2>&1 libsvm\\Error2.txt";
		cmdRun(commend);
	}

private:

#pragma region

	string readFile(string path) {

		ifstream file(path);
		string result((istreambuf_iterator<char>(file)), istreambuf_iterator<char>());
		return result;
	}

	string itos(double dbl) {
		ostringstream strs;
		strs << dbl;
		string str = strs.str();

		return str;
	}

	string itos(int i) {
		stringstream ss;
		string str;
		ss << i;
		ss >> str;

		return str;
	}

public:
	static void cmdRun(string commend) {

		const char* charCommend = commend.c_str();
		system(charCommend);
	}

#pragma endregion Test

};

