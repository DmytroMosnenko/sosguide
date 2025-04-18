import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: bleedingPage
    title: qsTr("Bleeding Control Guide")
    objectName: "BleedingPage"

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
                text: "🩸 " + qsTr("When to Control Bleeding:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- The wound is deep or bleeding heavily."),
                    qsTr("- Blood is spurting out (possible arterial bleeding)."),
                    qsTr("- Bleeding does not stop after 10 minutes of firm pressure.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "🆘 " + qsTr("Steps for Controlling Bleeding:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("1️⃣ Apply direct pressure – Use a clean cloth or bandage to press firmly on the wound."),
                    qsTr("2️⃣ Elevate the wound – If possible, raise the injured limb above heart level."),
                    qsTr("3️⃣ Apply a pressure bandage – Wrap the wound firmly but not too tight to cut off circulation."),
                    qsTr("4️⃣ Use a tourniquet (if necessary) – Only as a last resort if bleeding is life-threatening."),
                    qsTr("5️⃣ Seek medical help – Call emergency services if bleeding is severe or does not stop.")
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
