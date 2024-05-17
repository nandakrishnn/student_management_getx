import 'package:sqflite/sqflite.dart';
import 'package:studentapp/model/database_model.dart';

class DatabaseHealper {
  static const databaseVersion = 1;
  static const table = 'Students';
  static const columnId = '_id';
  static const columnName = 'name';
  static const columnSchoolName = 'schoolname';
  static const columnFatherName = 'fathername';
  static const columnage = 'age';
  static const imageurl = 'imageurl';

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _intidatabase();
    return _database!;
  }

  Future<Database> _intidatabase() async {
    return await openDatabase('student.db',
        version: databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table(
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT
        $columnName TEXT NOT NULL,
        $columnSchoolName TEXT NOT NULL,
        $columnFatherName TEXT NOT NULL,
        $columnage INTEGER NOT NULL,
        $imageurl TEXT NOT NULL,

      )
''');
  }

  Future<int> insertStudent(Student student) async {
    final db = await database;
    return await db.insert(table, {
      columnName: student.studentname,
      columnSchoolName: student.schoolname,
      columnFatherName: student.fathername,
      columnage: student.age,
      imageurl: student.imageurl
    });
  }

  Future<List<Student>> getStudent() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(table);
   return List.generate(
        maps.length,
        (index) => Student(
            imageurl: maps[index][imageurl],
            id: maps[index][columnId],
            studentname: maps[index][columnName],
            age: maps[index][columnage],
            fathername: maps[index][columnFatherName],
            schoolname: maps[index][columnSchoolName]));
  }
}
