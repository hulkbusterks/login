import 'package:flutter/material.dart';
import 'package:flutter_auth/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  double width;
  String FieldName;
  bool isObscure;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  Function(String)? onChanged;
  String? hintText;
  CustomTextField(
      {Key? key,
      required this.width,
      required this.FieldName,
      required this.isObscure,
      required this.keyboardType,
      required this.textInputAction,
      this.onChanged,
      this.hintText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: width,
      height: 108,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          FieldName,
          style: GoogleFonts.getFont("Ramabhadra",
              fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 40,
          child: TextFormField(
              obscureText: isObscure,
              textInputAction: textInputAction,
              keyboardType: keyboardType,
              cursorColor: Colors.black,
              onChanged: onChanged,
              cursorWidth: 1,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(bottom: 7, left: 10),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: textFilledColor,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xff0033ff),
                      width: 2.0,
                    ),
                  ),
                  fillColor: textFilledColor,
                  hintText: hintText,
                  hintStyle: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 195, 195, 195)))),
        )
      ]),
    );
  }
}
