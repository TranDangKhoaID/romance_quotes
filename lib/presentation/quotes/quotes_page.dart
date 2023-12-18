import 'package:flutter/material.dart';
import 'package:romance_quotes/app/controller/quotes_controller.dart';
import 'package:romance_quotes/app/helpers/db_quotes.dart';
import 'package:romance_quotes/app/storages/app_shared.dart';
import 'package:romance_quotes/data/fake_data/quotes_data.dart';
import 'package:romance_quotes/presentation/quotes/component/quotes_item.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
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
            onFavorite: () async {
              await SQLHelper.createItem(
                QuotesData.quotesList()[index].id,
                QuotesData.quotesList()[index].categoryID,
                QuotesData.quotesList()[index].content,
                QuotesData.quotesList()[index].author,
              );
              var quotes = await SQLHelper.getItems();
              print(quotes);
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
