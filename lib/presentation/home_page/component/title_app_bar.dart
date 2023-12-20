import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TitleAppBar extends StatelessWidget {
  final void Function()? onFavorites;
  final void Function()? onSetting;
  final void Function()? onQImages;
  const TitleAppBar({
    super.key,
    required this.onFavorites,
    required this.onSetting,
    required this.onQImages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/icon_app/app.png'),
              radius: 20,
            ),
            Gap(10),
            Text(
              'Quotes',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              tooltip: 'Kho ảnh với những caption hay',
              onPressed: onQImages,
              icon: const Icon(
                Icons.image_outlined,
              ),
            ),
            IconButton(
              tooltip: 'Kho câu nói yêu thích của bạn',
              onPressed: onFavorites,
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            IconButton(
              tooltip: 'Cài đặt',
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
