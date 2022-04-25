import 'package:flutter_movie_catalog/features/movie_catalog/domain/entities/movies_entity.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/domain/repositories/movies_repository.dart';

class GetMovies {
  final MoviesRepository _repository;

  GetMovies({required repository}) : _repository = repository;

  Future<MoviesEntity> data() async {
    return await _repository.getData();
  }
}
