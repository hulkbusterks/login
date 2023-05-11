import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/home/homePageAppBar.dart';
import 'package:flutter_auth/Screens/profile/personalInfo.dart';
import 'package:flutter_auth/Screens/profile/visibilityController.dart';
import 'package:flutter_auth/Screens/profile/yourOrders.dart';
import 'package:flutter_auth/Screens/profile/yourProducts.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  VisibilityController visibilityController = Get.put(VisibilityController());
  List<Widget> pages = [PersonalInfo(), YourOrders(), YourProducts()];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("profile screen build");
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomePageAppBar(scaffoldKey: _scaffoldKey),
            ],
        ),
      ),
    );
  }
}

ButtonStyle CustomElevatedBtnStyle() {
  return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.hovered)) {
          return const Color.fromARGB(
              255, 71, 117, 241); // set the hover color here
        }
        if (states.contains(MaterialState.pressed)) {
          return const Color(0xff0043fb); // set the hover color here
        }
        return const Color(0xff0043fb);
      }),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))));
}

class CustomText extends StatelessWidget {
  String text;
  double? fontSize;
  FontWeight? fontWeight;
  Color? textColor;
  CustomText(
      {Key? key,
      required this.text,
      this.fontSize,
      this.fontWeight,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize ?? 24,
          color: textColor ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.bold),
    );
  }
}

class CustomTextBtn extends StatelessWidget {
  String text;
  double? fontSize;
  FontWeight? fontWeight;
  Function()? onPressed;
  CustomTextBtn(
      {Key? key,
      required this.text,
      this.fontSize,
      this.fontWeight,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.hovered)) {
                return const Color(0xff0043fb); // set the hover color here
              }
              return Color.fromARGB(255, 152, 146, 146);
            }),
            overlayColor: MaterialStateProperty.all(Colors.transparent)),
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize ?? 24,
              fontWeight: fontWeight ?? FontWeight.bold),
        ));
  }
}
