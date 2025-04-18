import 'package:json_annotation/json_annotation.dart';

part 'lesson_model.g.dart';

@JsonSerializable()
class Lesson {
  final String title, description, video_url, video_type;
final int id;
  Lesson(
      {required this.title,
      required this.description,
      required this.video_url,
      required this.video_type,
      required this.id});

  factory Lesson.fromJson(Map<String, dynamic> json) =>
      _$LessonFromJson(json);

  Map<String, dynamic> toJson() => _$LessonToJson(this);
}
