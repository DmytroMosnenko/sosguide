#ifndef APPMANAGER_H
#define APPMANAGER_H

#include <QObject>
#include <QtQml>

class AppManager : public QObject {
    Q_OBJECT
    QML_ELEMENT  // Qt 6: автоматически делает класс доступным в QML

public:
    explicit AppManager(QObject *parent = nullptr);
    Q_INVOKABLE void sendSOS();
};

#endif // APPMANAGER_H
