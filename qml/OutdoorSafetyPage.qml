import QtQuick 6.8
import QtQuick.Controls 6.8
import QtQuick.Controls.Material 6.8

Page {
    id: carSafety
    title: qsTr("Walking & Outdoor Safety")
    objectName: "OutdoorSafetyPage"

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
                        ListElement { title: qsTr("Pedestrian Road"); icon: "qrc:/icons/crosswalk_white.png"; page: "PedestrianPage" }
                        ListElement { title: qsTr("Trip Hazards"); icon: "qrc:/icons/trip-hazard_white.png"; page: "TripHazardsPage" }
                        ListElement { title: qsTr("Night Walking"); icon: "qrc:/icons/night-walking_white.png"; page: "NightWalkingPage" }
                        ListElement { title: qsTr("Dehydration"); icon: "qrc:/icons/hydration_white.png"; page: "DehydrationPage" }
                        ListElement { title: qsTr("Hypothermia Signs"); icon: "qrc:/icons/hypothermia_white.png"; page: "HypothermiaSignsPage" }
                        ListElement { title: qsTr("Aggressive Animals"); icon: "qrc:/icons/boar_white.png"; page: "AggressiveAnimalsPage" }
                        ListElement { title: qsTr("Sprains & Blisters"); icon: "qrc:/icons/sprains_white.png"; page: "SprainsBlistersPage" }
                        ListElement { title: qsTr("Unfamiliar Areas"); icon: "qrc:/icons/map_white.png"; page: "UnfamiliarAreasPage" }
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
                text: "🚶‍♂️ " + qsTr("Essential Walking & Outdoor Safety Tips:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Stay aware of your surroundings at all times."),
                    qsTr("- Walk on sidewalks whenever possible, facing oncoming traffic."),
                    qsTr("- Cross streets at designated crosswalks and obey pedestrian signals."),
                    qsTr("- Wear bright or reflective clothing for visibility, especially at night."),
                    qsTr("- Carry a flashlight or use your phone's light in dim conditions."),
                    qsTr("- Avoid distractions like texting while walking in high-traffic areas."),
                    qsTr("- Keep an emergency contact accessible in case of accidents."),
                    qsTr("- Stay hydrated and dress appropriately for weather conditions.")
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
