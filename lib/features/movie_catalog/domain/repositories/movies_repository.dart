import 'package:flutter_movie_catalog/features/movie_catalog/domain/entities/movies_entity.dart';

abstract class MoviesRepository {
  Future<MoviesEntity> getData();
}
