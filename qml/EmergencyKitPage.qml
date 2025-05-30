import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: emergencyKitPage
    title: qsTr("Essential Emergency Kit")
    objectName: "EmergencyKitPage"

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
                text: "🎒 " + qsTr("What to Keep in Your Car Emergency Kit:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- First aid kit with bandages and antiseptic."),
                    qsTr("- Flashlight with spare batteries."),
                    qsTr("- Jumper cables and a tire repair kit."),
                    qsTr("- Bottled water and non-perishable snacks."),
                    qsTr("- Blankets and extra warm clothing."),
                    qsTr("- Reflective triangle and warning flares."),
                    qsTr("- Multi-tool or basic toolset."),
                    qsTr("- Phone charger and power bank.")
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
