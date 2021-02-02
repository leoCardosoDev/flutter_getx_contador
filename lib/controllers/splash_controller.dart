import 'package:flutter_getx_esp_contador/pages/home_page.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 2), () {
      Get.off(HomePage(), transition: Transition.zoom);
    });
  }

// foi substituido pelo dispose na SplashPage
  // @override
  // void onClose() {
  //   print("Fechando a SplashScreen");
  //   super.onClose();
  // }
}
