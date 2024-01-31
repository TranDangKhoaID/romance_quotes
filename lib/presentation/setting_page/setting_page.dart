import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:romance_quotes/app/constants/strings.dart';
import 'package:romance_quotes/app/controller/admob_service.dart';
import 'package:romance_quotes/app/controller/quotes_controller.dart';
import 'package:romance_quotes/app/manager/color_manager.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  BannerAd? _bannerAd;

  void _createBannerAd() {
    _bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdMobService.bannerSettingAdUnitID!,
      listener: AdMobService.bannerAdListener,
      request: const AdRequest(),
    )..load();
  }

  @override
  void initState() {
    super.initState();
    _createBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt'),
        elevation: 0,
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(
                Icons.rate_review,
                color: AppColors.primary,
              ),
              onTap: () {},
              title: const Text(
                "Đánh giá ứng dụng",
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            const Divider(
              height: 1,
              color: Colors.black12,
            ),
            ListTile(
              leading: Icon(
                Icons.share,
                color: AppColors.primary,
              ),
              onTap: () {},
              title: const Text(
                "Chia sẻ ứng dụng",
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            const Divider(
              height: 1,
              color: Colors.black12,
            ),
            ListTile(
              leading: Icon(
                Icons.privacy_tip,
                color: AppColors.primary,
              ),
              onTap: () {
                QuotesController.instance.launchUrlWWeb(
                  Constants.pathPolicyPrivacy,
                );
              },
              title: const Text(
                "Chính sách bảo mật",
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            const Divider(
              height: 1,
              color: Colors.black12,
            ),
            ListTile(
              leading: Icon(
                Icons.bookmark,
                color: AppColors.primary,
              ),
              onTap: () {
                QuotesController.instance.launchUrlWWeb(
                  Constants.pathTermsAndConditions,
                );
              },
              title: const Text(
                "Các điều khoản và điều kiện",
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            const Divider(
              height: 1,
              color: Colors.black12,
            ),
            ListTile(
              leading: Icon(
                Icons.contact_support,
                color: AppColors.primary,
              ),
              onTap: () {
                QuotesController.instance.launchEmail(
                  Constants.emailContant,
                );
              },
              title: const Text(
                "Liên hệ hỗ trợ",
              ),
              subtitle:
                  const Text('Gửi email đến bộ phận hỗ trợ của chúng tôi'),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            const Divider(
              height: 1,
              color: Colors.black12,
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
