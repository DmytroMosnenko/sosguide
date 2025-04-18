import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: warmUpPage
    title: qsTr("Proper Warm-Up & Cool-Down")
    objectName: "WarmUpPage"

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
                height: -22
            }

            Label {
                text: "🔥 " + qsTr("Why Warm-Up & Cool-Down Are Important:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Helps prevent injuries and muscle strains."),
                    qsTr("- Improves flexibility and mobility."),
                    qsTr("- Increases blood circulation to muscles."),
                    qsTr("- Reduces post-workout soreness."),
                    qsTr("- Helps the heart rate return to normal gradually.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "⚡ " + qsTr("Warm-Up Routine:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("1️⃣ Start with light cardio (5-10 min of jogging or cycling)."),
                    qsTr("2️⃣ Perform dynamic stretches like arm circles, leg swings."),
                    qsTr("3️⃣ Gradually increase intensity to activate major muscle groups."),
                    qsTr("4️⃣ Perform sport-specific movements (e.g., squats before lifting weights).")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "🧘 " + qsTr("Cool-Down Routine:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("1️⃣ Slow down your workout gradually (walk for 5 min)."),
                    qsTr("2️⃣ Perform static stretches for major muscle groups."),
                    qsTr("3️⃣ Take deep breaths to help relax the body."),
                    qsTr("4️⃣ Stay hydrated and refuel with healthy food.")
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
