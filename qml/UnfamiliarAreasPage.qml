import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: unfamiliarAreasPage
    title: qsTr("Navigating Unfamiliar Areas Safely")
    objectName: "UnfamiliarAreasPage"

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
                text: "🗺️ " + qsTr("Tips for Exploring New Areas Safely:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Plan your route in advance using maps or navigation apps."),
                    qsTr("- Stay in well-lit, populated areas and avoid isolated shortcuts."),
                    qsTr("- Be cautious of strangers offering unsolicited assistance."),
                    qsTr("- Carry emergency contacts and know the local emergency numbers."),
                    qsTr("- Keep your valuables secure and avoid displaying expensive items."),
                    qsTr("- Trust your instincts—leave an area if you feel unsafe."),
                    qsTr("- Inform a friend or family member of your location and expected return time.")
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
