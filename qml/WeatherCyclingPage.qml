import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: weatherCyclingPage
    title: qsTr("Riding in Different Weather Conditions")
    objectName: "WeatherCyclingPage"

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
                text: "🌦️ " + qsTr("Tips for Cycling in Various Weather Conditions:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("☔ Rain – Use fenders and waterproof clothing."),
                    qsTr("💨 Wind – Lower your posture to reduce resistance."),
                    qsTr("❄️ Snow – Ride with wider tires and reduce speed."),
                    qsTr("🌡️ Heat – Stay hydrated and wear light clothing."),
                    qsTr("🌫️ Fog – Use bright lights and avoid high-speed roads.")
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
