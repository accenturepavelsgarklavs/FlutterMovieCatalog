import 'package:flutter_movie_catalog/features/movie_catalog/domain/entities/movies_entity.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/domain/repositories/movies_repository.dart';

class GetMovies {
  final MoviesRepository repository;

  GetMovies(this.repository);

  Future<MoviesEntity> call() async {
    return await repository.getData();
  }
}
