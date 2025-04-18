import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: hydrationPage
    title: qsTr("Hydration & Nutrition Tips")
    objectName: "HydrationPage"

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
                text: "💧 " + qsTr("Hydration Guidelines:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Drink water before, during, and after workouts."),
                    qsTr("- Consume 500 ml (17 oz) of water 2 hours before exercise."),
                    qsTr("- Take small sips every 15-20 minutes during workouts."),
                    qsTr("- Replenish fluids with electrolyte-rich drinks if sweating heavily."),
                    qsTr("- Avoid excessive caffeine or alcohol before workouts.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "🍏 " + qsTr("Nutrition Tips:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Eat a balanced meal 1-3 hours before exercising."),
                    qsTr("- Include carbs for energy and protein for muscle support."),
                    qsTr("- Snack on fruits, nuts, or yogurt if training for long sessions."),
                    qsTr("- Replenish protein and carbs post-workout for recovery."),
                    qsTr("- Avoid heavy meals right before intense workouts.")
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
