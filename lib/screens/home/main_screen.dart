// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:books/models/books_model.dart';
import 'package:books/screens/utils/drawer/drawer.dart';
import 'package:books/values/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController _textEditingController = TextEditingController();
  int _current = 0;
  Future<List<DataModel>> loadJsonData() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((json) => DataModel.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
    final List<String> imgList = [
      'https://admin.klickwash.net/assets/img/logo1.png',
      'https://admin.klickwash.net/assets/img/logo1.png',
      'https://admin.klickwash.net/assets/img/logo1.png'
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(right: 20, left: 20),
                decoration: BoxDecoration(color: mainColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Welcome to ',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 32),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Speak Logic',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 32,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'We promote better communication',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: white),
                      ),
                    ),
                    // Divider(),
                  ],
                ),
              ),
              // SizedBox(height: 600,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        decoration: BoxDecoration(
                          color: white.withOpacity(0.8),
                          border: Border.all(color: borderGreen, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 55,
                              // width: 55,
                              decoration: BoxDecoration(
                                color:
                                    mainColor, // Set the background color to green
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                ),
                              ),
                              child: DropdownButton<String>(
                                value: dropdownItems[
                                    0], // Set the initial selected value
                                onChanged: (String? newValue) {
                                  // Handle the dropdown selection
                                  print('Selected: $newValue');
                                },
                                iconSize: 1,
                                iconEnabledColor: white,
                                iconDisabledColor: white,
                                items: dropdownItems.map((String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        item,
                                        style: TextStyle(color: white),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
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
                                    contentPadding:
                                        EdgeInsets.only(left: 20, bottom: 6),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 2, 139, 66),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.search, color: white),
                                onPressed: () {
                                  // Perform the action when the button is pressed
                                  String searchText =
                                      _textEditingController.text;
                                  print('Search: $searchText');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18, bottom: 12),
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
                                        width:
                                            MediaQuery.of(context).size.width,
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
                      Text(
                        'Lorem ipsum dolor sit amet, et enim tantas senserit his. No est utroque copiosae voluptatum, ad posse vituperatoribus eam, ex mel sint viris aliquam. An eos aliquip eloquentiam, tritani fabellas mea eu. Fugit consequat conclusionemque vix id, nec ea denique delicatissimi. Usu labore voluptatum in. Erat voluptua mea ne, cotidieque interpretaris vim in. Eu mei alia urbanitas posidonium. In vis graeco causae dissentiet, id sententiae appellantur repudiandae cum.',
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 12),
                        child: GestureDetector(
                          child: Container(
                            height: 50,
                            padding: EdgeInsets.fromLTRB(35, 13, 35, 13),
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Text(
                              'Explore More',
                              style: TextStyle(
                                  color: white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Books',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 0, right: 0, bottom: 8),
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: FutureBuilder<List<DataModel>>(
                          future: loadJsonData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child:
                                    CircularProgressIndicator(), // Show loading indicator.
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            } else if (!snapshot.hasData ||
                                snapshot.data!.isEmpty) {
                              return Center(
                                child: Text('No data available.'),
                              );
                            } else {
                              final dataList = snapshot.data!;
                              return GridView.builder(
                                // scrollDirection: Axis.horizontal,
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200,
                                        childAspectRatio: 0.63,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20),
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  final item = dataList[index];
                                  return Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: mainColor),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        height: 300,
                                        child: Column(
                                          children: [
                                            SvgPicture.asset(
                                              item.image,
                                              height: 160,
                                              fit: BoxFit.cover,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4.0, bottom: 6),
                                              child: Text(
                                                item.name,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: mainColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                  padding: EdgeInsets.only(
                                                      left: 4,
                                                      right: 4,
                                                      top: 2,
                                                      bottom: 4),
                                                  child: Text(
                                                    'Pdf',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: white),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 1.5, right: 1.5),
                                                    decoration: BoxDecoration(
                                                        color: mainColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4)),
                                                    padding: EdgeInsets.all(4),
                                                    child: Icon(
                                                      Icons
                                                          .download_for_offline_rounded,
                                                      size: 15,
                                                      color: white,
                                                    )),
                                                Container(
                                                    decoration: BoxDecoration(
                                                        color: mainColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4)),
                                                    padding: EdgeInsets.all(4),
                                                    child: Icon(
                                                      Icons
                                                          .info_outline_rounded,
                                                      size: 15,
                                                      color: white,
                                                    )),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 1.5, right: 1.5),
                                                    decoration: BoxDecoration(
                                                        color: mainColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4)),
                                                    padding: EdgeInsets.all(4),
                                                    child: Icon(
                                                      Icons.search,
                                                      size: 15,
                                                      color: white,
                                                    )),
                                                Container(
                                                    decoration: BoxDecoration(
                                                        color: mainColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4)),
                                                    padding: EdgeInsets.all(4),
                                                    child: Icon(
                                                      Icons.print,
                                                      size: 15,
                                                      color: white,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                          right: 18,
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 6,
                                                right: 6,
                                                bottom: 6,
                                                top: 8),
                                            decoration: BoxDecoration(
                                                color: mainColor,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5))),
                                            child: Text(
                                              '#1',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w800,
                                                  color: white),
                                            ),
                                          ))
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
