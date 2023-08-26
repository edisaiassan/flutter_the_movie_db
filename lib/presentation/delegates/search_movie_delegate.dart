import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:simple_the_movie_db/domain/entities/movie.dart';

//Creamos un typedef que nos permita recibir un método con un valor String
typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallback searchMovie;

  SearchMovieDelegate({required this.searchMovie});

  @override
  String get searchFieldLabel => 'Buscar Película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      FadeIn(
        animate: query.isNotEmpty,
        child: IconButton(
          onPressed: () => query = '',
          icon: const Icon(Icons.clear_rounded),
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      tooltip: 'Atrás',
      icon: const Icon(Icons.arrow_back_ios_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: searchMovie(
          query), //Eso nos permitirá ingresar el método Future cada que
      //escribimos
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return ListTile(
              onTap: () {},
              leading: movie.posterPath == 'no-poster'
                  ? const Icon(Icons.image_not_supported_outlined,
                      color: Colors.white)
                  : Image.network(
                      movie.posterPath,
                      fit: BoxFit.cover,
                    ),
              title: Text(movie.title),
              subtitle: Text(movie.overview,
                  maxLines: 3, overflow: TextOverflow.ellipsis),
            );
          },
        );
      },
    );
  }
}
