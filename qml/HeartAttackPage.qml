import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: heartAttackPage
    title: qsTr("Heart Attack Guide")
    objectName: "HeartAttackPage"

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
                text: "❤️ " + qsTr("Recognizing a Heart Attack:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Chest pain or discomfort, often spreading to arms, neck, jaw, or back."),
                    qsTr("- Shortness of breath, nausea, or lightheadedness."),
                    qsTr("- Cold sweat and overwhelming anxiety or sense of doom.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "⚡ " + qsTr("Immediate Actions:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("1️⃣ Call emergency services (112/911) immediately."),
                    qsTr("2️⃣ Keep the person calm and seated, loosen tight clothing."),
                    qsTr("3️⃣ If conscious, give them aspirin (if not allergic)."),
                    qsTr("4️⃣ If unconscious and no breathing, start CPR immediately."),
                    qsTr("5️⃣ Continue CPR until emergency responders arrive.")
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
