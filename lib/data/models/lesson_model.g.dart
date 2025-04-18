// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
      title: json['title'] as String,
      description: json['description'] as String,
      video_url: json['video_url'] as String,
      video_type: json['video_type'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'video_url': instance.video_url,
      'video_type': instance.video_type,
      'id': instance.id,
    };
