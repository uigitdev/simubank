import 'package:simubank/simubank.dart';
import 'package:path/path.dart';

class TransactionsDatabaseHelper {
  static final _instance = TransactionsDatabaseHelper._internal();

  TransactionsDatabaseHelper._internal();

  factory TransactionsDatabaseHelper() => _instance;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  /// Initial transaction database.
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'transactions.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  /// Create database model.
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE transactions(
        id INTEGER PRIMARY KEY,
        userId INTEGER,
        date TEXT,
        merchant TEXT,
        amount INTEGER,
        currency TEXT,
        description TEXT,
        from_account TEXT,
        to_account TEXT,
        category TEXT,
        sessionId TEXT
      )
    ''');
  }

  /// Insert transactions by [sessionId].
  ///
  /// Add [sessionId] param to [JSON] as an identification.
  Future<int> insertTransaction(TransactionModel transaction) async {
    final db = await database;
    return await db.insert(
      'transactions',
      transaction.toJson('${sessionState.sessionId}'),
    );
  }

  /// Get transactions by [sessionId].
  Future<List<Map<String, dynamic>>> getTransactionsBySession() async {
    final db = await database;
    return await db.query(
      'transactions',
      where: 'sessionId = ?',
      whereArgs: ['${sessionState.sessionId}'],
    );
  }

  /// Delete transactions by [sessionId].
  Future<int> deleteTransactionsBySession() async {
    final db = await database;
    return await db.delete(
      'transactions',
      where: 'sessionId = ?',
      whereArgs: ['${sessionState.sessionId}'],
    );
  }
}
