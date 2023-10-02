import 'package:books/values/colors.dart';

import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
    this.controller,
    this.icon,
  }) : super(key: key);

  final controller;
  final icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(right: 20, left: 20),
      decoration: BoxDecoration(color: mainColor),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Search Here',
                  border: InputBorder.none,
                  hintStyle:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  contentPadding: EdgeInsets.only(left: 20),
                ),
              ),
            ),
          ),
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Perform the action when the button is pressed
                String searchText = controller.text;
                print('Search: $searchText');
              },
            ),
          ),
        ],
      ),
    );
  }
}
