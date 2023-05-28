import 'package:flutter/material.dart';
import 'package:flutter_auth/responsive.dart';

import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';
import 'package:flutter_auth/Screens/utils/loginSignUpAppBar.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("On login Sceen");
    return Scaffold(
      body: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileLoginScreen(),
          desktop: Column(
            children: [
              LoginSignUpAppBar(isLogin: true),
              Row(
                children: [
                  const Expanded(
                    child: LoginScreenTopImage(),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoginForm()
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreenTopImage(),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
