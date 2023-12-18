import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:romance_quotes/app/constants/url_images.dart';
import 'package:romance_quotes/presentation/detail_banner/detail_banner.dart';
import 'package:romance_quotes/presentation/favorite/favorite_page.dart';
import 'package:romance_quotes/presentation/home_page/component/banner_image_item.dart';
import 'package:romance_quotes/presentation/home_page/component/category_tile.dart';
import 'package:romance_quotes/presentation/home_page/component/title_app_bar.dart';
import 'package:romance_quotes/presentation/quotes/quotes_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar(
          onFavorites: () {
            Get.to(() => FavoritePage());
          },
          onSetting: () {},
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            banner(),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('categories')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
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
                        return CategoryTile(
                          img: document['urlImage'],
                          title: document['title'],
                          subtitle: document['subtitle'],
                          onTap: () {},
                        );
                      },
                    );
                  } else {
                    // Trường hợp không có dữ liệu
                    return Center(child: Text('No data available'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget category() {
    return Column(
      children: [
        CategoryTile(
          img:
              'https://th.bing.com/th/id/OIP.d5qYPeR2mVuhAQT0gPfTrAHaHk?rs=1&pid=ImgDetMain',
          title: 'Lãng Mạn',
          subtitle: 'Tuyển tập 10001 lãng mạn',
          onTap: () {
            Get.to(() => QuotesPage());
          },
        ),
        CategoryTile(
          img:
              'https://th.bing.com/th/id/R.b4cb61859eef62c13d2ecd06b15e382d?rik=D571YJhbRgcCpQ&pid=ImgRaw&r=0',
          title: 'Cuộc sống',
          subtitle: 'Cuộc sống, lạc quan, yêu đời',
          onTap: () {},
        ),
        CategoryTile(
          img:
              'https://th.bing.com/th/id/OIP.brreJ4Xo55xbIp51rrI9fAHaFc?rs=1&pid=ImgDetMain',
          title: 'Học tập',
          subtitle: 'Học, học nữa, học mãi',
          onTap: () {},
        ),
      ],
    );
  }

  Widget banner() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          BannerImageItem(
            onTap: () {
              Get.to(
                () => DetailBanner(
                  img: UrlImages.onepiece,
                ),
              );
            },
            url: UrlImages.onepiece,
          ),
          BannerImageItem(
            onTap: () {},
            url: UrlImages.bleach,
          ),
          BannerImageItem(
            onTap: () {},
            url: UrlImages.gintama,
          ),
          BannerImageItem(
            onTap: () {},
            url: UrlImages.onepiece,
          ),
          BannerImageItem(
            onTap: () {},
            url: UrlImages.bleach,
          ),
          BannerImageItem(
            onTap: () {},
            url: UrlImages.gintama,
          ),
        ],
      ),
    );
  }
}
