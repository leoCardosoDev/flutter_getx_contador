import 'package:flutter_getx_esp_contador/models/pet.dart';
import 'package:get/get.dart';

class ReactiveController extends GetxController {
  RxInt counter = 0.obs;
  RxString currentDate = ''.obs;
  RxList<String> items = List<String>().obs;
  RxMap<String, dynamic> mapItems = Map<String, dynamic>().obs;

  Rx<Pet> myPet = Pet(name: "Lulu", age: 2).obs;

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
    myPet.value = myPet.value.copyWith(age: age);
  }
}
