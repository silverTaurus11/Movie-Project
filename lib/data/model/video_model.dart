
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
}
