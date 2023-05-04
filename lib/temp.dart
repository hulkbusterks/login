// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import '../../../components/already_have_an_account_acheck.dart';
// import '../../../constants.dart';
// import '../../Signup/signup_screen.dart';
// import '../../home/home.dart';

// class LoginForm extends StatelessWidget {
//   const LoginForm({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String emailAddress = '';
//     String password = '';
//     return Form(
//       child: Column(
//         children: [
//           TextFormField(
//             keyboardType: TextInputType.emailAddress,
//             textInputAction: TextInputAction.next,
//             cursorColor: kPrimaryColor,
//             onChanged: (email) {
//               emailAddress = email;
//             },
//             decoration: InputDecoration(
//               hintText: "Your email",
//               prefixIcon: Padding(
//                 padding: const EdgeInsets.all(defaultPadding),
//                 child: Icon(Icons.person),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: defaultPadding),
//             child: TextFormField(
//               textInputAction: TextInputAction.done,
//               obscureText: true,
//               cursorColor: kPrimaryColor,
//               decoration: InputDecoration(
//                 hintText: "Your password",
//                 prefixIcon: Padding(
//                   padding: const EdgeInsets.all(defaultPadding),
//                   child: Icon(Icons.lock),
//                 ),
//               ),
//               onChanged: (pass) {
//                 password = pass;
//               },
//             ),
//           ),
//           const SizedBox(height: defaultPadding),
//           Hero(
//             tag: "login_btn",
//             child: ElevatedButton(
//               onPressed: () async {
//                 try {
//                   final credential = await FirebaseAuth.instance
//                       .signInWithEmailAndPassword(
//                           email: emailAddress, password: password);
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     return HomePage();
//                   }));
//                 } on FirebaseAuthException catch (e) {
//                   if (e.code == 'user-not-found') {
//                     print('No user found for that email.');
//                   } else if (e.code == 'wrong-password') {
//                     print('Wrong password provided for that user.');
//                   }
//                 }
//               },
//               child: Text(
//                 "Login".toUpperCase(),
//               ),
//             ),
//           ),
//           const SizedBox(height: defaultPadding),
//           AlreadyHaveAnAccountCheck(
//             press: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) {
//                     return SignUpScreen();
//                   },
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
