#include "offlinetranslator.h"

#ifdef Q_OS_ANDROID
#include <QtCore/QJniObject>
#include <QtCore/private/qandroidextras_p.h>
#endif

OfflineTranslatorHelper *OfflineTranslatorHelper::instance = nullptr;

OfflineTranslatorHelper::OfflineTranslatorHelper(QObject *parent) : QObject(parent) {
    instance = this;
}

void OfflineTranslatorHelper::getSupportedLanguages()
{
    QJniObject javaClass("org/amidlab/OfflineTranslatorHelper");
    jlong callbackId = reinterpret_cast<jlong>(this);
    javaClass.callStaticMethod<void>(
        "org/amidlab/OfflineTranslatorHelper",
         "fetchSupportedLanguages",
         "(J)V",
         callbackId);
}

void OfflineTranslatorHelper::translateText(const QString &text, const QString& dstLangCode)
{
    QJniObject javaTextToTranslate = QJniObject::fromString(text);
    QJniObject javaSrcLangCodeText = QJniObject::fromString("auto");
    QJniObject javaDstLangCodeText = QJniObject::fromString(dstLangCode);

    jlong callbackPtr = reinterpret_cast<jlong>(this);

    QJniObject::callStaticMethod<void>(
        "org/amidlab/OfflineTranslatorHelper",
        "translateText",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V",
        javaTextToTranslate.object<jstring>(),
        javaSrcLangCodeText.object<jstring>(),
        javaDstLangCodeText.object<jstring>(),
        callbackPtr
        );
}

// JNI callback function (Progress)
void OfflineTranslatorHelper::onProgress(JNIEnv *env, jobject, jlong callbackPtr, jstring message) {
    Q_UNUSED(env);

    if (callbackPtr) {
        OfflineTranslatorHelper *helper = reinterpret_cast<OfflineTranslatorHelper *>(callbackPtr);
        if (helper) {
            QJniObject javaStr(message);
            QString result = javaStr.toString();
            emit helper->translationProgress(result);
        }
    }
}

// JNI callback function (LanguageDetected)
void OfflineTranslatorHelper::onLanguageDetected(JNIEnv *env, jobject, jlong callbackPtr, jstring langCode) {
    Q_UNUSED(env);

    if (callbackPtr) {
        OfflineTranslatorHelper *helper = reinterpret_cast<OfflineTranslatorHelper *>(callbackPtr);
        if (helper) {
            QJniObject javaStr(langCode);
            QString result = javaStr.toString();
            emit helper->translationLanguageDetected(result);
        }
    }
}

// JNI callback function (Success)
void OfflineTranslatorHelper::onSuccess(JNIEnv *env, jobject, jlong callbackPtr, jstring translatedText) {
    Q_UNUSED(env);

    if (callbackPtr) {
        OfflineTranslatorHelper *helper = reinterpret_cast<OfflineTranslatorHelper *>(callbackPtr);
        if (helper) {
            QJniObject javaStr(translatedText);
            QString result = javaStr.toString();
            emit helper->translationSuccess(result);
        }
    }
}

// JNI callback function (Failure)
void OfflineTranslatorHelper::onFailure(JNIEnv *env, jobject, jlong callbackPtr, jstring errorMessage) {
    Q_UNUSED(env);

    if (callbackPtr) {
        OfflineTranslatorHelper *helper = reinterpret_cast<OfflineTranslatorHelper *>(callbackPtr);
        if (helper) {
            QJniObject javaStr(errorMessage);
            QString error = javaStr.toString();
            emit helper->translationFailed(error);
        }
    }
}

// Register JNI functions
extern "C" {
JNIEXPORT void JNICALL Java_org_amidlab_OfflineTranslatorHelper_nativeOnLanguagesRetrieved(JNIEnv* env, jobject, jlong callbackId, jobjectArray languages) {
    auto* helper = reinterpret_cast<OfflineTranslatorHelper*>(callbackId);
    QStringList langList;

    int len = env->GetArrayLength(languages);
    for (int i = 0; i < len; i++) {
        jstring jLang = (jstring) env->GetObjectArrayElement(languages, i);
        const char* langStr = env->GetStringUTFChars(jLang, nullptr);
        langList.append(QString::fromUtf8(langStr));
        env->ReleaseStringUTFChars(jLang, langStr);
    }

    emit helper->languagesRetrieved(langList);
}

JNIEXPORT void JNICALL Java_org_amidlab_OfflineTranslatorHelper_nativeOnProgress(JNIEnv *env, jobject obj, jlong callbackPtr, jstring message) {
    OfflineTranslatorHelper::onProgress(env, obj, callbackPtr, message);
}

JNIEXPORT void JNICALL Java_org_amidlab_OfflineTranslatorHelper_nativeOnLanguageDetected(JNIEnv *env, jobject obj, jlong callbackPtr, jstring langCode) {
    OfflineTranslatorHelper::onLanguageDetected(env, obj, callbackPtr, langCode);
}

JNIEXPORT void JNICALL Java_org_amidlab_OfflineTranslatorHelper_nativeOnSuccess(JNIEnv *env, jobject obj, jlong callbackPtr, jstring translatedText) {
    OfflineTranslatorHelper::onSuccess(env, obj, callbackPtr, translatedText);
}

JNIEXPORT void JNICALL Java_org_amidlab_OfflineTranslatorHelper_nativeOnFailure(JNIEnv *env, jobject obj, jlong callbackPtr, jstring errorMessage) {
    OfflineTranslatorHelper::onFailure(env, obj, callbackPtr, errorMessage);
}
}
