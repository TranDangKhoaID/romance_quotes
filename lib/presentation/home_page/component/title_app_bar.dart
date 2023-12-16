import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
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
              onPressed: () {
                print('Yêu thích');
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            IconButton(
              onPressed: () {
                print('Setting');
              },
              icon: Icon(
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
