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
    return ListTile(
      tileColor: category.id == "0" ? Colors.pink : Colors.transparent,
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(category.urlImage.toString()),
      ),
      title: Text(
        category.title,
        style: TextStyle(
          color: category.id == "0" ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        category.subtitle,
        style: TextStyle(
          color: category.id == "0" ? Colors.white : Colors.black45,
        ),
      ),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: onTap,
    );
  }
}
