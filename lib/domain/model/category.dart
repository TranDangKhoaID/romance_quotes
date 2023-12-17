import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  final String id;
  final String title;
  final String subtitle;
  final String? urlImage;

  Category({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.urlImage,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
