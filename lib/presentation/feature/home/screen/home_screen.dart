import 'package:dummy_project/di/di.dart';
import 'package:dummy_project/domain/model/get_top_rated_movies_param.dart';
import 'package:dummy_project/l10n/app_localizations.dart';
import 'package:dummy_project/presentation/feature/top_rated_movie/bloc/event/movie_event.dart';
import 'package:dummy_project/presentation/feature/top_rated_movie/bloc/top_rated_movie_bloc.dart';
import 'package:dummy_project/presentation/feature/top_rated_movie/screen/top_rated_movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;

  late final List<Widget> _pages = [
    const TopRatedMovieScreen(),
    const SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return MultiBlocProvider(
      providers: [
        BlocProvider<TopRatedMovieBloc>(
          create: (_) =>
          getIt<TopRatedMovieBloc>()
            ..add(LoadTopRatedMovies(page: GetTopRatedMoviesParams())),
        ),
      ],
      child: Scaffold(
        body: IndexedStack(index: _currentIndex, children: _pages),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: loc.movie_tab,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: loc.profile_tab,
            ),
          ],
        ),
      ),
    );
  }
}
