
import '../../domain/model/video_item.dart';

class MovieVideoModel extends MovieVideo {
  const MovieVideoModel({
    required super.id,
    required super.name,
    required super.key,
    required super.site,
    required super.type,
    required super.official,
  });

  factory MovieVideoModel.fromJson(Map<String, dynamic> json) {
    return MovieVideoModel(
      id: json['id'] as String,
      name: json['name'] as String,
      key: json['key'] as String,
      site: json['site'] as String,
      type: json['type'] as String,
      official: (json['official'] as int) == 1,
    );
  }

  Map<String, dynamic> toJson(int movieId) {
    return {
      'id': id,
      'movie_id': movieId,
      'name': name,
      'key': key,
      'site': site,
      'type': type,
      'official': official ? 1 : 0,
    };
  }

  factory MovieVideoModel.fromNetwork(Map<String, dynamic> json) {
    return MovieVideoModel(
      id: json['id'] as String,
      name: json['name'] as String,
      key: json['key'] as String,
      site: json['site'] as String,
      type: json['type'] as String,
      official: json['official'] as bool? ?? false,
    );
  }
}
