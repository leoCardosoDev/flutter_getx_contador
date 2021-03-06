import 'package:flutter/material.dart';
import 'package:flutter_getx_esp_contador/controllers/global_controller.dart';
import 'package:flutter_getx_esp_contador/controllers/socket_client_controller.dart';
import 'package:flutter_getx_esp_contador/pages/reactive/reactive_page.dart';
// import 'package:flutter_getx_esp_contador/pages/splash_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(GlobalController());
    Get.put(SocketClientController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ReactivePage(),
    );
  }
}
