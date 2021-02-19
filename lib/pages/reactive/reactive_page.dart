import 'package:flutter/material.dart';
import 'package:flutter_getx_esp_contador/controllers/reactive_controller.dart';
import 'package:get/get.dart';

class ReactivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReactiveController>(
      init: ReactiveController(),
      builder: (_) {
        print("reactive fora");
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Text("Age: ${_.myPet.age}")),
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
