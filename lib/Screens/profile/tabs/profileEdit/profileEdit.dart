/// profile edit make user able to edit profile which is a showdialog box.
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/utils/btnDesigns.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_auth/Screens/utils/customField.dart';
import 'package:flutter_auth/Screens/utils/screensUtils.dart';
import 'package:get/get.dart';
import 'package:flutter_auth/controllers/controllers.dart';
class EditProfileDialog extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String mobileNumber;
  final String instituteName;
  final String language;
  final String instituteLocation;

  EditProfileDialog({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
    required this.instituteName,
    required this.language,
    required this.instituteLocation,
  }) : super(key: key);

  @override
  _EditProfileDialogState createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _mobileNumberController;
  late TextEditingController _instituteNameController;
  late TextEditingController _instituteTypeController;
  late TextEditingController _languageController;
  late TextEditingController _instituteLocationController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.firstName);
    _lastNameController = TextEditingController(text: widget.lastName);

    _emailController = TextEditingController(text: widget.email);
    _mobileNumberController = TextEditingController(text: widget.mobileNumber);
    _instituteNameController =
        TextEditingController(text: widget.instituteName);
    _languageController = TextEditingController(text: widget.language);
    _instituteLocationController =
        TextEditingController(text: widget.instituteLocation);
  }
    Controller controller = Get.put(Controller());


  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _mobileNumberController.dispose();
    _instituteNameController.dispose();
    _languageController.dispose();
    _instituteLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: EdgeInsets.only(top: 10),
      title: Center(
        child: Text(
          'Edit Personal Information',
          style: GoogleFonts.getFont("Nunito"),
        ),
      ),
      children: [
        Container(
            width: 600,
            height: 450,
            child: FutureBuilder(
              future: EditForm(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    !snapshot.hasError) {
                  final data = snapshot.data as Widget;
                  if (data == null) {
                    return Container(
                      child: const Text('Empty loaded'),
                    );
                  } else {
                    return data;
                  }
                } else if (snapshot.hasError) {
                  return Text(
                    "The error ${snapshot.error} has occurred",
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 35,
              width: 100,
              child: ElevatedButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: CustomElevatedBtnStyle(),

              ),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 35,
              width: 100,
              child: ElevatedButton(
                style: CustomElevatedBtnStyle(),
                onPressed: () {
                  // Save the changes and close the dialog
                  Navigator.of(context).pop({
                    'firstName': _firstNameController.text,
                    'lastName': _lastNameController.text,
                    'email': _emailController.text,
                    'mobileNumber': _mobileNumberController.text,
                    'instituteName': _instituteNameController.text,
                    'instituteType': _instituteTypeController.text,
                    'language': _languageController.text,
                    'instituteLocation': _instituteLocationController.text,
                  });
                },
                child: Text('Save'),
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        )
      ],
    );
  }

  Future<Widget> EditForm() async {
    return SingleChildScrollView(
        child: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
                      FieldName: "First Name",
                      width: 240,
                      controller: _firstNameController,
                      isObscure: false,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: fieldValidations['firstName']),
                      SizedBox(width: 20,),
                  CustomTextField(
                      FieldName: "Last Name",
                      width: 240,
                      controller: _lastNameController,
                      isObscure: false,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: fieldValidations['lastName']),
                ],
              ),
              CustomTextField(
                  FieldName: "Email",
                  width: 500,
                  controller: _emailController,
                  isObscure: false,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: fieldValidations['email']),
              CustomTextField(
                  FieldName: "Mobile Number",
                  width: 500,
                  controller: _mobileNumberController,
                  isObscure: false,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: fieldValidations['mobileNumber']),
             Container(
          width: 500,
          child: Row(children: [
            Row(
              children: [
                Obx(
                  () {
                    return Radio(
                      value: 'school',
                      groupValue: controller.instituteType.value,
                      onChanged: (value) {
                        controller.setInstituteType(value as String);
                      },
                    );
                  },
                ),
                const Text(
                  'School',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Row(
              children: [
                Obx(
                  () {
                    return Radio(
                      value: 'college',
                      groupValue: controller.instituteType.value,
                      onChanged: (value) {
                        controller.setInstituteType(value as String);
                      },
                    );
                  },
                ),
                const Text(
                  'College',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ]),
        ),
        SizedBox(
          height: 20,
        ),
              CustomTextField(
                  FieldName: "Institute Name",
                  width: 500,
                  controller: _instituteNameController,
                  isObscure: false,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: fieldValidations['name']),
              CustomTextField(
                  FieldName: "Institute Location",
                  width: 500,
                  controller: _instituteLocationController,
                  isObscure: false,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: fieldValidations['name']),
              CustomTextField(
                  FieldName: "Languages",
                  width: 500,
                  controller: _languageController,
                  isObscure: false,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: fieldValidations['name']),
      SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 35,
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                // Save the changes and close the dialog
                Navigator.of(context).pop({
                  'firstName': _firstNameController.text,
                  'lastName': _lastNameController.text,
                  'email': _emailController.text,
                  'mobileNumber': _mobileNumberController.text,
                  'instituteName': _instituteNameController.text,
                  'instituteType': _instituteTypeController.text,
                  'language': _languageController.text,
                  'instituteLocation': _instituteLocationController.text,
                });
              },
              child: Text('Save'),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    ]));
  }
}
