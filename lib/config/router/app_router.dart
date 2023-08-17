import 'package:go_router/go_router.dart';
import 'package:simple_the_movie_db/presentation/screens/movies/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (_, __) => const HomeScreen(),
    ),
  ],
);
