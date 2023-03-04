#include "mainwindow.h"
#include <QLibraryInfo>
#include <QApplication>
#include <QDebug>
#include <QDir>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    QTranslator qtTranslator;
    if(!(qtTranslator.load("C:/Users/PEREC/Desktop/QtProjects/Test/QtLanguage_.qm"))){
        qDebug() << QDir::currentPath();
    } else { qDebug() << "Translation load";
        qApp->installTranslator(&qtTranslator);
    }

    MainWindow w;
    w.show();
    return a.exec();
}
