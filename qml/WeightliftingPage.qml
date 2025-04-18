import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: weightliftingPage
    title: qsTr("Weightlifting Safety")
    objectName: "WeightliftingPage"

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
                text: "🏋️ " + qsTr("Essential Weightlifting Safety Tips:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Use proper form to prevent injuries."),
                    qsTr("- Start with lighter weights to learn technique."),
                    qsTr("- Always warm up before lifting."),
                    qsTr("- Don't hold your breath; exhale during exertion."),
                    qsTr("- Use a spotter for heavy lifts."),
                    qsTr("- Never drop weights; lower them safely."),
                    qsTr("- Rest between sets to avoid fatigue."),
                    qsTr("- Listen to your body and stop if you feel pain.")
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
