import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleConnect extends StatelessWidget {
  bool isLogin;
  Function()? onTap;
  GoogleConnect({Key? key, required this.isLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Colors.blue,
        height: 40,
        width: 240,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            width: 40,
            padding: const EdgeInsets.only(left: 2),
            child: Container(
              width: 36,
              color: Colors.white,
              height: 36,
              child: SvgPicture.network(
                "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/google/google-original.svg",
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 35),
            child: Text(
              isLogin == true ? "Sign In with Google" : "Sign up with Google",
              style: const TextStyle(
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          )
        ]),
      ),
    );
  }
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnackBar(
    BuildContext context, String inputText) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Align(alignment: Alignment.topCenter,child: Text(inputText)),
    backgroundColor: Colors.teal,
    behavior: SnackBarBehavior.floating,
    width: 300,
    duration: Duration(seconds: 3),
    action: SnackBarAction(
      label: 'Dismiss',
      disabledTextColor: Colors.white,
      textColor: Colors.yellow,
      onPressed: () {
        //Do whatever you want
      },
    ),
    onVisible: () {
      //your code goes here
    },
  ));
}

class Validations {
  static bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  static bool validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return false;
    else
      return true;
  }

  static bool validateName(String value) {
    if (value.length < 3)
      return false;
    else
      return true;
  }

  static bool validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return false;
    } return regex.hasMatch(value);
  }
}
