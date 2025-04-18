import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: carFirePage
    title: qsTr("Car Fire Safety")
    objectName: "CarFirePage"

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
                text: "🔥 " + qsTr("What to Do in a Car Fire:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Pull over immediately and turn off the engine."),
                    qsTr("- Get everyone out of the car quickly."),
                    qsTr("- Move at least 30 meters (100 feet) away from the vehicle."),
                    qsTr("- Call emergency services immediately."),
                    qsTr("- Never open the hood if smoke is coming from the engine."),
                    qsTr("- Use a fire extinguisher (Class B or C) if available and safe to do so.")
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
