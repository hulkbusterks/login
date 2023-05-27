import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/profile/profileutils/profileConstants.dart';
import 'package:google_fonts/google_fonts.dart';

ButtonStyle CustomElevatedBtnStyle() {
  return ButtonStyle(
      shadowColor: MaterialStateProperty.all(Colors.transparent),
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.hovered)) {
          return secondary; // set the hover color here
        }
        if (states.contains(MaterialState.pressed)) {
          return primary;
        }
        return primary;
      }),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))));
}

