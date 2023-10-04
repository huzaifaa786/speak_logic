// ignore_for_file: prefer_typing_uninitialized_variables, unused_field, unused_element

import 'package:books/screens/problem/problem.dart';
import 'package:books/screens/problem/problemlist.dart';
import 'package:books/screens/solution/soutionlist.dart';
import 'package:books/screens/utils/drawer/drawer.dart';
import 'package:books/screens/Books/books_screen.dart';
import 'package:books/screens/home/main_screen.dart';
import 'package:books/screens/solution/solution.dart';
import 'package:books/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key, this.selectedIndex}) : super(key: key);
  final selectedIndex;

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> with RouteAware {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // final GlobalKey<ChatsFragmentState> chatFragmentState = GlobalKey<ChatsFragmentState>();

  int _navigationMenuIndex = 0;
  bool _isScanning = false;

  void _scanQR() {
    setState(() {
      _isScanning = true;
    });
  }

  switchFragment(int index) {
    setState(() {
      _navigationMenuIndex = index;
    });
  }

  checkForSelectedIndex() {
    if (widget.selectedIndex != null) {
      _navigationMenuIndex = widget.selectedIndex;
    }
  }

  @override
  void initState() {
    checkForSelectedIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _fragments = [
      const MainScreen(),
      const Problemlist(),
      const Solutionlist(),
      const BooksScreen(),
      const MainScreen(),
    ];
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          backgroundColor: Color(4278231372),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
          ),
          drawer: Drawer(
            child:
                SideDrawer(), // Use your custom drawer content widget here
          ),
          body: SafeArea(
            child: _fragments[_navigationMenuIndex],
          ),
          bottomNavigationBar: BottomAppBar(
            height: MediaQuery.of(context).size.height * 0.095,
            color: Color(4278231372),
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Material(
                      color: Color(4278231372),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _navigationMenuIndex = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/home.png', height: 20),
                              Text(
                                'Home',
                                style: TextStyle(
                                  decoration: _navigationMenuIndex == 0
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                  decorationColor: Colors.white,
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: _navigationMenuIndex == 0
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Material(
                      color: Color(4278231372),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _navigationMenuIndex = 1;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/searchInfo.png',
                                  height: 20),
                              Text(
                                'Problems',
                                style: TextStyle(
                                  decoration: _navigationMenuIndex == 1
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                  decorationColor: Colors.white,
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: _navigationMenuIndex == 1
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Material(
                      color: Color(4278231372),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _navigationMenuIndex = 2;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/solution.png',
                                  height: 20),
                              Text(
                                'Solution',
                                style: TextStyle(
                                  decoration: _navigationMenuIndex == 2
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                  decorationColor: white,
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: _navigationMenuIndex == 2
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Material(
                      color: Color(4278231372),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _navigationMenuIndex = 3;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/book.png', height: 20),
                              Text(
                                'Books',
                                style: TextStyle(
                                  decoration: _navigationMenuIndex == 3
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                  fontSize: 12,
                                  decorationColor: white,
                                  color: Colors.white,
                                  fontWeight: _navigationMenuIndex == 3
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Material(
                      color: Color(4278231372),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _navigationMenuIndex = 4;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/apps.png', height: 20),
                              Text(
                                'Apps',
                                style: TextStyle(
                                    decoration: _navigationMenuIndex == 4
                                        ? TextDecoration.underline
                                        : TextDecoration.none,
                                    fontSize: 12,
                                    decorationColor: white,
                                    color: Colors.white,
                                    fontWeight: _navigationMenuIndex == 4
                                        ? FontWeight.bold
                                        : FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
