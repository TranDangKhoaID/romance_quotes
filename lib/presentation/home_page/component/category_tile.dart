import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String? img;
  final String title;
  final String subtitle;
  final void Function()? onTap;

  const CategoryTile({
    super.key,
    required this.img,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(img.toString()),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
        ),
        onTap: onTap,
      ),
    );
  }
}
