import 'dart:async';

import 'package:dummy_project/helper/string_ext.dart';
import 'package:dummy_project/l10n/app_localizations.dart';
import 'package:dummy_project/presentation/feature/component/movie_card.dart';
import 'package:dummy_project/presentation/feature/top_rated_movie/bloc/state/movie_state.dart';
import 'package:dummy_project/presentation/feature/top_rated_movie/bloc/top_rated_movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/di.dart';
import '../bloc/event/movie_event.dart';
import '../listener/native_sync_listener.dart';

class TopRatedMovieScreen extends StatefulWidget {
  const TopRatedMovieScreen({super.key});

  @override
  State<TopRatedMovieScreen> createState() => _TopRatedMovieScreenState();
}

class _TopRatedMovieScreenState extends State<TopRatedMovieScreen> {
  late final TopRatedMovieBloc _bloc;
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();

    _bloc = getIt<TopRatedMovieBloc>();

    _subscription = NativeSyncListener.stream.listen((event) {
      if (!mounted) return;

      if (event == 'first_sync_done') {
        _bloc.add(LoadTopRatedMovies());
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(title: Text(loc.top_rated)),
        body: BlocBuilder<TopRatedMovieBloc, MovieState>(
          builder: (context, state) {

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
                    id: movie.id,
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

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
