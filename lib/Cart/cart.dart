import 'package:flutter/foundation.dart';
import '../models/product_model.dart';

class Cart {
  List<CartItem> items = [];

  void addItem(Product product, int quantity) {
    bool itemfound = false;
    int foundIndex = -1;
    for (var i = 0; i < items.length; i++) {
      if (items.isNotEmpty &&
          product.aData?.id == items[i].product.aData?.id) {
        itemfound = true;
        foundIndex = i;
        break;
      } else {
        print('item does not exist');
      }
    }


    // Check if the product is already in the cart
    final existingItemIndex =
        items.indexWhere((item) => item.product == product);

    if (existingItemIndex != -1) {
      // Update the quantity of the existing item
      items[existingItemIndex].quantity += quantity;
    } else {
      if (itemfound) {
        items[foundIndex].quantity += quantity;
      } else {
        // Add a new item to the cart
        items.add(CartItem(product: product, quantity: quantity));
      }
    }
  }
  void removeItem(Product product) {
    final existingItemIndex =
        items.indexWhere((item) => item.product == product);

    if (existingItemIndex != -1) {
      // Update the quantity of the existing item
      if (items[existingItemIndex].quantity > 1) {
        items[existingItemIndex].quantity -= 1;
      } else {
        // Remove the item from the cart when the quantity is 0
        items.removeAt(existingItemIndex);
      }
    }
  }

  double get total {
    return items.fold(0, (total, item) {
      return total + (item.product.aData?.price ?? 0) * item.quantity;
    });
  }
  
  int get totalQuantity {
    return items.fold(0, (total, item) => total + item.quantity);
  }

}

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': product.aData?.id,
      'productJson': productToJson(product),
      'quantity': quantity,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      product: Product.fromJson(map['productJson']),
      quantity: map['quantity'],
    );
  }
}

class CartProvider with ChangeNotifier {
  final Cart _cart = Cart();

  Cart get cart => _cart;

  void addToCart(Product product, int quantity) {
    _cart.addItem(product, quantity);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.removeItem(product);
    notifyListeners();
  }
}
