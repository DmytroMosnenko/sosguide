import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: brakingPage
    title: qsTr("Braking Techniques & Control")
    objectName: "BrakingPage"

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
                text: "🛑 " + qsTr("Why Proper Braking Matters:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Prevents skidding and loss of control."),
                    qsTr("- Reduces the risk of sudden stops leading to falls."),
                    qsTr("- Helps in handling emergency stops effectively.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "🚲 " + qsTr("Key Braking Techniques:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Use both front and rear brakes for balanced stopping."),
                    qsTr("- Avoid squeezing the front brake too hard to prevent flipping over."),
                    qsTr("- Feather the brakes on wet or slippery surfaces."),
                    qsTr("- Apply brakes gradually when going downhill."),
                    qsTr("- Keep fingers ready to react in emergencies.")
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
