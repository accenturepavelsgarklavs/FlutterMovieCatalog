import '../../features/movie_catalog/data/repositories/saved_movies_repository_impl.dart';

class RepositoryImplSingleton {
  static final RepositoryImplSingleton _repo =
      RepositoryImplSingleton._internal();

  factory RepositoryImplSingleton() {
    return _repo;
  }

  static final repositoryImpl = SavedMoviesRepositoryImpl();

  RepositoryImplSingleton._internal();
}
