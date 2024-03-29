import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:romance_quotes/domain/model/quotes.dart';

class DetailQuotesItem extends StatelessWidget {
  final Quotes quotes;
  final void Function()? onFavorite;
  final void Function()? onCopy;
  final void Function()? onShare;
  final Color color;
  const DetailQuotesItem({
    super.key,
    required this.quotes,
    required this.onFavorite,
    required this.onCopy,
    required this.onShare,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: color,
        ),
      ),
      child: Column(
        children: [
          Text(
            quotes.content,
            softWrap: true,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 17,
              wordSpacing: 0.5,
            ),
          ),
          const Gap(10),
          Container(
            alignment: Alignment.center,
            child: Text(
              quotes.author ?? '',
              style: const TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
                fontSize: 13,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: onFavorite,
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
              const Gap(10),
              IconButton(
                onPressed: onCopy,
                icon: const Icon(Icons.copy),
              ),
              const Gap(10),
              IconButton(
                onPressed: onShare,
                icon: const Icon(Icons.share),
              ),
            ],
          )
        ],
      ),
    );
  }
}
