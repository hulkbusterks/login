import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../home/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_auth/Screens/utils/customField.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String emailAddress = '';
    String password = '';
    return Container(
      width: 410,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 140,
                child: Column(children: [
                  Text(
                    "Sign In to buyBuddy",
                    style: GoogleFonts.getFont("Ramabhadra",
                        fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 240,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(8),
                          backgroundColor:
                              const Color.fromRGBO(26, 115, 232, 1),
                          shadowColor: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network(
                            "https://castironsteak.com/wp-content/uploads/2016/01/google-square.jpg",
                          ),
                          const Text(
                            "Sign In with Google",
                            style: TextStyle(
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
              ),
              // Or element
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  width: 180,
                  height: 1,
                  color: const Color.fromARGB(255, 197, 197, 197),
                  padding: const EdgeInsets.only(bottom: 5),
                ),
                const Text(
                  "Or",
                  style: TextStyle(color: Color.fromARGB(255, 142, 142, 142)),
                ),
                Container(
                  width: 180,
                  height: 1,
                  color: const Color.fromARGB(255, 197, 197, 197),
                  padding: const EdgeInsets.only(bottom: 5),
                )
              ]),
              Column(
                children: <Widget>[
                  CustomTextField(
                    width: 410,
                    FieldName: "Email",
                    isObscure: false,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: (email) {
                      emailAddress = email;
                    },
                  ),
                  CustomTextField(
                      width: 410,
                      FieldName: "Password",
                      isObscure: true,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      onChanged: (pass) {
                        password = pass;
                      }),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 80,
                height: 40,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: emailAddress, password: password);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomePage();
                      }));
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                              color: Color(0xff002aff), width: 2)),
                      padding: const EdgeInsets.all(8),
                      backgroundColor: Colors.white,
                      shadowColor: Colors.white),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
