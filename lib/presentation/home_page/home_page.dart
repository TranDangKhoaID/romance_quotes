import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:romance_quotes/app/controller/admob_service.dart';
import 'package:romance_quotes/domain/model/category.dart';
import 'package:romance_quotes/presentation/favorite/favorite_page.dart';
import 'package:romance_quotes/presentation/home_page/component/category_tile.dart';
import 'package:romance_quotes/presentation/home_page/component/title_app_bar.dart';
import 'package:romance_quotes/presentation/quotes/quotes_page.dart';
import 'package:romance_quotes/presentation/quotes_images/quotes_images_page.dart';
import 'package:romance_quotes/presentation/setting_page/setting_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    _createBannerAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  void _createBannerAd() {
    _bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdMobService.bannerHomePageAdUnitID!,
      listener: AdMobService.bannerAdListener,
      request: const AdRequest(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar(
          onFavorites: () {
            Get.to(() => const FavoritePage());
          },
          onSetting: () {
            Get.to(() => const SettingPage());
          },
          onQImages: () {
            Get.to(() => const QuotesImagePage());
          },
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: category(),
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

  Widget category() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('categories').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          List<DocumentSnapshot> documents = snapshot.data!.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              var document = documents[index];
              final category = Category(
                id: document['id'],
                title: document['title'],
                subtitle: document['subtitle'],
                urlImage: document['urlImage'],
              );
              return CategoryTile(
                category: category,
                onTap: () {
                  Get.to(
                    () => QuotesPage(
                      category: category,
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
          ));
        }
      },
    );
  }
}
