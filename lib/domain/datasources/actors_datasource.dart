import 'package:simple_the_movie_db/domain/entities/actor.dart';

abstract class ActorsDatasource {

  Future<List<Actor>> getActorsByMovie(String movieId);
  
}