import 'package:bloc_food_delivery_app/data/entity/Users.dart';
import 'package:bloc_food_delivery_app/data/sqlite/database_helper.dart';
import 'package:sqflite/sqflite.dart';


class UserDaoRepository {
  final dbHelper = DatabaseHelper.instance;

  Future<int> insertUser(User user) async {
    final db = await dbHelper.database;
    return await db.insert('users', user.toMap());
  }

  Future<User?> getUserByEmailAndPassword(String email, String passsword) async {
    final db = await dbHelper.database;
    final result = await db.query(
      'users',
      where: 'email = ? AND passsword = ?',
      whereArgs: [email, passsword],
    );
    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    }
    return null;
  }
}
