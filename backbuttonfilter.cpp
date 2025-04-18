#include "backbuttonfilter.h"

bool BackButtonFilter::eventFilter(QObject *obj, QEvent *event) {
    if (event->type() == QEvent::KeyPress) {
        QKeyEvent *keyEvent = static_cast<QKeyEvent *>(event);
        if (keyEvent->key() == Qt::Key_Back) {
            emit backPressed();
            return true; // Consume the event
        }
    }
    return QObject::eventFilter(obj, event);
}
