import 'package:books/values/colors.dart';
import 'package:flutter/material.dart';

class Announcementhead extends StatelessWidget {
  const Announcementhead({
    Key? key,
    this.controller,
    this.text,
  }) : super(key: key);

  final controller;
  final text;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.16,
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
            SizedBox(
              height: 2,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad',
              maxLines: 3,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            )

            // SizedBox(height: 20,),
          ],
        ));
  }
}
