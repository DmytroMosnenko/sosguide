import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: chokingPage
    title: qsTr("Choking Guide")
    objectName: "ChokingPage"

    ScrollView {
        anchors.fill: parent
        contentWidth: parent.width
        clip: true

        Column {
            width: parent.width * 0.9
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 32

            Item {
                width: 1
                height: -22 // This adds dummy margin considering spacing: 32
            }

            Label {
                text: "🆘 " + qsTr("When to Perform the Heimlich Maneuver:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- The person is unable to speak, cough, or breathe."),
                    qsTr("- They are clutching their throat or showing distress."),
                    qsTr("- Their face turns blue due to lack of oxygen.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "⚡ " + qsTr("Steps to Help a Choking Person:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("1️⃣ Encourage coughing – If they can still breathe, let them try to cough it out."),
                    qsTr("2️⃣ Perform back blows – Stand behind, bend them forward, and give 5 firm blows between the shoulder blades."),
                    qsTr("3️⃣ Perform abdominal thrusts – Stand behind, wrap arms around waist, and apply quick inward thrusts above the navel."),
                    qsTr("4️⃣ Alternate back blows and thrusts until the object is expelled."),
                    qsTr("5️⃣ If unconscious, begin CPR and call emergency services immediately.")
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
