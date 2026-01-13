import 'package:dummy_project/presentation/feature/detail/screen/movie_detail_screen.dart';
import 'package:dummy_project/presentation/feature/home/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const home = '/';
  static const movieDetail = '/movies/:id';
}

final router = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) {
        return const MainNavigationPage();
      },
      routes: [
        GoRoute(
          path: AppRoutes.movieDetail,
          builder: (context, state) {
            final movieId = int.parse(state.pathParameters['id']!);
            return MovieDetailScreen(movieId: movieId);
          },
        ),
      ],
    ),
  ],
);

