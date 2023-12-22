import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:romance_quotes/domain/model/quotes.dart';

class QuotesItem extends StatelessWidget {
  final Quotes quotes;
  final Color color;
  final int index;
  final void Function() onTap;
  const QuotesItem({
    super.key,
    required this.quotes,
    required this.color,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Stack(
              children: [
                Icon(
                  Icons.quora_outlined,
                  size: 55,
                  color: color,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 6,
                  top: 0,
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(10),
            Expanded(
              child: Column(
                children: [
                  Text(
                    quotes.content,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: color,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
