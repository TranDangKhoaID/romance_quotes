import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

class QuotesController extends GetxController {
  static QuotesController get instance => Get.find();

  void copyQuotesContent(String content) {
    Clipboard.setData(ClipboardData(text: content));
  }

  void shareQuotesContent(String content) {
    Share.share(content);
  }
}
