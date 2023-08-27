import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_the_movie_db/domain/entities/movie.dart';
import 'package:simple_the_movie_db/presentation/delegates/search_movie_delegate.dart';
import 'package:simple_the_movie_db/presentation/providers/providers.dart';
import 'package:simple_the_movie_db/presentation/screens/screens.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    return SliverAppBar(
      floating: true,
      leading: Icon(Icons.movie_outlined, color: colors.primary),
      title: const Text('The Fluvie DB'),
      actions: [
        IconButton(
          onPressed: () {
            final movieRepository = ref.read(movieRepositoryProvider);
            showSearch<Movie?>(
              context: context,
              delegate: SearchMovieDelegate(
                  searchMovies: movieRepository.searchMovies),
            ).then(
              (movie) {
                if (movie == null) return;
                context.pushNamed(
                  MovieScreen.name,
                  pathParameters: {
                    'id': movie.id.toString(),
                  },
                );
              },
            );
          },
          icon: const Icon(Icons.search_rounded),
        ),
        const SizedBox(width: 8.0),
      ],
    );
  }
}
