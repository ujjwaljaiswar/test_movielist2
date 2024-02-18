import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'movie_data.dart';

class DatabaseHelper {
  static Database? _database;
  static const String tableName = 'movies';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'movies_database.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            cinema TEXT,
            movieNameEnglish TEXT,
            movieNameArabic TEXT,
            releaseDate TEXT,
            endDate TEXT,
            genre TEXT,
            language TEXT,
            format TEXT,
            rating REAL,
            trailerLink TEXT,
            showMoviePageBanner INTEGER,
            showWhatsOnMovies INTEGER,
            showComingSoonMovies INTEGER,
            showRecommendedMovies INTEGER,
            showPromotionalMovies INTEGER
          )
        ''');
      },
      version: 1,
    );
  }

  Future<void> insertMovie(MovieData movie) async {
    final db = await database;
    await db.insert(tableName, movie.toMap());
  }

  Future<void> deleteMovie(int id) async {
    final db = await database;
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<MovieData>> getMovies() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (index) {
      return MovieData.fromMap(maps[index]);
    });
  }
}
