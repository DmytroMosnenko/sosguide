import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: sprainsBlistersPage
    title: qsTr("First Aid for Sprains & Blisters")
    objectName: "SprainsBlistersPage"

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
                text: "🩹 " + qsTr("How to Treat Sprains:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Use the RICE method: Rest, Ice, Compression, Elevation."),
                    qsTr("- Apply ice packs (wrapped in a cloth) for 15-20 minutes every few hours."),
                    qsTr("- Wrap the injured area with an elastic bandage to reduce swelling."),
                    qsTr("- Keep the affected limb elevated above heart level."),
                    qsTr("- Avoid putting weight on the sprained joint until pain subsides."),
                    qsTr("- Seek medical attention if swelling or pain worsens.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "👣 " + qsTr("How to Treat Blisters:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Do not pop blisters unless absolutely necessary."),
                    qsTr("- Keep the area clean and covered with a sterile bandage."),
                    qsTr("- If the blister bursts, clean it with antiseptic and apply a soft dressing."),
                    qsTr("- Wear well-fitted shoes and socks to prevent blisters."),
                    qsTr("- Apply blister pads or moleskin for added protection during activities.")
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
