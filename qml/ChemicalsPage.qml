import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: chemicalsPage
    title: qsTr("Handling Household Chemicals")
    objectName: "ChemicalsPage"

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
                text: "⚠️ " + qsTr("Safety Precautions for Chemicals:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Always read labels before using chemicals."),
                    qsTr("- Store household chemicals in original containers."),
                    qsTr("- Keep out of reach of children and pets."),
                    qsTr("- Never mix chemicals (e.g., bleach and ammonia)."),
                    qsTr("- Ensure proper ventilation when using strong cleaners.")
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
