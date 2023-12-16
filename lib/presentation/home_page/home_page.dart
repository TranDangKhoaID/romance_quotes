import 'package:flutter/material.dart';
import 'package:romance_quotes/app/constants/url_images.dart';
import 'package:romance_quotes/presentation/home_page/component/banner_image_item.dart';
import 'package:romance_quotes/presentation/home_page/component/title_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar(),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            banner(),
            Column(
              children: [],
            ),
          ],
        ),
      ),
    );
  }

  Widget banner() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
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
