import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_the_movie_db/infrastructure/datasources/moviedb_datasource.dart';
import 'package:simple_the_movie_db/infrastructure/repositories/movie_repository_impl.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});