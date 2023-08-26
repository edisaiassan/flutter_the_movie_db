import 'package:dio/dio.dart';
import 'package:simple_the_movie_db/config/constants/enviroment.dart';
import 'package:simple_the_movie_db/domain/datasources/actors_datasource.dart';
import 'package:simple_the_movie_db/domain/entities/actor.dart';
import 'package:simple_the_movie_db/infrastructure/mappers/actor_mapper.dart';
import 'package:simple_the_movie_db/infrastructure/models/moviedb/credits_response.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
    final dio = Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
        'api_key': Enviroment.theMovieDBKey,
        'language': 'es-MX',
      }),
    );

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {

    final response = await dio.get('/movie/$movieId/credits');

    final creditsResponse = CreditsResponse.fromJson(response.data);

    final List<Actor> actors = creditsResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();

    return actors;
  }
}
