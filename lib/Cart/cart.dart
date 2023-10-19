import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/product_model.dart';

class CartDatabaseHelper {
  Database? _database;
  final String cartTable = 'cart';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'cart_database.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('''
        CREATE TABLE $cartTable (
          productId TEXT PRIMARY KEY,
          productJson TEXT,
          quantity INTEGER
        )
      ''');
    }, version: 1);
  }

  Future<void> addToCart(CartItem cartItem) async {
    final db = await database;
    await db.insert(cartTable, cartItem.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> removeFromCart(String productId) async {
    final db = await database;
    await db.delete(
      cartTable,
      where: 'productId = ?',
      whereArgs: [productId],
    );
  }

  Future<List<CartItem>> getCartItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(cartTable);
    return List.generate(maps.length, (i) {
      return CartItem.fromMap(maps[i]);
    });
  }
}

class Cart {
  List<CartItem> items = [];
}

class CartItem {
  final String productId;
  final Product product;
  int quantity;

  CartItem({
    required this.productId,
    required this.product,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productJson': productToJson(product),
      'quantity': quantity,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      productId: map['productId'],
      product: Product.fromJson(jsonDecode( map['productJson'])),
      quantity: map['quantity'],
    );
  }
}

class CartProvider with ChangeNotifier {
  final CartDatabaseHelper _db = CartDatabaseHelper();
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  CartProvider() {
    loadCartItems();
  }

  Future<void> loadCartItems() async {
    _cartItems = await _db.getCartItems();
    notifyListeners();
  }

  void addToCart(Product product, int quantity) async {
    final cartItem = CartItem(
        productId: product.aData!.id.toString(),
        product: product,
        quantity: quantity);

    // Check if the product is already in the cart and update its quantity
    final existingCartItemIndex =
        _cartItems.indexWhere((item) => item.productId == cartItem.productId);
    if (existingCartItemIndex != -1) {
      _cartItems[existingCartItemIndex].quantity += quantity;
      _db.addToCart(_cartItems[existingCartItemIndex]);
    } else {
      _cartItems.add(cartItem);
      _db.addToCart(cartItem);
    }

    notifyListeners();
  }

void removeFromCart(Product product) async {
    final productId = product.aData?.id.toString();

    // Find the cart item with the matching product ID and remove it from the list and database.
    final existingCartItemIndex = _cartItems.indexWhere((item) => item.productId == productId);
    if (existingCartItemIndex != -1) {
      if (_cartItems[existingCartItemIndex].quantity > 1) {
        _cartItems[existingCartItemIndex].quantity -= 1;
        _db.addToCart(_cartItems[existingCartItemIndex]);
      } else {
        _cartItems.removeAt(existingCartItemIndex);
        _db.removeFromCart(productId!);
      }
      notifyListeners();
    }
}


  double get total {
    return _cartItems.fold(0.0, (total, item) {
      return total + (item.product.aData?.price ?? 0) * item.quantity;
    });
  }

  int get totalQuantity {
    return _cartItems.fold(0, (total, item) => total + item.quantity);
  }
}
