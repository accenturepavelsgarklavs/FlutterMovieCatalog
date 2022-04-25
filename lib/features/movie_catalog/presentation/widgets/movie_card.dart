import 'package:flutter/material.dart';
import 'package:flutter_movie_catalog/core/singletons/repository_impl_singleton.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/domain/entities/movies_entity.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/domain/entities/saved_movies_entity.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/domain/usecases/insert_new_saved_movie.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/presentation/pages/movie_details_page.dart';

class MovieCard extends StatefulWidget {
  final MoviesEntity? movies;
  final int index;

  const MovieCard({required this.movies, required this.index, Key? key})
      : super(key: key);

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  final String imageUrl = "https://image.tmdb.org/t/p/w600_and_h900_bestv2/";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.lightBlueAccent,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MovieDetails(
                        movies: widget.movies,
                        index: widget.index,
                      )));
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl +
                      "${widget.movies?.results[widget.index].posterPath}"),
                  radius: 48,
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("${widget.movies?.results[widget.index].title}",
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                          maxLines: 2),
                      Text(
                        "Released in: ${widget.movies?.results[widget.index].releaseDate}",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () async {
                        final moviePath = widget.movies?.results[widget.index];
                        await InsertNewSavedMovie(
                                repository:
                                    RepositoryImplSingleton.repositoryImpl)
                            .insert(SavedMoviesEntity(
                                id: moviePath?.id,
                                originalLanguage: moviePath?.originalLanguage,
                                originalTitle: moviePath?.originalTitle,
                                overview: moviePath?.overview,
                                popularity: moviePath?.popularity,
                                posterPath: moviePath?.posterPath,
                                releaseDate: moviePath?.releaseDate,
                                title: moviePath?.title,
                                voteAverage: moviePath?.voteAverage,
                                voteCount: moviePath?.voteCount));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('${moviePath?.title} added to saved movies'),
                          duration: const Duration(seconds: 2),
                        ));
                      },
                      icon: const Icon(Icons.add_circle_outline, size: 32),
                      splashColor: Colors.green,
                      splashRadius: 28,
                    ),
                    Text.rich(
                      TextSpan(
                        children: <InlineSpan>[
                          const WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(
                                Icons.star,
                                color: Colors.amberAccent,
                              )),
                          TextSpan(
                              text:
                                  "${widget.movies?.results[widget.index].voteAverage}"),
                        ],
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
