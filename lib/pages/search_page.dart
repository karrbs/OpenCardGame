import 'package:flutter/material.dart';
import 'package:ocg/widgets/bottom_nav_bar_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();

  String? _input;

  _clearSearch() {
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _searchController.clear());
    setState(() {
      _input = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15.0),
            border: InputBorder.none,
            hintText: 'Search',
            prefixIcon: Icon(
              Icons.search,
              size: 30.0,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
              ),
              onPressed: _clearSearch,
            ),
            filled: true,
          ),
          onSubmitted: (input) {
            if (input.isNotEmpty) {
              setState(() {
                // _users = DatabaseService.searchUsers(input);
                _input = input;
              });
            }
          },
        ),
        // bottom: const TabBar(
        //   labelColor: Colors.black45,
        //   tabs: <Widget>[
        //     Tab(
        //       icon: Icon(Icons.account_circle),
        //     ),
        //     Tab(
        //       icon: Icon(Icons.dock_outlined),
        //     ),
        //   ],
        // ),
      ),
      body: Row(
        children: [Text('test')],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
