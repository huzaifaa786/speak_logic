import 'package:books/screens/Announcements/Announcements.dart';
import 'package:books/screens/Books/mybook.dart';
import 'package:books/screens/Question/question.dart';
import 'package:books/screens/contactus/contactus.dart';
import 'package:books/screens/forum/forum.dart';
import 'package:books/screens/software/software.dart';
import 'package:books/screens/video/video.dart';
import 'package:books/values/colors.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 50, left: 20),
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
                  padding: const EdgeInsets.only(left: 50),
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
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuestionScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.question_mark_outlined),
                      Text(' Questions'),
                    ],
                  ),
                  Icon(Icons.keyboard_arrow_right_outlined),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForumScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoScreen()));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.play_circle_outlined),
                        Text(' Videos'),
                      ],
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ForumScreen()));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.chat_outlined),
                      Text(' Forum'),
                    ],
                  ),
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.phone_android),
                      Text(' Contact us'),
                    ],
                  ),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SoftwareScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.computer_sharp),
                      Text(' Software'),
                    ],
                  ),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.question_mark_outlined),
                    Text(' Support'),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: GestureDetector(onTap:  () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Announcements()));
                          },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle_notifications_outlined),
                      Text(' Announcements'),
                    ],
                  ),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: GestureDetector(onTap:  () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyBook()));
                          },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.question_mark_outlined),
                      Text(' My books'),
                    ],
                  ),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(' Speak Logic Gears'),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.logout,
                    ),
                    Text(' Log out'),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
