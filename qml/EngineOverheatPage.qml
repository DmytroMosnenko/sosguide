import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: engineOverheatPage
    title: qsTr("Signs of Engine Overheating")
    objectName: "EngineOverheatPage"

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
                text: "🌡️ " + qsTr("How to Recognize and Handle Engine Overheating:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Temperature gauge is in the red zone."),
                    qsTr("- Steam or smoke coming from under the hood."),
                    qsTr("- Unusual smell (burning oil or coolant)."),
                    qsTr("- Loss of engine power or knocking sounds."),
                    qsTr("- Turn off the air conditioning to reduce strain."),
                    qsTr("- Pull over safely, turn off the engine, and let it cool."),
                    qsTr("- Check the coolant level once the engine is cool."),
                    qsTr("- Never open the radiator cap when the engine is hot.")
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
