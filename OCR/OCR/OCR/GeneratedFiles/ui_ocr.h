/********************************************************************************
** Form generated from reading UI file 'ocr.ui'
**
** Created by: Qt User Interface Compiler version 5.6.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_OCR_H
#define UI_OCR_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QGroupBox>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSlider>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QTabWidget>
#include <QtWidgets/QTextBrowser>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_OCRClass
{
public:
    QWidget *centralWidget;
    QHBoxLayout *horizontalLayout;
    QTabWidget *tabWidget;
    QWidget *tab;
    QVBoxLayout *verticalLayout;
    QGroupBox *groupBox_5;
    QGridLayout *gridLayout_7;
    QLabel *LImage1;
    QSpacerItem *verticalSpacer_5;
    QSpacerItem *horizontalSpacer_13;
    QSpacerItem *horizontalSpacer_14;
    QSpacerItem *verticalSpacer_6;
    QGroupBox *groupBox_6;
    QGridLayout *gridLayout_6;
    QLabel *label_5;
    QLabel *label_7;
    QLabel *label_6;
    QLabel *label_8;
    QSlider *HSContrast1;
    QSlider *HSBrightness1;
    QLabel *label_2;
    QSlider *HSRotate1;
    QLabel *label;
    QPushButton *BConfirmChange1;
    QGroupBox *groupBox;
    QGridLayout *gridLayout_2;
    QLabel *label_4;
    QLineEdit *LEPathImageLoad1;
    QPushButton *BLoadImage1;
    QLabel *label_3;
    QLineEdit *LEPathImageSave1;
    QPushButton *BSaveImage1;
    QWidget *tab_3;
    QVBoxLayout *verticalLayout_3;
    QGroupBox *groupBox_8;
    QHBoxLayout *horizontalLayout_5;
    QSpacerItem *horizontalSpacer_3;
    QLabel *LImage3;
    QSpacerItem *horizontalSpacer_4;
    QGroupBox *groupBox_9;
    QGridLayout *gridLayout_3;
    QGroupBox *groupBox_10;
    QGridLayout *gridLayout_4;
    QLabel *label_11;
    QSlider *HSBinaryElement3;
    QLabel *label_12;
    QSlider *HSBinaryKernel3;
    QGroupBox *groupBox_11;
    QGridLayout *gridLayout_5;
    QLabel *label_14;
    QSlider *HSErodeElement3;
    QLabel *label_13;
    QSlider *HSErodeKernel3;
    QGroupBox *groupBox_12;
    QHBoxLayout *horizontalLayout_6;
    QLabel *L;
    QLineEdit *LEPathImageLoad3;
    QPushButton *BLoadImage3;
    QWidget *tab_2;
    QVBoxLayout *verticalLayout_2;
    QGroupBox *groupBox_3;
    QHBoxLayout *horizontalLayout_3;
    QPushButton *BLeftImageRow2;
    QSpacerItem *horizontalSpacer;
    QLabel *LImageRow2;
    QSpacerItem *horizontalSpacer_2;
    QPushButton *BRightImageRow2;
    QGroupBox *groupBox_7;
    QHBoxLayout *horizontalLayout_4;
    QPushButton *BLeftImageCell2;
    QSpacerItem *horizontalSpacer_5;
    QLabel *LImageCell2;
    QSpacerItem *horizontalSpacer_6;
    QPushButton *BRightImageCell2;
    QGroupBox *groupBox_4;
    QVBoxLayout *verticalLayout_4;
    QPushButton *BSaveImages2;
    QWidget *tab_4;
    QVBoxLayout *verticalLayout_5;
    QGroupBox *groupBox_13;
    QHBoxLayout *horizontalLayout_7;
    QPushButton *BLeftImageCell4;
    QSpacerItem *horizontalSpacer_7;
    QLabel *LImageCell4;
    QSpacerItem *horizontalSpacer_8;
    QPushButton *BRightImageCell4;
    QGroupBox *groupBox_2;
    QVBoxLayout *verticalLayout_6;
    QTextBrowser *TB4;

    void setupUi(QMainWindow *OCRClass)
    {
        if (OCRClass->objectName().isEmpty())
            OCRClass->setObjectName(QStringLiteral("OCRClass"));
        OCRClass->resize(973, 596);
        centralWidget = new QWidget(OCRClass);
        centralWidget->setObjectName(QStringLiteral("centralWidget"));
        horizontalLayout = new QHBoxLayout(centralWidget);
        horizontalLayout->setSpacing(6);
        horizontalLayout->setContentsMargins(11, 11, 11, 11);
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        tabWidget = new QTabWidget(centralWidget);
        tabWidget->setObjectName(QStringLiteral("tabWidget"));
        tab = new QWidget();
        tab->setObjectName(QStringLiteral("tab"));
        verticalLayout = new QVBoxLayout(tab);
        verticalLayout->setSpacing(6);
        verticalLayout->setContentsMargins(11, 11, 11, 11);
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        groupBox_5 = new QGroupBox(tab);
        groupBox_5->setObjectName(QStringLiteral("groupBox_5"));
        gridLayout_7 = new QGridLayout(groupBox_5);
        gridLayout_7->setSpacing(6);
        gridLayout_7->setContentsMargins(11, 11, 11, 11);
        gridLayout_7->setObjectName(QStringLiteral("gridLayout_7"));
        LImage1 = new QLabel(groupBox_5);
        LImage1->setObjectName(QStringLiteral("LImage1"));

        gridLayout_7->addWidget(LImage1, 0, 2, 1, 1);

        verticalSpacer_5 = new QSpacerItem(1, 218, QSizePolicy::Minimum, QSizePolicy::Expanding);

        gridLayout_7->addItem(verticalSpacer_5, 0, 4, 1, 1);

        horizontalSpacer_13 = new QSpacerItem(171, 1, QSizePolicy::Expanding, QSizePolicy::Minimum);

        gridLayout_7->addItem(horizontalSpacer_13, 0, 1, 1, 1);

        horizontalSpacer_14 = new QSpacerItem(171, 1, QSizePolicy::Expanding, QSizePolicy::Minimum);

        gridLayout_7->addItem(horizontalSpacer_14, 0, 3, 1, 1);

        verticalSpacer_6 = new QSpacerItem(1, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        gridLayout_7->addItem(verticalSpacer_6, 0, 0, 1, 1);


        verticalLayout->addWidget(groupBox_5);

        groupBox_6 = new QGroupBox(tab);
        groupBox_6->setObjectName(QStringLiteral("groupBox_6"));
        gridLayout_6 = new QGridLayout(groupBox_6);
        gridLayout_6->setSpacing(6);
        gridLayout_6->setContentsMargins(11, 11, 11, 11);
        gridLayout_6->setObjectName(QStringLiteral("gridLayout_6"));
        label_5 = new QLabel(groupBox_6);
        label_5->setObjectName(QStringLiteral("label_5"));

        gridLayout_6->addWidget(label_5, 0, 0, 1, 1);

        label_7 = new QLabel(groupBox_6);
        label_7->setObjectName(QStringLiteral("label_7"));

        gridLayout_6->addWidget(label_7, 0, 2, 1, 1);

        label_6 = new QLabel(groupBox_6);
        label_6->setObjectName(QStringLiteral("label_6"));

        gridLayout_6->addWidget(label_6, 1, 0, 1, 1);

        label_8 = new QLabel(groupBox_6);
        label_8->setObjectName(QStringLiteral("label_8"));

        gridLayout_6->addWidget(label_8, 1, 2, 1, 1);

        HSContrast1 = new QSlider(groupBox_6);
        HSContrast1->setObjectName(QStringLiteral("HSContrast1"));
        HSContrast1->setMinimum(0);
        HSContrast1->setMaximum(3);
        HSContrast1->setOrientation(Qt::Horizontal);

        gridLayout_6->addWidget(HSContrast1, 0, 1, 1, 1);

        HSBrightness1 = new QSlider(groupBox_6);
        HSBrightness1->setObjectName(QStringLiteral("HSBrightness1"));
        HSBrightness1->setMaximum(100);
        HSBrightness1->setOrientation(Qt::Horizontal);

        gridLayout_6->addWidget(HSBrightness1, 1, 1, 1, 1);

        label_2 = new QLabel(groupBox_6);
        label_2->setObjectName(QStringLiteral("label_2"));

        gridLayout_6->addWidget(label_2, 2, 2, 1, 1);

        HSRotate1 = new QSlider(groupBox_6);
        HSRotate1->setObjectName(QStringLiteral("HSRotate1"));
        HSRotate1->setMaximum(360);
        HSRotate1->setOrientation(Qt::Horizontal);

        gridLayout_6->addWidget(HSRotate1, 2, 1, 1, 1);

        label = new QLabel(groupBox_6);
        label->setObjectName(QStringLiteral("label"));

        gridLayout_6->addWidget(label, 2, 0, 1, 1);

        BConfirmChange1 = new QPushButton(groupBox_6);
        BConfirmChange1->setObjectName(QStringLiteral("BConfirmChange1"));

        gridLayout_6->addWidget(BConfirmChange1, 3, 1, 1, 1);


        verticalLayout->addWidget(groupBox_6);

        groupBox = new QGroupBox(tab);
        groupBox->setObjectName(QStringLiteral("groupBox"));
        gridLayout_2 = new QGridLayout(groupBox);
        gridLayout_2->setSpacing(6);
        gridLayout_2->setContentsMargins(11, 11, 11, 11);
        gridLayout_2->setObjectName(QStringLiteral("gridLayout_2"));
        label_4 = new QLabel(groupBox);
        label_4->setObjectName(QStringLiteral("label_4"));

        gridLayout_2->addWidget(label_4, 0, 0, 1, 1);

        LEPathImageLoad1 = new QLineEdit(groupBox);
        LEPathImageLoad1->setObjectName(QStringLiteral("LEPathImageLoad1"));

        gridLayout_2->addWidget(LEPathImageLoad1, 0, 1, 1, 1);

        BLoadImage1 = new QPushButton(groupBox);
        BLoadImage1->setObjectName(QStringLiteral("BLoadImage1"));

        gridLayout_2->addWidget(BLoadImage1, 0, 2, 1, 1);

        label_3 = new QLabel(groupBox);
        label_3->setObjectName(QStringLiteral("label_3"));

        gridLayout_2->addWidget(label_3, 1, 0, 1, 1);

        LEPathImageSave1 = new QLineEdit(groupBox);
        LEPathImageSave1->setObjectName(QStringLiteral("LEPathImageSave1"));

        gridLayout_2->addWidget(LEPathImageSave1, 1, 1, 1, 1);

        BSaveImage1 = new QPushButton(groupBox);
        BSaveImage1->setObjectName(QStringLiteral("BSaveImage1"));

        gridLayout_2->addWidget(BSaveImage1, 1, 2, 1, 1);


        verticalLayout->addWidget(groupBox);

        tabWidget->addTab(tab, QString());
        tab_3 = new QWidget();
        tab_3->setObjectName(QStringLiteral("tab_3"));
        verticalLayout_3 = new QVBoxLayout(tab_3);
        verticalLayout_3->setSpacing(6);
        verticalLayout_3->setContentsMargins(11, 11, 11, 11);
        verticalLayout_3->setObjectName(QStringLiteral("verticalLayout_3"));
        groupBox_8 = new QGroupBox(tab_3);
        groupBox_8->setObjectName(QStringLiteral("groupBox_8"));
        horizontalLayout_5 = new QHBoxLayout(groupBox_8);
        horizontalLayout_5->setSpacing(6);
        horizontalLayout_5->setContentsMargins(11, 11, 11, 11);
        horizontalLayout_5->setObjectName(QStringLiteral("horizontalLayout_5"));
        horizontalSpacer_3 = new QSpacerItem(447, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_5->addItem(horizontalSpacer_3);

        LImage3 = new QLabel(groupBox_8);
        LImage3->setObjectName(QStringLiteral("LImage3"));

        horizontalLayout_5->addWidget(LImage3);

        horizontalSpacer_4 = new QSpacerItem(446, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_5->addItem(horizontalSpacer_4);


        verticalLayout_3->addWidget(groupBox_8);

        groupBox_9 = new QGroupBox(tab_3);
        groupBox_9->setObjectName(QStringLiteral("groupBox_9"));
        gridLayout_3 = new QGridLayout(groupBox_9);
        gridLayout_3->setSpacing(6);
        gridLayout_3->setContentsMargins(11, 11, 11, 11);
        gridLayout_3->setObjectName(QStringLiteral("gridLayout_3"));
        groupBox_10 = new QGroupBox(groupBox_9);
        groupBox_10->setObjectName(QStringLiteral("groupBox_10"));
        gridLayout_4 = new QGridLayout(groupBox_10);
        gridLayout_4->setSpacing(6);
        gridLayout_4->setContentsMargins(11, 11, 11, 11);
        gridLayout_4->setObjectName(QStringLiteral("gridLayout_4"));
        label_11 = new QLabel(groupBox_10);
        label_11->setObjectName(QStringLiteral("label_11"));

        gridLayout_4->addWidget(label_11, 0, 0, 1, 1);

        HSBinaryElement3 = new QSlider(groupBox_10);
        HSBinaryElement3->setObjectName(QStringLiteral("HSBinaryElement3"));
        HSBinaryElement3->setMaximum(4);
        HSBinaryElement3->setValue(1);
        HSBinaryElement3->setOrientation(Qt::Horizontal);

        gridLayout_4->addWidget(HSBinaryElement3, 0, 1, 1, 1);

        label_12 = new QLabel(groupBox_10);
        label_12->setObjectName(QStringLiteral("label_12"));

        gridLayout_4->addWidget(label_12, 1, 0, 1, 1);

        HSBinaryKernel3 = new QSlider(groupBox_10);
        HSBinaryKernel3->setObjectName(QStringLiteral("HSBinaryKernel3"));
        HSBinaryKernel3->setMaximum(255);
        HSBinaryKernel3->setValue(240);
        HSBinaryKernel3->setOrientation(Qt::Horizontal);

        gridLayout_4->addWidget(HSBinaryKernel3, 1, 1, 1, 1);


        gridLayout_3->addWidget(groupBox_10, 0, 0, 1, 1);

        groupBox_11 = new QGroupBox(groupBox_9);
        groupBox_11->setObjectName(QStringLiteral("groupBox_11"));
        gridLayout_5 = new QGridLayout(groupBox_11);
        gridLayout_5->setSpacing(6);
        gridLayout_5->setContentsMargins(11, 11, 11, 11);
        gridLayout_5->setObjectName(QStringLiteral("gridLayout_5"));
        label_14 = new QLabel(groupBox_11);
        label_14->setObjectName(QStringLiteral("label_14"));

        gridLayout_5->addWidget(label_14, 0, 0, 1, 1);

        HSErodeElement3 = new QSlider(groupBox_11);
        HSErodeElement3->setObjectName(QStringLiteral("HSErodeElement3"));
        HSErodeElement3->setMaximum(2);
        HSErodeElement3->setOrientation(Qt::Horizontal);

        gridLayout_5->addWidget(HSErodeElement3, 0, 1, 1, 1);

        label_13 = new QLabel(groupBox_11);
        label_13->setObjectName(QStringLiteral("label_13"));

        gridLayout_5->addWidget(label_13, 1, 0, 1, 1);

        HSErodeKernel3 = new QSlider(groupBox_11);
        HSErodeKernel3->setObjectName(QStringLiteral("HSErodeKernel3"));
        HSErodeKernel3->setMinimum(1);
        HSErodeKernel3->setSingleStep(2);
        HSErodeKernel3->setValue(1);
        HSErodeKernel3->setOrientation(Qt::Horizontal);

        gridLayout_5->addWidget(HSErodeKernel3, 1, 1, 1, 1);


        gridLayout_3->addWidget(groupBox_11, 0, 1, 1, 1);


        verticalLayout_3->addWidget(groupBox_9);

        groupBox_12 = new QGroupBox(tab_3);
        groupBox_12->setObjectName(QStringLiteral("groupBox_12"));
        horizontalLayout_6 = new QHBoxLayout(groupBox_12);
        horizontalLayout_6->setSpacing(6);
        horizontalLayout_6->setContentsMargins(11, 11, 11, 11);
        horizontalLayout_6->setObjectName(QStringLiteral("horizontalLayout_6"));
        L = new QLabel(groupBox_12);
        L->setObjectName(QStringLiteral("L"));

        horizontalLayout_6->addWidget(L);

        LEPathImageLoad3 = new QLineEdit(groupBox_12);
        LEPathImageLoad3->setObjectName(QStringLiteral("LEPathImageLoad3"));

        horizontalLayout_6->addWidget(LEPathImageLoad3);

        BLoadImage3 = new QPushButton(groupBox_12);
        BLoadImage3->setObjectName(QStringLiteral("BLoadImage3"));

        horizontalLayout_6->addWidget(BLoadImage3);


        verticalLayout_3->addWidget(groupBox_12);

        tabWidget->addTab(tab_3, QString());
        tab_2 = new QWidget();
        tab_2->setObjectName(QStringLiteral("tab_2"));
        verticalLayout_2 = new QVBoxLayout(tab_2);
        verticalLayout_2->setSpacing(6);
        verticalLayout_2->setContentsMargins(11, 11, 11, 11);
        verticalLayout_2->setObjectName(QStringLiteral("verticalLayout_2"));
        groupBox_3 = new QGroupBox(tab_2);
        groupBox_3->setObjectName(QStringLiteral("groupBox_3"));
        horizontalLayout_3 = new QHBoxLayout(groupBox_3);
        horizontalLayout_3->setSpacing(6);
        horizontalLayout_3->setContentsMargins(11, 11, 11, 11);
        horizontalLayout_3->setObjectName(QStringLiteral("horizontalLayout_3"));
        BLeftImageRow2 = new QPushButton(groupBox_3);
        BLeftImageRow2->setObjectName(QStringLiteral("BLeftImageRow2"));

        horizontalLayout_3->addWidget(BLeftImageRow2);

        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_3->addItem(horizontalSpacer);

        LImageRow2 = new QLabel(groupBox_3);
        LImageRow2->setObjectName(QStringLiteral("LImageRow2"));

        horizontalLayout_3->addWidget(LImageRow2);

        horizontalSpacer_2 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_3->addItem(horizontalSpacer_2);

        BRightImageRow2 = new QPushButton(groupBox_3);
        BRightImageRow2->setObjectName(QStringLiteral("BRightImageRow2"));

        horizontalLayout_3->addWidget(BRightImageRow2);


        verticalLayout_2->addWidget(groupBox_3);

        groupBox_7 = new QGroupBox(tab_2);
        groupBox_7->setObjectName(QStringLiteral("groupBox_7"));
        horizontalLayout_4 = new QHBoxLayout(groupBox_7);
        horizontalLayout_4->setSpacing(6);
        horizontalLayout_4->setContentsMargins(11, 11, 11, 11);
        horizontalLayout_4->setObjectName(QStringLiteral("horizontalLayout_4"));
        BLeftImageCell2 = new QPushButton(groupBox_7);
        BLeftImageCell2->setObjectName(QStringLiteral("BLeftImageCell2"));

        horizontalLayout_4->addWidget(BLeftImageCell2);

        horizontalSpacer_5 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_4->addItem(horizontalSpacer_5);

        LImageCell2 = new QLabel(groupBox_7);
        LImageCell2->setObjectName(QStringLiteral("LImageCell2"));

        horizontalLayout_4->addWidget(LImageCell2);

        horizontalSpacer_6 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_4->addItem(horizontalSpacer_6);

        BRightImageCell2 = new QPushButton(groupBox_7);
        BRightImageCell2->setObjectName(QStringLiteral("BRightImageCell2"));

        horizontalLayout_4->addWidget(BRightImageCell2);


        verticalLayout_2->addWidget(groupBox_7);

        groupBox_4 = new QGroupBox(tab_2);
        groupBox_4->setObjectName(QStringLiteral("groupBox_4"));
        verticalLayout_4 = new QVBoxLayout(groupBox_4);
        verticalLayout_4->setSpacing(6);
        verticalLayout_4->setContentsMargins(11, 11, 11, 11);
        verticalLayout_4->setObjectName(QStringLiteral("verticalLayout_4"));
        BSaveImages2 = new QPushButton(groupBox_4);
        BSaveImages2->setObjectName(QStringLiteral("BSaveImages2"));

        verticalLayout_4->addWidget(BSaveImages2);


        verticalLayout_2->addWidget(groupBox_4);

        tabWidget->addTab(tab_2, QString());
        tab_4 = new QWidget();
        tab_4->setObjectName(QStringLiteral("tab_4"));
        verticalLayout_5 = new QVBoxLayout(tab_4);
        verticalLayout_5->setSpacing(6);
        verticalLayout_5->setContentsMargins(11, 11, 11, 11);
        verticalLayout_5->setObjectName(QStringLiteral("verticalLayout_5"));
        groupBox_13 = new QGroupBox(tab_4);
        groupBox_13->setObjectName(QStringLiteral("groupBox_13"));
        horizontalLayout_7 = new QHBoxLayout(groupBox_13);
        horizontalLayout_7->setSpacing(6);
        horizontalLayout_7->setContentsMargins(11, 11, 11, 11);
        horizontalLayout_7->setObjectName(QStringLiteral("horizontalLayout_7"));
        BLeftImageCell4 = new QPushButton(groupBox_13);
        BLeftImageCell4->setObjectName(QStringLiteral("BLeftImageCell4"));

        horizontalLayout_7->addWidget(BLeftImageCell4);

        horizontalSpacer_7 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_7->addItem(horizontalSpacer_7);

        LImageCell4 = new QLabel(groupBox_13);
        LImageCell4->setObjectName(QStringLiteral("LImageCell4"));

        horizontalLayout_7->addWidget(LImageCell4);

        horizontalSpacer_8 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_7->addItem(horizontalSpacer_8);

        BRightImageCell4 = new QPushButton(groupBox_13);
        BRightImageCell4->setObjectName(QStringLiteral("BRightImageCell4"));

        horizontalLayout_7->addWidget(BRightImageCell4);


        verticalLayout_5->addWidget(groupBox_13);

        groupBox_2 = new QGroupBox(tab_4);
        groupBox_2->setObjectName(QStringLiteral("groupBox_2"));
        verticalLayout_6 = new QVBoxLayout(groupBox_2);
        verticalLayout_6->setSpacing(6);
        verticalLayout_6->setContentsMargins(11, 11, 11, 11);
        verticalLayout_6->setObjectName(QStringLiteral("verticalLayout_6"));
        TB4 = new QTextBrowser(groupBox_2);
        TB4->setObjectName(QStringLiteral("TB4"));

        verticalLayout_6->addWidget(TB4);


        verticalLayout_5->addWidget(groupBox_2);

        tabWidget->addTab(tab_4, QString());

        horizontalLayout->addWidget(tabWidget);

        OCRClass->setCentralWidget(centralWidget);

        retranslateUi(OCRClass);

        tabWidget->setCurrentIndex(3);


        QMetaObject::connectSlotsByName(OCRClass);
    } // setupUi

    void retranslateUi(QMainWindow *OCRClass)
    {
        OCRClass->setWindowTitle(QApplication::translate("OCRClass", "OCR", 0));
        groupBox_5->setTitle(QApplication::translate("OCRClass", "Zdj\304\231cie", 0));
        LImage1->setText(QString());
        groupBox_6->setTitle(QApplication::translate("OCRClass", "Warto\305\233ci", 0));
        label_5->setText(QApplication::translate("OCRClass", "Kontrast", 0));
        label_7->setText(QApplication::translate("OCRClass", "1", 0));
        label_6->setText(QApplication::translate("OCRClass", "Jasno\305\233\304\207", 0));
        label_8->setText(QApplication::translate("OCRClass", "1", 0));
        label_2->setText(QApplication::translate("OCRClass", "0", 0));
        label->setText(QApplication::translate("OCRClass", "Obr\303\263t", 0));
        BConfirmChange1->setText(QApplication::translate("OCRClass", "Zatwiedz zmian\304\231", 0));
        groupBox->setTitle(QApplication::translate("OCRClass", "Zdj\304\231cia", 0));
        label_4->setText(QApplication::translate("OCRClass", "Lokalizacja zdj\304\231cia", 0));
        BLoadImage1->setText(QApplication::translate("OCRClass", "Za\305\202aduj zdj\304\231cie", 0));
        label_3->setText(QApplication::translate("OCRClass", "Lokalizacja zdj\304\231cia", 0));
        BSaveImage1->setText(QApplication::translate("OCRClass", "Zapisz zdj\304\231cie", 0));
        tabWidget->setTabText(tabWidget->indexOf(tab), QApplication::translate("OCRClass", "Kontrast & Jasno\305\233\304\207 & Obr\303\263t", 0));
        groupBox_8->setTitle(QApplication::translate("OCRClass", "Zdj\304\231cie", 0));
        LImage3->setText(QString());
        groupBox_9->setTitle(QApplication::translate("OCRClass", "Edycja", 0));
        groupBox_10->setTitle(QApplication::translate("OCRClass", "Binaryzacja", 0));
        label_11->setText(QApplication::translate("OCRClass", "Element", 0));
        label_12->setText(QApplication::translate("OCRClass", "Rozmiar j\304\205dra", 0));
        groupBox_11->setTitle(QApplication::translate("OCRClass", "Erozja", 0));
        label_14->setText(QApplication::translate("OCRClass", "Element", 0));
        label_13->setText(QApplication::translate("OCRClass", "Rozmiar j\304\205dra", 0));
        groupBox_12->setTitle(QApplication::translate("OCRClass", "Wyb\303\263r zdj\304\231cia", 0));
        L->setText(QApplication::translate("OCRClass", "Lokalizacja zdj\304\231cia", 0));
        BLoadImage3->setText(QApplication::translate("OCRClass", "Za\305\202aduj zdj\304\231cie", 0));
        tabWidget->setTabText(tabWidget->indexOf(tab_3), QApplication::translate("OCRClass", "Przetwarzanie wst\304\231pne", 0));
        groupBox_3->setTitle(QApplication::translate("OCRClass", "Rz\304\205d", 0));
        BLeftImageRow2->setText(QApplication::translate("OCRClass", "<", 0));
        LImageRow2->setText(QString());
        BRightImageRow2->setText(QApplication::translate("OCRClass", ">", 0));
        groupBox_7->setTitle(QApplication::translate("OCRClass", "Pojedyncze znaki", 0));
        BLeftImageCell2->setText(QApplication::translate("OCRClass", "<", 0));
        LImageCell2->setText(QString());
        BRightImageCell2->setText(QApplication::translate("OCRClass", ">", 0));
        groupBox_4->setTitle(QApplication::translate("OCRClass", "Zapis", 0));
        BSaveImages2->setText(QApplication::translate("OCRClass", "Zapisz wyniki", 0));
        tabWidget->setTabText(tabWidget->indexOf(tab_2), QApplication::translate("OCRClass", "Segmentation", 0));
        groupBox_13->setTitle(QApplication::translate("OCRClass", "Pojedyncze znaki", 0));
        BLeftImageCell4->setText(QApplication::translate("OCRClass", "<", 0));
        LImageCell4->setText(QString());
        BRightImageCell4->setText(QApplication::translate("OCRClass", ">", 0));
        groupBox_2->setTitle(QApplication::translate("OCRClass", "Momenty", 0));
        tabWidget->setTabText(tabWidget->indexOf(tab_4), QApplication::translate("OCRClass", "Momenty", 0));
    } // retranslateUi

};

namespace Ui {
    class OCRClass: public Ui_OCRClass {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_OCR_H
