import 'package:flutter/material.dart';
import 'package:flutter_auth/responsive.dart';
import 'components/sign_up_top_image.dart';
import 'components/signUpPagebody.dart';
import 'package:flutter_auth/Screens/utils/loginSignUpAppBar.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Responsive(
        mobile: const MobileSignupScreen(),
        desktop: SignUpPageBody(),
      ),
    );
  }
}


class MobileSignupScreen extends StatelessWidget {
  const MobileSignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SignUpScreenTopImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: SignUpPageBody(),
            ),
            Spacer(),
          ],
        ),
        // const SocalSignUp()
      ],
    );
  }
}
