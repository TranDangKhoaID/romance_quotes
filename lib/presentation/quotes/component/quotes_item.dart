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
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: color,
                  //width: 1,
                ),
              ),
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
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
