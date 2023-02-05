import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

abstract class JsonConverter
    extends TypeConverter<Map<String, dynamic>, String> {
  const JsonConverter();

  Map<String, dynamic> mapToDart(String fromDb) => json.decode(fromDb);
  String mapToSql(Map<String, dynamic> dart) => json.encode(dart);
}

@DriftDatabase(
  tables: [Cart, ResponseFromAPI],
  // include: {'tables.drift'},
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<CartData>> getCart(userId) async {
    return (select(cart)..where((t) => t.userId.equals(userId))).get();
  }

  Future<int> insertToCart(CartData companion) async {
    return await into(cart).insertOnConflictUpdate(companion);
  }

  Future updateQuantity(CartData cartdata) async {
    return await update(cart).replace(cartdata);
  }

  Future deleteCartItem(int id) {
    return (delete(cart)..where((t) => t.productId.equals(id))).go();
  }

  Future emptyCart() async {
    return (delete(cart)).go();
  }

  // RESPONSE
  Future<List<ResponseFromAPIData>> getResponse() async {
    return (select(responseFromAPI)).get();
  }

  Future<int> insertResponseAPI(ResponseFromAPIData companion) async {
    return await into(responseFromAPI).insertOnConflictUpdate(companion);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase(file);
  });
}

class Cart extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get productId => integer()();
  IntColumn get initialPrice => integer().nullable()();
  IntColumn get productPrice => integer().nullable()();
  IntColumn get quantity => integer().nullable()();
  TextColumn get productName => text().nullable()();
  TextColumn get unitTag => text().nullable()();
  TextColumn get image => text().nullable()();
  IntColumn get userId => integer()();
}

class ResponseFromAPI extends Table {
  Set<Column> get primaryKey => {method, path};

  TextColumn get method => text()();
  TextColumn get path => text()();
  TextColumn get status => text()();
  TextColumn get responseBody => text()();
  TextColumn get data => text().nullable()();
}
