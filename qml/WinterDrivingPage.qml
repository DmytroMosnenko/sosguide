import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: winterDrivingPage
    title: qsTr("Winter Driving Tips")
    objectName: "WinterDrivingPage"

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
                text: "❄️ " + qsTr("Essential Winter Driving Tips:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Drive slower and increase following distance."),
                    qsTr("- Use winter tires or snow chains for better grip."),
                    qsTr("- Keep headlights on to improve visibility."),
                    qsTr("- Avoid sudden braking or sharp turns."),
                    qsTr("- Carry an emergency kit with blankets, food, and a flashlight."),
                    qsTr("- Never let your fuel tank drop below half full in extreme cold.")
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
