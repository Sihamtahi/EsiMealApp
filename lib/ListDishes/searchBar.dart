import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchBar(),
    );
  }
}


class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:8.0,left:8.0,top: 20.0),
      child: Material(
        color: Colors.white,
        elevation: 5.0,
        borderRadius: BorderRadius.circular(50.0),
        child: TextField(
          cursorColor: Colors.grey[700],
          cursorWidth: 1.0,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              hintText: "Search for any dish...",
              border: InputBorder.none,
              suffixIcon: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(50.0),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              )),
        ),
      ),
    );

  }
}
