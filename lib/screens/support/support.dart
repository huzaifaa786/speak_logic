import 'package:books/screens/utils/drawer/drawer.dart';
import 'package:books/static/button.dart';
import 'package:books/static/heading.dart';
import 'package:books/values/colors.dart';
import 'package:flutter/material.dart';
class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
   TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: Drawer(
          child: SideDrawer(),
        ),
        body: SafeArea(child: 
        SingleChildScrollView(
          child: 
          Column(
            children: [
                Headingcontainer(
                text: 'Support',
              ),
               Padding(
                padding: const EdgeInsets.only(bottom: 3, left: 26, top: 17),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Name',
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
              ),

                 Padding(
                padding: const EdgeInsets.only(bottom: 3, left: 26, top: 7),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Email',
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
                        hintText: 'Name',
                        hintStyle: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
              ),

               Padding(
                padding: const EdgeInsets.only(bottom: 3, left: 26, top: 17),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Description',
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
                    controller: descriptionController,
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
                        // hintText: 'Message',
                        // hintStyle: TextStyle(
                        //     fontSize: 13,
                        //     color: Colors.grey,
                        //     fontWeight: FontWeight.w400)
                            ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Button(title: 'Request support', onPressed: (){},buttonWidth: 0.44,textcolor: white,
                ),
              ),
            ],
          ),
        )
        ),
    );
  }
}