import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/profile/visibilityController.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profileConstants.dart';
class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  int _selectedIndex = 0;
  VisibilityController visibilityController = Get.put(VisibilityController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customTextButton("Personal information", 0, () {}, fontSize: 20),
        const SizedBox(
          height: 8,
        ),
        customTextButton("Your Orders", 1, () {}, fontSize: 20),
        const SizedBox(
          height: 8,
        ),
        customTextButton("Your Products", 2, () {}, fontSize: 20),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget customTextButton(String text, int index, Function() onPressed,
      {
      double? fontSize = 24,
      FontWeight? fontWeight = FontWeight.bold}) {
    Color txtColor = _selectedIndex == index
        ? primary
        : const Color.fromARGB(255, 154, 154, 154);

    return TextButton(
        onPressed: () {
          setState(() {
            _selectedIndex = index;
          });
          visibilityController.setVisibility(index);
          onPressed;
        },
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            elevation: MaterialStateProperty.all(0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.hovered)) {
                return secondary; // set the hover color here
              }
              return txtColor;
            }),
            overlayColor: MaterialStateProperty.all(Colors.transparent)),
        child: Text(
          text,
          style: GoogleFonts.getFont("Nunito",textStyle:TextStyle(
              fontSize: fontSize ?? 24,
              fontWeight: fontWeight ?? FontWeight.bold),)
        ));
  }
}
