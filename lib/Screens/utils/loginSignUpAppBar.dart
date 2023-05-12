import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:google_fonts/google_fonts.dart';
class LoginSignUpAppBar extends StatelessWidget{
  LoginSignUpAppBar({Key? key,required this.isLogin}) : super(key: key);
  bool isLogin;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                "buyBuddy",
                style: GoogleFonts.getFont('Ramabhadra',fontSize: 25,color: Colors.black),
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
                      return const SignUpScreen();
                    })));
                  }else{
                    Navigator.push(context, MaterialPageRoute(builder: ((context) {
                      return LoginScreen();
                    })));
                  }
                },hoverColor: Colors.transparent,child: Text(isLogin==true?"Sign Up  ":"Sign In  ",style: const TextStyle(color: Color(0xff0a46fc), fontSize: 14))),
                const SizedBox(width: 20,)
              ],
            )
          ],
        ));
  }
}
