import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => CustomBottomNavBarState();
}

class CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/create');
              },
              tooltip: 'Create Game',
              icon: const Icon(
                (Icons.add),
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
              tooltip: 'Search Game',
              icon: const Icon(
                (Icons.search),
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/play');
              },
              tooltip: 'Play Game',
              icon: const Icon(
                (Icons.play_arrow_rounded),
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/account');
              },
              icon: Icon(Icons.account_circle),
            ),
          ),
        ],
      ),
    );
  }
}
