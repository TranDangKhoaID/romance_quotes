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
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: ListTile(
        leading: Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(),
          child: Image.network(
            category.urlImage.toString(),
            fit: BoxFit.cover,
          ),
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
