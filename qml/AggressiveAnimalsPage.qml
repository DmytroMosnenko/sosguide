import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: aggressiveAnimalsPage
    title: qsTr("Dealing with Aggressive Animals")
    objectName: "AggressiveAnimalsPage"

    ScrollView {
        anchors.fill: parent
        contentWidth: parent.width
        clip: true

        Column {
            spacing: 32
            width: parent.width * 0.9
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 20

            Item { width: 1; height: -22 }

            Label {
                text: "🐕 " + qsTr("How to Handle Aggressive Animals:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Stay calm and avoid making sudden movements."),
                    qsTr("- Do not run—this can trigger a chase instinct."),
                    qsTr("- Maintain eye contact but do not stare aggressively."),
                    qsTr("- Speak in a firm, calm voice."),
                    qsTr("- Slowly back away while keeping the animal in sight."),
                    qsTr("- If attacked, use an object to create a barrier (backpack, stick)."),
                    qsTr("- Seek medical attention if bitten or scratched to prevent infection.")
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
