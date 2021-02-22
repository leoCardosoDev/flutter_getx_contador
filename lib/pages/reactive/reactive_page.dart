import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_esp_contador/controllers/reactive_controller.dart';
import 'package:flutter_getx_esp_contador/controllers/socket_client_controller.dart';
import 'package:get/get.dart';

class ReactivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketController = Get.find<SocketClientController>();
    return GetBuilder<ReactiveController>(
      init: ReactiveController(),
      builder: (_) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoTextField(
                  onChanged: (text) {
                    socketController.setSearchText(text);
                  },
                ),
                Obx(() => Text("Age: ${_.myPet.age}")),
                Obx(() => Text(socketController.message.value)),
                SizedBox(height: 20),
                FlatButton(
                  onPressed: () {
                    _.setPetAge(_.myPet.age + 1);
                  },
                  child: Text("Set Age"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
