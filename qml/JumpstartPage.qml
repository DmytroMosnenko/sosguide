import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: jumpstartPage
    title: qsTr("Jumpstarting a Car Battery")
    objectName: "JumpstartPage"

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
                text: "🔋 " + qsTr("Steps to Jumpstart a Car:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Park both cars facing each other and turn off engines."),
                    qsTr("- Attach red clamp to the dead battery’s positive terminal."),
                    qsTr("- Attach the other red clamp to the donor battery’s positive terminal."),
                    qsTr("- Attach black clamp to the donor battery’s negative terminal."),
                    qsTr("- Attach the other black clamp to an unpainted metal surface on the dead car."),
                    qsTr("- Start the donor car, wait a few minutes, then start the dead car.")
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
