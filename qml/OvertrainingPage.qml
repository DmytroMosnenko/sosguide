import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: overtrainingPage
    title: qsTr("Recognizing & Managing Overtraining")
    objectName: "OvertrainingPage"

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
                text: "⚠️ " + qsTr("Signs of Overtraining:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Persistent muscle soreness and fatigue."),
                    qsTr("- Decline in performance despite training harder."),
                    qsTr("- Increased resting heart rate and blood pressure."),
                    qsTr("- Difficulty sleeping or feeling restless."),
                    qsTr("- Mood swings, irritability, or lack of motivation."),
                    qsTr("- More frequent colds, infections, or injuries."),
                    qsTr("- Loss of appetite or unexpected weight changes.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "🛑 " + qsTr("How to Recover from Overtraining:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Reduce training intensity and allow rest days."),
                    qsTr("- Get enough sleep (7-9 hours per night)."),
                    qsTr("- Maintain a balanced diet with enough protein and carbs."),
                    qsTr("- Stay hydrated and avoid excessive caffeine."),
                    qsTr("- Include active recovery like yoga or light stretching."),
                    qsTr("- Listen to your body and seek medical advice if needed.")
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
