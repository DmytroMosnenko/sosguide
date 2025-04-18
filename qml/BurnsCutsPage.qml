import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: burnsCutsPage
    title: qsTr("First Aid for Burns & Cuts")
    objectName: "BurnsCutsPage"

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
                text: "🔥 " + qsTr("First Aid for Burns:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Cool the burn with cool (not ice-cold) running water for at least 10 minutes."),
                    qsTr("- Cover the burn with a sterile, non-stick dressing."),
                    qsTr("- Do not pop blisters or apply butter/oil."),
                    qsTr("- Seek medical help for severe burns.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "🩹 " + qsTr("First Aid for Cuts:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Apply gentle pressure to stop bleeding."),
                    qsTr("- Clean the wound with water and mild soap."),
                    qsTr("- Apply an antibiotic ointment and cover with a bandage."),
                    qsTr("- Seek medical attention for deep or infected wounds.")
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
