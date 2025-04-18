#ifndef ADMOBHELPER_H
#define ADMOBHELPER_H

#include <QObject>

#ifdef Q_OS_ANDROID
#include <QtCore/QJniEnvironment>
#endif

class AdMobHelper : public QObject {
    Q_OBJECT
public:
    explicit AdMobHelper(QObject *parent = nullptr);
    Q_INVOKABLE void loadBannerAd(const QString &adUnitId);

    // Callback function that will receive the translation result
    static void onAdLoaded(JNIEnv *env, jobject obj, jlong callbackPtr);

signals:
    void adLoaded();
};

#endif // ADMOBHELPER_H
