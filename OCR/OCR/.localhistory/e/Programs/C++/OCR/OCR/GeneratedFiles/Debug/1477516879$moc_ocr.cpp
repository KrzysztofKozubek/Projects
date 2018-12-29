/****************************************************************************
** Meta object code from reading C++ file 'ocr.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.6.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../ocr.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ocr.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.6.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_OCR_t {
    QByteArrayData data[22];
    char stringdata0[386];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_OCR_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_OCR_t qt_meta_stringdata_OCR = {
    {
QT_MOC_LITERAL(0, 0, 3), // "OCR"
QT_MOC_LITERAL(1, 4, 25), // "changeContrasOrBrightness"
QT_MOC_LITERAL(2, 30, 0), // ""
QT_MOC_LITERAL(3, 31, 6), // "rotate"
QT_MOC_LITERAL(4, 38, 13), // "confirmChange"
QT_MOC_LITERAL(5, 52, 9), // "loadImage"
QT_MOC_LITERAL(6, 62, 9), // "saveImage"
QT_MOC_LITERAL(7, 72, 10), // "loadImage2"
QT_MOC_LITERAL(8, 83, 19), // "changeBinaryOrErode"
QT_MOC_LITERAL(9, 103, 21), // "SegmentationLoadImage"
QT_MOC_LITERAL(10, 125, 21), // "SegmentationSaveImage"
QT_MOC_LITERAL(11, 147, 15), // "SegmentationRow"
QT_MOC_LITERAL(12, 163, 3), // "Mat"
QT_MOC_LITERAL(13, 167, 5), // "image"
QT_MOC_LITERAL(14, 173, 16), // "SegmentationCell"
QT_MOC_LITERAL(15, 190, 33), // "SegmentationIncreaseIndexImag..."
QT_MOC_LITERAL(16, 224, 31), // "SegmentationReduceIndexImageRow"
QT_MOC_LITERAL(17, 256, 34), // "SegmentationIncreaseIndexImag..."
QT_MOC_LITERAL(18, 291, 32), // "SegmentationReduceIndexImageCell"
QT_MOC_LITERAL(19, 324, 24), // "SegmentationLoadImageRow"
QT_MOC_LITERAL(20, 349, 25), // "SegmentationLoadImageCell"
QT_MOC_LITERAL(21, 375, 10) // "saveEffect"

    },
    "OCR\0changeContrasOrBrightness\0\0rotate\0"
    "confirmChange\0loadImage\0saveImage\0"
    "loadImage2\0changeBinaryOrErode\0"
    "SegmentationLoadImage\0SegmentationSaveImage\0"
    "SegmentationRow\0Mat\0image\0SegmentationCell\0"
    "SegmentationIncreaseIndexImageRow\0"
    "SegmentationReduceIndexImageRow\0"
    "SegmentationIncreaseIndexImageCell\0"
    "SegmentationReduceIndexImageCell\0"
    "SegmentationLoadImageRow\0"
    "SegmentationLoadImageCell\0saveEffect"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_OCR[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      18,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,  104,    2, 0x0a /* Public */,
       3,    0,  105,    2, 0x0a /* Public */,
       4,    0,  106,    2, 0x0a /* Public */,
       5,    0,  107,    2, 0x0a /* Public */,
       6,    0,  108,    2, 0x0a /* Public */,
       7,    0,  109,    2, 0x0a /* Public */,
       8,    0,  110,    2, 0x0a /* Public */,
       9,    0,  111,    2, 0x0a /* Public */,
      10,    0,  112,    2, 0x0a /* Public */,
      11,    1,  113,    2, 0x0a /* Public */,
      14,    1,  116,    2, 0x0a /* Public */,
      15,    0,  119,    2, 0x0a /* Public */,
      16,    0,  120,    2, 0x0a /* Public */,
      17,    0,  121,    2, 0x0a /* Public */,
      18,    0,  122,    2, 0x0a /* Public */,
      19,    0,  123,    2, 0x0a /* Public */,
      20,    0,  124,    2, 0x0a /* Public */,
      21,    0,  125,    2, 0x0a /* Public */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 12,   13,
    QMetaType::Void, 0x80000000 | 12,   13,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void OCR::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        OCR *_t = static_cast<OCR *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->changeContrasOrBrightness(); break;
        case 1: _t->rotate(); break;
        case 2: _t->confirmChange(); break;
        case 3: _t->loadImage(); break;
        case 4: _t->saveImage(); break;
        case 5: _t->loadImage2(); break;
        case 6: _t->changeBinaryOrErode(); break;
        case 7: _t->SegmentationLoadImage(); break;
        case 8: _t->SegmentationSaveImage(); break;
        case 9: _t->SegmentationRow((*reinterpret_cast< Mat(*)>(_a[1]))); break;
        case 10: _t->SegmentationCell((*reinterpret_cast< Mat(*)>(_a[1]))); break;
        case 11: _t->SegmentationIncreaseIndexImageRow(); break;
        case 12: _t->SegmentationReduceIndexImageRow(); break;
        case 13: _t->SegmentationIncreaseIndexImageCell(); break;
        case 14: _t->SegmentationReduceIndexImageCell(); break;
        case 15: _t->SegmentationLoadImageRow(); break;
        case 16: _t->SegmentationLoadImageCell(); break;
        case 17: _t->saveEffect(); break;
        default: ;
        }
    }
}

const QMetaObject OCR::staticMetaObject = {
    { &QMainWindow::staticMetaObject, qt_meta_stringdata_OCR.data,
      qt_meta_data_OCR,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *OCR::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *OCR::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_OCR.stringdata0))
        return static_cast<void*>(const_cast< OCR*>(this));
    return QMainWindow::qt_metacast(_clname);
}

int OCR::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 18)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 18;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 18)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 18;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
