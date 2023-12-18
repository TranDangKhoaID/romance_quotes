import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:romance_quotes/app/storages/app_shared.dart';
import 'package:romance_quotes/domain/model/quotes.dart';
import 'package:share/share.dart';

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
}
