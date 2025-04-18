import QtQuick 6.8
import QtQuick.Controls 6.8

Page {
    id: tripFallPreventionPage
    title: qsTr("Avoiding Trip & Fall Hazards")
    objectName: "TripHazardsPage"

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
                text: "⚠️ " + qsTr("Tips to Prevent Trips & Falls:")
                font.bold: true
                font.pixelSize: 24
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Repeater {
                model: [
                    qsTr("- Watch out for uneven surfaces or cracks in sidewalks."),
                    qsTr("- Keep living areas clutter-free to avoid tripping."),
                    qsTr("- Use proper lighting in hallways and staircases."),
                    qsTr("- Hold onto handrails when using stairs."),
                    qsTr("- Wear non-slip shoes to improve stability."),
                    qsTr("- Be cautious around wet or icy surfaces."),
                    qsTr("- Avoid rushing and take your time while walking.")
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
