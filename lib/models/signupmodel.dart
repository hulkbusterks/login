class SignUpMode{
  String uid;
  String firstName;
  String lastName;
  String email;
  String password;
  String confirmPassword;
  String instituteType;
  String instituteName;
  String instituteLocation;
  SignUpMode({required this.uid,required this.firstName,required this.lastName,required this.email,required this.password,required this.confirmPassword,required this.instituteType,required this.instituteName,required this.instituteLocation});

  static SignUpMode fromMap(Map<String, dynamic> map) {
  return SignUpMode(
    uid: map['uid'],
    firstName: map['firstName'],
    lastName: map['lastName'],
    email: map['email'],
    password: map['password'],
    confirmPassword: map['confirmPassword'],
    instituteType: map['instituteType'],
    instituteName: map['instituteName'],
    instituteLocation: map['instituteLocation'],
  );
}
}