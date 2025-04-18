import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: hypothermiaSignsPage
    title: qsTr("Recognizing Signs of Hypothermia")
    objectName: "HypothermiaSignsPage"

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
                text: "❄️ " + qsTr("Early Signs of Hypothermia:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Shivering, which may stop as hypothermia worsens."),
                    qsTr("- Slow or slurred speech."),
                    qsTr("- Confusion and difficulty thinking clearly."),
                    qsTr("- Weak pulse and slow breathing."),
                    qsTr("- Loss of coordination and clumsiness."),
                    qsTr("- Fatigue and drowsiness."),
                    qsTr("- Skin that appears pale, cold, or blueish.")
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
