// import 'package:flutter/material.dart';

// Future<Widget> editForm() async{
//   return SingleChildScrollView(
//             child: Column(children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CustomTextField(
//                       FieldName: "First Name",
//                       width: 240,
//                       controller: _firstNameController,
//                       isObscure: false,
//                       keyboardType: TextInputType.name,
//                       textInputAction: TextInputAction.next,
//                       validator: fieldValidations['firstName']),
//                       SizedBox(width: 20,),
//                   CustomTextField(
//                       FieldName: "Last Name",
//                       width: 240,
//                       controller: _lastNameController,
//                       isObscure: false,
//                       keyboardType: TextInputType.name,
//                       textInputAction: TextInputAction.next,
//                       validator: fieldValidations['lastName']),
//                 ],
//               ),
//               CustomTextField(
//                   FieldName: "Email",
//                   width: 500,
//                   controller: _emailController,
//                   isObscure: false,
//                   keyboardType: TextInputType.name,
//                   textInputAction: TextInputAction.next,
//                   validator: fieldValidations['email']),
//               CustomTextField(
//                   FieldName: "Mobile Number",
//                   width: 500,
//                   controller: _mobileNumberController,
//                   isObscure: false,
//                   keyboardType: TextInputType.name,
//                   textInputAction: TextInputAction.next,
//                   validator: fieldValidations['mobileNumber']),
//               CustomTextField(
//                   FieldName: "Institute Type",
//                   width: 500,
//                   controller: _instituteTypeController,
//                   isObscure: false,
//                   keyboardType: TextInputType.name,
//                   textInputAction: TextInputAction.next,
//                   validator: fieldValidations['name']),
//               CustomTextField(
//                   FieldName: "Institute Name",
//                   width: 500,
//                   controller: _instituteNameController,
//                   isObscure: false,
//                   keyboardType: TextInputType.name,
//                   textInputAction: TextInputAction.next,
//                   validator: fieldValidations['name']),
//               CustomTextField(
//                   FieldName: "Institute Location",
//                   width: 500,
//                   controller: _instituteLocationController,
//                   isObscure: false,
//                   keyboardType: TextInputType.name,
//                   textInputAction: TextInputAction.next,
//                   validator: fieldValidations['name']),
//               CustomTextField(
//                   FieldName: "Languages",
//                   width: 500,
//                   controller: _languageController,
//                   isObscure: false,
//                   keyboardType: TextInputType.name,
//                   textInputAction: TextInputAction.next,
//                   validator: fieldValidations['name']),
//               SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   SizedBox(
//                     height: 35,
//                     width: 100,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Save the changes and close the dialog
//                         Navigator.of(context).pop({
//                           'firstName': _firstNameController.text,
//                           'lastName': _lastNameController.text,
//                           'email': _emailController.text,
//                           'mobileNumber': _mobileNumberController.text,
//                           'instituteName': _instituteNameController.text,
//                           'instituteType': _instituteTypeController.text,
//                           'language': _languageController.text,
//                           'instituteLocation':
//                               _instituteLocationController.text,
//                         });
//                       },
//                       child: Text('Save'),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   )
//                 ],
//               ),
//             ]),
//           );
        
// }