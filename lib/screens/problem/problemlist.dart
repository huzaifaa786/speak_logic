import 'package:books/static/button.dart';
import 'package:books/static/problembox.dart';
import 'package:books/static/search.dart';
import 'package:books/values/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

class Problemlist extends StatefulWidget {
  const Problemlist({super.key});

  @override
  State<Problemlist> createState() => _ProblemlistState();
}

class _ProblemlistState extends State<Problemlist> {
  final List<String> imgList = [
    'https://admin.klickwash.net/assets/img/logo1.png',
    'https://admin.klickwash.net/assets/img/logo1.png',
    'https://admin.klickwash.net/assets/img/logo1.png'
  ];
  int _current = 0;
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(right: 20, left: 20),
              decoration: BoxDecoration(color: mainColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Problem',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: white),
                  ),
                  Divider(),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                      color: white.withOpacity(0.8),
                      border: Border.all(color: borderGreen, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                            ),
                            child: TextField(
                              controller: _textEditingController,
                              decoration: InputDecoration(
                                hintText: 'Search Here',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w400),
                                contentPadding: EdgeInsets.only(left: 20),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                            ),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              // Perform the action when the button is pressed
                              String searchText = _textEditingController.text;
                              print('Search: $searchText');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 20,),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 14, bottom: 12),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            viewportFraction: 1,
                            enlargeCenterPage: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            },
                          ),
                          items: imgList.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: i,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      Positioned(
                        bottom: 24,
                        right: 115,
                        child: CarouselIndicator(
                          count: 3,
                          index: _current,
                          activeColor: mainColor,
                          color: Colors.white60,
                          width: 40,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    ProBox(
                      text: 'problem',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ProBox(text: 'problem')
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    ProBox(text: 'problem'),
                    SizedBox(
                      width: 10,
                    ),
                    ProBox(text: 'problem')
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
