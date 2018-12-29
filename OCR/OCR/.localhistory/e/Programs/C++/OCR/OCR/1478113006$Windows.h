#pragma once

/* library VS */
#include <iostream>
#include <fstream>
#include <vector>

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

	static 
};

