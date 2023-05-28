import 'package:flutter_auth/models/userModel.dart';
import 'package:get/get.dart';

class Controller extends GetxController{
  Rx<UserModel> userModel=UserModel(firstName: "", lastName: "",mobileNumber: "", email: "", instituteType: "", instituteName: "", instituteLocation: "").obs;
  setUserModel(UserModel model){
    userModel.value=model;
  }

  RxString instituteType="".obs;
  setInstituteType(String iType){
    instituteType.value=iType;
  }
}