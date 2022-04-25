import 'package:equatable/equatable.dart';

class SavedMoviesEntity extends Equatable {
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final num? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final num? voteAverage;
  final int? voteCount;

  const SavedMoviesEntity(
      {required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.voteAverage,
      required this.voteCount});

  @override
  List<Object?> get props => [
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        voteAverage,
        voteCount
      ];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "originalLanguage": originalLanguage,
      "originalTitle": originalTitle,
      "overview": overview,
      "popularity": popularity,
      "posterPath": posterPath,
      "releaseDate": releaseDate,
      "title": title,
      "voteAverage": voteAverage,
      "voteCount": voteCount,
    };
  }

  @override
  String toString() {
    return "Movie{id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, voteAverage: $voteAverage, voteCount: $voteCount}";
  }
}
