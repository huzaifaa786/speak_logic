import 'package:books/screens/home/globalcontroller.dart';
import 'package:books/values/colors.dart';
import 'package:books/values/controller.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProblemScreen extends StatefulWidget {
  const ProblemScreen({super.key});

  @override
  State<ProblemScreen> createState() => _ProblemScreenState();
}

class _ProblemScreenState extends State<ProblemScreen> {
  TextEditingController _textEditingController = TextEditingController();
  final List<String> imgList = [
    'assets/images/Problem/image4 44.jpg',
    'assets/images/Problem/IMG2_V3.jpg',
    'assets/images/Problem/P1_C1_V4.jpg',
    'assets/images/Problem/P10_B2_V2.jpg',
  ];
  final List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
  int _current = 0;


  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(
      builder: (controller) => Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.15,
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
                            right: 100,
                            child: CarouselIndicator(
                              count: 4,
                              index: _current,
                              activeColor: mainColor,
                              color: Colors.white60,
                              width: 40,
                            ),
                          )
                        ],
                      ),
                    ),
                    controller.appConfig.isNotEmpty
                        ? Text(controller.appConfig[0].value.toString())
                        : SizedBox(),
                    if (controller.appConfig.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Text(controller.appConfig[13].name.toString(),
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: mainColor)),
                      ),
                    if (controller.appConfig.isNotEmpty)
                      Text(controller.appConfig[13].description!)
                  ],
                ),
              ),
            ]),
          ))),
    );
  }
}
