import 'package:get/get.dart';

class LogicController extends GetxController {
  var _gameOver = false.obs;
  var _winner = "X".obs;
  var _draw = false.obs;
  var _count = 0.obs;
  late List<List> matrix;

  // @override
  // void onInit() {
  //   super.onInit();
  //   createMatrix(3, 3);
  // }

  // createMatrix(rows, columns) {
  //   matrix = List.generate(
  //       rows, (_) => List.generate(3, (_) => "", growable: false),
  //       growable: false);
  // }

  bool get gameOver => _gameOver.value;
  String get winner => _winner.value;
  bool get draw => _draw.value;
  int get count => _count.value;
  set changeValue(value) {
    _gameOver.value = value;
  }

  set winnerValue(value) {
    _winner.value = value;
  }

  set drawValue(value) {
    _draw.value = value;
  }

  increaseCount() {
    _count.value++;
  }
}
