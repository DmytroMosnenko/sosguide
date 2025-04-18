import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: postWorkoutRecoveryPage
    title: qsTr("Post-Workout Recovery")
    objectName: "PostWorkoutPage"

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
                text: "🛌 " + qsTr("Why Recovery is Important:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Allows muscles to repair and grow after exercise."),
                    qsTr("- Reduces risk of injuries and overtraining."),
                    qsTr("- Restores energy levels and improves performance."),
                    qsTr("- Helps in reducing muscle soreness and stiffness.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "💧 " + qsTr("Essential Steps for Recovery:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- **Hydration**: Drink water or electrolyte-rich fluids to replenish lost fluids."),
                    qsTr("- **Proper Nutrition**: Consume protein for muscle repair and carbohydrates for energy replenishment."),
                    qsTr("- **Stretching & Cool Down**: Helps reduce stiffness and maintain flexibility."),
                    qsTr("- **Rest & Sleep**: Sleep is the body's primary recovery mechanism, aim for 7-9 hours."),
                    qsTr("- **Massage or Foam Rolling**: Helps in muscle relaxation and reduces tightness.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "🕒 " + qsTr("How Long Should Recovery Take?")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- **Light workouts (Yoga, Walking)**: Few hours to a day."),
                    qsTr("- **Moderate workouts (Cardio, Strength Training)**: 24-48 hours."),
                    qsTr("- **Intense workouts (HIIT, Heavy Lifting, Endurance Runs)**: 48-72 hours."),
                    qsTr("- **Active Recovery**: Doing light activity on rest days can speed up recovery.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "⚡ " + qsTr("Signs You Need More Recovery:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Persistent muscle soreness beyond 3 days."),
                    qsTr("- Decreased performance despite training."),
                    qsTr("- Constant fatigue or trouble sleeping."),
                    qsTr("- Increased irritability or loss of motivation."),
                    qsTr("- Frequent injuries or joint pain.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "💡 " + qsTr("Pro Recovery Tips:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Try contrast baths (alternating hot and cold water) to improve circulation."),
                    qsTr("- Include anti-inflammatory foods like berries, nuts, and turmeric in your diet."),
                    qsTr("- Schedule **deload weeks** every few months to prevent burnout."),
                    qsTr("- Consider meditation or breathing exercises for better relaxation."),
                    qsTr("- Use a **fitness tracker** to monitor recovery trends over time.")
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
