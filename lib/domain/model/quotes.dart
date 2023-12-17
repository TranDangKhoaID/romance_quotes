import 'package:json_annotation/json_annotation.dart';

part 'quotes.g.dart';

@JsonSerializable()
class Quotes {
  final String id;
  final String categoryID;
  final String content;
  final String? author;

  Quotes({
    required this.id,
    required this.categoryID,
    required this.content,
    required this.author,
  });

  factory Quotes.fromJson(Map<String, dynamic> json) => _$QuotesFromJson(json);
  Map<String, dynamic> toJson() => _$QuotesToJson(this);
}
