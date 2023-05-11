import 'package:get/get.dart';

class VisibilityController extends GetxController {
  RxInt visibilityIndex=0.obs;
  void setVisibility(int index) {
    visibilityIndex.value = index;
  }
}