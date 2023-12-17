import 'package:flutter/material.dart';
import 'package:romance_quotes/app/controller/quotes_controller.dart';
import 'package:romance_quotes/app/storage/app_shared.dart';
import 'package:romance_quotes/data/fake_data/quotes_data.dart';
import 'package:romance_quotes/presentation/quotes/component/quotes_item.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: Text('Lãng mạn'),
      ),
      body: ListView.builder(
        itemCount: QuotesData.quotesList().length,
        itemBuilder: (context, index) {
          return QuotesItem(
            quotes: QuotesData.quotesList()[index],
            onFavorite: () {
              QuotesController.instance.saveFavorites(
                context,
                QuotesData.quotesList()[index],
                index,
              );
            },
            onCopy: () {
              QuotesController.instance
                  .copyQuotesContent(QuotesData.quotesList()[index].content);
            },
            onShare: () {
              QuotesController.instance
                  .shareQuotesContent(QuotesData.quotesList()[index].content);
            },
          );
        },
      ),
    );
  }
}
