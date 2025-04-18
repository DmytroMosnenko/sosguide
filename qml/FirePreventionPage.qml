import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: firePreventionPage
    title: qsTr("Fire Prevention & Extinguishing")
    objectName: "FirePreventionPage"

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
                text: "🔥 " + qsTr("Fire Prevention Tips:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Never leave cooking unattended."),
                    qsTr("- Keep flammable objects away from heat sources."),
                    qsTr("- Regularly check electrical wiring for faults."),
                    qsTr("- Install smoke detectors and check batteries monthly."),
                    qsTr("- Have a fire extinguisher in accessible locations.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "🧯 " + qsTr("How to Extinguish a Fire:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("1️⃣ Assess the fire type before attempting to put it out."),
                    qsTr("2️⃣ Use a fire extinguisher if available – Aim at the base of the fire."),
                    qsTr("3️⃣ Never use water on electrical or grease fires."),
                    qsTr("4️⃣ If the fire spreads quickly, evacuate immediately and call emergency services."),
                    qsTr("5️⃣ Close doors behind you to slow the fire’s spread.")
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
