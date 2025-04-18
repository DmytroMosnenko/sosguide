import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: dehydrationPreventionPage
    title: qsTr("Preventing Dehydration & Heatstroke")
    objectName: "DehydrationPage"

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
                text: "💧 " + qsTr("Tips to Stay Hydrated & Avoid Heatstroke:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Drink water regularly, even if you don't feel thirsty."),
                    qsTr("- Avoid excessive caffeine or alcohol in hot weather."),
                    qsTr("- Wear light-colored, breathable clothing."),
                    qsTr("- Take breaks in the shade or indoors when outdoors for long periods."),
                    qsTr("- Recognize symptoms like dizziness, confusion, and excessive sweating."),
                    qsTr("- Avoid strenuous activity during peak heat hours (10 AM - 4 PM)."),
                    qsTr("- Use a hat and sunscreen for extra protection.")
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
