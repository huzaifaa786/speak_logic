import 'package:books/screens/utils/drawer/drawer.dart';
import 'package:books/values/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProblemScreen extends StatefulWidget {
  const ProblemScreen({super.key});

  @override
  State<ProblemScreen> createState() => _ProblemScreenState();
}

class _ProblemScreenState extends State<ProblemScreen> {
  TextEditingController _textEditingController = TextEditingController();
  final List<String> imgList = [
    'assets/images/image 7.png',
    'assets/images/image 7.png',
    'assets/images/image 7.png',
  ];
  final List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: Drawer(
          child: SideDrawer(), // Use your custom drawer content widget here
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.22,
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
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
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
                                    child: Image.asset(
                                      i, // Assuming 'i' contains the asset path, e.g., 'assets/image.png'
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
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Text('Problem',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: mainColor)),
                  ),
                  Text(
                      'It is impossible to learn proper communication without being aware of the principle of communication. That is why it is important to learn the principle of communication. It is impossible to learn proper communication without being aware of the principle of communication. That is why it is important to learn the principle of communication.It is impossible to learn proper communication without being aware of the principle of communication. That is why it is important to learn the principle of communication.It is impossible to learn proper communication without being aware of the principle of communication. That is why it is important to learn the principle of communication.It is impossible to learn proper communication without being aware of the principle of communication. That is why it is important to learn the principle of communication.It is impossible to learn proper communication without being aware of the principle of communication. That is why it is important to learn the principle of communication.It is impossible to learn proper communication without being aware of the principle of communication. That is why it is important to learn the principle of communication.')
                ],
              ),
            ),
          ]),
        )));
  }
}
