import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/presentation/pages/settings_page.dart';

import 'features/movie_catalog/presentation/bloc/dark_mode_cubit.dart';
import 'features/movie_catalog/presentation/pages/home_page.dart';
import 'features/movie_catalog/presentation/pages/saved_movies_page.dart';

void main() => runApp(const MovieCatalogApp());

class MovieCatalogApp extends StatelessWidget {
  const MovieCatalogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DarkModeCubit>(
      create: (context) => DarkModeCubit(),
      child: BlocBuilder<DarkModeCubit, DarkModeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Movie Catalog App',
            theme: state.theme,
            initialRoute: "/",
            routes: {
              "/": (context) => const HomePage(),
              "settings": (context) => const SettingsPage(),
              "saved_movies": (context) => const SavedMoviesPage()
            },
          );
        },
      ),
    );
  }
}
