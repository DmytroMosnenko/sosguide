import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: evacuationPage
    title: qsTr("Emergency Evacuation Plan")
    objectName: "EvacuationPage"

    ScrollView {
        anchors.fill: parent
        contentWidth: parent.width
        clip: true

        Column {
            spacing: 32
            width: parent.width * 0.9
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 20

            Item {
                width: 1
                height: -22
            }

            Label {
                text: "🚨 " + qsTr("Steps to Create an Emergency Plan:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Identify the nearest exits in every room."),
                    qsTr("- Establish a family emergency meeting spot."),
                    qsTr("- Practice evacuation drills regularly."),
                    qsTr("- Keep emergency supplies (flashlights, first aid kit, etc.)."),
                    qsTr("- Teach children how to dial emergency services.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }
        }
    }
}
