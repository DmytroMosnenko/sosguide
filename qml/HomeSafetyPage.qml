import QtQuick 6.8
import QtQuick.Controls 6.8
import QtQuick.Controls.Material 6.8

Page {
    id: homeSafety
    title: qsTr("Home Safety")
    objectName: "HomeSafetyPage"

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
                        ListElement { title: qsTr("Fire Prevention"); icon: "qrc:/icons/fire-prevention_white.png"; page: "FirePreventionPage" }
                        ListElement { title: qsTr("Electricity"); icon: "qrc:/icons/electricity_white.png"; page: "ElectricalSafetyPage" }
                        ListElement { title: qsTr("Gas Leak"); icon: "qrc:/icons/gas-leak_white.png"; page: "GasLeakPage" }
                        ListElement { title: qsTr("Burns & Cuts"); icon: "qrc:/icons/burns_white.png"; page: "BurnsCutsPage" }
                        ListElement { title: qsTr("Childproofing"); icon: "qrc:/icons/childproof_white.png"; page: "ChildproofingPage" }
                        ListElement { title: qsTr("Chemicals"); icon: "qrc:/icons/chemicals_white.png"; page: "ChemicalsPage" }
                        ListElement { title: qsTr("Appliances"); icon: "qrc:/icons/appliance_white.png"; page: "AppliancesPage" }
                        ListElement { title: qsTr("Evacuation"); icon: "qrc:/icons/evacuation_white.png"; page: "EvacuationPage" }
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
                text: "🏠 " + qsTr("Essential Home Safety Tips:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Install smoke detectors and check batteries regularly."),
                    qsTr("- Keep a fire extinguisher in an accessible location."),
                    qsTr("- Store hazardous chemicals safely away from children."),
                    qsTr("- Ensure electrical outlets are childproof."),
                    qsTr("- Have an emergency exit plan and practice it with family.")
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
