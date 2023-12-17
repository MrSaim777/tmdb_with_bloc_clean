import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:tmdb_ui/features/favorite/data/datasources/database/db_services.dart';
import 'package:tmdb_ui/features/favorite/data/models/movies_model.dart';

class MoviesDB {
  final String tableName = 'movies';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
      "id" INTEGER NOT NULL,
      "image" TEXT NOT NULL,
      "date" INTEGER NOT NULL DEFAULT (cast(strftime('%s','now') as int)),
      "saved_at" INTEGER NOT NULL DEFAULT (cast(strftime('%s','now') as int)),
      "title" TEXT NOT NULL,
      "overview" TEXT NOT NULL,
      "rating" DOUBLE,
      PRIMARY KEY("id" AUTOINCREMENT)
      );""");
  }

  Future<int> create(
      {required int id,
      required String image,
      required String date,
      required String title,
      required String overview,
      required double rating}) async {
    final db = await DatabaseService().database;
    return await db.rawInsert(
        '''INSERT INTO $tableName (id,image,date,saved_at,title,overview,rating) VALUES(?,?,?,?,?,?,?)''',
        [
          id,
          image,
          date,
          DateTime.now().millisecondsSinceEpoch,
          title,
          overview,
          rating
        ]);
  }

  Future<List<FavoriteMoviesModel>> fetchAll() async {
    final db = await DatabaseService().database;
    final movies = await db.rawQuery('''SELECT * from $tableName''');
    return movies
        .map((movie) => FavoriteMoviesModel.fromSqfliteDatabase(movie))
        .toList();
  }

  Future<void> remove(int id) async {
    final db = await DatabaseService().database;
    try {
      await db.rawDelete('''DELETE FROM $tableName WHERE id = ?''', [id]);
    } catch (e) {
      log(e.toString(), name: "Remove Exception");
    }
  }

  Future<bool> toggleFavorite({
    required int id,
    required String image,
    required String date,
    required String title,
    required String overview,
    required double rating,
  }) async {
    final db = await DatabaseService().database;

    final List<Map<String, dynamic>> existingMovies = await db.rawQuery(
      '''SELECT * FROM $tableName WHERE id = ?''',
      [id],
    );

    if (existingMovies.isNotEmpty) {
      await remove(id);
      return false;
    } else {
      await create(
        id: id,
        image: image,
        date: date,
        title: title,
        overview: overview,
        rating: rating,
      );
      return true;
    }
  }
}
