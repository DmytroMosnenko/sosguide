import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: detailPage
    property string topic: ""
    objectName: "FirstAidDetailPage"

    title: topic

    header: ToolBar {
        Row {
            anchors.fill: parent
            spacing: 10

            ToolButton {
                text: "←"
                onClicked: stackView.pop()
            }

            Label {
                text: topic
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

    ScrollView {
        anchors.fill: parent

        Text {
            width: parent.width - 20
            anchors.horizontalCenter: parent.horizontalCenter
            wrapMode: Text.WordWrap
            text: qsTr("Detailed first aid instructions for: ") + topic
        }
    }
}
