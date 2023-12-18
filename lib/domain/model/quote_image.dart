import 'package:json_annotation/json_annotation.dart';

part 'quote_image.g.dart';

@JsonSerializable()
class QuoteImage {
  final String id;
  final String url;

  QuoteImage({
    required this.id,
    required this.url,
  });

  factory QuoteImage.fromJson(Map<String, dynamic> json) =>
      _$QuoteImageFromJson(json);
  Map<String, dynamic> toJson() => _$QuoteImageToJson(this);
}
