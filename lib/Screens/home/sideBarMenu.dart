import 'package:flutter/material.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.only(bottom: 20),
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 20),
          title: Center(child: const Text('SignIn/SignUp')),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 20),
          title: Center(child: const Text('Settings')),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 20),
          title: Center(child: const Text('About Our Team')),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ));
  }
}
