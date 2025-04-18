import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: brakeFailurePage
    title: qsTr("Brake Failure Response")
    objectName: "BrakeFailurePage"

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
                text: "🚨 " + qsTr("What to Do if Your Brakes Fail:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Stay calm and remove your foot from the accelerator."),
                    qsTr("- Pump the brake pedal rapidly to build pressure."),
                    qsTr("- Downshift to a lower gear to slow the car."),
                    qsTr("- Use the parking brake gradually to prevent skidding."),
                    qsTr("- Look for a safe place to stop, such as an open shoulder."),
                    qsTr("- If necessary, use a soft crash barrier (bushes, guardrails) to slow down.")
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
