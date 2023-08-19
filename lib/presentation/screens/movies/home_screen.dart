import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_the_movie_db/presentation/providers/movies/movies_providers.dart';
import 'package:simple_the_movie_db/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:simple_the_movie_db/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    //final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final moviesSlideshow = ref.watch(moviesSlideshowProvider);

    if(moviesSlideshow.isEmpty) return const Center(child: CircularProgressIndicator());

    return Column(
      children: [
        const CustomAppBar(),
        MoviesSlideshow(movies: moviesSlideshow),
      ],
    );
  }
}
