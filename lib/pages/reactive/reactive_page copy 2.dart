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
            child: Obx(
              () => ListView.builder(
                itemCount: _.items.length,
                itemBuilder: (__, index) {
                  final String text = _.items[index];
                  return ListTile(
                    title: Text(text),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _.removeItem(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'add',
                child: Icon(Icons.add),
                onPressed: () {
                  // _.increment();
                  // _.removeItem(index);
                },
              ),
              FloatingActionButton(
                heroTag: 'date',
                child: Icon(Icons.calendar_today),
                onPressed: () {
                  //_.getDate();
                  _.addItem();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
