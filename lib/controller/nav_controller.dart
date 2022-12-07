import 'package:get/get.dart';

class NavController extends GetxController {
  Rx<int> _currItemIndex = 3.obs;

  void changeIndex({required int idx}) {
    _currItemIndex.value = idx;
    update();
  }

  get getCurrIndex => _currItemIndex.value;
}
