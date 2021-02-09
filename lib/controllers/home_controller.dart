import 'package:flutter_getx_esp_contador/api/users_api.dart';
import 'package:flutter_getx_esp_contador/models/users.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int _counter = 0;
  List<User> _users = [];
  bool _loading = true;

  int get counter => _counter;
  List<User> get users => _users;
  bool get loading => _loading;

  @override
  void onInit() {
    print("Chamado ANTES de renderizar");
    super.onInit();
  }

  @override
  void onReady() {
    print("Chamado DEPOIS de renderizar");
    super.onReady();
    this.loadUsers();
  }

  Future<void> loadUsers() async {
    final data = await UsersAPI.instance.getUsers(1);
    this._users = data;
    this._loading = false;
    update(['users']);
  }

  void increment() {
    this._counter++;
    update(['text'], _counter >= 10);
  }
}
