import 'package:flutter/material.dart';
import 'sideBarMenu.dart';
import 'homePageAppBar.dart';
class HomePage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SideBarMenu(),
      backgroundColor: const Color(0xffffffff),
      body: Column(children: [
        HomePageAppBar(
          scaffoldKey: _scaffoldKey,
        )
      ]),
    );
  }
}