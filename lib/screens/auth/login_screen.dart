// ignore_for_file: prefer_const_constructors

import 'package:books/screens/auth/register.dart';
import 'package:books/screens/home/home_screen.dart';
import 'package:books/values/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.only(bottom: 15),
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor,
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/Artboard 1.png',
                    width: MediaQuery.of(context).size.width * 0.85,
                  ))),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.57,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                border: Border.all(
                  color: mainColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: white,
                boxShadow: [
                  BoxShadow(
                      color: shadowColor,
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 2)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 15),
                                prefixIcon:
                                    Image.asset('assets/images/person.png'),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: mainColor)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: mainColor)),
                                hintText: 'Enter a valid email address',
                                hintStyle: TextStyle(
                                    color: hintColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 15),
                                prefixIcon:
                                    Image.asset('assets/images/lock.png'),
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
                        SizedBox(height: 5),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: hintText),
                          ),
                        ),
                        SizedBox(height: 17),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          child: Container(
                            height: 50,
                            width: 110,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Icon(
                                    Icons.arrow_circle_right,
                                    color: white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 17),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Dont have an account',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterScreen()));
                              },
                              child: Text('  SIGN UP',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: mainColor)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Or Continue with',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/fbicon.png'),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Image.asset('assets/images/twtricon.png'),
                            ),
                            Image.asset('assets/images/googleicon.png')
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
