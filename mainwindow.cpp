#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDebug>
#include <QSqlError>
#include <QSqlRecord>
#include <QDate>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent), ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    db = QSqlDatabase::addDatabase("QPSQL");
        db.setHostName("localhost");
        db.setDatabaseName("business");
        db.setUserName("db_user");
        db.setPassword("1q2w3e4r");
        db.setPort(5432);
        if (!db.open()){
            qDebug() << db.lastError().text();
            return;
        } else { qDebug() << "Success";}


    model1 = new QSqlRelationalTableModel(this, db);
    model1->setEditStrategy(QSqlTableModel::OnManualSubmit);
    model1->setTable("supliers");
    model1->select();
    ui->tableView->setModel(model1);
    ui->tableView->resizeColumnToContents(0);
    ui->tableView->resizeColumnToContents(1);
    model1->setHeaderData(1, Qt::Horizontal, tr("Name of supplier"));
    model1->setHeaderData(2, Qt::Horizontal, tr("surname of supplier"));
    ui->tableView->resizeColumnToContents(2);
    ui->tableView->resizeColumnToContents(3);
    model1->setHeaderData(3, Qt::Horizontal, tr("Name of the comapy"));
    ui->tableView->resizeColumnToContents(4);
    model1->setHeaderData(4, Qt::Horizontal, tr("Price"));

    model2 = new QSqlRelationalTableModel(this, db);
    model2->setEditStrategy(QSqlTableModel::OnManualSubmit);
    model2->setTable("timber_supply");
    model2->setRelation(1, QSqlRelation("trees", "id", "name_of_tree"));
    model2->setRelation(2, QSqlRelation("supliers", "id", "name_of_supplier"));
    model2->select();
    ui->tableView_2->setModel(model2);
    ui->tableView_2->setItemDelegate(new QSqlRelationalDelegate(ui->tableView_2));
    ui->tableView_2->setItemDelegate(new QSqlRelationalDelegate(ui->tableView_2));
    ui->tableView_2->resizeColumnToContents(0);
    model2->setHeaderData(1, Qt::Horizontal, tr("Breed of tree"));
    ui->tableView_2->resizeColumnToContents(1);
    model2->setHeaderData(2, Qt::Horizontal, tr("Name of supplier"));
    ui->tableView_2->resizeColumnToContents(2);
    model2->setHeaderData(3, Qt::Horizontal, tr("Date of supply"));
    ui->tableView_2->resizeColumnToContents(3);
    model2->setHeaderData(4, Qt::Horizontal, tr("Volume"));
    ui->tableView_2->resizeColumnToContents(4);


}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_tableView_activated(const QModelIndex &index)
{
    model1->submitAll();
    ui->retranslateUi(this);
    QSqlQuery query1 = QSqlQuery();
    query1.exec("select * from supliers");
    while(query1.next()){
        int id = query1.value(0).toInt();
        QString name_of_supplier = query1.value(1).toString();
        QString surname_of_suplier = query1.value(2).toString();
        QString name_of_company = query1.value(3).toString();
        int price = query1.value(4).toInt();
        qDebug() << id << name_of_supplier << surname_of_suplier << name_of_company << price;
    }
}


void MainWindow::on_tableView_2_activated(const QModelIndex &index)
{
    QSqlQuery query2 = QSqlQuery();
    model2->submitAll();
    query2.exec("select * from timber_supply");
    while(query2.next()){
        int id = query2.value(0).toInt();
        int id_of_tree = query2.value(1).toInt();
        int id_of_supplyer = query2.value(2).toInt();
        QDate date_of_supply = query2.value(3).toDate();
        int volume = query2.value(4).toInt();
        qDebug() << id << id_of_tree << date_of_supply  << id_of_supplyer << volume;
    }
}


void MainWindow::on_pushButton_clicked()
{
    model1->submitAll();
}


void MainWindow::on_pushButton_3_clicked()
{
    model1->insertRow(model1->rowCount());
}


void MainWindow::on_pushButton_14_clicked()
{
    model2->insertRow(model2->rowCount());
}


void MainWindow::on_pushButton_4_clicked()
{

    int selectedRow = ui->tableView->currentIndex().row();
    if(selectedRow >= 0){
        qDebug() << "Deleting row: " << model1->removeRow(selectedRow);
    }else qDebug() << "No row selected";

}


void MainWindow::on_pushButton_13_clicked()
{
    int selectedRow_2 = ui->tableView_2->currentIndex().row();
    if(selectedRow_2 >= 0){
        qDebug() << "Deleting row: " << model2->removeRow(selectedRow_2);
    }else qDebug() << "No row selected";
}


void MainWindow::on_pushButton_16_clicked()
{
    model2->submitAll();
}


void MainWindow::on_pushButton_2_clicked()
{
    model1->revertAll();
}


void MainWindow::on_pushButton_15_clicked()
{
    model2->revertAll();
}


