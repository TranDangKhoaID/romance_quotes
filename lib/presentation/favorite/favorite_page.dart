import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:romance_quotes/app/controller/admob_service.dart';
import 'package:romance_quotes/app/helpers/db_quotes.dart';
import 'package:romance_quotes/app/manager/color_manager.dart';
import 'package:romance_quotes/presentation/favorite/component/favorite_item.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  BannerAd? _bannerAd;
  List<Map<String, dynamic>> journals = [];
  bool isLoading = true;

  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      journals = data;
      isLoading = false;
    });
  }

  void _createBannerAd() {
    _bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdMobService.bannerFavoritesAdUnitID!,
      listener: AdMobService.bannerAdListener,
      request: const AdRequest(),
    )..load();
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();
    _createBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yêu thích'),
        elevation: 0,
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            onPressed: () {
              SQLHelper.deleteAllItems();
              _refreshJournals();
            },
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : journals.isEmpty
              ? const Center(
                  child: Text(
                    "Bạn chưa có câu nói yêu thích của mình!",
                    style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: journals.length,
                  itemBuilder: (context, index) {
                    return FavoriteItem(
                      index: index,
                      content: journals[index]['content'],
                      author: journals[index]['author'],
                      onTap: () async {
                        await SQLHelper.deleteItem(journals[index]['id']);
                        _refreshJournals();
                      },
                    );
                  },
                ),
      bottomNavigationBar: _bannerAd == null
          ? Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 55,
              child: const Text("Quảng cáo không khả dụng"),
            )
          : Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 55,
              child: AdWidget(ad: _bannerAd!),
            ),
    );
  }
}
