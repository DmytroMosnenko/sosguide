#include "admobhelper.h"

#ifdef Q_OS_ANDROID
#include <QtCore/QJniObject>
#include <QtCore/private/qandroidextras_p.h>
#endif

AdMobHelper::AdMobHelper(QObject *parent) : QObject(parent) {}

void AdMobHelper::loadBannerAd(const QString &adUnitId) {
    QJniObject javaActivity = QNativeInterface::QAndroidApplication::context();
    if (!javaActivity.isValid()) return;

    QJniObject javaAdUnitId = QJniObject::fromString(adUnitId);
    QJniObject admobHelper("org/amidlab/AdMobHelper",
                           "(Landroid/app/Activity;)V",
                           javaActivity.object<jobject>());

    jlong callbackPtr = reinterpret_cast<jlong>(this);

    admobHelper.callMethod<void>("loadBannerAd",
                                 "(Ljava/lang/String;J)V",
                                 javaAdUnitId.object<jstring>(),
                                 callbackPtr);
}


// JNI callback function (onBannerLoaded)
void AdMobHelper::onAdLoaded(JNIEnv *env, jobject, jlong callbackPtr)
{
    Q_UNUSED(env);

    if (callbackPtr) {
        AdMobHelper *helper = reinterpret_cast<AdMobHelper *>(callbackPtr);
        if (helper) {
            emit helper->adLoaded();
        }
    }
}


// Register JNI functions
extern "C" {

JNIEXPORT void JNICALL Java_org_amidlab_AdMobHelper_nativeOnBannerLoaded(JNIEnv *env, jobject obj, jlong callbackPtr) {
    AdMobHelper::onAdLoaded(env, obj, callbackPtr);
}

}
