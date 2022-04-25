import 'package:flutter_movie_catalog/features/movie_catalog/domain/entities/saved_movies_entity.dart';

import '../repositories/saved_movies_repository.dart';

class InsertNewSavedMovie {
  final SavedMoviesRepository _repository;

  InsertNewSavedMovie({required repository}) : _repository = repository;

  Future<void> insert(SavedMoviesEntity entity) async {
    return await _repository.insertData(entity);
  }
}
