import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: gymInjuryPreventionPage
    title: qsTr("Preventing Gym Injuries")
    objectName: "GymInjuriesPage"

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
                text: "🚑 " + qsTr("How to Avoid Gym Injuries:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Warm up properly before workouts."),
                    qsTr("- Use the correct form for each exercise."),
                    qsTr("- Avoid lifting weights beyond your capacity."),
                    qsTr("- Don't skip rest days; muscles need recovery."),
                    qsTr("- Stay hydrated and maintain a balanced diet."),
                    qsTr("- Pay attention to signs of fatigue or pain."),
                    qsTr("- Use appropriate footwear for exercises."),
                    qsTr("- Follow proper gym etiquette and be aware of others."),
                    qsTr("- Clean equipment before and after use to avoid infections.")
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
