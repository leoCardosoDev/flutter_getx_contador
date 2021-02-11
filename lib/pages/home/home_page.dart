import 'package:flutter/material.dart';
import 'package:flutter_getx_esp_contador/controllers/global_controller.dart';
import 'package:flutter_getx_esp_contador/controllers/home_controller.dart';
// import 'package:flutter_getx_esp_contador/pages/home/widgets/home_list.dart';
import 'package:flutter_getx_esp_contador/widgets/product_list.dart';
import 'package:get/state_manager.dart';

class HomePage extends StatelessWidget {
  final HomeController _controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: _controller,
      builder: (_) {
        return Scaffold(
          //body: HomeList(),
          appBar: AppBar(
            actions: [
              GetBuilder<GlobalController>(
                id: 'favorites',
                builder: (_) => FlatButton(
                  onPressed: () {},
                  child: Text("Favoritos (${_.favorites.length})"),
                ),
              ),
            ],
          ),
          body: ProductList(),
          floatingActionButton: FloatingActionButton(
            onPressed: _.increment,
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
