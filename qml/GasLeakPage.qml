import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: gasLeakPage
    title: qsTr("Gas Leak Precautions")
    objectName: "GasLeakPage"

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
                height: -22 // This adds dummy margin considering spacing: 32
            }

            Label {
                text: "🛑 " + qsTr("Gas Leak Warning Signs:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Smell of rotten eggs or sulfur."),
                    qsTr("- Hissing or whistling sound near a gas line."),
                    qsTr("- Dead or discolored vegetation near gas pipes.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "⚠️ " + qsTr("What to Do If You Suspect a Gas Leak:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("1️⃣ Leave the area immediately."),
                    qsTr("2️⃣ Do not use electrical switches, lighters, or phones inside the building."),
                    qsTr("3️⃣ Call the gas company or emergency services from a safe distance."),
                    qsTr("4️⃣ If safe, open doors and windows to ventilate.")
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
