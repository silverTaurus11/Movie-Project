class MovieVideo {
  final String id;
  final String name;
  final String key;
  final String site;
  final String type;
  final bool official;

  const MovieVideo({
    required this.id,
    required this.name,
    required this.key,
    required this.site,
    required this.type,
    required this.official,
  });

  bool get isYoutube => site.toLowerCase() == 'youtube';

  bool get isTrailer => type.toLowerCase() == 'trailer';

  String get youtubeUrl => 'https://www.youtube.com/watch?v=$key';
}
