import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_the_movie_db/domain/entities/actor.dart';
import 'package:simple_the_movie_db/presentation/providers/actors/actors_repository_repository_provider.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorRepository = ref.watch(actorRepositoryProvider).getActorsByMovie;

  return ActorByMovieNotifier(getActors: actorRepository);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorByMovieNotifier({required this.getActors}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final List<Actor> actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}
