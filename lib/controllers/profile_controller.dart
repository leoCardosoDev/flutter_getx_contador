import 'package:flutter/cupertino.dart';
import 'package:flutter_getx_esp_contador/models/user.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  User _user;
  User get user => _user;

  String _inputText = '';

  @override
  void onInit() {
    super.onInit();
    this._user = Get.arguments as User;
  }

  void onInputTextChanged(String text) {
    this._inputText = text;
  }

  void goToBackWithData() {
    this._inputText.trim().length > 0
        ? Get.back(result: this._inputText)
        : showCupertinoModalPopup(
            context: Get.overlayContext,
            builder: (_) => CupertinoActionSheet(
              title: Text('ERROR'),
              message: Text('Entre com dados válidos!'),
              cancelButton: CupertinoActionSheetAction(
                child: Text("Aceitar"),
                onPressed: () => Get.back(),
              ),
            ),
          );
  }
}
