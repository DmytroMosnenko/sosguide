import QtQuick 6.8
import QtCore 6.8
import QtQuick.Controls 6.8

Page {
    id: translatorPage
    title: qsTr("Offline Translator")
    objectName: "TranslatorPage"

    property string sourceTextPlaceHolder: qsTr("Enter text to translate")

    enum TranslateStatus {
        Init,
        Ready,
        InProgress
    }

    property int translateStatus: TranslatorPage.TranslateStatus.Init

    Connections {
        target: offlineTranslatorHelper

        function onTranslationLanguageDetected(text) {
            console.log("onTranslationLanguageDetected:", text);
            inputText.placeholderText = sourceTextPlaceHolder + " (" + text + ")";
        }

        function onTranslationProgress(text) {
            translateStatus = TranslatorPage.TranslateStatus.InProgress;
            statusText.text = "Translation: " + text;
            progressContainerTimer.start();
        }

        function onTranslationSuccess(text) {
            outputText.text = text;
            translateStatus = TranslatorPage.TranslateStatus.Ready;
            if (!progressContainerTimer.running)
                progressContainerTimer.start();
        }

        function onTranslationFailed(error) {
            console.log("Translation failed: " + error);
            statusText.text = "Translation failed: " + error;
            progressContainer.opacity = 1;
            translateStatus = TranslatorPage.TranslateStatus.Ready;
            if (!progressContainerTimer.running)
                progressContainerTimer.start();
        }
    }

    // Toast message for progress text
    Rectangle {
        id: progressContainer
        width: statusText.width + 20
        height: 40
        color: "#333"
        radius: 10
        z: 999
        opacity: 0
        // opacity: 1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        // y: 150
        anchors.bottomMargin: 50

        Text {
            id: statusText
            anchors.centerIn: parent
            color: "white"
            clip: true
            text: qsTr("Translation progress here")
            elide: Text.ElideRight
            onTextChanged: {
                if (statusText.implicitWidth + 20 > translatorPage.width - 40)
                    statusText.width = translatorPage.width - 40
                else
                    statusText.width = statusText.implicitWidth + 20
            }
        }

        Behavior on opacity { NumberAnimation { duration: 300 } }
    }

    // Timer to reset progress text
    Timer {
        id: progressContainerTimer
        interval: 2000 // Reset after 2 seconds
        onTriggered: {
            if (translateStatus === TranslatorPage.TranslateStatus.Init) {
                statusText.text = "⚠ First translation requires Internet!";
                translateStatus = TranslatorPage.TranslateStatus.Ready
                progressContainer.opacity = 1;
                progressContainerTimer.start();
                return
            }

            progressContainer.opacity = translateStatus === TranslatorPage.TranslateStatus.InProgress;
        }
    }

    ScrollView {
        anchors.fill: parent
        contentWidth: parent.width
        clip: true

        Column {
            spacing: 10
            anchors.centerIn: parent
            width: parent.width * 0.9

            Item {
                width: 1
                height: 10 // This adds dummy margin
            }

            TextArea {
                id: inputText
                height: Math.max(implicitHeight, font.pixelSize * 6)
                width: parent.width
                wrapMode: TextEdit.Wrap
                placeholderText: qsTr("Enter text to translate")
            }

            ListModel {
                id: languageModel
            }

            ComboBox {
                id: languageSelector
                width: parent.width
                model: languageModel

                Component.onCompleted: {
                    offlineTranslatorHelper.languagesRetrieved.connect((langs) => {
                        var systemLangCode = LocalizationHelper.getSystemLanguageCode();
                        console.log("languagesRetrieved:", systemLangCode, languageSelector.count, langs);
                        languageModel.clear();

                        languageSelector.model = langs.map(code => ({
                            code: code,
                            name: LocalizationHelper.getLanguageName(code)
                        }));

                        languageSelector.textRole = "name";


                        for (var i = 0; i < languageSelector.count; ++i)
                        {
                            if (languageSelector.model[i].code === systemLangCode) {
                                languageSelector.currentIndex = i;
                                break;
                            }
                        }
                    });
                    offlineTranslatorHelper.getSupportedLanguages();
                }
            }

            Button {
                text: qsTr("Translate")
                width: parent.width * 0.5
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    console.log("Translating text: " + inputText.text + " to " + languageSelector.currentText +
                                "(" + languageSelector.model[languageSelector.currentIndex].code +")");
                    if (inputText.text.trim().length > 0) {
                        offlineTranslatorHelper.translateText(
                                    inputText.text,  languageSelector.model[languageSelector.currentIndex].code);
                    }
                }
            }

            TextArea {
                id: outputText
                width: parent.width
                height: Math.max(implicitHeight, font.pixelSize * 6)
                readOnly: true
                wrapMode: TextEdit.Wrap
                placeholderText: qsTr("Translation result will appear here")
            }

            Item {
                width: 1
                height: 10 // This adds dummy margin
            }
        }
    }

        Component.onCompleted: {
            progressContainerTimer.start();
        }
}
