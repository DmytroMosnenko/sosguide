import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: burnsPage
    title: qsTr("Burns Guide")
    objectName: "BurnsPage"

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
                text: "🔥 " + qsTr("When to Seek Medical Help for Burns:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Burns covering large areas or deep burns."),
                    qsTr("- Burns on the face, hands, feet, or groin."),
                    qsTr("- Chemical or electrical burns."),
                    qsTr("- Signs of infection (swelling, redness, pus).")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "🩹 " + qsTr("First Aid Steps for Burns:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("1️⃣ Cool the burn – Hold under cool (not cold) running water for at least 10 minutes."),
                    qsTr("2️⃣ Remove tight items – Take off rings, watches, or clothing near the burn (unless stuck to skin)."),
                    qsTr("3️⃣ Cover with a clean, non-stick dressing – Use sterile gauze or cloth."),
                    qsTr("4️⃣ Avoid breaking blisters – This increases infection risk."),
                    qsTr("5️⃣ Seek medical help – If the burn is severe or the person is in shock.")
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
