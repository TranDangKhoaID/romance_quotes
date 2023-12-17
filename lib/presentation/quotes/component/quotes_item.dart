import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:romance_quotes/app/manager/color_manager.dart';
import 'package:romance_quotes/domain/model/quotes.dart';

class QuotesItem extends StatelessWidget {
  final Quotes quotes;
  final void Function()? onFavorite;
  final void Function()? onCopy;
  final void Function()? onShare;
  const QuotesItem({
    super.key,
    required this.quotes,
    required this.onFavorite,
    required this.onCopy,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: generateRandomColor(),
        ),
      ),
      child: Column(
        children: [
          Container(
            child: Text(
              quotes.content,
              softWrap: true,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          Gap(10),
          Container(
            alignment: Alignment.center,
            child: Text(
              quotes.author ?? '',
              style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
                fontSize: 13,
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: onFavorite,
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
                Gap(10),
                IconButton(
                  onPressed: onCopy,
                  icon: Icon(Icons.copy),
                ),
                Gap(10),
                IconButton(
                  onPressed: onShare,
                  icon: Icon(Icons.share),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
