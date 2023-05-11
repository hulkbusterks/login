import 'package:get/get.dart';

class UserIdController extends GetxController {
  RxString userid="".obs;
  void setUserId(String uid) {
    userid.value = uid;
  }
}