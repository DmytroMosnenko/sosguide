import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: balanceTrainingPage
    title: qsTr("Balancing Cardio & Strength Training")
    objectName: "BalanceTrainingPage"

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
                text: "⚖️ " + qsTr("Why Balance Matters:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Combining cardio and strength training maximizes overall fitness."),
                    qsTr("- Overloading on one type can lead to muscle imbalances or overuse injuries."),
                    qsTr("- Proper balance improves endurance, strength, and recovery."),
                    qsTr("- Each person’s balance depends on their fitness goals (e.g., weight loss, muscle building, endurance).")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "🏋️‍♂️ " + qsTr("How to Structure Your Workout Plan:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Alternate cardio and strength training days to prevent overtraining."),
                    qsTr("- Combine both in one session by doing strength first, then cardio."),
                    qsTr("- For weight loss, prioritize cardio but include strength to maintain muscle."),
                    qsTr("- For muscle building, focus on strength while adding light cardio for endurance."),
                    qsTr("- Listen to your body – adjust intensity based on energy levels and recovery.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "📅 " + qsTr("Example Weekly Workout Plan:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Monday: Strength Training (Upper Body) + 15 min Light Cardio"),
                    qsTr("- Tuesday: Cardio (HIIT or Running)"),
                    qsTr("- Wednesday: Strength Training (Lower Body)"),
                    qsTr("- Thursday: Active Recovery (Yoga, Walking)"),
                    qsTr("- Friday: Strength Training (Full Body) + 10 min Cardio"),
                    qsTr("- Saturday: Cardio (Cycling, Swimming, or Hiking)"),
                    qsTr("- Sunday: Rest or Light Mobility Work")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "💡 " + qsTr("Tips for Efficient Training:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Adjust workout intensity based on goals (e.g., endurance vs. muscle growth)."),
                    qsTr("- Ensure proper nutrition – protein for muscle recovery, carbs for energy."),
                    qsTr("- Get enough sleep and hydration for optimal performance."),
                    qsTr("- Track progress and make changes based on results."),
                    qsTr("- Avoid excessive fatigue – rest days are just as important as training days.")
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
