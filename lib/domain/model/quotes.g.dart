// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quotes _$QuotesFromJson(Map<String, dynamic> json) => Quotes(
      id: json['id'] as String,
      content: json['content'] as String,
      author: json['author'] as String?,
    );

Map<String, dynamic> _$QuotesToJson(Quotes instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'author': instance.author,
    };
