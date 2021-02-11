import 'package:flutter/material.dart';
import 'package:flutter_getx_esp_contador/controllers/global_controller.dart';
import 'package:flutter_getx_esp_contador/models/product.dart';
import 'package:get/get.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<GlobalController>();
    return GetBuilder<GlobalController>(
      id: 'products',
      builder: (_) => ListView.builder(
        itemCount: _.products.length,
        itemBuilder: (__, index) {
          final Product product = _.products[index];
          return ListTile(
            trailing: IconButton(
              icon: Icon(
                Icons.favorite,
                color: product.isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                _.onFavorite(index, !product.isFavorite);
              },
            ),
            title: Text(product.name),
            subtitle: Text("USD ${product.price}"),
          );
        },
      ),
    );
  }
}
