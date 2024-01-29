import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:romance_quotes/app/controller/admob_service.dart';
import 'package:romance_quotes/app/controller/quotes_controller.dart';
import 'package:romance_quotes/app/helpers/db_quotes.dart';
import 'package:romance_quotes/app/manager/color_manager.dart';
import 'package:romance_quotes/domain/model/quotes.dart';
import 'package:romance_quotes/presentation/detail_quotes/component/detail_quotes_item.dart';

class DetailQuotesPage extends StatefulWidget {
  final int index;
  final String title;
  final Quotes quotes;
  final Color color;
  const DetailQuotesPage({
    super.key,
    required this.quotes,
    required this.color,
    required this.index,
    required this.title,
  });

  @override
  State<DetailQuotesPage> createState() => _DetailQuotesPageState();
}

class _DetailQuotesPageState extends State<DetailQuotesPage> {
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    _createBannerAd();
  }

  void _createBannerAd() {
    _bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdMobService.bannerDetailQuotesAdUnitID!,
      listener: AdMobService.bannerAdListener,
      request: const AdRequest(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text('${widget.title} #${widget.index + 1}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailQuotesItem(
              quotes: widget.quotes,
              color: widget.color,
              onFavorite: () {
                SQLHelper.createItem(
                  widget.quotes.id,
                  widget.quotes.content,
                  widget.quotes.author,
                );
              },
              onCopy: () {
                QuotesController.instance
                    .copyQuotesContent(widget.quotes.content);
              },
              onShare: () {
                QuotesController.instance
                    .shareQuotesContent(widget.quotes.content);
              },
            ),
          ],
        ),
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
