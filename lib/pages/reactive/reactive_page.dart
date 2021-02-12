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
                Obx(
                  () {
                    print("MUDOU SEXO!?");
                    return Text(
                      'Sexo as 15:${_.counter.value.toString()}',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    );
                  },
                ),
                Obx(
                  () {
                    print("MUDOU DATA!?");
                    return Text(
                      _.currentDate.value,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'add',
                child: Icon(Icons.add),
                onPressed: () {
                  _.increment();
                },
              ),
              FloatingActionButton(
                heroTag: 'date',
                child: Icon(Icons.calendar_today),
                onPressed: () {
                  _.getDate();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
