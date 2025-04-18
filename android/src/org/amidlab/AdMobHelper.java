package org.amidlab;

import android.util.Log;

import android.app.Activity;
import android.widget.FrameLayout;
import android.view.ViewGroup;
import android.view.Gravity;
// import com.google.android.gms.ads.*;
import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdView;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.MobileAds;
import com.google.android.gms.ads.AdListener;

public class AdMobHelper {
    private Activity activity;
    private AdView adView;

    public AdMobHelper(Activity activity) {
        this.activity = activity;
    }

    public void loadBannerAd(final String adUnitId, long callbackPtr) {
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                Log.d("SOSGuideAds", "run");
                adView = new AdView(activity);
                Log.d("SOSGuideAds", "After new AdView");
                // adView.setAdSize(AdSize.BANNER);  // Should be Standard 320x50dp, but sometimes it's 468x60
                // adView.setAdSize(new AdSize(468, 60));
                adView.setAdSize(AdSize.LARGE_BANNER);
                adView.setAdUnitId(adUnitId);
                
                FrameLayout layout = new FrameLayout(activity);
                Log.d("SOSGuideAds", "After new FrameLayout");

                // Create Layout Params
                FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                        FrameLayout.LayoutParams.MATCH_PARENT,
                        FrameLayout.LayoutParams.WRAP_CONTENT,
                        Gravity.BOTTOM);

                adView.setAdListener(new AdListener()
                    {
                        // Add listener when an ad finishes loading
                        public void onAdLoaded()
                        {
                            Log.d("SOSGuideAds", "onAdLoaded");
                            nativeOnBannerLoaded(callbackPtr);
                        }

                        public void onAdFailedToLoad(int errorCode)
                        {
                            Log.d("SOSGuideAds", "onAdFailedToLoad");
                            // BannerFailedToLoad(errorCode);
                        }

                        public void onAdOpened()
                        {
                            Log.d("SOSGuideAds", "onAdOpened");
                            // BannerOpened();
                        }

                        public void onAdLeftApplication()
                        {
                            Log.d("SOSGuideAds", "onAdLeftApplication");
                            // BannerLeftApplication();
                        }

                        public void onAdClosed()
                        {
                            Log.d("SOSGuideAds", "onAdClosed");
                            // BannerClosed();
                        }

                        public void onAdClicked()
                        {
                            Log.d("SOSGuideAds", "onAdClicked");
                            // BannerLoaded();
                        }

                         public void onAdImpression()
                        {
                            Log.d("SOSGuideAds", "onAdImpression");
                            // BannerLoaded();
                        }
                    });
                Log.d("SOSGuideAds", "After setAdListener");

                // Add Banner to Layout
                activity.addContentView(adView, params);
                Log.d("SOSGuideAds", "After addContentView");

                adView.loadAd(new AdRequest.Builder().build());
                Log.d("SOSGuideAds", "After loadAd");
            }
        });
    }

    private native void nativeOnBannerLoaded(long callbackPtr);
}
