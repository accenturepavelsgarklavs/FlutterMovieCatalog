import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_catalog/core/singletons/repository_impl_singleton.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/domain/entities/saved_movies_entity.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/domain/usecases/delete_saved_movie.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/domain/usecases/get_saved_movies.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/presentation/widgets/saved_movie_card.dart';

class SavedMoviesPage extends StatefulWidget {
  const SavedMoviesPage({Key? key}) : super(key: key);

  @override
  State<SavedMoviesPage> createState() => _SavedMoviesPageState();
}

class _SavedMoviesPageState extends State<SavedMoviesPage> {
  late Future<List<SavedMoviesEntity>> _savedMovies;
  late final GetSavedMovies _getSavedMoviesInstance =
      GetSavedMovies(repository: RepositoryImplSingleton.repositoryImpl);

  @override
  void initState() {
    _savedMovies = _getSavedMoviesInstance.data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Movies"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<SavedMoviesEntity>>(
        future: _savedMovies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          setState(() {
                            DeleteSavedMovie(
                                    repository:
                                        RepositoryImplSingleton.repositoryImpl)
                                .delete(snapshot.data?[index].id);
                            _savedMovies = _getSavedMoviesInstance.data();
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                '${snapshot.data?[index].title} removed from saved movies'),
                            duration: const Duration(seconds: 2),
                          ));
                        },
                        background: Container(
                          alignment: AlignmentDirectional.centerStart,
                          color: Colors.red,
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        direction: DismissDirection.startToEnd,
                        child: SavedMovieCard(
                            movies: snapshot.data, index: index));
                  }),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
