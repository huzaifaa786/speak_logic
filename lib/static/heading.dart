import 'package:books/values/colors.dart';
import 'package:flutter/material.dart';

class Headingcontainer extends StatelessWidget {
  const Headingcontainer({
    Key? key,
    this.controller,
    this.text,
  }) : super(key: key);

  final controller;
  final text;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(right: 20, left: 20),
        decoration: BoxDecoration(color: mainColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.w700, color: white),
            ),
            Divider(),
            SizedBox(height: 2,),
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: white.withOpacity(0.8),
                border: Border.all(color: borderGreen, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
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
                          hintStyle: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400),
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
            ),
            // SizedBox(height: 20,),
          ],
        ));
  }
}
