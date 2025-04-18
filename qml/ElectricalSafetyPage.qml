import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: electricalSafetyPage
    title: qsTr("Electrical Safety")
    objectName: "ElectricalSafetyPage"

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
                text: "⚡ " + qsTr("Electrical Safety Tips:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Do not overload power outlets."),
                    qsTr("- Keep electrical appliances away from water."),
                    qsTr("- Replace frayed or damaged cords immediately."),
                    qsTr("- Use surge protectors for sensitive electronics.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "🚨 " + qsTr("What to Do in an Electrical Emergency:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("1️⃣ If someone is electrocuted, do not touch them—turn off power first."),
                    qsTr("2️⃣ Call emergency services immediately."),
                    qsTr("3️⃣ Use a wooden stick or rubber gloves to move a person away from the source if necessary."),
                    qsTr("4️⃣ Never use water to extinguish an electrical fire—use a Class C extinguisher.")
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
