import 'package:flutter/material.dart';

import '../../../../domain/model/movie_detail.dart';
import 'cast_section.dart';
import 'hero_section.dart';
import 'meta_info_section.dart';
import 'overview_section.dart';
import 'rating_section.dart';
import 'tagline_section.dart';

class MovieDetailContent extends StatelessWidget {
  final MovieDetail detail;

  const MovieDetailContent({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    final movie = detail.movie;
    final cast = detail.cast;
    final trailer = detail.trailer;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeroSection(movie: movie),
          RatingSection(rating: movie.voteAverage),
          MetaInfoSection(movie: movie, trailerUrl: trailer),
          TaglineSection(tagline: movie.tagline),
          OverviewSection(overview: movie.overview),
          CastSection(cast: cast),
        ],
      ),
    );
  }
}
