import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: firstAidPage
    title: qsTr("First Aid")
    objectName: "FirstAidPage"

    ListView {
        id: listView
        anchors.fill: parent
        model: ListModel {
            ListElement { title: qsTr("Burns") }
            ListElement { title: qsTr("Choking") }
            ListElement { title: qsTr("Heart Attack") }
            ListElement { title: qsTr("Fractures") }
            ListElement { title: qsTr("Bleeding") }
        }

        delegate: ItemDelegate {
            width: parent.width
            text: model.title
            onClicked: stackView.push("FirstAidDetailPage.qml", { topic: model.title })
        }
    }
}
