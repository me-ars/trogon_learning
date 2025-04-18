import 'package:json_annotation/json_annotation.dart';

part 'module_model.g.dart';

@JsonSerializable()
class Module {
  final String title, description;
  final int id;

  Module({required this.title, required this.description, required this.id});

  factory Module.fromJson(Map<String, dynamic> json) => _$ModuleFromJson(json);

  Map<String, dynamic> toJson() => _$ModuleToJson(this);
}
