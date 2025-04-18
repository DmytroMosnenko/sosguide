#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "appmanager.h"
#include "backbuttonfilter.h"
#include "emergencycallhelper.h"
#include "offlinetranslator.h"
#include "localizationhelper.h"
#include "admobhelper.h"


int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    BackButtonFilter backButtonFilter;
    app.installEventFilter(&backButtonFilter);

    EmergencyCallHelper emergencyHelper;
    engine.rootContext()->setContextProperty("emergencyHelper", &emergencyHelper);

    OfflineTranslatorHelper offlineTranslatorHelper;
    engine.rootContext()->setContextProperty("offlineTranslatorHelper", &offlineTranslatorHelper);

    LocalizationHelper localizationHelper;
    engine.rootContext()->setContextProperty("LocalizationHelper", &localizationHelper);

    AdMobHelper adMobHelper;
    engine.rootContext()->setContextProperty("adMobHelper", &adMobHelper);

    // Register C++ class for QML
    qmlRegisterType<AppManager>("org.amidlab.sosguide", 1, 0, "AppManager");

    engine.rootContext()->setContextProperty("backButtonFilter", &backButtonFilter);
    engine.load(QUrl(QStringLiteral("qrc:/qml/Main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
