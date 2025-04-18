#include "emergencycallhelper.h"

#ifdef Q_OS_ANDROID
#include <QtCore/QJniObject>
#include <QtCore/QJniEnvironment>
#include <QtCore/private/qandroidextras_p.h>
#endif

EmergencyCallHelper::EmergencyCallHelper(QObject *parent) : QObject(parent) {}

void EmergencyCallHelper::callEmergencyNumber()
{
#ifdef Q_OS_ANDROID
    QJniObject actionDial = QJniObject::fromString("android.intent.action.DIAL");
    QJniObject number = QJniObject::callStaticObjectMethod(
        "android/net/Uri",
        "parse",
        "(Ljava/lang/String;)Landroid/net/Uri;",
        QJniObject::fromString("tel:112").object()
        );

    QJniObject intent("android/content/Intent",
                      "(Ljava/lang/String;Landroid/net/Uri;)V",
                      actionDial.object(),
                      number.object());

    QJniObject activity = QJniObject::callStaticObjectMethod(
        "org/qtproject/qt/android/QtNative",
        "activity",
        "()Landroid/app/Activity;"
        );

    activity.callMethod<void>(
        "startActivity",
        "(Landroid/content/Intent;)V",
        intent.object()
        );
#endif
}
