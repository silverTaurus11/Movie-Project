import 'package:dummy_project/l10n/app_localizations.dart';
import 'package:dummy_project/presentation/feature/top_rated_movie/screen/top_rated_movie_screen.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
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
    );
  }
}
