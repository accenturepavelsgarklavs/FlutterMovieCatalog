import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SavedMoviesDbLocalDataSource {
  Future<DatabaseExecutor> getDatabase() async {
    final database = openDatabase(
      join(await getDatabasesPath(), "saved_movies_database.db"),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE saved_movies(id INTEGER PRIMARY KEY, adult INTEGER, originalLanguage TEXT, originalTitle TEXT, overview TEXT, popularity REAL, posterPath TEXT, releaseDate TEXT, title TEXT, voteAverage REAL, voteCount INTEGER)',
        );
      },
      version: 1,
    );
    return database;
  }
}
