import 'package:flutter/material.dart';

class BannerImageItem extends StatelessWidget {
  final void Function()? onTap;
  final String? url;
  const BannerImageItem({
    super.key,
    required this.onTap,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(5),
        child: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(url.toString()),
        ),
      ),
    );
  }
}
