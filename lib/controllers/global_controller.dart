import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_getx_esp_contador/models/product.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  List<Product> _products = [];
  Map<String, Product> _favorites = Map();

  List<Product> get products => _products;
  Map<String, Product> get favorites => _favorites;

  @override
  void onInit() {
    super.onInit();
    print("Global onInit");
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final String productsString =
        await rootBundle.loadString('assets/products.json');
    this._products = (jsonDecode(productsString) as List)
        .map((e) => Product.fromJson(e))
        .toList();
    print("PRODUTOS CARREGADOS");
    update(['products']);
  }

  onFavorite(int index, bool isFavorite) {
    Product product = this._products[index];
    product.isFavorite = isFavorite;
    if (isFavorite) {
      this._favorites[product.name] = product;
    } else {
      this._favorites.remove(product.name);
    }
    update(['products', 'favorites']);
  }
}
