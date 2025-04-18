import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: fracturePage
    title: qsTr("Fracture Guide")
    objectName: "FracturesPage"

    ScrollView {
        anchors.fill: parent
        contentWidth: parent.width
        clip: true

        Column {
            spacing: 32
            width: parent.width * 0.9
            anchors.horizontalCenter: parent.horizontalCenter

            Item {
                width: 1
                height: -22 // This adds dummy margin considering spacing: 32
            }

            Label {
                text: "🦴 " + qsTr("Signs of a Fracture:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Intense pain at the injury site."),
                    qsTr("- Swelling, bruising, or deformity."),
                    qsTr("- Inability to move or bear weight.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "🛑 " + qsTr("What to Do:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("1️⃣ Keep the person still and support the injured area."),
                    qsTr("2️⃣ Apply a splint or padding to immobilize, if trained."),
                    qsTr("3️⃣ Use ice packs wrapped in cloth to reduce swelling."),
                    qsTr("4️⃣ Elevate the injury if possible and keep the person calm."),
                    qsTr("5️⃣ Seek medical attention immediately.")
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
