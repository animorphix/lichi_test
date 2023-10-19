// import 'package:flutter/foundation.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// import '../Cart/cart.dart';
// import '../models/product_model.dart';

// class CartDatabaseHelper {
//   Database? _database;

//   Future<void> initDatabase() async {
//     _database = await openDatabase(
//       join(await getDatabasesPath(), 'cart_database.db'),
//       onCreate: (db, version) {
//         return db.execute(
//           "CREATE TABLE cart_items(id INTEGER PRIMARY KEY, productJson TEXT, quantity INTEGER)",
//         );
//       },
//       version: 1,
//     );
//   }

//   Future<void> addToCart(CartItem item) async {
//     if (_database == null) {
//       await initDatabase();
//     }
//     await _database?.insert(
//       'cart_items',
//       item.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<void> removeFromCart(CartItem item) async {
//     if (_database == null) {
//       await initDatabase();
//     }
//     await _database?.delete(
//       'cart_items',
//       where: 'id = ?',
//       whereArgs: [item.product.aData?.id],
//     );
//   }

//   Future<List<CartItem>> getCartItems() async {
//     if (_database == null) {
//       await initDatabase();
//     }
//     final List<Map<String, dynamic>> maps = await _database!.query('cart_items');
//     return List.generate(maps.length, (i) {
//       return CartItem.fromMap(maps[i]);
//     });
//   }
// }

// class CartProvider with ChangeNotifier {
//   final CartDatabaseHelper _dbHelper = CartDatabaseHelper();

//   Future<void> addToCart(Product product, int quantity) async {
//     final cartItem = CartItem(product: product, quantity: quantity);
//     await _dbHelper.addToCart(cartItem);
//     notifyListeners();
//   }

//   Future<void> removeFromCart(CartItem item) async {
//     await _dbHelper.removeFromCart(item);
//     notifyListeners();
//   }

//   Future<List<CartItem>> getCartItems() async {
//     return _dbHelper.getCartItems();
//   }
// }
