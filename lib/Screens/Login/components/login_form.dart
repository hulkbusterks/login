import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';
import '../../home/home.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

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
                              "Sign Up to buyBuddy",
                              style: GoogleFonts.getFont("Ramabhadra",fontSize: 24,fontWeight: FontWeight.w700),
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
                                      "Sign up with Google",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Container(width: 180,height: 1,color: Color.fromARGB(255, 197, 197, 197),padding: EdgeInsets.only(bottom: 5),),
                          Text("Or",style: TextStyle(color: Color.fromARGB(255, 142, 142, 142)),),
                          Container(width: 180,height: 1,color: Color.fromARGB(255, 197, 197, 197),padding: EdgeInsets.only(bottom: 5),)
                        
                        ]),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            CustomTextField(
                                width: 200,
                                FieldName: "First Name",
                                isObscure: false,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next),
                            const SizedBox(
                              width: 10,
                            ),
                            CustomTextField(
                                width: 200,
                                FieldName: "Last Name",
                                isObscure: false,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next),
                          ],
                        ),
                        Row(
                          children: [
                            CustomTextField(
                                width: 200,
                                FieldName: "Country",
                                isObscure: false,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next),
                            const SizedBox(
                              width: 10,
                            ),
                            CustomTextField(
                                width: 200,
                                FieldName: "Mobile Number",
                                isObscure: false,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next),
                          ],
                        ),
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                hintText: "6+ characters",
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
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => NextPageOfSignUpPage(emailAddress: emailAddress,password: password),
                                ),
                              );
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
                              "Next",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: 100,)
                        
                      ],
                    ),
                  ),
                ),
              );
            }
}
