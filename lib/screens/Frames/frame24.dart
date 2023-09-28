import 'package:books/values/colors.dart';
import 'package:flutter/material.dart';

class Frame24Screen extends StatefulWidget {
  const Frame24Screen({super.key});

  @override
  State<Frame24Screen> createState() => _Frame24ScreenState();
}

class _Frame24ScreenState extends State<Frame24Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 198,
            width: MediaQuery.of(context).size.width * 1,
            color: mainColor,
            child: Row(
              children: [
                Icon(
                  Icons.cancel,
                ),
                Container(
                  height: 145,
                  width: 147,
                  color: white,
                  child: Image.asset(
                    'assets/images/Group.svg',
                    
                  ),
                ),
              ],
            ),
          )
        ]),
      )),
    );
  }
}
