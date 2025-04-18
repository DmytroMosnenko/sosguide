#ifndef BACKBUTTONFILTER_H
#define BACKBUTTONFILTER_H

#include <QKeyEvent>
#include <QDebug>

class BackButtonFilter : public QObject
{
    Q_OBJECT

public:
    explicit BackButtonFilter(QObject *parent = nullptr) : QObject(parent) {}

protected:
    bool eventFilter(QObject *obj, QEvent *event) override;

signals:
    void backPressed();
};
#endif // BACKBUTTONFILTER_H
