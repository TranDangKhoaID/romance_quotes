import 'package:flutter/material.dart';
import 'package:romance_quotes/app/controller/quotes_controller.dart';
import 'package:romance_quotes/app/helpers/db_quotes.dart';
import 'package:romance_quotes/app/manager/color_manager.dart';
import 'package:romance_quotes/domain/model/quotes.dart';
import 'package:romance_quotes/presentation/detail_quotes/component/detail_quotes_item.dart';

class DetailQuotesPage extends StatelessWidget {
  final Quotes quotes;
  final Color color;
  const DetailQuotesPage({
    super.key,
    required this.quotes,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailQuotesItem(
              quotes: quotes,
              color: color,
              onFavorite: () {
                SQLHelper.createItem(
                  quotes.id,
                  quotes.content,
                  quotes.author,
                );
              },
              onCopy: () {
                QuotesController.instance.copyQuotesContent(quotes.content);
              },
              onShare: () {
                QuotesController.instance.shareQuotesContent(quotes.content);
              },
            ),
          ],
        ),
      ),
    );
  }
}
