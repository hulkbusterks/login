import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/controllers/controllers.dart';
import 'package:get/get.dart';
import '/Screens/home/home.dart';
import 'package:flutter_auth/Screens/utils/loginSignUpAppBar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_auth/controllers/userIdController.dart';

Color textFilledColor = const Color(0xfff1f1f1);

class FieldStyle extends StatelessWidget {
  String fieldName;
  TextEditingController controller;
  FieldStyle({Key? key, required this.fieldName, required this.controller})
      : super(key: key);

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
              controller: controller,
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
  // fetching user credentials from sign up body
  String firstName;
  String lastName;
  String mobileNumber;
  String emailAddress;
  String password;
  NextPageOfSignUpPage(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.mobileNumber,
      required this.emailAddress,
      required this.password})
      : super(key: key);
  @override
  State<NextPageOfSignUpPage> createState() => _NextPageOfSignUpPageState();
}

class _NextPageOfSignUpPageState extends State<NextPageOfSignUpPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var instituteNameController = TextEditingController();
  var instituteLocationController = TextEditingController();
  Controller controller = Get.put(Controller());
  UserIdController userIdController=Get.put(UserIdController());
  Widget _buildSchoolDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldStyle(
          fieldName: "School Name",
          controller: instituteNameController,
        ),
        const SizedBox(height: 20),
        FieldStyle(
          fieldName: "School Address",
          controller: instituteLocationController,
        ),
      ],
    );
  }

  Widget _buildCollegeDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FieldStyle(
            fieldName: "College Name", controller: instituteNameController),
        const SizedBox(height: 20),
        FieldStyle(
            fieldName: "College Address",
            controller: instituteLocationController),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          LoginSignUpAppBar(isLogin: false),
          Row(
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(children: [
                          Row(
                            children: [
                              Obx(() {
                                return Radio(
                                value: 'school',
                                groupValue: controller.instituteType.value,
                                onChanged: (value) {
                                  controller.setInstituteType(value as String);
                                  print(controller.instituteType.value);

                                },
                              );
                              },),
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
                              Obx(() {
                                return Radio(
                                value: 'college',
                                groupValue: controller.instituteType.value,
                                onChanged: (value) {
                                  controller.setInstituteType(value as String);
                                  print(controller.instituteType.value);
                                },
                              );
                              }),
                              const Text(
                                'College',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ]),
                        const SizedBox(height: 20),
                        Obx(() {
                          return controller.instituteType.value == 'school'
                            ? _buildSchoolDetails()
                            : controller.instituteType.value == 'college'
                                ? _buildCollegeDetails()
                                : const SizedBox();
                        },),
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
                                            color: Color(0xff002aff),
                                            width: 2)),
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
                                  var instituteName =
                                      instituteNameController.text.trim();
                                  var instituteLocation =
                                      instituteLocationController.text.trim();
                                  if (controller.instituteType.value.isEmpty ||
                                      instituteName.isEmpty ||
                                      instituteLocation.isEmpty) {
                                    // show error toast
                                    Fluttertoast.showToast(
                                        msg: 'Please fill all fields');
                                    return;
                                  }
                                  try {
                                    UserCredential credential =
                                        await FirebaseAuth.instance
                                            .createUserWithEmailAndPassword(
                                      email: widget.emailAddress,
                                      password: widget.password,
                                    );
                                    DatabaseReference userRef = FirebaseDatabase
                                        .instance
                                        .ref()
                                        .child('users');
                                    String uid = credential.user!.uid;
                                    userIdController.setUserId(uid);
                                    await userRef.child(uid).set({
                                      'firstName': widget.firstName,
                                      'lastName': widget.lastName,
                                      'email': widget.emailAddress,
                                      'mobileNumber': widget.mobileNumber,
                                      'password': widget.password,
                                      'instituteType':
                                          controller.instituteType.value,
                                      'instituteName': instituteName,
                                      'instituteLocation': instituteLocation,
                                    });
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HomePage();
                                    }));
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      const SnackBar(
                                          content: Text(
                                              'The password provided is too weak.'));
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      const SnackBar(
                                          content: Text(
                                              'The account already exists for that email.'));
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(
                                            color: Color(0xff002aff),
                                            width: 2)),
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
        ],
      ),
    );
  }
}
