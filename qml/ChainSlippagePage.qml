import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: chainSlippagePage
    title: qsTr("Preventing Chain Slippage")
    objectName: "ChainSlippagePage"

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
                text: "🔧 " + qsTr("Common Causes of Chain Slipping:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Worn-out chain or cassette."),
                    qsTr("- Loose derailleur or incorrect tension."),
                    qsTr("- Dirty or dry chain without lubrication."),
                    qsTr("- Shifting gears under heavy load.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "⚙️ " + qsTr("How to Prevent Chain Issues:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Regularly clean and lubricate the chain."),
                    qsTr("- Adjust derailleur tension properly."),
                    qsTr("- Replace worn-out chains or cassettes."),
                    qsTr("- Avoid shifting gears too aggressively.")
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
