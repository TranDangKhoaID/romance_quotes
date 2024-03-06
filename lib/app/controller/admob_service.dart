import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/*
test ad
Banner ads: "ca-app-pub-3940256099942544/6300978111"
Interstitial ads: "ca-app-pub-3940256099942544/1033173712"
Rewarded ads: "ca-app-pub-3940256099942544/5224354917"
Native ads: "ca-app-pub-3940256099942544/2247696110"
*/
class AdMobService {
  //banner ad
  static final BannerAdListener bannerAdListener = BannerAdListener(
    onAdLoaded: (ad) => debugPrint('Ad load'),
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      debugPrint('Ad failed to load: $error');
    },
    onAdOpened: (ad) => debugPrint('Ad opened'),
    onAdClosed: (ad) => debugPrint('Ad closed'),
  );
  static String? get bannerHomePageAdUnitID {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8347334978438891/4007588188';
      // } else if (Platform.isIOS) {
      //   return 'ca-app-pub-8347334978438891/5484925658';
      // }
    }
    return null;
  }

  static String? get bannerQuotesAdUnitID {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8347334978438891/3689584483';
      // } else if (Platform.isIOS) {
      //   return 'ca-app-pub-8347334978438891/2676563369';
      // }
    }
    return null;
  }

  static String? get bannerDetailQuotesAdUnitID {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8347334978438891/6202506683';
      // } else if (Platform.isIOS) {
      //   return 'ca-app-pub-8347334978438891/4345648501';
      // }
    }
    return null;
  }

  static String? get bannerImageQuotesAdUnitID {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8347334978438891/8311355773';
      // } else if (Platform.isIOS) {
      //   return 'ca-app-pub-8347334978438891/7472189500';
      // }
    }
    return null;
  }

  static String? get bannerFavoritesAdUnitID {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8347334978438891/7268176347';
      // } else if (Platform.isIOS) {
      //   return 'ca-app-pub-8347334978438891/4231782649';
      // }
    }
    return null;
  }

  static String? get bannerSettingAdUnitID {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8347334978438891/1993359433';
      // } else if (Platform.isIOS) {
      //   return 'ca-app-pub-8347334978438891/8987601091';
      // }
    }
    return null;
  }

  static String? get bannerDetailImageAdUnitID {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8347334978438891/1981751147';
      // } else if (Platform.isIOS) {
      //   return 'ca-app-pub-8347334978438891/8987601091';
      // }
    }
    return null;
  }

  //interstitial ad
  static String? get interstitialImageQuotesUnitID {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8347334978438891/4031638917';
      // } else if (Platform.isIOS) {
      //   return 'ca-app-pub-8347334978438891/9327450825';
      // }
    }
    return null;
  }

  static String? get interstitialQuotesPageAdUnitID {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8347334978438891/3193199966';
      // } else if (Platform.isIOS) {
      //   return 'ca-app-pub-8347334978438891/7851463453';
      // }
    }
    return null;
  }

  //test
  static String? get interstitialAdUnitID {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/1033173712';
      // } else if (Platform.isIOS) {
      //   return 'ca-app-pub-3940256099942544/1033173712';
      // }
    }
    return null;
  }

  static String? get bannerAdUnitID {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/6300978111';
    }
    return null;
  }
}
