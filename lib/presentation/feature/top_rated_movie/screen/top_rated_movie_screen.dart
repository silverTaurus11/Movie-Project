import 'package:dummy_project/helper/string_ext.dart';
import 'package:dummy_project/l10n/app_localizations.dart';
import 'package:dummy_project/presentation/feature/component/movie_card.dart';
import 'package:dummy_project/presentation/feature/top_rated_movie/bloc/state/movie_state.dart';
import 'package:dummy_project/presentation/feature/top_rated_movie/bloc/top_rated_movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedMovieScreen extends StatelessWidget {
  const TopRatedMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.top_rated)),
      body: BlocBuilder<TopRatedMovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is MovieLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: state.movies.length,
              itemBuilder: (_, index) {
                final movie = state.movies[index];
                return MovieCard(
                  title: movie.title,
                  posterUrl: movie.posterPath.toImageUrl(),
                  voteAverage: movie.voteAverage,
                  releaseDate: movie.releaseDate,
                );
              },
            );
          }

          if (state is MovieError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
