import 'package:flutter_movie_catalog/features/movie_catalog/domain/entities/saved_movies_entity.dart';

abstract class SavedMoviesRepository {
  Future<List<SavedMoviesEntity>> getData();

  Future<void> insertData(SavedMoviesEntity entity);

  Future<void> deleteData(int id);
}
