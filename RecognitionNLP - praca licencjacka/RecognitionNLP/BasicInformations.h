#pragma once

/* library C++ */
#include <string>

using namespace std;


class CBasicInformations {

	/* Neccessery value */
public:
	static const int	NUMBER_SYMBOL = 35;			//number available signs in NLP(number licence plate)

	char				sign[NUMBER_SYMBOL] = {
		'0','1','2','3','4','5','6','7','8','9',	//10
		'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',		//8
		'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',		//8 
		'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'	//9
	};												//+: 35
public:
	int				nrSign[NUMBER_SYMBOL] = {
		0,0,0,0,0,0,0,0,0,0,	//10
		0,0,0,0,0,0,0,0,		//8
		0,0,0,0,0,0,0,0,		//8 
		0,0,0,0,0,0,0,0,0	//9
	};												//+: 35

	/* END Neccessery value */

public:
	CBasicInformations();
	~CBasicInformations();

	int getNumberSign(char sign) {

		for (int i = 0; i < NUMBER_SYMBOL; i++) {
			if (this->sign[i] == sign)
				return i;
		}

		return -1;
	}
};

