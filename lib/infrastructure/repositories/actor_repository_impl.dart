import 'package:simple_the_movie_db/domain/datasources/actors_datasource.dart';
import 'package:simple_the_movie_db/domain/entities/actor.dart';
import 'package:simple_the_movie_db/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {

  final ActorsDatasource datasource;

  ActorRepositoryImpl(this.datasource);
  
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
  
}