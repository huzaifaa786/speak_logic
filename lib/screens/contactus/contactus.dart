import 'package:books/screens/utils/drawer/drawer.dart';
import 'package:books/static/button.dart';
import 'package:books/static/heading.dart';
import 'package:books/values/colors.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: Drawer(
          child: SideDrawer(),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Headingcontainer(
                text: 'Contact us',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3, left: 1),
                          child: Text(
                            'Name',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Container(
                          width: 143,
                          height: 43,
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: mainColor,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: mainColor,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3, left: 1),
                          child: Text('Email',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                        ),
                        Container(
                          width: 155,
                          height: 43,
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: mainColor,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: mainColor,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 3, left: 26, top: 7),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Subject',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Container(
                  height: 43,
                  child: TextField(
                    controller: subjectController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: mainColor,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: mainColor,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Name',
                        hintStyle: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 3, left: 26, top: 7),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Message',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Container(
                  height: 150,
                  child: TextField(
                    expands: true,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    controller: messageController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: mainColor,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: mainColor,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.only(bottom: 50, left: 10),
                        hintText: 'Message',
                        hintStyle: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 15,),
                child: Button(title: 'Send', onPressed: (){},buttonWidth: 0.3,textcolor: white,),
              ),
              Image.asset('assets/images/Frame 81.png',height: 229,)
            ],
          ),
        )));
  }
}
