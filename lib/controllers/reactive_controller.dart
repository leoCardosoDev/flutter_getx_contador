import 'dart:async';

import 'package:flutter_getx_esp_contador/controllers/socket_client_controller.dart';
import 'package:flutter_getx_esp_contador/models/pet.dart';
import 'package:get/get.dart';

class ReactiveController extends GetxController {
  RxInt counter = 0.obs;
  RxString currentDate = ''.obs;
  RxList<String> items = List<String>().obs;
  RxMap<String, dynamic> mapItems = Map<String, dynamic>().obs;

  Pet myPet = Pet(name: "Lulu", age: 2);

  StreamSubscription<String> _subscription;

  @override
  void onInit() {
    super.onInit();
    final SocketClientController socketController =
        Get.find<SocketClientController>();

    _subscription = socketController.message.listen((String data) {
      //print("Message::::: $data");
    });
  }

  void increment() {
    counter.value++;
  }

  void getDate() {
    currentDate.value = DateTime.now().toString();
  }

  void addItem() {
    items.add(DateTime.now().toString());
  }

  void removeItem(int index) {
    items.removeAt(index);
  }

  void setPetAge(int age) {
    // myPet.value = myPet.value.copyWith(age: age);
    myPet.age = age;
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }
}
