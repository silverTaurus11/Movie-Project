import '../../domain/model/cast_item.dart';

class CastModel extends Cast {
  CastModel({
    required super.id,
    required super.name,
    required super.character,
    required super.profilePath,
  });

  Map<String, dynamic> toJson(int movieId) {
    return {
      'id': id,
      'movie_id': movieId,
      'name': name,
      'character': character,
      'profile_path': profilePath,
    };
  }

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      id: json['id'],
      name: json['name'],
      character: json['character'] ?? '',
      profilePath: json['profile_path'] ?? '',
    );
  }
}