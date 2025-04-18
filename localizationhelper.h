#ifndef LOCALIZATIONHELPER_H
#define LOCALIZATIONHELPER_H

#include <QObject>
#include <QLocale>

class LocalizationHelper : public QObject
{
    Q_OBJECT
public:
    explicit LocalizationHelper(QObject *parent = nullptr) : QObject(parent) {}

    Q_INVOKABLE QString getLanguageName(const QString &code);
    Q_INVOKABLE QString getSystemLanguageCode();
};

#endif // LOCALIZATIONHELPER_H
