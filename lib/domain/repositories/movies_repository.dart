import 'package:simple_the_movie_db/domain/entities/movie.dart';

abstract class MoviesRepository {

  Future<List<Movie>> getNowPlaying({int page = 1});
}