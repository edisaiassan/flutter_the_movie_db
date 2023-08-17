import 'package:dio/dio.dart';
import 'package:simple_the_movie_db/config/constants/enviroment.dart';
import 'package:simple_the_movie_db/domain/datasources/movies_datasource.dart';
import 'package:simple_the_movie_db/domain/entities/movie.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDBKey,
        'language': 'es-MX',
      },
    ),
  );
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {

    final response = await dio.get('/movie/now_playing');
    final List<Movie> movies = [];
    return movies;
  }
}