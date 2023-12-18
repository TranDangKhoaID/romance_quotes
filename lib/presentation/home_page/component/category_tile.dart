import 'package:flutter/material.dart';
import 'package:romance_quotes/domain/model/category.dart';

class CategoryTile extends StatelessWidget {
  final Category category;
  final void Function()? onTap;

  const CategoryTile({
    super.key,
    required this.category,
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
          backgroundImage: NetworkImage(category.urlImage.toString()),
        ),
        title: Text(
          category.title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          category.subtitle,
        ),
        onTap: onTap,
      ),
    );
  }
}
