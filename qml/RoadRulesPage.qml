import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: roadRulesPage
    title: qsTr("Road Rules & Hand Signals")
    objectName: "RoadRulesPage"

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
                text: "🚴 " + qsTr("Basic Cycling Rules:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Always ride in the direction of traffic."),
                    qsTr("- Obey traffic lights and signs."),
                    qsTr("- Use bike lanes whenever possible."),
                    qsTr("- Yield to pedestrians and avoid sidewalks."),
                    qsTr("- Never ride while distracted or using a phone.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "✋ " + qsTr("Essential Hand Signals:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("✋ Left turn – Extend left arm straight out."),
                    qsTr("🤚 Right turn – Extend right arm straight out or left arm bent upwards."),
                    qsTr("🛑 Stop – Extend left arm downward."),
                    qsTr("👋 Signal lane change – Wave arm slightly before moving.")
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
