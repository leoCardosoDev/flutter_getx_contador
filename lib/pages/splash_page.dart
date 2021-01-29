import 'package:flutter/material.dart';
import 'package:flutter_getx_esp_contador/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (_) => Scaffold(
              backgroundColor: Colors.amberAccent,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}
