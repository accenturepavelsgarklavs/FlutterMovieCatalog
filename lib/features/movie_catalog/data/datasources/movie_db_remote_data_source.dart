import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;

import '../models/movies_model.dart';

class MovieDbRemoteDataSource {
  final String _url =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=e9a7d576b0d0d2ba668c55ed2a236fa7";

  Future<MoviesModel> getData() async {
    final raw = await http.get(Uri.parse(_url));
    return MoviesModel.fromJson(json.decode(raw.body));
  }
}
