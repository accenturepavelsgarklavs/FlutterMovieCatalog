import 'package:equatable/equatable.dart';

class MoviesEntity extends Equatable {
  final int page;
  final List<ResultsEntity> results;
  final int totalPages;
  final int totalResults;

  const MoviesEntity(
      {required this.page,
      required this.results,
      required this.totalPages,
      required this.totalResults});

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}

class ResultsEntity {
  bool adult;
  String backdropPath;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  ResultsEntity(
      {required this.adult,
      required this.backdropPath,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});
}
