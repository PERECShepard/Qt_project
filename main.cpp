#include "mainwindow.h"
#include <QLibraryInfo>
#include <QApplication>
#include <QDebug>
#include <QDir>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    QTranslator qtTranslator;
    if(!(qtTranslator.load(QString("QtLanguage_.qm")))){
        qDebug() << QDir::currentPath();
    } else {qApp->installTranslator(&qtTranslator);}

    MainWindow w;
    w.show();
    return a.exec();
}
