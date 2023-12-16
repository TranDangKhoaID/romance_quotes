import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          QuotesItem(),
          QuotesItem(),
          QuotesItem(),
        ],
      ),
    );
  }
}
