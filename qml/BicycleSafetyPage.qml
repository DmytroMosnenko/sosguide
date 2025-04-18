import QtQuick 6.8
import QtQuick.Controls 6.8
import QtQuick.Controls.Material 6.8

Page {
    id: carSafety
    title: qsTr("Bicycle Safety")
    objectName: "BicycleSafetyPage"

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
                        ListElement { title: qsTr("Helmet Fitting"); icon: "qrc:/icons/bike-helmet_white.png"; page: "HelmetPage" }
                        ListElement { title: qsTr("Night Cycling"); icon: "qrc:/icons/night-cycling_white.png"; page: "NightCyclingPage" }
                        ListElement { title: qsTr("Tire Punctures"); icon: "qrc:/icons/bike-tire_white.png"; page: "TirePuncturePage" }
                        ListElement { title: qsTr("Braking Control"); icon: "qrc:/icons/bike-brakes_white.png"; page: "BrakingPage" }
                        ListElement { title: qsTr("Road Rules"); icon: "qrc:/icons/traffic_white.png"; page: "RoadRulesPage" }
                        ListElement { title: qsTr("Chain Slippage"); icon: "qrc:/icons/bike-chain_white.png"; page: "ChainSlippagePage" }
                        ListElement { title: qsTr("Weather Conditions"); icon: "qrc:/icons/weather_white.png"; page: "WeatherCyclingPage" }
                        ListElement { title: qsTr("Avoiding Injuries"); icon: "qrc:/icons/bike-injuries_white.png"; page: "CyclingInjuriesPage" }
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
                text: "🔧 " + qsTr("Basic Bike Maintenance:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Inflate tires to the recommended pressure."),
                    qsTr("- Keep the chain lubricated to prevent rust."),
                    qsTr("- Check brakes regularly and replace worn pads."),
                    qsTr("- Make sure gears shift smoothly."),
                    qsTr("- Tighten loose bolts and screws."),
                    qsTr("- Clean the bike frame to prevent dirt buildup.")
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
