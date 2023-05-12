import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/utils/loginSignUpComponents.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  late String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
  decoration: InputDecoration(
  
    labelText: 'Email',
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  validator: (value) {
    if (value!.isEmpty) {
      return 'Email is required.';
    } else if (!Validations.isEmail(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  },
),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Do something with the form data
    }
  }
}
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_auth/controllers/userIdController.dart';
// import 'package:get/get.dart';
// import '../../home/home.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_auth/Screens/utils/customField.dart';
// import 'package:flutter_auth/Screens/utils/loginSignUpComponents.dart';

// class LoginForm extends StatelessWidget {
//   LoginForm({
//     Key? key,
//   }) : super(key: key);
//   final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
//   UserIdController userIdController = Get.put(UserIdController());

//   @override
//   Widget build(BuildContext context) {
//     BuildContext SnackContext=context;
//     var emailController = TextEditingController();
//     var passwordController = TextEditingController();
//     return Container(
//       width: 410,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//                 height: 140,
//                 child: Column(children: [
//                   Text(
//                     "Sign In to buyBuddy",
//                     style: GoogleFonts.getFont("Ramabhadra",
//                         fontSize: 24, fontWeight: FontWeight.w700),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   GoogleConnect(isLogin: true)
//                 ]),
//               ),
//               // Or element
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                 Container(
//                   width: 180,
//                   height: 1,
//                   color: const Color.fromARGB(255, 197, 197, 197),
//                   padding: const EdgeInsets.only(bottom: 5),
//                 ),
//                 const Text(
//                   "Or",
//                   style: TextStyle(color: Color.fromARGB(255, 142, 142, 142)),
//                 ),
//                 Container(
//                   width: 180,
//                   height: 1,
//                   color: const Color.fromARGB(255, 197, 197, 197),
//                   padding: const EdgeInsets.only(bottom: 5),
//                 )
//               ]),
              
//           Form(
//             key: _formKey,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Column(
//                     children: <Widget>[
//                       CustomTextField(
//                         errorText: "Enter a ",
//                         controller: emailController,
//                         width: 410,
//                         validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Email is required.';
//                     } else if (Validations.isEmail(value)) {
//                       return 'Please enter a valid email address.';
//                     }
//                     return null;
//                   },
//                         FieldName: "Email",
//                         isObscure: false,
//                         keyboardType: TextInputType.emailAddress,
//                         textInputAction: TextInputAction.next,
//                       ),
//                       CustomTextField(
//                         errorText: "Incorrect Password",
//                         controller: passwordController,
//                         width: 410,
//                         FieldName: "Password",
//                         validator: (input) {
//                           Validations.validatePassword(input!);
//                           return null;
//                         },
//                         isObscure: true,
//                         keyboardType: TextInputType.visiblePassword,
//                         textInputAction: TextInputAction.done,
//                       ),
//                     ],
//                   ),
                  
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                     width: 80,
//                     height: 40,
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         try {
//                           final credential = await FirebaseAuth.instance
//                               .signInWithEmailAndPassword(
//                                   email: emailController.text.trim(),
//                                   password: passwordController.text.trim());
//                           userIdController.setUserId(credential.user!.uid);
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) {
//                             return HomePage();
//                           }));
//                         } on FirebaseAuthException catch (e) {
//                           if (e.code == 'user-not-found') {
//                             customSnackBar(SnackContext, "No user found for that email.");
//                           } else if (e.code == 'wrong-password') {
//                             customSnackBar(SnackContext, "Wrong password provided for that user.");
//                           }
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               side: const BorderSide(
//                                   color: Color(0xff002aff), width: 2)),
//                           padding: const EdgeInsets.all(8),
//                           backgroundColor: Colors.white,
//                           shadowColor: Colors.white),
//                       child: const Text(
//                         "Login",
//                         style: TextStyle(
//                             color: Colors.black, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 100,
//                   )
//         ],
//       ),
//     );
//   }
// }
