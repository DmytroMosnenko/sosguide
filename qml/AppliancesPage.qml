import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: appliancesPage
    title: qsTr("Safe Use of Appliances")
    objectName: "AppliancesPage"

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
                text: "⚙️ " + qsTr("Guidelines for Safe Appliance Use:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Follow manufacturer instructions for each appliance."),
                    qsTr("- Regularly check for damaged cords or plugs."),
                    qsTr("- Unplug appliances when not in use."),
                    qsTr("- Keep appliances away from water sources."),
                    qsTr("- Do not overload electrical outlets.")
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
