import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:romance_quotes/app/controller/quotes_controller.dart';
import 'package:romance_quotes/domain/model/quote_image.dart';
import 'package:romance_quotes/presentation/detail_banner/detail_banner.dart';
import 'package:romance_quotes/presentation/quotes_images/component/image_item.dart';

class QuotesImagePage extends StatelessWidget {
  const QuotesImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kho ảnh'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: image(),
    );
  }

  Widget image() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('quote_images').snapshots(),
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
          return GridView.builder(
            itemCount: documents.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemBuilder: (context, index) {
              var document = documents[index];
              final quoteImage = QuoteImage(
                id: document['id'],
                url: document['url'],
              );
              return ImageItem(
                quoteImage: quoteImage,
                onTap: () {
                  Get.to(
                    () => DetailBanner(
                      img: quoteImage.url,
                      onDownload: () {},
                      onShare: () {
                        QuotesController.instance
                            .shareQuoteImage(quoteImage.url);
                      },
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
    );
  }
}