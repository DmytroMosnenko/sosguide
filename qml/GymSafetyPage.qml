import QtQuick 6.8
import QtQuick.Controls 6.8
import QtQuick.Controls.Material 6.8

Page {
    id: carSafety
    title: qsTr("Gym & Fitness Safety")
    objectName: "GymSafetyPage"

    ScrollView {
        anchors.fill: parent
        contentWidth: parent.width
        clip: true

        Column {
            spacing: 15
            width: parent.width * 0.9
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 20

            Grid {
                columns: 2
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter

                Repeater {
                    model: ListModel {
                        ListElement { title: qsTr("Warm-Up"); icon: "qrc:/icons/warm-up_white.png"; page: "WarmUpPage" }
                        ListElement { title: qsTr("Weightlifting"); icon: "qrc:/icons/weightlifting_white.png"; page: "WeightliftingPage" }
                        ListElement { title: qsTr("Gym Injuries"); icon: "qrc:/icons/gym-injuries_white.png"; page: "GymInjuriesPage" }
                        ListElement { title: qsTr("Hydration & Nutrition"); icon: "qrc:/icons/hydration_white.png"; page: "HydrationPage" }
                        ListElement { title: qsTr("Gym Equipment"); icon: "qrc:/icons/gym-equipment_white.png"; page: "GymEquipmentPage" }
                        ListElement { title: qsTr("Overtraining"); icon: "qrc:/icons/gym-overtraining_white.png"; page: "OvertrainingPage" }
                        ListElement { title: qsTr("Training's Balance"); icon: "qrc:/icons/training-balance_white.png"; page: "BalanceTrainingPage" }
                        ListElement { title: qsTr("Post Workout"); icon: "qrc:/icons/post-workout_white.png"; page: "PostWorkoutPage" }
                    }

                    ToolButton {
                        width: 120
                        height: 120
                        Material.background: "#2196F3"
                        Material.foreground: "white"

                        Column {
                            anchors.centerIn: parent
                            spacing: 5

                            Image {
                                source: model.icon
                                width: 50
                                height: 50
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            Label {
                                text: model.title
                                color: "white"
                                font.bold: true
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }

                        onClicked: {
                            console.log("Opening: ", model.title, model.page)
                            root.switchPage(model.page);
                        }
                    }
                }
            }

            Label {
                text: "🏋️ " + qsTr("Basic Gym Safety Rules:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- **Warm-up properly** before starting exercises to prepare your muscles."),
                    qsTr("- **Use correct form** to avoid strains and injuries."),
                    qsTr("- **Start with lighter weights** and gradually increase intensity."),
                    qsTr("- **Don't hold your breath** during strength training; use proper breathing techniques."),
                    qsTr("- **Stay hydrated** to maintain energy and prevent dehydration."),
                    qsTr("- **Know your limits** and avoid overtraining."),
                    qsTr("- **Wipe down equipment** after use to maintain hygiene."),
                    qsTr("- **Use a spotter** when lifting heavy weights.")
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
