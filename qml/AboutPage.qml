import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: sosGuidePage
    title: qsTr("SOS Guide")
    objectName: "SosGuidePage"

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
                height: -22 // This adds dummy margin considering spacing: 32
            }

            Label {
                text: qsTr("🚨 Why This Guide Matters")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Label {
                text: qsTr("Emergencies can happen anytime, anywhere. Knowing how to react quickly and correctly can make the difference between life and death. This SOS Guide provides essential safety information across various situations, helping you stay prepared and respond effectively.")
                font.pixelSize: 20
                wrapMode: Text.WordWrap
                width: parent.width
            }

            Label {
                text: qsTr("📖 How to Use This Guide")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Choose a category (Home, Car, Gym, Bicycle, Walking, Swimming, etc.)."),
                    qsTr("- Select a specific topic to get clear, step-by-step guidance."),
                    qsTr("- Follow the outlined actions to ensure safety for yourself and others."),
                    qsTr("- Always call emergency services when needed!")
                ]
                Label {
                    text: modelData
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    width: parent.width
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
                    qsTr("- Universal Emergency Number: 112 (Europe, including Poland)"),
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

            Label {
                text: qsTr("💡 General Safety Principles")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("✅ Stay Calm – Panic can make situations worse. Take a deep breath and assess the situation."),
                    qsTr("✅ Ensure Personal Safety First – Do not put yourself at risk when helping others."),
                    qsTr("✅ Call for Help – Dial emergency services as soon as possible."),
                    qsTr("✅ Follow Basic First Aid Steps – Stop bleeding, provide CPR if needed, and keep the injured stable."),
                    qsTr("✅ Be Prepared – Learn basic safety skills before an emergency happens.")
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
