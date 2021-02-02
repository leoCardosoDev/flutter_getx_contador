import 'package:flutter/material.dart';
import 'package:flutter_getx_esp_contador/controllers/home_controller.dart';
import 'package:flutter_getx_esp_contador/pages/home/widgets/home_label.dart';
import 'package:get/state_manager.dart';

class HomePage extends StatelessWidget {
  final HomeController _controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: _controller,
      builder: (_) {
        print("Build Home");
        return Scaffold(
          body: Center(
            child: HomeLabel(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _.increment,
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
