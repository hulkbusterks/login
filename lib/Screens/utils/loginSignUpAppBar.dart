import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';

class LoginSignUpAppBar extends StatelessWidget with PreferredSizeWidget {
  LoginSignUpAppBar({Key? key, required this.scaffoldKey,required this.isLogin}) : super(key: key);
  bool isLogin;
  final scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: const Text(
                "buyBuddy",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            Row(
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: isLogin==true?"Don't have an account ? ":"Already a member ? ",
                      style: const TextStyle(color: Colors.black, fontSize: 14)),
                ])),
                InkWell(onTap: (){
                  if(isLogin==true){
                    Navigator.push(context, MaterialPageRoute(builder: ((context) {
                      return SignUpScreen();
                    })));
                  }else{
                    Navigator.push(context, MaterialPageRoute(builder: ((context) {
                      return LoginScreen();
                    })));
                  }
                },hoverColor: Colors.transparent,child: Text(isLogin==true?"Sign Up  ":"Sign In  ",style: const TextStyle(color: Color(0xff0a46fc), fontSize: 14)))
              ],
            )
          ],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
