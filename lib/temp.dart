// Row(
//           children: [
//             Expanded(
//               flex: 2,
//               child: Center(child: Text("Let see")),
//             ),
//             Expanded(
//               flex: 4,
//               child: Center(
//                 child: SizedBox(
//                   width: 410,
//                   child: Form(
//                     key: _formKey,
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             height: 140,
//                             child: Column(children: [
//                               Text(
//                                 "Sign Up to buyBuddy",
//                                 style: GoogleFonts.getFont("Ramabhadra",
//                                     fontSize: 24,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                               const SizedBox(
//                                 height: 15,
//                               ),
//                               GoogleConnect(isLogin: false)
//                             ]),
//                           ),
//                           // Or element
//                           Row(
//                               mainAxisAlignment:
//                                   MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                   width: 180,
//                                   height: 1,
//                                   color: const Color.fromARGB(
//                                       255, 197, 197, 197),
//                                   padding: const EdgeInsets.only(bottom: 5),
//                                 ),
//                                 const Text(
//                                   "Or",
//                                   style: TextStyle(
//                                       color:
//                                           Color.fromARGB(255, 142, 142, 142)),
//                                 ),
//                                 Container(
//                                   width: 180,
//                                   height: 1,
//                                   color: const Color.fromARGB(
//                                       255, 197, 197, 197),
//                                   padding: const EdgeInsets.only(bottom: 5),
//                                 )
//                               ]),
//                           Row(
//                             children: [
//                               CustomTextField(
//                                   controller: firstNameController,
//                                   width: 200,
//                                   FieldName: "First Name",
//                                   isObscure: false,
//                                   keyboardType: TextInputType.name,
//                                   textInputAction: TextInputAction.next),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               CustomTextField(
//                                   controller: lastNameController,
//                                   width: 200,
//                                   FieldName: "Last Name",
//                                   isObscure: false,
//                                   keyboardType: TextInputType.name,
//                                   textInputAction: TextInputAction.next),
//                             ],
//                           ),
//                           CustomTextField(
//                               controller: mobileNumberController,
//                               width: 410,
//                               FieldName: "Mobile Number",
//                               isObscure: false,
//                               keyboardType: TextInputType.number,
//                               textInputAction: TextInputAction.next),
//                           Column(
//                             // crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: <Widget>[
//                               CustomTextField(
//                                 controller: emailController,
//                                 width: 410,
//                                 FieldName: "Email",
//                                 isObscure: false,
//                                 keyboardType: TextInputType.emailAddress,
//                                 textInputAction: TextInputAction.next,
//                               ),
//                               CustomTextField(
//                                 controller: passwordController,
//                                 width: 410,
//                                 FieldName: "Password",
//                                 isObscure: true,
//                                 keyboardType: TextInputType.visiblePassword,
//                                 textInputAction: TextInputAction.done,
//                                 hintText: "6+ characters",
//                               ),
//                               CustomTextField(
//                                 width: 410,
//                                 controller: confirmPasswordController,
//                                 FieldName: "Confirm Password",
//                                 isObscure: true,
//                                 keyboardType: TextInputType.visiblePassword,
//                                 textInputAction: TextInputAction.done,
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           SizedBox(
//                             width: 80,
//                             height: 40,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 var firstName =
//                                     firstNameController.text.trim();
//                                 var lastName = lastNameController.text.trim();
//                                 var mobileNumber =
//                                     mobileNumberController.text.trim();
//                                 var email = emailController.text.trim();
//                                 var password = passwordController.text.trim();
//                                 var confirmPass =
//                                     confirmPasswordController.text.trim();
//                                 if (firstName.isEmpty ||
//                                     lastName.isEmpty ||
//                                     mobileNumber.isEmpty ||
//                                     email.isEmpty ||
//                                     password.isEmpty ||
//                                     confirmPass.isEmpty) {
//                                   // show error toast

//                                   Fluttertoast.showToast(
//                                       msg: 'Please fill all fields');
//                                   return;
//                                 }

//                                 if (password.length < 6) {
//                                   // show error toast
//                                   Fluttertoast.showToast(
//                                       msg:
//                                           'Weak Password, at least 6 characters are required');

//                                   return;
//                                 }

//                                 if (password != confirmPass) {
//                                   // show error toast
//                                   Fluttertoast.showToast(
//                                       msg: 'Passwords do not match');

//                                   return;
//                                 }

//                                 // request to firebase auth

//                                 ProgressDialog progressDialog =
//                                     ProgressDialog(
//                                   context,
//                                   title:
//                                       const Text('Now Add few more details'),
//                                   message: const Text('Please wait'),
//                                 );

//                                 progressDialog.show();
//                                 Navigator.of(context).push(
//                                   MaterialPageRoute(
//                                     builder: (context) =>
//                                         NextPageOfSignUpPage(
//                                       emailAddress: email,
//                                       password: password,
//                                       firstName: firstName,
//                                       lastName: lastName,
//                                       mobileNumber: mobileNumber,
//                                     ),
//                                   ),
//                                 );
//                               },
//                               style: ElevatedButton.styleFrom(
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                       side: const BorderSide(
//                                           color: Color(0xff002aff),
//                                           width: 2)),
//                                   padding: const EdgeInsets.all(8),
//                                   backgroundColor: Colors.white,
//                                   shadowColor: Colors.white),
//                               child: const Text(
//                                 "Next",
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 100,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
      