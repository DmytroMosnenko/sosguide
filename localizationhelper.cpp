#include "localizationhelper.h"


QString LocalizationHelper::getLanguageName(const QString &code)
{
    return QLocale(code).nativeLanguageName();
}

QString LocalizationHelper::getSystemLanguageCode()
{
    return QLocale::languageToCode(QLocale().language());
}
