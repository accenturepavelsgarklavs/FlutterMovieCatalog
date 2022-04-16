import 'package:flutter_movie_catalog/features/movie_catalog/domain/entities/movies_entity.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/domain/repositories/movies_repository.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/domain/usecases/get_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// class MockMoviesRepository extends Mock implements MoviesRepository {}
//
// void main() {
//   GetMovies usecase;
//   MockMoviesRepository mockMoviesRepository;
//
//   setUp(() {
//       mockMoviesRepository = MockMoviesRepository();
//       usecase = GetMovies(mockMoviesRepository);
//   });
//
//   // const tMovies = MoviesEntity(title: "Lord of the Rings", release: "2002", popularity: 8.9);
//
//   test("should get movies from repository",
//       () async {
//         // arrange
//         // when(mockMoviesRepository.getData());
//         // act
//
//         // assert
//       }
//   );
// }