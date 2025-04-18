import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: nightWalkingSafetyPage
    title: qsTr("Walking Safely at Night")
    objectName: "NightWalkingPage"

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
                text: "🌙 " + qsTr("Tips for Nighttime Walking Safety:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Wear bright or reflective clothing."),
                    qsTr("- Carry a flashlight or use a phone light if needed."),
                    qsTr("- Stay on well-lit streets and avoid dark alleys."),
                    qsTr("- Walk with a companion when possible."),
                    qsTr("- Be extra cautious at intersections."),
                    qsTr("- Avoid using headphones to stay alert to your surroundings."),
                    qsTr("- Trust your instincts—if something feels unsafe, change your route.")
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
