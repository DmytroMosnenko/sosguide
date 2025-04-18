import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: gymEquipmentPage
    title: qsTr("Safe Use of Gym Equipment")
    objectName: "GymEquipmentPage"

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
                text: "🏋️‍♂️ " + qsTr("Gym Equipment Safety Tips:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Read instructions or ask a trainer before using new machines."),
                    qsTr("- Adjust machines to fit your body before starting."),
                    qsTr("- Use safety locks on weights and machines."),
                    qsTr("- Don’t overload machines; increase weight gradually."),
                    qsTr("- Clean handles and seats after use."),
                    qsTr("- Avoid distractions like phones when using heavy equipment."),
                    qsTr("- Store weights properly to avoid trip hazards."),
                    qsTr("- Check for damaged or broken equipment before using.")
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
