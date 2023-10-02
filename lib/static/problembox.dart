import 'package:books/static/button.dart';
import 'package:books/values/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProBox extends StatelessWidget {
  const ProBox(
      {Key? key,
      this.button,
      this.text,
      this.rounded = false,
      this.color = mainColor})
      : super(key: key);

  final color;
  final button;
  final text;
  final rounded;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Color(0xFFffffff),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400]!,
            blurRadius: 8.0, // soften the shadow
            spreadRadius: 1.0, //extend the shadow
            offset: Offset(
              2.0, // Move to right 5  horizontally
              1.0, // Move to bottom 5 Vertically
            ),
          )
        ],
      ),
      height: MediaQuery.of(context).size.height * 0.26,
      width: MediaQuery.of(context).size.width * 0.43,
      padding: EdgeInsets.only(right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.red,fontWeight: FontWeight.w500),
          ),
          Text(
            'It is impossible to learn proper communication without being aware of the principle of communication. That is why it is important to learn the principle of communication',
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 12,
          ),
          Button(title: 'View more', onPressed: () {},textcolor: white,)
        ],
      ),
    );
  }
}