import 'package:json_annotation/json_annotation.dart';

/// 使用库json_serializable实现Json序列化/反序列化
// 执行flutter packages pub run build_runner build或flutter packages pub run build_runner watch命令生成实现了fromJson和toJson的Movie.g.dart
// Movie.g.dart 将在我们运行生成命令后自动生成
part 'Movie.g.dart';

// 这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class Movie {
  String id;
  String title;
  List<Director> directors;

  Movie({this.id, this.title, this.directors});

  factory Movie.fromJson(Map<String, dynamic> parsedJson) =>
      _$MovieFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable()
class Director {
  String alt;
  String name;
  String id;
  Avatar avatar;

  Director({this.alt, this.name, this.id, this.avatar});

  factory Director.fromJson(Map<String, dynamic> parsedJson) =>
      _$DirectorFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$DirectorToJson(this);
}

@JsonSerializable()
class Avatar {
  String small;
  String medium;
  String large;

  Avatar({this.small, this.medium, this.large});

  factory Avatar.fromJson(Map<String, dynamic> parsedJson) =>
      _$AvatarFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$AvatarToJson(this);
}
