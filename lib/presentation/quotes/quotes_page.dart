import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:romance_quotes/app/controller/quotes_controller.dart';
import 'package:romance_quotes/app/helpers/db_quotes.dart';
import 'package:romance_quotes/app/manager/color_manager.dart';
import 'package:romance_quotes/domain/model/category.dart';
import 'package:romance_quotes/domain/model/quotes.dart';
import 'package:romance_quotes/presentation/detail_quotes/component/detail_quotes_item.dart';
import 'package:romance_quotes/presentation/detail_quotes/detail_quotes.dart';
import 'package:romance_quotes/presentation/quotes/component/quotes_item.dart';

class QuotesPage extends StatelessWidget {
  final Category category;
  const QuotesPage({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text(category.title),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('categories')
            .doc(category.id)
            .collection('quotes')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text(
                'Đang tải...',
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
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
                final quotes = Quotes(
                  id: document['id'],
                  content: document['content'],
                  author: document['author'],
                );
                final color = generateRandomColor();
                return QuotesItem(
                  quotes: quotes,
                  color: color,
                  index: index,
                  onTap: () {
                    Get.to(
                      () => DetailQuotesPage(
                        quotes: quotes,
                        color: color,
                      ),
                    );
                  },
                );
              },
            );
          } else {
            // Trường hợp không có dữ liệu
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
