import 'package:books/static/button.dart';
import 'package:books/values/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BookBox extends StatelessWidget {
  const BookBox(
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
      height: MediaQuery.of(context).size.height * 0.16,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          Text(
            'It is impossible to learn proper communication without being aware of the principle of communication. That is why it is important to learn the principle of communication',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 12,
          ),
          Button(
            title: 'View more',
            onPressed: () {},
            textcolor: white,
          )
        ],
      ),
    );
  }
}
