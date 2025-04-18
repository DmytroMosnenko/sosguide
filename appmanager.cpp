#include "appmanager.h"
#include <QDebug>

AppManager::AppManager(QObject *parent) : QObject(parent) {}

void AppManager::sendSOS() {
    qDebug() << "SOS сигнал отправлен!";
    // Здесь можно добавить вызов API для отправки SMS или звонка
}
