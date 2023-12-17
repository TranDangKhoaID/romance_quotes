import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:romance_quotes/app/manager/color_manager.dart';
import 'package:romance_quotes/domain/model/quotes.dart';

class FavoriteItem extends StatelessWidget {
  final int index;
  final Quotes quotes;
  final void Function()? onTap;
  const FavoriteItem({
    super.key,
    required this.index,
    required this.quotes,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: generateRandomColor(),
                width: 2,
              ),
            ),
            child: Text(
              index.toString(),
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[700],
              ),
            ),
          ),
          const Gap(10),
          Expanded(
              child: Column(
            children: [
              Text(
                quotes.content,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const Gap(10),
              Text(
                quotes.author ?? "",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          )),
          IconButton(
            onPressed: onTap,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
