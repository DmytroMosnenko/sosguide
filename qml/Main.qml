import QtQuick 6.8
import QtQuick.Controls 6.8
import QtQuick.Controls.Material 2.15
import QtQuick.Effects 6.8

import org.amidlab.sosguide 1.0

ApplicationWindow {
    id: root
    visible: true
    // width: 360
    // height: 640
    property string appName: qsTr("SOS Guide")
    title: appName

    property alias adsBanner: adsBanner

    AppManager { id: appManager }

    property bool backPressedOnce: false

    Material.theme: Material.Dark  // Set Material theme
    Material.primary: "#6200EE"    // Customize color

    Connections {
        target: backButtonFilter
        function onBackPressed() {
            console.log("onBackPressed:", root.currentPageKey, pages[root.currentPageKey]["parent"])
            if (pages[root.currentPageKey]["parent"] !== null) {
                root.switchPage(pages[root.currentPageKey]["parent"])
            } else {
                if (backPressedOnce) {
                    Qt.quit();
                } else {
                    backPressedOnce = true;
                    toast.opacity = 1;
                    toastTimer.start();
                    console.log("toast: ", toast.x, toast.y, toast.parent.height, toast.parent.width)
                }
            }
        }
    }

    Connections {
        target: adMobHelper
        function onAdLoaded() {
            console.log("adLoaded: invoked");
            adsBanner.height = 100 + 10 /* margin */;
        }
    }


    // Timer to reset backPressedOnce flag
    Timer {
        id: toastTimer
        interval: 2000 // Reset after 2 seconds
        onTriggered: {
            backPressedOnce = false;
            toast.opacity = 0;
        }
    }

    property var pages: ({
        // Drawer:
        "MainPage": { "component" : Qt.createComponent("MainPage.qml"), "parent" : null},
        "FirstAidPage": { "component" : Qt.createComponent("FirstAidPage.qml"), "parent" : "MainPage"},
        "TranslatorPage": { "component" : Qt.createComponent("TranslatorPage.qml"), "parent" : "MainPage"},
        "SettingsPage": { "component" : Qt.createComponent("SettingsPage.qml"), "parent" : "MainPage"},
        "AboutPage": { "component" : Qt.createComponent("AboutPage.qml"), "parent" : "MainPage"},

        // MainPage:
        "CprPage" : { "component" : Qt.createComponent("CprPage.qml"), "parent" : "MainPage"},
        "ChokingPage" : { "component" : Qt.createComponent("ChokingPage.qml"), "parent" : "MainPage"},
        "HeartAttackPage" : { "component" : Qt.createComponent("HeartAttackPage.qml"), "parent" : "MainPage"},
        "FracturesPage" : { "component" : Qt.createComponent("FracturesPage.qml"), "parent" : "MainPage"},
        "BleedingPage" : { "component" : Qt.createComponent("BleedingPage.qml"), "parent" : "MainPage"},
        "BurnsPage" : { "component" : Qt.createComponent("BurnsPage.qml"), "parent" : "MainPage"},

        // HomeSafetyPage:
        "HomeSafetyPage": { "component" : Qt.createComponent("HomeSafetyPage.qml"), "parent" : "MainPage"},
        "FirePreventionPage": { "component" : Qt.createComponent("FirePreventionPage.qml"), "parent" : "HomeSafetyPage"},
        "ElectricalSafetyPage": { "component" : Qt.createComponent("ElectricalSafetyPage.qml"), "parent" : "HomeSafetyPage"},
        "GasLeakPage": { "component" : Qt.createComponent("GasLeakPage.qml"), "parent" : "HomeSafetyPage"},
        "BurnsCutsPage": { "component" : Qt.createComponent("BurnsCutsPage.qml"), "parent" : "HomeSafetyPage"},
        "ChildproofingPage": { "component" : Qt.createComponent("ChildproofingPage.qml"), "parent" : "HomeSafetyPage"},
        "ChemicalsPage": { "component" : Qt.createComponent("ChemicalsPage.qml"), "parent" : "HomeSafetyPage"},
        "AppliancesPage": { "component" : Qt.createComponent("AppliancesPage.qml"), "parent" : "HomeSafetyPage"},
        "EvacuationPage": { "component" : Qt.createComponent("EvacuationPage.qml"), "parent" : "HomeSafetyPage"},

        // CarSafetyPage:
        "CarSafetyPage": { "component" : Qt.createComponent("CarSafetyPage.qml"), "parent" : "MainPage"},
        "CarAccidentPage": { "component" : Qt.createComponent("CarAccidentPage.qml"), "parent" : "CarSafetyPage"},
        "JumpstartPage": { "component" : Qt.createComponent("JumpstartPage.qml"), "parent" : "CarSafetyPage"},
        "FlatTirePage": { "component" : Qt.createComponent("FlatTirePage.qml"), "parent" : "CarSafetyPage"},
        "BrakeFailurePage": { "component" : Qt.createComponent("BrakeFailurePage.qml"), "parent" : "CarSafetyPage"},
        "WinterDrivingPage": { "component" : Qt.createComponent("WinterDrivingPage.qml"), "parent" : "CarSafetyPage"},
        "CarFirePage": { "component" : Qt.createComponent("CarFirePage.qml"), "parent" : "CarSafetyPage"},
        "EmergencyKitPage": { "component" : Qt.createComponent("EmergencyKitPage.qml"), "parent" : "CarSafetyPage"},
        "EngineOverheatPage": { "component" : Qt.createComponent("EngineOverheatPage.qml"), "parent" : "CarSafetyPage"},

        // GymSafetyPage:
        "GymSafetyPage": { "component" : Qt.createComponent("GymSafetyPage.qml"), "parent" : "MainPage"},
        "WarmUpPage": { "component" : Qt.createComponent("WarmUpPage.qml"), "parent" : "GymSafetyPage"},
        "WeightliftingPage": { "component" : Qt.createComponent("WeightliftingPage.qml"), "parent" : "GymSafetyPage"},
        "GymInjuriesPage": { "component" : Qt.createComponent("GymInjuriesPage.qml"), "parent" : "GymSafetyPage"},
        "HydrationPage": { "component" : Qt.createComponent("HydrationPage.qml"), "parent" : "GymSafetyPage"},
        "GymEquipmentPage": { "component" : Qt.createComponent("GymEquipmentPage.qml"), "parent" : "GymSafetyPage"},
        "OvertrainingPage": { "component" : Qt.createComponent("OvertrainingPage.qml"), "parent" : "GymSafetyPage"},
        "BalanceTrainingPage": { "component" : Qt.createComponent("BalanceTrainingPage.qml"), "parent" : "GymSafetyPage"},
        "PostWorkoutPage": { "component" : Qt.createComponent("PostWorkoutPage.qml"), "parent" : "GymSafetyPage"},

        // BicycleSafetyPage:
        "BicycleSafetyPage": { "component" : Qt.createComponent("BicycleSafetyPage.qml"), "parent" : "MainPage"},
        "HelmetPage": { "component" : Qt.createComponent("HelmetPage.qml"), "parent" : "BicycleSafetyPage"},
        "NightCyclingPage": { "component" : Qt.createComponent("NightCyclingPage.qml"), "parent" : "BicycleSafetyPage"},
        "TirePuncturePage": { "component" : Qt.createComponent("TirePuncturePage.qml"), "parent" : "BicycleSafetyPage"},
        "BrakingPage": { "component" : Qt.createComponent("BrakingPage.qml"), "parent" : "BicycleSafetyPage"},
        "RoadRulesPage": { "component" : Qt.createComponent("RoadRulesPage.qml"), "parent" : "BicycleSafetyPage"},
        "ChainSlippagePage": { "component" : Qt.createComponent("ChainSlippagePage.qml"), "parent" : "BicycleSafetyPage"},
        "WeatherCyclingPage": { "component" : Qt.createComponent("WeatherCyclingPage.qml"), "parent" : "BicycleSafetyPage"},
        "CyclingInjuriesPage": { "component" : Qt.createComponent("CyclingInjuriesPage.qml"), "parent" : "BicycleSafetyPage"},

        // OutdoorSafetyPage:
        "OutdoorSafetyPage": { "component" : Qt.createComponent("OutdoorSafetyPage.qml"), "parent" : "MainPage"},
        "PedestrianPage": { "component" : Qt.createComponent("PedestrianPage.qml"), "parent" : "OutdoorSafetyPage"},
        "TripHazardsPage": { "component" : Qt.createComponent("TripHazardsPage.qml"), "parent" : "OutdoorSafetyPage"},
        "NightWalkingPage": { "component" : Qt.createComponent("NightWalkingPage.qml"), "parent" : "OutdoorSafetyPage"},
        "DehydrationPage": { "component" : Qt.createComponent("DehydrationPage.qml"), "parent" : "OutdoorSafetyPage"},
        "HypothermiaSignsPage": { "component" : Qt.createComponent("HypothermiaSignsPage.qml"), "parent" : "OutdoorSafetyPage"},
        "AggressiveAnimalsPage": { "component" : Qt.createComponent("AggressiveAnimalsPage.qml"), "parent" : "OutdoorSafetyPage"},
        "SprainsBlistersPage": { "component" : Qt.createComponent("SprainsBlistersPage.qml"), "parent" : "OutdoorSafetyPage"},
        "UnfamiliarAreasPage": { "component" : Qt.createComponent("UnfamiliarAreasPage.qml"), "parent" : "OutdoorSafetyPage"},
    })

    property var pageInstances: ({})
    property string currentPageKey: "MainPage"

    function switchPage(pageKey) {
        console.log("switchPage:", pageKey, currentPageKey)
        if (pages[pageKey] && pageKey !== currentPageKey) {
            currentPageKey = pageKey;

            if (!pageInstances[pageKey])
                pageInstances[pageKey] = pages[pageKey]["component"].createObject(pageLoader);


            console.log("switchPage replace:", pageInstances[pageKey], pages[pageKey]["component"]);
            stackView.replace(pageInstances[pageKey]);
        } else {
            console.warn("Page not found:", pageKey);
        }
    }

    // Toast message for exit confirmation
    Rectangle {
        id: toast
        width: toastText.implicitWidth + 20
        height: 40
        color: "#333"
        radius: 10
        z: 999
        opacity: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50

        Text {
            id: toastText
            anchors.centerIn: parent
            color: "white"
            text: qsTr("Press back again to exit")
        }

        Behavior on opacity { NumberAnimation { duration: 300 } }
    }

    // Side panel (Drawer)
    Drawer {
        id: sideMenu
        dragMargin: 100
        width: 0.66 * parent.width
        height: parent.height - adsBanner.height

        ListView {
            id: menuList
            anchors.fill: parent
            clip: true

            function isActiveItem() {
                return currentPageKey === model.page;
            }

            model: ListModel {
                ListElement { title: qsTr("Basics"); icon: "main"; page: "MainPage"; enabled: true }
                ListElement { title: qsTr("Offline Translator"); icon: "g_translate"; page: "TranslatorPage"; enabled: true }

                // Divider Section
                ListElement { title: ""; icon: ""; page: "" }

                // ListElement { title: qsTr("First Aid Guide"); icon: "heart"; page: "FirstAidPage"; enabled: true }
                ListElement { title: qsTr("Home Safety"); icon: "home"; page: "HomeSafetyPage"; enabled: true }
                ListElement { title: qsTr("Car Safety"); icon: "car"; page: "CarSafetyPage"; enabled: true }
                ListElement { title: qsTr("Gym Safety"); icon: "gym"; page: "GymSafetyPage"; enabled: true }
                ListElement { title: qsTr("Bicycle Safety"); icon: "bicycle"; page: "BicycleSafetyPage"; enabled: true }
                ListElement { title: qsTr("Outdoor Safety"); icon: "outdoor"; page: "OutdoorSafetyPage"; enabled: true }

                // Divider Section
                ListElement { title: ""; icon: ""; page: "" }

                // TODO(amid): not for now:
                // ListElement { title: qsTr("Settings"); icon: "settings"; page: "SettingsPage"; enabled: true }
                ListElement { title: qsTr("About"); icon: "info"; page: "AboutPage"; enabled: true }
                ListElement { title: qsTr("Logout"); icon: "logout"; page: "logout"; enabled: true }
            }

            delegate: Item {
                width: parent.width
                height: model.title === "" ? 10 : 50  // Divider height is 10px

                Rectangle {
                    width: parent.width
                    height: 50
                    color: currentPageKey === model.page ? "#D0E0FF" : mouseArea.pressed ? "#B0C4DE" : "transparent"
                    opacity: currentPageKey === model.page ? 1.0 : 0.5  // Dim disabled items
                    Behavior on color { ColorAnimation { duration: 100 } }
                }

                Row {
                    spacing: 15
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 15

                    Image {
                        id: iconImage
                        source: "qrc:/icons/" + model.icon + (currentPageKey === model.page ? "_black" : "_white") + ".png"
                        width: 24
                        height: 24
                        visible: model.icon !== ""
                        anchors.verticalCenter: parent.verticalCenter
                        fillMode: Image.PreserveAspectFit

                        onSourceChanged: {
                            console.log('iconImage.onSourceChanged:', source, menuList.isActiveItem())
                        }
                    }

                    Label {
                        text: model.title
                        font.pixelSize: 16
                        color: currentPageKey === model.page || mouseArea.pressed ? "black" : "#bbbbbb"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                MouseArea {
                    id: mouseArea
                    enabled: model.enabled
                    anchors.fill: parent

                    onClicked: {
                        if (model.page === "logout") {
                            console.log("Logging out...")  // Implement logout logic here
                            Qt.quit();
                        } else if (model.page !== "" && !menuList.isActiveItem()) {
                            console.log("stackView.push:", model.page)
                            root.switchPage(model.page)
                        }
                        sideMenu.close()
                    }
                }

                // Divider Line
                Rectangle {
                    width: parent.width - 30
                    height: 1
                    color: "#CCCCCC"
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.bottom: parent.bottom
                    visible: model.title === ""  // Show divider only for empty titles
                }
            }
        }

    }

    header: ToolBar {
        id: appBar
        Material.background: Material.primary

        Row {
            spacing: 10
            anchors.fill: parent
            anchors.leftMargin: 10
            height: parent.height - adsBanner.height

            ToolButton {
                icon.source: "qrc:/icons/menu_black.png"
                onClicked: sideMenu.open()
            }

            Label {
                text: qsTr(appName) + " - " + stackView.currentItem.title
                color: Material.foreground
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }


    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "MainPage.qml"

        Loader {
            id: pageLoader
        }

        replaceEnter: Transition {
            PropertyAnimation { property: "opacity"; from: 0; to: 1; duration: 200 }
            NumberAnimation { property: "x"; from: stackView.width; to: 0; duration: 200; easing.type: Easing.OutQuad }
        }

        replaceExit: Transition {
            PropertyAnimation { property: "opacity"; from: 1; to: 0; duration: 200 }
            NumberAnimation { property: "x"; from: 0; to: stackView.width; duration: 200; easing.type: Easing.InQuad }
        }
    }

    footer: ToolBar {
        id: adsBanner
        Material.background: "transparent"  // Ensures transparency
        // background: Rectangle { color: "transparent" }  // Alternative if needed

        height: 10  // Banner height

        // 📢 Banner Ad Placeholder
        Rectangle {
            id: bannerContainer
            // width: parent.width
            // height: 100  // Banner height
            anchors.fill: parent
            color: "transparent"
            anchors.bottom: parent.bottom

            Component.onCompleted: {
                console.log("Main: onCompleted")
                // adMobHelper.loadBannerAd("ca-app-pub-3940256099942544/6300978111");  // Test
                adMobHelper.loadBannerAd("ca-app-pub-9868285787757990/2145044502");
            }
        }
    }
}
