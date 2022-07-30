import 'package:cash_flow/app/data/constants/message_constants.dart';
import 'package:cash_flow/app/data/models/transaction_model.dart';
import 'package:cash_flow/app/data/models/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CashFlowDatabase {
  static final CashFlowDatabase instance = CashFlowDatabase._init();

  static Database? _database;

  CashFlowDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('cashflow.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE $tableUser (
  ${UserFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
  ${UserFields.username} TEXT NOT NULL,
  ${UserFields.password} TEXT NOT NULL,
  ${UserFields.name} TEXT NOT NULL,
)
''');

    await db.execute('''
CREATE TABLE $tableTransaction (
  ${TransactionFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
  ${TransactionFields.userId} INTEGER NOT NULL,
  ${TransactionFields.amount} INTEGER NOT NULL,
  ${TransactionFields.isIncome} BOOLEAN NOT NULL,
  ${TransactionFields.note} TEXT NOT NULL,
  ${TransactionFields.createdTime} TEXT NOT NULL,
)
''');

    await db.insert(
      tableUser,
      const UserModel(
        username: "user",
        password: "user",
        name: "Dharma",
      ).toJson(),
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<int> createUser(UserModel userModel) async {
    final db = await instance.database;

    return await db.insert(tableUser, userModel.toJson());
  }

  Future<int> createTransaction(TransactionModel newTransactionModel) async {
    final db = await instance.database;

    return await db.insert(tableTransaction, newTransactionModel.toJson());
  }

  Future<UserModel> readUserByUsernameAndPassword(
    String username,
    String password,
  ) async {
    final db = await instance.database;

    final listUserMap = await db.query(
      tableUser,
      columns: UserFields.userColumns,
      where: '${UserFields.username} = ? AND ${UserFields.password} = ?',
      whereArgs: [username, password],
    );

    if (listUserMap.isNotEmpty) {
      return UserModel.fromJson(listUserMap.first);
    } else {
      throw Exception(loginErrorMessage(username));
    }
  }

  Future<List<TransactionModel>> readAllTransaction(int userId) async {
    final db = await instance.database;

    final listTransactionMap = await db.query(
      tableUser,
      columns: TransactionFields.transactionColumns,
      where: '${TransactionFields.userId} = ?',
      orderBy: '${TransactionFields.createdTime} ASC',
      whereArgs: [userId],
    );

    return listTransactionMap.map((e) => TransactionModel.fromJson(e)).toList();
  }

  Future<int> updateUser(UserModel newUser) async {
    final db = await instance.database;

    return db.update(
      tableUser,
      newUser.toJson(),
      where: '${UserFields.id} = ?',
      whereArgs: [newUser.id],
    );
  }
}
