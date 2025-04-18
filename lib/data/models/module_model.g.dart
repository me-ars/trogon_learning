// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Module _$ModuleFromJson(Map<String, dynamic> json) => Module(
      title: json['title'] as String,
      description: json['description'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$ModuleToJson(Module instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'id': instance.id,
    };
