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
            padding: EdgeInsets.only(top: 40, left: 35),
            height: 198,
            width: MediaQuery.of(context).size.width * 1,
            color: mainColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.cancel,
                    color: white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 65),
                  child: Column(
                    children: [
                      Container(
                        color: mainColor,
                        child: Stack(children: [
                          Image.asset(
                            'assets/images/Group.png',
                            height: 96,
                            width: 98,
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Image.asset(
                              'assets/images/material-symbols_edit-sharp.png',
                              height: 35,
                              width: 35,
                            ),
                          ),
                        ]),
                      ),
                      Text(
                        'User name',
                        style: TextStyle(color: white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.question_mark_outlined),
                    Text('Questions'),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right_outlined),
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.play_circle_outlined),
                    Text('Videos'),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.chat_outlined),
                    Text('Forum'),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.phone_android),
                    Text('Contact us'),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.computer_sharp),
                    Text('Software'),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.question_mark_outlined),
                    Text('Support'),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.question_mark_outlined),
                    Text('Questions'),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.question_mark_outlined),
                    Text('Questions'),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.question_mark_outlined),
                    Text('Questions'),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ), Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.question_mark_outlined),
                    Text('Questions'),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          )
        ]),
      )),
    );
  }
}
