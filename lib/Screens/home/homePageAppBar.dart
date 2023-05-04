import 'package:flutter/material.dart';
import 'textFieldContainer.dart';
class HomePageAppBar extends StatelessWidget with PreferredSizeWidget {
  HomePageAppBar({Key? key, required this.scaffoldKey}) : super(key: key);
  final scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black, width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "BuyBuddy",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  customButton(Icons.home, "HOME"),
                  SizedBox(
                    width: 10,
                  ),
                  customButton(Icons.shopping_cart, "CART"),
                  SizedBox(
                    width: 10,
                  ),
                  SearchBar(),
                  SizedBox(
                    width: 10,
                  ),
                  customButton(Icons.category, "FILTER"),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: Icon(Icons.menu, color: Colors.black))
                ],
              ),
            )
          ],
        ));
  }

  Widget customButton(IconData icon, String text) {
    return TextButton(
        style: TextButton.styleFrom(elevation: 0),
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            Text(text, style: TextStyle(color: Colors.black))
          ],
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(
              Icons.search,
              color: Color(0xffa9a9a9),
            ),
            contentPadding: EdgeInsets.only(bottom: 8),
            hintText: 'Search'),
      ),
    );
  }
}
