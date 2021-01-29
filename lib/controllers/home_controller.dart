import 'package:get/get.dart';

class HomeController extends GetxController {
  int _counter = 0;

  int get counter => _counter;

  @override
  void onInit() {
    print("Chamado ANTES de renderizar");
    super.onInit();
  }

  @override
  void onReady() {
    print("Chamado DEPOIS de renderizar");
    super.onReady();
  }

  void increment() {
    this._counter++;
    update();
  }
}
