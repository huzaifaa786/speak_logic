import 'package:books/static/heading.dart';
import 'package:books/static/problembox.dart';
import 'package:books/static/videobox.dart';
import 'package:books/values/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  final List<String> imgList = [
    'assets/images/image 7.png',
    'assets/images/image 7.png',
    'assets/images/image 7.png',
  ];
  int _current = 0;
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Headingcontainer(
              controller: _textEditingController,
              text: 'Forum',
            ),
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
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The Speak Logic Forum',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Watch the videos below to learn more about SLPSoft products and how they can best serve you. The videos provide some quick overviews of our software and will help you get accustomed to our products. We are currently in the process of creating more videos regarding the modeling process, and we encourage you check this page in the future for updated videos. Please contact us for any further information about our products.',
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        ProBox(
                          text: 'Heading',
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        ProBox(
                          text: 'Heading',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        ProBox(
                          text: 'Heading',
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        ProBox(
                          text: 'Heading',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
