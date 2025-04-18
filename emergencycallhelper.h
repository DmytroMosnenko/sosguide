#ifndef EMERGENCYCALLHELPER_H
#define EMERGENCYCALLHELPER_H

#include <QObject>

class EmergencyCallHelper : public QObject
{
    Q_OBJECT

public:
    explicit EmergencyCallHelper(QObject *parent = nullptr);

    Q_INVOKABLE void callEmergencyNumber();
};

#endif // EMERGENCYCALLHELPER_H
