import 'package:flutter/material.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/domain/entities/movies_entity.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/presentation/pages/movie_details_page.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl = "https://image.tmdb.org/t/p/w600_and_h900_bestv2/";
  final MoviesEntity? movies;
  final int index;

  const MovieCard({required this.movies, required this.index, Key? key})
      : super(key: key);

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
                        movies: movies,
                        index: index,
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
                  backgroundImage: NetworkImage(
                      imageUrl + "${movies?.results[index].posterPath}"),
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
                      Text("${movies?.results[index].title}",
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                          maxLines: 2),
                      Text(
                        "Released in: ${movies?.results[index].releaseDate}",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
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
                              text: "${movies?.results[index].voteAverage}"),
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
