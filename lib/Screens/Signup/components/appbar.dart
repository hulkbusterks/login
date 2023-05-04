import 'package:flutter/material.dart';

class SignUpPageAppBar extends StatelessWidget with PreferredSizeWidget {
  SignUpPageAppBar({Key? key, required this.scaffoldKey}) : super(key: key);
  final scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "buyBuddy",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Already a member?",
                  style: TextStyle(color: Colors.black, fontSize: 14)),
              TextSpan(
                  text: " Sign In  ",
                  style: TextStyle(color: Color(0xff0a46fc), fontSize: 14)),
            ]))
          ],
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
