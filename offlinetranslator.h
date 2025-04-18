#ifndef OFFLINETRANSLATOR_H
#define OFFLINETRANSLATOR_H

#include <QObject>

#ifdef Q_OS_ANDROID
#include <QtCore/QJniEnvironment>
#endif

class OfflineTranslatorHelper : public QObject
{
    Q_OBJECT
public:
    OfflineTranslatorHelper(QObject* parent = nullptr);

    // void initialize(const QString &sourceLang, const QString &targetLang);

    Q_INVOKABLE void getSupportedLanguages();
    Q_INVOKABLE void translateText(const QString& text, const QString& dstLangCode);

    // Callback function that will receive the translation result
    static void onProgress(JNIEnv *env, jobject obj, jlong callbackPtr, jstring message);
    static void onLanguageDetected(JNIEnv *env, jobject obj, jlong callbackPtr, jstring langCode);
    static void onSuccess(JNIEnv *env, jobject obj, jlong callbackPtr, jstring translatedText);
    static void onFailure(JNIEnv *env, jobject obj, jlong callbackPtr, jstring errorMessage);

signals:
    void languagesRetrieved(QStringList langList);
    void translationProgress(QString message);
    void translationLanguageDetected(QString langCode);
    void translationSuccess(QString translatedText);
    void translationFailed(QString error);

private:
    static OfflineTranslatorHelper *instance;
};

#endif // OFFLINETRANSLATOR_H
