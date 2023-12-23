import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static String? get bannerAdUnitID {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8347334978438891/3819709940';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8347334978438891/5484925658';
    }
    return null;
  }

  static String? get interstitialAdUnitID {
    if (Platform.isAndroid) {
      return '';
    } else if (Platform.isIOS) {
      return '';
    }
    return null;
  }

  static final BannerAdListener bannerAdListener = BannerAdListener(
    onAdLoaded: (ad) => debugPrint('Ad load'),
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      debugPrint('Ad failed to load: $error');
    },
    onAdOpened: (ad) => debugPrint('Ad opened'),
    onAdClosed: (ad) => debugPrint('Ad closed'),
  );
}
