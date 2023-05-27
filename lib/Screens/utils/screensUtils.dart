import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/utils/loginSignUpComponents.dart';

Map fieldValidations = {
  'firstName': (value) {
    if (value!.isEmpty) {
      return 'First Name is required.';
    } else if (!Validations.validateName(value)) {
      return "Name must be more than 2 charater";
    }
    return null;
  },
  'lastName': (value) {
    if (value!.isEmpty) {
      return 'Last Name is required.';
    } else if (!Validations.validateName(value)) {
      return "Name must be more than 2 charater";
    }
    return null;
  },
  'mobileNumber': (value) {
    if (value!.isEmpty) {
      return 'Mobile Number is required.';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Mobile number must contain only digits.';
    } else if (!Validations.validateMobile(value)) {
      return "Enter a valid mobile number";
    }
    return null;
  },
  'email': (value) {
    if (value!.isEmpty) {
      return 'Email is required.';
    } else if (!Validations.isEmail(value)) {
      return "Enter a valid email";
    }
    return null;
  },
  'password': (value) {
    if (value!.isEmpty) {
      return 'password is required.';
    } else if (!Validations.validatePassword(value)) {
      return 'Please enter a valid password';
    }
    return null;
  },
  
};
