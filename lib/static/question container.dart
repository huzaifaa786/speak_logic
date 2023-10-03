import 'package:books/values/colors.dart';
import 'package:flutter/material.dart';

class Questioncontainer extends StatelessWidget {
  const Questioncontainer ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: questioncontainercolor,   borderRadius: BorderRadius.all(Radius.circular(5)),),
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'What is speak logic project ?',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            Icon(
              Icons.add,
              color: mainColor,
            )
          ],
        ),
      ),
    );
  }
}
