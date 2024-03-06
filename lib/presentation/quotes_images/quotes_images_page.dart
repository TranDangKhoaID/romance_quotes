import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:romance_quotes/app/controller/admob_service.dart';
import 'package:romance_quotes/app/controller/quotes_controller.dart';
import 'package:romance_quotes/domain/model/quote_image.dart';
import 'package:romance_quotes/presentation/detail_banner/detail_banner.dart';
import 'package:romance_quotes/presentation/quotes_images/component/image_item.dart';

class QuotesImagePage extends StatefulWidget {
  const QuotesImagePage({super.key});

  @override
  State<QuotesImagePage> createState() => _QuotesImagePageState();
}

class _QuotesImagePageState extends State<QuotesImagePage> {
  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    _createBannerAd();
    _createInterstitialAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }

  void _createBannerAd() {
    _bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdMobService.bannerImageQuotesAdUnitID!,
      listener: AdMobService.bannerAdListener,
      request: const AdRequest(),
    )..load();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdMobService.interstitialImageQuotesUnitID!,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd = ad,
        onAdFailedToLoad: (error) => _interstitialAd = null,
      ),
    );
  }

  _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _createInterstitialAd();
        },
      );
      _interstitialAd!.show();
      _interstitialAd = null;
    } else {
      _createInterstitialAd();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kho ảnh',
          semanticsLabel: 'Quotes Image Title',
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: image(),
      ),
      bottomNavigationBar: _bannerAd == null
          ? Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 55,
              child: const Text(
                "Quảng cáo không khả dụng",
                semanticsLabel: 'No Ad Available Label',
              ),
            )
          : Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 55,
              child: AdWidget(ad: _bannerAd!),
            ),
    );
  }

  Widget image() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('quote_images').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text(
              'Đang tải...',
              style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          );
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          List<DocumentSnapshot> documents = snapshot.data!.docs;
          return GridView.builder(
            itemCount: documents.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemBuilder: (context, index) {
              var document = documents[index];
              final quoteImage = QuoteImage(
                id: document['id'],
                url: document['url'],
              );
              return ImageItem(
                quoteImage: quoteImage,
                onTap: () {
                  _showInterstitialAd();
                  Get.to(
                    () => DetailBanner(
                      img: quoteImage.url,
                      onDownload: () {
                        QuotesController.instance.downloadQuoteImage(
                          quoteImage.url,
                          context,
                        );
                      },
                      onShare: () => QuotesController.instance
                          .shareQuoteImage(quoteImage.url),
                    ),
                  );
                },
              );
            },
          );
        } else {
          // Trường hợp không có dữ liệu
          return const Center(
            child: Text(
              'No data available',
              semanticsLabel: 'No data available',
            ),
          );
        }
      },
    );
  }
}
