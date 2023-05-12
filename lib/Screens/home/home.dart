import 'package:flutter/material.dart';
import 'sideBarMenu.dart';
import 'homePageAppBar.dart';
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SideBarMenu(),
      backgroundColor: const Color(0xffffffff),
      body: Column(children: [
        HomePageAppBar(
        )
      ]),
    );
  }
}