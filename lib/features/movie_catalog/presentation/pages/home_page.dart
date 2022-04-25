import 'package:flutter/material.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/domain/entities/movies_entity.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/domain/usecases/get_movies.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/presentation/widgets/movie_card.dart';

import '../../data/repositories/movies_repository_impl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MoviesRepositoryImpl repository = MoviesRepositoryImpl();

  final _filterItems = [
    "Score from highest to lowest",
    "Score from lowest to highest"
  ];
  String _value = "Score from highest to lowest";

  late Future<MoviesEntity> _futureMovies;

  @override
  void initState() {
    _futureMovies = GetMovies(repository: repository).data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie App Catalog"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "settings");
            },
            icon: const Icon(Icons.settings),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "saved_movies");
          },
          icon: const Icon(Icons.save),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<MoviesEntity>(
        future: _futureMovies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  _futureMovies = repository.getData();
                  _value = "Score from highest to lowest";
                });
              },
              child: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 4),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.amber, width: 2),
                            borderRadius: BorderRadius.circular(4)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            items: _filterItems.map(buildFilterItem).toList(),
                            value: _value,
                            onChanged: (value) =>
                                setState(() => onFilter(value!)),
                            iconSize: 28,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data?.results.length,
                        itemBuilder: (context, index) {
                          return MovieCard(movies: snapshot.data, index: index);
                        },
                      ),
                    ),
                  ],
                ),
              )),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error occurred! Error: ${snapshot.error}",
                style: const TextStyle(color: Colors.red, fontSize: 32),
                textAlign: TextAlign.center,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  DropdownMenuItem<String> buildFilterItem(String item) => DropdownMenuItem(
        child: Text(item),
        value: item,
      );

  void onFilter(String value) {
    if (value == "Score from highest to lowest") {
      _value = value;
      _futureMovies.then((value) =>
          value.results.sort((b, a) => a.voteAverage.compareTo(b.voteAverage)));
    } else if (value == "Score from lowest to highest") {
      _value = value;
      _futureMovies.then((value) =>
          value.results.sort((a, b) => a.voteAverage.compareTo(b.voteAverage)));
    }
  }
}
