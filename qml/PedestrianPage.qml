import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: pedestrianSafetyPage
    title: qsTr("Pedestrian Road Safety")
    objectName: "PedestrianPage"

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
                text: "🚶‍♂️ " + qsTr("Key Pedestrian Safety Tips:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Always use sidewalks or designated walking paths."),
                    qsTr("- Cross at marked crosswalks and obey pedestrian signals."),
                    qsTr("- Look left, right, and left again before crossing."),
                    qsTr("- Avoid distractions like texting or wearing headphones while walking."),
                    qsTr("- Wear reflective clothing at night for better visibility."),
                    qsTr("- Be aware of vehicles backing up in driveways or parking lots."),
                    qsTr("- Walk against traffic when sidewalks are unavailable.")
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
