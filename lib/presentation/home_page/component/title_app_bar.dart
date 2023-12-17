import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TitleAppBar extends StatelessWidget {
  final void Function()? onFavorites;
  final void Function()? onSetting;
  const TitleAppBar({
    super.key,
    required this.onFavorites,
    required this.onSetting,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 20,
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
            Gap(10),
            Text(
              'Romace Quotes',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: onFavorites,
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            IconButton(
              onPressed: onSetting,
              icon: const Icon(
                Icons.settings,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
