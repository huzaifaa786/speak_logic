// ignore_for_file: prefer_typing_uninitialized_variables, unused_field, unused_element

import 'package:books/screens/home/home_screen.dart';
import 'package:books/screens/home/main_screen.dart';
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
    // ignore: no_leading_underscores_for_local_identifiers
    var _fragments = [
      const MainScreen(),
      const HomeScreen(),
      const HomeScreen(),
    ];
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          backgroundColor: Color(4278231372),
          body: SafeArea(
            child: _fragments[_navigationMenuIndex],
          ),
          bottomNavigationBar: BottomAppBar(
            height: MediaQuery.of(context).size.height*0.075,
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
                              // SvgPicture.asset(
                              //   'assets/images/home.svg',
                              //   color: _navigationMenuIndex == 0
                              //       ? Colors.white
                              //       : Colors.white,
                              // ),
                              Icon(
                                Icons.home_filled,
                                color: _navigationMenuIndex == 0
                                    ? Colors.white
                                    : Colors.white,
                              ),
                              Text(
                                'Home',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: _navigationMenuIndex == 0
                                      ? Colors.white
                                      : Colors.white,
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
                              Icon(
                                Icons.home_filled,
                                color: _navigationMenuIndex == 0
                                    ? Colors.white
                                    : Colors.white,
                              ),
                              Text(
                                'Home',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: _navigationMenuIndex == 0
                                      ? Colors.white
                                      : Colors.white,
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
                              Icon(
                                Icons.home_filled,
                                color: _navigationMenuIndex == 0
                                    ? Colors.white
                                    : Colors.white,
                              ),
                              Text(
                                'Home',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: _navigationMenuIndex == 0
                                      ? Colors.white
                                      : Colors.white,
                                ),
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
