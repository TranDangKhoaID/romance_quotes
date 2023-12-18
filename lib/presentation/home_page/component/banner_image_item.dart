import 'package:flutter/material.dart';
import 'package:romance_quotes/domain/model/quote_image.dart';

class BannerImageItem extends StatelessWidget {
  final void Function()? onTap;
  final QuoteImage quoteImage;
  const BannerImageItem({
    super.key,
    required this.onTap,
    required this.quoteImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        child: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(quoteImage.url.toString()),
        ),
      ),
    );
  }
}
