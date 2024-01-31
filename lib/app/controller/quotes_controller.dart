import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class QuotesController extends GetxController {
  static QuotesController get instance => Get.find();

  void copyQuotesContent(String content) {
    Clipboard.setData(ClipboardData(text: content));
  }

  void shareQuotesContent(String content) {
    Share.share(content);
  }

  void shareQuoteImage(String imageUrl) {
    Share.share(imageUrl);
  }

  Future<dynamic> launchEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': 'Hỗ trợ',
        'body': 'Nội dung',
      },
    );

    if (!await launchUrl(emailLaunchUri)) {
      EasyLoading.showError('Không thể mở ứng dụng email $emailLaunchUri');
    }
  }

  Future<void> launchUrlWWeb(String url) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: 'doc-hosting.flycricket.io',
      path: url,
    );

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      EasyLoading.showError('Không thể mở ứng dụng $uri');
    }
  }
}
