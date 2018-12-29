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

	static void saveVectorToFile(int* labels, float** trainingData, string nameFile, string path, int size, bool scale = true) {

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
};

