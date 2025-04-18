import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: childproofingPage
    title: qsTr("Childproofing Your Home")
    objectName: "ChildproofingPage"

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
                text: "👶 " + qsTr("Essential Childproofing Tips:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Install safety gates at stairs and doors."),
                    qsTr("- Cover electrical outlets with safety covers."),
                    qsTr("- Secure furniture and heavy objects to prevent tipping."),
                    qsTr("- Store medicines and cleaning products out of reach."),
                    qsTr("- Use corner guards on sharp furniture edges.")
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
