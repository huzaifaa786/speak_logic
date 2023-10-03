// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use, prefer_const_constructors

import 'package:books/values/colors.dart';
import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  const Button(
      {Key? key,
      @required this.title,
      @required this.onPressed,
      this.textcolor,
      this.icon,
      this.buttonWidth = 0.4,
    
      this.rounded = false,
      this.color = mainColor})
      : super(key: key);

  final title;
  final onPressed;

  final color;
  final textcolor;
  final icon;
  final rounded;
  final buttonWidth;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
        width: MediaQuery.of(context).size.width * buttonWidth,
          height: MediaQuery.of(context).size.width * 0.11,
       
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: textcolor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
