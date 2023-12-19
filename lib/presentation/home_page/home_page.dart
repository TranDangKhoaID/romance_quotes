import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:romance_quotes/app/controller/quotes_controller.dart';
import 'package:romance_quotes/domain/model/category.dart';
import 'package:romance_quotes/domain/model/quote_image.dart';
import 'package:romance_quotes/presentation/detail_banner/detail_banner.dart';
import 'package:romance_quotes/presentation/favorite/favorite_page.dart';
import 'package:romance_quotes/presentation/home_page/component/banner_image_item.dart';
import 'package:romance_quotes/presentation/home_page/component/category_tile.dart';
import 'package:romance_quotes/presentation/home_page/component/title_app_bar.dart';
import 'package:romance_quotes/presentation/quotes/quotes_page.dart';
import 'package:romance_quotes/presentation/setting_page/setting_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            banner(),
            Expanded(child: category()),
          ],
        ),
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
          return const Center(child: Text('No data available'));
        }
      },
    );
  }

  Widget banner() {
    return SizedBox(
      height: 80,
      child: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('quote_images').snapshots(),
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
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: documents.length,
              itemBuilder: (context, index) {
                var document = documents[index];
                final quoteImage = QuoteImage(
                  id: document['id'],
                  url: document['url'],
                );
                return BannerImageItem(
                  quoteImage: quoteImage,
                  onTap: () {
                    Get.to(
                      () => DetailBanner(
                        img: document['url'],
                        onDownload: () {},
                        onShare: () {
                          QuotesController.instance.shareQuoteImage(
                            document['url'],
                          );
                        },
                      ),
                    );
                  },
                );
              },
            );
          } else {
            // Trường hợp không có dữ liệu
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
