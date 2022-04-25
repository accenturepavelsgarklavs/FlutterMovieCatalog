import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/domain/entities/saved_movies_entity.dart';

class SavedMovieDetails extends StatelessWidget {
  final String imageUrl = "https://image.tmdb.org/t/p/w600_and_h900_bestv2/";
  final List<SavedMoviesEntity>? movies;
  final int index;

  const SavedMovieDetails({Key? key, required this.movies, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Details"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(imageUrl + "${movies?[index].posterPath}"),
                    radius: 120,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "${movies?[index].title}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.amber),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("${movies?[index].overview}",
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.amber),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Total vote count: ${movies?[index].voteCount}",
                          style: const TextStyle(
                              fontSize: 24, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.amber),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Original language: ${movies?[index].originalLanguage}",
                        style:
                            const TextStyle(fontSize: 24, color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
