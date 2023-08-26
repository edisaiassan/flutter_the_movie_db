import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_the_movie_db/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:simple_the_movie_db/infrastructure/repositories/actor_repository_impl.dart';

final actorRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDbDatasource());
});