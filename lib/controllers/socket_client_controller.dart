import 'dart:async';

import 'package:faker/faker.dart';
import 'package:get/get.dart';

class SocketClientController extends GetxController {
  RxString _message = "".obs;
  RxString _searchText = "".obs;
  RxInt _counter = 0.obs;

  RxString get message => _message;

  Timer _timer, _timerCounter;

  final _faker = Faker();

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  _init() {
    // ever(_counter, (_) {
    //   print("Executa sempre que houver mudança ${_counter.value}");
    // });

    // once(_counter, (_) {
    //   print("Executa somente uma vez que houver mudança ${_counter.value}");
    // });

// Executa depois de um certo tempo
    // debounce(
    //   _counter,
    //   (_) {
    //     print(
    //         "Executa depois de um certo tempo que houver mudança ${_counter.value}");
    //   },
    //   time: 1.seconds,
    // );

    // ever(_searchText, (_) {
    //   print("Executa sempre que houver mudança $_searchText");
    // });

    // debounce(
    //   _searchText,
    //   (_) {
    //     print(_searchText);
    //   },
    //   time: 500.milliseconds,
    // );
// Executa a cada intervalo
    interval(
      _searchText,
      (_) {
        print(_searchText);
      },
      time: 500.milliseconds,
    );

    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      _message.value = _faker.lorem.sentence();
    });

    _timerCounter = Timer.periodic(Duration(seconds: 1), (timer) {
      _counter.value++;
    });
  }

  void setSearchText(String text) {
    _searchText.value = text;
  }

  @override
  void onClose() {
    if (_timer != null) _timer.cancel();
    if (_timerCounter != null) _timerCounter.cancel();
    super.onClose();
  }
}
