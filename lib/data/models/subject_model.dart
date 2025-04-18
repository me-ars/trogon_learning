import 'package:json_annotation/json_annotation.dart';

part 'subject_model.g.dart';

@JsonSerializable()
class Subject {
  final String title, description, image;
  final int id;

  Subject(
      {required this.id,
      required this.title,
      required this.description,
      required this.image});

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}
