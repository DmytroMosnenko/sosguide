import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: cyclingInjuriesPage
    title: qsTr("Avoiding Common Cycling Injuries")
    objectName: "CyclingInjuriesPage"

    ScrollView {
        anchors.fill: parent
        contentWidth: parent.width
        clip: true

        Column {
            spacing: 32
            width: parent.width * 0.9
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 20

            Item { width: 1; height: -22 }

            Label {
                text: "🚲 " + qsTr("Preventing Common Cycling Injuries:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Adjust saddle height to prevent knee pain."),
                    qsTr("- Use padded gloves to reduce wrist strain."),
                    qsTr("- Keep proper posture to avoid back pain."),
                    qsTr("- Take breaks and stretch after long rides.")
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
