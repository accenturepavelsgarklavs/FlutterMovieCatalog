import 'package:flutter_movie_catalog/features/movie_catalog/data/datasources/movie_db_remote_data_source.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/domain/entities/movies_entity.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MovieDbRemoteDataSource _movieDbRemoteDataSource =
      MovieDbRemoteDataSource();

  @override
  Future<MoviesEntity> getData() {
    return _movieDbRemoteDataSource.getData();
  }
}
