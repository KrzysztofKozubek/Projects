#include "ocr.h"
#include <QtWidgets/QApplication>

int main(int argc, char *argv[]) {

	QApplication a(argc, argv);
	OCR w;
	w.show();
	return a.exec();
}
