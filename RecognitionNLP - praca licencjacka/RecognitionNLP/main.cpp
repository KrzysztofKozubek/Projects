#include "Recognitionnlp.h"
#include <QtWidgets/QApplication>

int main(int argc, char *argv[])
{
	QApplication a(argc, argv);
	RecognitionNLP w;
	w.show();
	return a.exec();
}
