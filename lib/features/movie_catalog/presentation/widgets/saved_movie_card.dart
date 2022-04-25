import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/domain/entities/saved_movies_entity.dart';

import '../pages/saved_movie_details_page.dart';

class SavedMovieCard extends StatefulWidget {
  final List<SavedMoviesEntity>? movies;
  final int index;

  const SavedMovieCard({required this.movies, required this.index, Key? key})
      : super(key: key);

  @override
  State<SavedMovieCard> createState() => _SavedMovieCardState();
}

class _SavedMovieCardState extends State<SavedMovieCard> {
  final String imageUrl = "https://image.tmdb.org/t/p/w600_and_h900_bestv2/";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SavedMovieDetails(
                      movies: widget.movies,
                      index: widget.index,
                    )));
      },
      child: Card(
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
                      imageUrl + "${widget.movies?[widget.index].posterPath}"),
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
                      Text("${widget.movies?[widget.index].title}",
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                          maxLines: 2),
                      Text(
                        "Released in: ${widget.movies?[widget.index].releaseDate}",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      const WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.star,
                            color: Colors.amberAccent,
                          )),
                      TextSpan(
                          text: "${widget.movies?[widget.index].voteAverage}"),
                    ],
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
