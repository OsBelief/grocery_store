// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
      id: json['id'] as String,
      title: json['title'] as String,
      directors: (json['directors'] as List)
          ?.map((e) =>
              e == null ? null : Director.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'directors': instance.directors
    };

Director _$DirectorFromJson(Map<String, dynamic> json) {
  return Director(
      alt: json['alt'] as String,
      name: json['name'] as String,
      id: json['id'] as String,
      avatar: json['avatar'] == null
          ? null
          : Avatar.fromJson(json['avatar'] as Map<String, dynamic>));
}

Map<String, dynamic> _$DirectorToJson(Director instance) => <String, dynamic>{
      'alt': instance.alt,
      'name': instance.name,
      'id': instance.id,
      'avatar': instance.avatar
    };

Avatar _$AvatarFromJson(Map<String, dynamic> json) {
  return Avatar(
      small: json['small'] as String,
      medium: json['medium'] as String,
      large: json['large'] as String);
}

Map<String, dynamic> _$AvatarToJson(Avatar instance) => <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large
    };
