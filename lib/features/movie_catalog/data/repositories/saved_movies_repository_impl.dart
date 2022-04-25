import 'package:flutter_movie_catalog/features/movie_catalog/data/datasources/saved_movies_db_local_data_source.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/domain/entities/saved_movies_entity.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/domain/repositories/saved_movies_repository.dart';
import 'package:sqflite/sqflite.dart';

class SavedMoviesRepositoryImpl implements SavedMoviesRepository {
  final SavedMoviesDbLocalDataSource _savedMoviesDbLocalDataSource =
      SavedMoviesDbLocalDataSource();

  @override
  Future<List<SavedMoviesEntity>> getData() async {
    final db = await _savedMoviesDbLocalDataSource.getDatabase();

    final List<Map<String, dynamic>> maps = await db.query("saved_movies");

    return List.generate(maps.length, (i) {
      return SavedMoviesEntity(
          id: maps[i]["id"],
          originalLanguage: maps[i]["originalLanguage"],
          originalTitle: maps[i]["originalTitle"],
          overview: maps[i]["overview"],
          popularity: maps[i]["popularity"],
          posterPath: maps[i]["posterPath"],
          releaseDate: maps[i]["releaseDate"],
          title: maps[i]["title"],
          voteAverage: maps[i]["voteAverage"],
          voteCount: maps[i]["voteCount"]);
    });
  }

  @override
  Future<void> insertData(SavedMoviesEntity entity) async {
    final db = await _savedMoviesDbLocalDataSource.getDatabase();

    await db.insert(
      "saved_movies",
      entity.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> deleteData(int id) async {
    final db = await _savedMoviesDbLocalDataSource.getDatabase();
    await db.delete(
      "saved_movies",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
