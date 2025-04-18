import QtQuick 6.8
import QtQuick.Controls 6.8
import QtQuick.Controls.Material 6.8

Page {
    id: carSafety
    title: qsTr("Car Safety & Emergencies")
    objectName: "CarSafetyPage"

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
                        ListElement { title: qsTr("Car Accident"); icon: "qrc:/icons/car-accident_white.png"; page: "CarAccidentPage" }
                        ListElement { title: qsTr("Car Battery"); icon: "qrc:/icons/car-battery_white.png"; page: "JumpstartPage" }
                        ListElement { title: qsTr("Flat Tire"); icon: "qrc:/icons/flat-tire_white.png"; page: "FlatTirePage" }
                        ListElement { title: qsTr("Brake Failure"); icon: "qrc:/icons/brake-failure_white.png"; page: "BrakeFailurePage" }
                        ListElement { title: qsTr("Winter Driving"); icon: "qrc:/icons/winter-driving_white.png"; page: "WinterDrivingPage" }
                        ListElement { title: qsTr("Car Fire"); icon: "qrc:/icons/car-fire_white.png"; page: "CarFirePage" }
                        ListElement { title: qsTr("Emergency Kit"); icon: "qrc:/icons/emergency-kit_white.png"; page: "EmergencyKitPage" }
                        ListElement { title: qsTr("Engine Overheating"); icon: "qrc:/icons/engine-overheating_white.png"; page: "EngineOverheatPage" }
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
                text: "🚗 " + qsTr("Emergency Car Tips")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Always wear a seatbelt and ensure passengers do too."),
                    qsTr("- Keep an emergency kit in the car with first aid, water, and tools."),
                    qsTr("- Regularly check tire pressure and tread depth."),
                    qsTr("- Ensure brakes, lights, and wipers are functioning properly."),
                    qsTr("- Keep at least half a tank of fuel, especially in extreme weather."),
                    qsTr("- Know how to jumpstart a battery and change a tire."),
                    qsTr("- Have a roadside assistance contact in case of emergencies."),
                    qsTr("- If stranded, stay inside the vehicle with hazard lights on."),
                    qsTr("- Learn basic car maintenance like checking oil and coolant levels.")
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
