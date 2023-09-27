// ignore_for_file: prefer_const_constructors

import 'package:books/values/colors.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passwordVisible = false;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width * 0.85,
                child: Image.asset('assets/images/Artboard 1.png')),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 16, right: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 15),
                          prefixIcon: Image.asset('assets/images/person.png'),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: mainColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: mainColor)),
                          hintText: 'First Name',
                          hintStyle: TextStyle(
                              color: hintColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 15),
                          prefixIcon: Image.asset('assets/images/person.png'),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: mainColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: mainColor)),
                          hintText: 'Last Name',
                          hintStyle: TextStyle(
                              color: hintColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 15),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black45,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: mainColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: mainColor)),
                          hintText: 'Enter Email',
                          hintStyle: TextStyle(
                              color: hintColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 15),
                          prefixIcon: Image.asset('assets/images/lock.png'),
                          suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(
                                () {
                                  passwordVisible = !passwordVisible;
                                },
                              );
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: mainColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: mainColor)),
                          hintText: 'Enter a valid password',
                          hintStyle: TextStyle(
                              color: hintColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.fromLTRB(25, 13, 25, 13),
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  color: white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 17),
                        child: GestureDetector(
                          child: Container(
                            height: 50,
                            padding: EdgeInsets.fromLTRB(35, 13, 35, 13),
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
