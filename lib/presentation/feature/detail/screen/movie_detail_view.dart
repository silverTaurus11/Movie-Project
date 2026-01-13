import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/movie_detail_bloc.dart';
import '../bloc/movie_detail_state.dart';
import '../component/movie_detail_content.dart';

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E2A2A),
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieDetailLoading ||
              state is MovieDetailInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is MovieDetailError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          if (state is MovieDetailLoaded) {
            return MovieDetailContent(detail: state.detail);
          }

          return const SizedBox();
        },
      ),
    );
  }
}
