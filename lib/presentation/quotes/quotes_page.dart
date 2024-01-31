import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:romance_quotes/app/controller/admob_service.dart';
import 'package:romance_quotes/app/manager/color_manager.dart';
import 'package:romance_quotes/domain/model/category.dart';
import 'package:romance_quotes/domain/model/quotes.dart';
import 'package:romance_quotes/presentation/detail_quotes/detail_quotes.dart';
import 'package:romance_quotes/presentation/quotes/component/quotes_item.dart';

class QuotesPage extends StatefulWidget {
  final Category category;
  const QuotesPage({
    super.key,
    required this.category,
  });

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
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
      adUnitId: AdMobService.bannerQuotesAdUnitID!,
      listener: AdMobService.bannerAdListener,
      request: const AdRequest(),
    )..load();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdMobService.interstitialQuotesPageAdUnitID!,
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
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text(
          widget.category.title,
          semanticsLabel: 'Quotes Page Title',
        ),
      ),
      body: Column(
        children: [
          _bannerAd == null
              ? Container(
                  alignment: Alignment.center,
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
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('categories')
                  .doc(widget.category.id)
                  .collection('quotes')
                  .snapshots(),
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
                  return Center(
                      child: Text(
                    'Error: ${snapshot.error}',
                    semanticsLabel: 'Data error',
                  ));
                }
                if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  List<DocumentSnapshot> documents = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      var document = documents[index];
                      final quotes = Quotes(
                        id: document['id'],
                        content: document['content'],
                        author: document['author'],
                      );
                      final color = generateRandomColor();
                      return QuotesItem(
                        quotes: quotes,
                        color: color,
                        index: index,
                        onTap: () {
                          _showInterstitialAd();
                          Get.to(
                            () => DetailQuotesPage(
                              title: widget.category.title,
                              index: index,
                              quotes: quotes,
                              color: color,
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
            ),
          ),
        ],
      ),
    );
  }
}
