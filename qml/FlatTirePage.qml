import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: flatTirePage
    title: qsTr("Changing a Flat Tire")
    objectName: "FlatTirePage"

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
                text: "🛞 " + qsTr("Steps to Change a Flat Tire:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Park on a flat, stable surface and engage the handbrake."),
                    qsTr("- Loosen the lug nuts before jacking up the car."),
                    qsTr("- Raise the car using a jack at the designated jacking point."),
                    qsTr("- Remove the flat tire and mount the spare."),
                    qsTr("- Tighten the lug nuts in a star pattern."),
                    qsTr("- Lower the car and check the tire pressure.")
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
