import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';
import '/Screens/home/home.dart';

Color textFilledColor = const Color(0xfff1f1f1);

class FieldStyle extends StatelessWidget {
  String fieldName;
  FieldStyle({Key? key, required this.fieldName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          width: 410,
          child: TextField(
              obscureText: false,
              keyboardType: TextInputType.name,
              cursorColor: Colors.black,
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
              )),
        ),
      ],
    );
  }
}

class NextPageOfSignUpPage extends StatefulWidget {
  String emailAddress;
  String password;
  NextPageOfSignUpPage(
      {Key? key, required this.emailAddress, required this.password})
      : super(key: key);
  @override
  State<NextPageOfSignUpPage> createState() => _NextPageOfSignUpPageState();
}

class _NextPageOfSignUpPageState extends State<NextPageOfSignUpPage> {
  String _selectedType = '';
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildSchoolDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldStyle(fieldName: "School Name"),
        const SizedBox(height: 20),
        FieldStyle(fieldName: "School Address"),
      ],
    );
  }

  Widget _buildCollegeDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FieldStyle(fieldName: "College Name"),
        const SizedBox(height: 20),
        FieldStyle(fieldName: "College Address"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: SignUpPageAppBar(scaffoldKey: _scaffoldKey),
      body: Row(
        children: [
          Container(
            color: Colors.amber,
            width: size.width * 0.4,
          ),
          Container(
            width: size.width * 0.6,
            child: Center(
              child: Container(
                width: 450,
                height: 600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Are you from School or College?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(children: [
                      Row(
                        children: [
                          Radio(
                            value: 'school',
                            groupValue: _selectedType,
                            onChanged: (value) {
                              setState(() {
                                _selectedType = value as String;
                              });
                            },
                          ),
                          const Text(
                            'School',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 'college',
                            groupValue: _selectedType,
                            onChanged: (value) {
                              setState(() {
                                _selectedType = value as String;
                              });
                            },
                          ),
                          const Text(
                            'College',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ]),
                    const SizedBox(height: 20),
                    _selectedType == 'school'
                        ? _buildSchoolDetails()
                        : _selectedType == 'college'
                            ? _buildCollegeDetails()
                            : const SizedBox(),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
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
                              "Back",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 130,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                UserCredential credential = await FirebaseAuth
                                    .instance
                                    .createUserWithEmailAndPassword(
                                  email: widget.emailAddress,
                                  password: widget.password,
                                );
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomePage();
                                }));
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  print(
                                      'The account already exists for that email.');
                                }
                              } catch (e) {
                                print(e);
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
                              "Create Account",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
