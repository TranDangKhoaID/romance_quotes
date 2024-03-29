import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:romance_quotes/app/manager/color_manager.dart';

class FavoriteItem extends StatelessWidget {
  final int index;
  //final Quotes quotes;
  final String content;
  final String? author;
  final void Function()? onTap;
  const FavoriteItem({
    super.key,
    required this.index,
    //required this.quotes,
    required this.onTap,
    required this.content,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: generateRandomColor(),
                width: 2,
              ),
            ),
            child: Text(
              '${index + 1}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
          ),
          const Gap(10),
          Expanded(
            child: Column(
              children: [
                Text(
                  content,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                const Gap(10),
                Text(
                  author ?? "",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
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
