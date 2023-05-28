/// This file refers to the body of sign up page which includes the form, and button to the next page.
/// Here, some checks are done before heading towards next page.
/// checks are: password matches confirm password

import 'package:flutter/material.dart';
import 'nextpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_auth/Screens/utils/customField.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_auth/Screens/utils/loginSignUpAppBar.dart';
import 'package:flutter_auth/Screens/utils/loginSignUpComponents.dart';
import 'package:flutter_auth/Screens/utils/screensUtils.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class SignUpPageBody extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        LoginSignUpAppBar(
          isLogin: false,
        ),
        Expanded(
          child: Row(
            children: [
              const Expanded(
                flex: 2,
                child: Center(child: Text("Let see")),
              ),
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Center(
                    child: SizedBox(
                      width: 410,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 140,
                            child: Column(children: [
                              Text(
                                "Sign Up to buyBuddy",
                                style: GoogleFonts.getFont("Ramabhadra",
                                    fontSize: 24, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              GoogleConnect(
                                isLogin: false,
                                onTap: () {},
                              )
                            ]),
                          ),
                          // Or element
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 180,
                                  height: 1,
                                  color:
                                      const Color.fromARGB(255, 197, 197, 197),
                                  padding: const EdgeInsets.only(bottom: 5),
                                ),
                                const Text(
                                  "Or",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 142, 142, 142)),
                                ),
                                Container(
                                  width: 180,
                                  height: 1,
                                  color:
                                      const Color.fromARGB(255, 197, 197, 197),
                                  padding: const EdgeInsets.only(bottom: 5),
                                )
                              ]),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CustomTextField(
                                        controller: firstNameController,
                                        width: 200,
                                        FieldName: "First Name",
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'First Name is required.';
                                          } else if (!Validations.validateName(
                                              value)) {
                                            return "Name must be more than 2 charater";
                                          }
                                          return null;
                                        },
                                        isObscure: false,
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.next),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    CustomTextField(
                                        controller: lastNameController,
                                        width: 200,
                                        FieldName: "Last Name",
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Last Name is required.';
                                          } else if (!Validations.validateName(
                                              value)) {
                                            return "Name must be more than 2 charater";
                                          }
                                          return null;
                                        },
                                        isObscure: false,
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.next),
                                  ],
                                ),
                                CustomTextField(
                                    controller: mobileNumberController,
                                    width: 410,
                                    FieldName: "Mobile Number",
                                    validator: fieldValidations['mobileNumber'],
                                    isObscure: false,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next),
                                Column(
                                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    CustomTextField(
                                      controller: emailController,
                                      validator: fieldValidations['email'],
                                      width: 410,
                                      FieldName: "Email",
                                      isObscure: false,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                    ),
                                    passwordFormat(),
                                    CustomTextField(
                                      controller: passwordController,
                                      width: 410,
                                      validator: fieldValidations['password'],
                                      FieldName: "Password",
                                      isObscure: true,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      textInputAction: TextInputAction.done,
                                      hintText: "6+ characters",
                                    ),
                                    CustomTextField(
                                      width: 410,
                                      controller: confirmPasswordController,
                                      FieldName: "Confirm Password",
                                      validator: (val) {
                                        if (val!.isEmpty)
                                          return 'Empty';
                                        else if (val !=
                                            passwordController.text) {
                                          return 'Password do not match';
                                        }
                                        return null;
                                      },
                                      isObscure: true,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      textInputAction: TextInputAction.done,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 80,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                var firstName = firstNameController.text.trim();
                                var lastName = lastNameController.text.trim();
                                var mobileNumber =
                                    mobileNumberController.text.trim();
                                var email = emailController.text.trim();
                                var password = passwordController.text.trim();
                                var confirmPass =
                                    confirmPasswordController.text.trim();
                                if (firstName.isEmpty ||
                                    lastName.isEmpty ||
                                    mobileNumber.isEmpty ||
                                    email.isEmpty ||
                                    password.isEmpty ||
                                    confirmPass.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: 'Please fill all fields');
                                  return;
                                }

                                if (password.length < 6) {
                                  // show error toast
                                  Fluttertoast.showToast(
                                      msg:
                                          'Weak Password, at least 6 characters are required');

                                  return;
                                }

                                if (password != confirmPass) {
                                  // show error toast
                                  Fluttertoast.showToast(
                                      msg: 'Passwords do not match');
                                  return;
                                }

                                // request to firebase auth
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => NextPageOfSignUpPage(
                                      emailAddress: email,
                                      password: password,
                                      firstName: firstName,
                                      lastName: lastName,
                                      mobileNumber: mobileNumber,
                                    ),
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
                          const SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
