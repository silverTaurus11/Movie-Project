import 'package:dummy_project/l10n/app_localizations.dart';
import 'package:dummy_project/presentation/feature/top_rated_movie/bloc/top_rated_movie_bloc.dart';
import 'package:dummy_project/presentation/feature/top_rated_movie/screen/top_rated_movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildTestableTopRatedMovieScreen({
  required TopRatedMovieBloc bloc,
}) {
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: BlocProvider<TopRatedMovieBloc>.value(
      value: bloc,
      child: const TopRatedMovieScreen(),
    ),
  );
}
