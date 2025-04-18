import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: tirePuncturePage
    title: qsTr("Handling Tire Punctures")
    objectName: "TirePuncturePage"

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
                text: "🚲 " + qsTr("Common Causes of Tire Punctures:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Sharp objects like glass, nails, or thorns."),
                    qsTr("- Low tire pressure causing pinch flats."),
                    qsTr("- Worn-out tires that lack protection."),
                    qsTr("- Improperly installed inner tubes.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "🛠️ " + qsTr("How to Fix a Flat Tire:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("1️⃣ Remove the wheel and locate the puncture."),
                    qsTr("2️⃣ Use tire levers to take out the inner tube."),
                    qsTr("3️⃣ Patch the hole or replace the tube."),
                    qsTr("4️⃣ Inflate the tube and check for leaks."),
                    qsTr("5️⃣ Reassemble the tire and reattach the wheel."),
                    qsTr("6️⃣ Check pressure before riding again.")
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
