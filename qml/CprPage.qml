import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: cprPage
    title: qsTr("CPR Guide")
    objectName: "CprPage"

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
                text: "🆘 " + qsTr("When to Perform CPR:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- The person is unconscious and not breathing or only gasping."),
                    qsTr("- No pulse detected within 10 seconds."),
                    qsTr("- The person collapses suddenly.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "⚡ " + qsTr("Steps for Performing CPR:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("1️⃣ Check responsiveness – Tap the person and shout, 'Are you okay?'") ,
                    qsTr("2️⃣ Call for help – Dial Emergency Services (e.g., 112/911)."),
                    qsTr("3️⃣ Position the person – Lay them flat on their back on a firm surface."),
                    qsTr("4️⃣ Start chest compressions – Place both hands on the center of the chest, push hard and fast (100-120 per minute)."),
                    qsTr("5️⃣ Give rescue breaths (if trained) – Tilt the head back, lift the chin, and give 2 breaths (each ~1 second)."),
                    qsTr("6️⃣ Continue CPR until emergency responders arrive or the person starts breathing.")
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
