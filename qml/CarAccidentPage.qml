import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: carAccidentPage
    title: qsTr("What to Do in a Car Accident")
    objectName: "CarAccidentPage"

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
                text: "🚗 " + qsTr("Steps After a Car Accident:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Stay calm and check for injuries."),
                    qsTr("- Move to a safe location if possible."),
                    qsTr("- Call emergency services (112/911)."),
                    qsTr("- Exchange information with other drivers."),
                    qsTr("- Take photos of the scene and damages."),
                    qsTr("- Report the accident to the insurance company.")
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
