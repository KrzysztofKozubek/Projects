#pragma once

/* library VS */
#include <iostream>
#include <fstream>
#include <vector>
#include <sstream>
#include <algorithm>

/* My Class */
#include "dirent.h"

using namespace std;

class CWindows {

public:
	/* Neccessery value */

	static const int	NUMBER_SYMBOL = 10;				//number available signs
	char				sign[NUMBER_SYMBOL] = { '0','1','2','3','4','5','6','7','8','9' };
	int					nrSign[NUMBER_SYMBOL] = { 0,0,0,0,0,0,0,0,0,0 };

	const string		NAME_FILE_FEATURES_VECTOR = "VF.txt";
	const string		NAME_FILE_SCALING_PARAMETERS = "SP.txt";
	const string		NAME_FILE_SCALING_VECTOR = "SVF.txt";
	const string		NAME_FILE_RESULT = "R.txt";

	const string		NAME_FILE_MODEL_SVM = "SVM.model";

	/* END Neccessery value */

	CWindows() {}
	~CWindows() {}


}