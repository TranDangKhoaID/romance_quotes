import 'package:flutter/material.dart';
import 'package:romance_quotes/domain/model/quote_image.dart';

class ImageItem extends StatelessWidget {
  final QuoteImage quoteImage;
  final void Function()? onTap;
  const ImageItem({
    super.key,
    required this.quoteImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Image.network(
          quoteImage.url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
