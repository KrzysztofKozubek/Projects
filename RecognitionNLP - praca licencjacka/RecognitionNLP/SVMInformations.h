#pragma once

/* library C++ */
#include <string>

using namespace std;


class CSVMInformations{

public:

	/* Need to SVM */
	const string		NAME_FILE_FEATURES_VECTOR		= "VF.txt";
	const string		NAME_FILE_SCALING_PARAMETERS	= "SP.txt";
	const string		NAME_FILE_SCALING_VECTOR		= "SVF.txt";
	const string		NAME_FILE_RESULT				= "R.txt";

	const string		NAME_FILE_MODEL_SVM				= "SVM.model";
	/* END Need to SVM */

	CSVMInformations() {}
	~CSVMInformations() {}
};

