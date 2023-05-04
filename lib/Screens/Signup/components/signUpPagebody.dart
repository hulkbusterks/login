import 'package:flutter/material.dart';
import 'nextpage.dart';
import 'package:google_fonts/google_fonts.dart';


class SignUpPageBody extends StatelessWidget {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String emailAddress = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width * 0.35,
          color: Colors.amber,
        ),
        SingleChildScrollView(
          child: Container(
            width: size.width * 0.65,
            child: Center(
              child: Container(
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
              ),
            ),
          ),
        ),
      ],
    );
  }
}

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
          style: GoogleFonts.getFont("Ramabhadra",fontSize: 15,fontWeight: FontWeight.bold),
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
                hintStyle: TextStyle(fontSize: 14,color: Color.fromARGB(255, 195, 195, 195))
              )),
        )
      ]),
    );
  }
}
