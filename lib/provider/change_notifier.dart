import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_list_model.dart';
import '../models/product_model.dart';
import '../services/api_repository.dart';

class ProductProvider with ChangeNotifier {
  ProductList _productList = ProductList(aProduct: []);

  ProductList get productList => _productList;

  void setProductList(ProductList productList) {
    _productList = productList;
    notifyListeners();
  }

    Future<Product> fetchProductDetail(int productId) async {
    try {
      final product = await getProductDetail(productId);
      return product;
    } catch (e) {
      throw Exception('Failed to fetch product details: $e');
    }
  }

}


Future<void> fetchData(String category, BuildContext context) async {
  final productList = await getCategoryProductList(category);
  final productProvider = Provider.of<ProductProvider>(context, listen: false);
  productProvider.setProductList(productList);
}

