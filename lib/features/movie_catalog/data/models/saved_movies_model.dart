import 'package:flutter_movie_catalog/features/movie_catalog/domain/entities/saved_movies_entity.dart';

class SavedMoviesModel extends SavedMoviesEntity {
  const SavedMoviesModel(
      {required int id,
      required String originalLanguage,
      required String originalTitle,
      required String overview,
      required num popularity,
      required String posterPath,
      required String releaseDate,
      required String title,
      required num voteAverage,
      required int voteCount})
      : super(
            id: id,
            originalLanguage: originalLanguage,
            originalTitle: originalTitle,
            overview: overview,
            popularity: popularity,
            posterPath: posterPath,
            releaseDate: releaseDate,
            title: title,
            voteAverage: voteAverage,
            voteCount: voteCount);
}
