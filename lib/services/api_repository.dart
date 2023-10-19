import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lichi_flutter/models/product_list_model.dart';

import '../models/product_model.dart';

// Метод для получения товаров из категории для каталога
Future<ProductList> getCategoryProductList(String category) async {
  const String url = 'https://api.lichi.com/category/get_category_product_list';

  final Map<String, String> queryParams = {
    'shop': '2',
    'lang': '1',
    'category': category, // Название категории (new, last, dresses, shoes)
    'limit': '12',
    'page': '1'
  };

  final response = await http.post(Uri.parse(url), body: queryParams);

  if (response.statusCode == 200) {
    try {
      final jsonResult = jsonDecode(response.body);
      final products = jsonResult['api_data'];
      ProductList productList = ProductList.fromJson(products);
      return productList;
    } on Exception catch (e) {
      throw Exception('Ошибка при чтении ответа сервера $e');
    }
  } else {
    throw Exception('Ошибка при загрузке товаров из категории');
  }
}

// Метод для получения информации о товаре по идентификатору
Future<Product> getProductDetail(int productId) async {
  const String url = 'https://api.lichi.com/product/get_product_detail';
  final Map<String, String> queryParams = {
    'shop': '2',
    'lang': '1',
    'id': productId.toString(),
  };
  final response = await http.post(Uri.parse(url), body: queryParams);

  if (response.statusCode == 200) {
    try {
      final jsonResult = jsonDecode(response.body);
      final jsonProduct = jsonResult['api_data'];
      Product product = Product.fromJson(jsonProduct);
      return product;
    } on Exception catch (e) {
      throw Exception('Ошибка при чтении ответа сервера $e');
    }
  } else {
    throw Exception('Ошибка при получении информации о товаре');
  }
}
