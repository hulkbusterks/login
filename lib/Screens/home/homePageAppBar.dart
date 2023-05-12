import 'package:flutter/material.dart';
import 'textFieldContainer.dart';

class HomePageAppBar extends StatelessWidget{
  HomePageAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black, width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: const Text(
                "BuyBuddy",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  customButton(Icons.home, "HOME"),
                  const SizedBox(
                    width: 10,
                  ),
                  customButton(Icons.shopping_cart, "CART"),
                  const SizedBox(
                    width: 10,
                  ),
                  const SearchBar(),
                  const SizedBox(
                    width: 10,
                  ),
                  customButton(Icons.category, "FILTER"),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: const Icon(Icons.menu, color: Colors.black))
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
            Text(text, style: const TextStyle(color: Colors.black))
          ],
        ));
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        decoration: const InputDecoration(
            border: InputBorder.none,
            icon: Icon(
              Icons.search,
              color: Color(0xffa9a9a9),
            ),
            contentPadding: EdgeInsets.only(bottom: 12),
            hintText: 'Search'),
      ),
    );
  }
}
