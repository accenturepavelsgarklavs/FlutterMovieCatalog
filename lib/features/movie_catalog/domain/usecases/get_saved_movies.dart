import 'package:flutter_movie_catalog/features/movie_catalog/domain/entities/saved_movies_entity.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/domain/repositories/saved_movies_repository.dart';

class GetSavedMovies {
  final SavedMoviesRepository _repository;

  GetSavedMovies({required repository}) : _repository = repository;

  Future<List<SavedMoviesEntity>> data() async {
    return await _repository.getData();
  }
}
