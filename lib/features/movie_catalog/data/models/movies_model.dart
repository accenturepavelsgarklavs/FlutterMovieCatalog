import 'package:flutter_movie_catalog/features/movie_catalog/domain/entities/movies_entity.dart';

class MoviesModel extends MoviesEntity {
  const MoviesModel(
      {required page,
      required results,
      required totalPages,
      required totalResults})
      : super(
            page: page,
            results: results,
            totalPages: totalPages,
            totalResults: totalResults);

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    var results = <ResultsModel>[];
    if (json["results"] != null) {
      json["results"].forEach((v) {
        results.add(ResultsModel.fromJson(v));
      });
    }
    return MoviesModel(
        page: json["page"],
        results: results,
        totalPages: json["total_pages"],
        totalResults: json["total_results"]);
  }
}

class ResultsModel extends ResultsEntity {
  ResultsModel(
      {required adult,
      required backdropPath,
      required id,
      required originalLanguage,
      required originalTitle,
      required overview,
      required popularity,
      required posterPath,
      required releaseDate,
      required title,
      required video,
      required voteAverage,
      required voteCount})
      : super(
            adult: adult,
            backdropPath: backdropPath,
            id: id,
            originalLanguage: originalLanguage,
            originalTitle: originalTitle,
            overview: overview,
            popularity: popularity,
            posterPath: posterPath,
            releaseDate: releaseDate,
            title: title,
            video: video,
            voteAverage: voteAverage,
            voteCount: voteCount);

  factory ResultsModel.fromJson(Map<String, dynamic> json) {
    return ResultsModel(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        id: json['id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}
