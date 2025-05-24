import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ProjectDb {
  //region DB CONSTANTS
  static const String USER = 'User';

  static const String USER_ID = 'UserID';
  static const String NAME = 'Name';
  static const String EMAIL = 'Email';
  static const String PHONE_NO = 'PhoneNo';
  static const String PASSWORD = 'Password';
  static const String CONFIRM_PASSWORD = 'ConfirmPassword';
  static const String CITY = 'City';
  static const String DOB = 'Dob';
  static const String AGE = 'Age';
  static const String GENDER = 'Gender';
  static const String IS_FAVOURITE = 'IsFavourite';
  static const String HOBBIES = 'Hobbies';
  int DB_VERSION = 1;

  //endregion

  // region INIT DATABASE
  // Future<Database> initDatabase() async {
  //   String path;
  //   Database db = await openDatabase(
  //     path = join(await getDatabasesPath(), 'Matrimony_Project.db'),
  //     onCreate: (db, version) {
  //       db.execute(
  //           'CREATE TABLE $USER(${ProjectDb.USER_ID} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '
  //               '${ProjectDb.NAME} TEXT NOT NULL, '
  //               '${ProjectDb.EMAIL} TEXT,'
  //               '${ProjectDb.PHONE_NO} TEXT,'
  //               '${ProjectDb.PASSWORD} TEXT,'
  //               '${ProjectDb.CONFIRM_PASSWORD} TEXT,'
  //               '${ProjectDb.CITY} TEXT,'
  //               '${ProjectDb.GENDER} TEXT,'
  //               '${ProjectDb.HOBBIES} TEXT,'
  //               '${ProjectDb.AGE} INTEGER,'
  //               '${ProjectDb.DOB} INTEGER NOT NULL, '
  //               '${ProjectDb.IS_FAVOURITE} INTEGER DEFAULT 0)'
  //       );
  //     },
  //
  //     onUpgrade: (db, oldVersion, newVersion) {
  //       if (newVersion > oldVersion) {
  //         db.execute('ALTER TABLE $USER ADD $IS_FAVOURITE INTEGER');
  //       }
  //     },
  //     version: DB_VERSION,
  //     readOnly: false,
  //   );
  //   return db;
  // }
  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'Matrimony_Project.db');
    print("📂 Database Path: $path"); // ✅ Debugging

    Database db = await openDatabase(
      path,
      version: DB_VERSION,
      onCreate: (db, version) {
        print("✅ Creating User Table");
        db.execute(
            'CREATE TABLE $USER(${ProjectDb.USER_ID} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '
                '${ProjectDb.NAME} TEXT NOT NULL, '
                '${ProjectDb.EMAIL} TEXT,'
                '${ProjectDb.PHONE_NO} TEXT,'
                '${ProjectDb.PASSWORD} TEXT,'
                '${ProjectDb.CONFIRM_PASSWORD} TEXT,'
                '${ProjectDb.CITY} TEXT,'
                '${ProjectDb.GENDER} TEXT,'
                '${ProjectDb.HOBBIES} TEXT,'
                '${ProjectDb.AGE} INTEGER,'
                '${ProjectDb.DOB} INTEGER NOT NULL, '
                '${ProjectDb.IS_FAVOURITE} INTEGER DEFAULT 0)'
        );
        print("✅ User Table Created Successfully");
      },
      onOpen: (db) {
        print("📂 Database Opened Successfully");
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 5) {
          await db.execute(
              'ALTER TABLE $USER ADD COLUMN $IS_FAVOURITE INTEGER DEFAULT 0');
          print("🔄 Table Updated to Version 5");
        }
      },
      readOnly: false,
    );

    return db;
  }

  void testDatabase() async {
    Database db = await ProjectDb().initDatabase();
    var tables = await db
        .rawQuery("SELECT name FROM sqlite_master WHERE type='table' AND name='$ProjectDb.USER'");

    if (tables.isNotEmpty) {
      print("✅ Table '$ProjectDb.USER' exists.");
    } else {
      print("❌ Table '$ProjectDb.USER' does NOT exist.");
    }
  }

//endregion
}

