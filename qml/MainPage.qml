import QtQuick 6.8
import QtQuick.Controls 6.8
import QtQuick.Controls.Material 6.8

Page {
    id: mainPage
    title: qsTr("First Aid")
    objectName: "MainPage"

    ScrollView {
        anchors.fill: parent
        contentWidth: parent.width
        clip: true

        Column {
            // anchors.fill: parent
            // anchors.margins: 20
            // spacing: 15
            spacing: 15
            width: parent.width * 0.9
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 20

            // TODO(amid): disabled for now
            // 🔍 Search Bar
            // TextField {
            //     id: searchField
            //     placeholderText: qsTr("Search first aid topics...")
            //     Material.background: "#EEE"
            //     leftPadding: 10
            //     onAccepted: {
            //         // Implement search functionality
            //         console.log("Searching: " + searchField.text)
            //     }
            // }

            Item {
                width: 1
                height: 10 // This adds dummy margin
            }

            // 🚨 Emergency Button
            Rectangle {
                width: 120
                height: 120
                radius: 24
                color: "red"
                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    anchors.fill: parent
                    background: Rectangle {
                        color: "transparent"
                        radius: 24
                    }
                    contentItem: Column {
                        anchors.centerIn: parent
                        spacing: 4
                        Label {
                            text: "  🚑"
                            font.pixelSize: 32
                            horizontalAlignment: Text.AlignHCenter
                        }
                        Label {
                            text: qsTr("Call\nEmergency")
                            font.pixelSize: 16
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                    onClicked: {
                        console.log("Emergency call triggered!")
                        emergencyHelper.callEmergencyNumber();
                    }
                }
            }

            Item {
                width: 1
                height: 10 // This adds dummy margin
            }

            // Open Offline Translator button
            Rectangle {
                width: translatorButton.width
                height: 40
                radius: 24
                color: "blue"
                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    id: translatorButton
                    anchors.fill: parent
                    background: Rectangle {
                        color: "transparent"
                        radius: 24
                    }
                    text: qsTr("Offline Translator")

                    onClicked: {
                        root.switchPage("TranslatorPage");
                    }
                }
            }

            // 🩹 Quick Links (Common Emergencies)
            Grid {
                columns: 2
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter

                Repeater {
                    model: ListModel {
                        ListElement { title: qsTr("CPR"); icon: "qrc:/icons/cpr_white.png"; page: "CprPage" }
                        ListElement { title: qsTr("Choking"); icon: "qrc:/icons/choking_white.png"; page: "ChokingPage" }
                        ListElement { title: qsTr("Heart Attack"); icon: "qrc:/icons/heart-attack_white.png"; page: "HeartAttackPage" }
                        ListElement { title: qsTr("Fractures"); icon: "qrc:/icons/fractures_white.png"; page: "FracturesPage" }
                        ListElement { title: qsTr("Bleeding"); icon: "qrc:/icons/bleeding_white.png"; page: "BleedingPage" }
                        ListElement { title: qsTr("Burns"); icon: "qrc:/icons/burns_white.png"; page: "BurnsPage" }
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
                text: qsTr("☎️ Key Emergency Numbers")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Universal Emergency Number: 112 (Europe)"),
                    qsTr("- U.S. & Canada: 911"),
                    qsTr("- United Kingdom: 999"),
                    qsTr("- Australia: 000"),
                    qsTr("- Ukraine: 101 (Fire), 102 (Police), 103 (Ambulance)")
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
