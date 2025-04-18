package org.amidlab;

import java.util.List;

import android.content.Context;
import android.util.Log;

import com.google.mlkit.nl.translate.Translation;
import com.google.mlkit.nl.translate.Translator;
import com.google.mlkit.nl.translate.TranslatorOptions;
import com.google.mlkit.nl.translate.TranslateRemoteModel;
import com.google.mlkit.nl.translate.TranslateLanguage;
import com.google.mlkit.nl.languageid.IdentifiedLanguage;
import com.google.mlkit.nl.languageid.LanguageIdentification;
import com.google.mlkit.nl.languageid.LanguageIdentifier;
import com.google.mlkit.common.model.RemoteModel;
import com.google.mlkit.common.model.RemoteModelManager;
import com.google.mlkit.common.model.DownloadConditions;

public class OfflineTranslatorHelper {
    private static Translator translator;
    private static String textToTranslate;
    private static long translatedCallbackPtr;

    public static void fetchSupportedLanguages(long callbackId) {
        new Thread(() -> {
            Log.d("MLKit", "fetchSupportedLanguages invoked");
            List<String> languages = TranslateLanguage.getAllLanguages();
            for (String lang : languages) {
                Log.d("SupportedLang:", lang);
            }
            nativeOnLanguagesRetrieved(callbackId, languages.toArray(new String[0]));
        }).start();
    }

    public static void translateText(String text, String srcLangCode, String dstLangCode, long callbackPtr) {
        textToTranslate = text;
        translatedCallbackPtr = callbackPtr;

        Log.e("translateText: ", text + " " + srcLangCode + " to " + dstLangCode);

        if (srcLangCode.equals("auto")) {
            Log.e("translateText: ", srcLangCode);
            nativeOnProgress(callbackPtr, "Detecting source language...");
            LanguageIdentifier languageIdentifier = LanguageIdentification.getClient();

            languageIdentifier.identifyLanguage(text)
                .addOnSuccessListener(languageCode -> {
                    if (languageCode.equals("und")) {
                        // callback.onFailure(new Exception("Could not detect language"));
                        nativeOnFailure(translatedCallbackPtr, "Could not detect language");
                    } else {
                        Log.d("MLKit", "Detected language: " + languageCode);
                        translateText(text, languageCode, dstLangCode, translatedCallbackPtr);
                    }
                })
                .addOnFailureListener(e -> nativeOnFailure(translatedCallbackPtr, e.getMessage()));

            return;
        }

        Log.d("MLKit", "LanguageDetected: " + srcLangCode);
        nativeOnLanguageDetected(translatedCallbackPtr, srcLangCode);


        TranslatorOptions options = new TranslatorOptions.Builder()
            // .setSourceLanguage(TranslateLanguage.ENGLISH)
            // .setTargetLanguage(TranslateLanguage.UKRAINIAN)
            // .setSourceLanguage("en")
            .setSourceLanguage(srcLangCode)
            // .setTargetLanguage("pl")
            .setTargetLanguage(dstLangCode)
            .build();

        translator = Translation.getClient(options);


        RemoteModelManager modelManager = RemoteModelManager.getInstance();
        TranslateRemoteModel model = new TranslateRemoteModel.Builder(srcLangCode).build();

        modelManager.isModelDownloaded(model)
            .addOnSuccessListener(isDownloaded -> {
                Log.d("MLKit", "isModelDownloaded: " + isDownloaded);

                // Disabled because en case of 'en' language isDownloaded always true:
                // if (isDownloaded)
                //     onModelDownloadSuccess(srcLangCode, dstLangCode;
                // else
                //     downloadModel(srcLangCode, dstLangCode);

                downloadModel(srcLangCode, dstLangCode);
            })
            .addOnFailureListener(e -> {
                Log.e("MLKit", "Failed isModelDownloaded", e);
                nativeOnFailure(translatedCallbackPtr, e.getMessage());
        });
    }

    private static void downloadModel(String srcLangCode, String dstLangCode) {
        Log.d("MLKit", "Start Model downloading... " + srcLangCode + '-' + dstLangCode);
        nativeOnProgress(translatedCallbackPtr, "Downloading '" + srcLangCode + '-' + dstLangCode + "' language...");
        DownloadConditions conditions = new DownloadConditions.Builder()
            // .requireWifi()
            .build();

        translator.downloadModelIfNeeded(conditions)
            .addOnSuccessListener(aVoid -> onModelDownloadSuccess(srcLangCode, dstLangCode))
            .addOnFailureListener(e -> {
                Log.e("MLKit", "Model download failed", e);
                nativeOnFailure(translatedCallbackPtr, e.getMessage());
            });
    }

    private static void onModelDownloadSuccess(String srcLangCode, String dstLangCode) {
        Log.d("MLKit", "Model downloaded successfully for " + srcLangCode + '-' + dstLangCode);
        nativeOnProgress(translatedCallbackPtr, "Language '" + srcLangCode + '-' + dstLangCode + "' downloaded");

        translator.translate(textToTranslate)
            .addOnSuccessListener(translatedText -> {
                Log.d("MLKit", "Translated text: " + translatedText);
                nativeOnProgress(translatedCallbackPtr, "Translation finished");
                nativeOnSuccess(translatedCallbackPtr, translatedText);                

                // TODO(amid): remove:
                RemoteModelManager modelManager = RemoteModelManager.getInstance();
                TranslateRemoteModel model = new TranslateRemoteModel.Builder(srcLangCode).build();

                // modelManager.deleteDownloadedModel(model)
                //     .addOnSuccessListener(aVoid -> Log.d("MLKit", "Deleted model successfully"))
                //     .addOnFailureListener(e -> Log.e("MLKit", "Failed to delete model", e));
            })
            .addOnFailureListener(e -> nativeOnFailure(translatedCallbackPtr, e.getMessage()));
    }


    // Native methods to send results to C++
    public static native void nativeOnLanguagesRetrieved(long callbackId, String[] languages);

    private static native void nativeOnProgress(long callbackPtr, String message);
    private static native void nativeOnLanguageDetected(long callbackPtr, String langCode);
    private static native void nativeOnSuccess(long callbackPtr, String translatedText);
    private static native void nativeOnFailure(long callbackPtr, String errorMessage);
}
