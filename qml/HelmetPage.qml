import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: helmetFittingPage
    title: qsTr("Proper Helmet Fitting")
    objectName: "HelmetPage"

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
                text: "⛑️ " + qsTr("Why a Properly Fitted Helmet Matters:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Protects against head injuries in accidents."),
                    qsTr("- Ensures comfort and better visibility."),
                    qsTr("- Prevents the helmet from slipping off or obstructing vision.")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
            }

            Label {
                text: "📝 " + qsTr("Steps to Properly Fit a Helmet:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("1️⃣ Measure your head size and choose the right helmet."),
                    qsTr("2️⃣ Position the helmet so it sits level on your head."),
                    qsTr("3️⃣ Adjust the side straps to form a 'V' under your ears."),
                    qsTr("4️⃣ Buckle the chin strap securely; it should be snug but comfortable."),
                    qsTr("5️⃣ Perform a shake test – the helmet should not move much."),
                    qsTr("6️⃣ Replace the helmet if damaged or after a strong impact.")
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
