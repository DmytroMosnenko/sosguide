import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: nightCyclingPage
    title: qsTr("Night & Low Visibility Cycling")
    objectName: "NightCyclingPage"

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
                text: "🌙 " + qsTr("Why Visibility is Crucial at Night:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Reduces the risk of accidents due to poor lighting."),
                    qsTr("- Helps motorists and pedestrians see you."),
                    qsTr("- Increases overall road safety.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "🔦 " + qsTr("Essential Night Riding Tips:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Use **bright front and rear lights**."),
                    qsTr("- Wear **reflective clothing** to increase visibility."),
                    qsTr("- Stick to **well-lit roads and bike lanes**."),
                    qsTr("- Avoid sudden turns; signal your movements clearly."),
                    qsTr("- Maintain a **lower speed** for better control.")
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
