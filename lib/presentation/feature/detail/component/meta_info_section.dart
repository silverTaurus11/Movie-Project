import 'package:dummy_project/helper/int_ext.dart';
import 'package:dummy_project/helper/list_ext.dart';
import 'package:dummy_project/helper/open_launcher.dart';
import 'package:dummy_project/helper/string_ext.dart';
import 'package:flutter/material.dart';

import '../../../../domain/model/movie_item.dart';

class MetaInfoSection extends StatelessWidget {
  final Movie movie;
  final String trailerUrl;

  const MetaInfoSection({
    super.key,
    required this.movie,
    required this.trailerUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _ageBadge(movie.adult),
                const SizedBox(width: 8),
                _dotText(
                  '${movie.releaseDate.formatDateToMMDDYYYY()} (${movie.originalLanguage.toUpperCase()})',
                ),
                _separator(),
                _dotText(movie.runtime.formatMinutesToHourMinute()),
                const SizedBox(width: 12),
                _playTrailer(trailerUrl),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              movie.genres.combineWithAnd(),
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ageBadge(bool adult) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white70),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        adult ? "+17" : "3+",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _dotText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white70, fontSize: 13),
    );
  }

  Widget _separator() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Text('•', style: TextStyle(color: Colors.white54)),
    );
  }

  Widget _playTrailer(String url) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: () {
        openYoutube(url);
      },
      child: Row(
        children: const [
          Icon(Icons.play_arrow, size: 18, color: Colors.white),
          SizedBox(width: 4),
          Text(
            'Play Trailer',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
