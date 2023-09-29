// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:books/models/books_model.dart';
import 'package:books/values/colors.dart';
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
  Future<List<DataModel>> loadJsonData() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((json) => DataModel.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
    final List<String> items = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];
    final CarouselController _controller = CarouselController();
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, color: white),
      ),
      body: SafeArea(
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
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: SingleChildScrollView(s
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      decoration: BoxDecoration(
                        color:white .withOpacity(0.8),
                        border: Border.all(
                            color: borderGreen, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 55,
                            // width: 55,
                            decoration: BoxDecoration(
                              color: mainColor, // Set the background color to green
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
                                String searchText = _textEditingController.text;
                                print('Search: $searchText');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0, bottom: 12),
                      child: Stack(
                        children: [
                          CarouselSlider(
                            carouselController: _controller,
                            options: CarouselOptions(
                              height: 100.0,
                              viewportFraction: 1,
                              enlargeCenterPage: false,
                              aspectRatio: 1,
                              autoPlay:
                                  false, // Set to true for automatic sliding
                            ),
                            items: items.map((item) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                    ),
                                    child: Center(
                                      child: Text(
                                        item,
                                        style: TextStyle(
                                          fontSize: 24.0,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                          Positioned(
                            top: 25,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      _controller.previousPage();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(left: 10),
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                          color: mainColor),
                                      child: Icon(
                                        Icons.arrow_back_ios_new,
                                        color: white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.all(6),
                                    decoration:
                                        BoxDecoration(color: mainColor),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: white,
                                    ),
                                  ),
                                  //                                 ElevatedButton(
                                  //                                   onPressed: () {
                                  //                                     _controller.previousPage();
                                  //                                   },
                                  //                                   style: ElevatedButton.styleFrom(
                                  //   primary: mainColor, // Background color
                                  // ),
                                  //                                   child: Icon(Icons.arrow_back_ios),
                                  //                                 ),
                                  // ElevatedButton(
                                  //   onPressed: () {
                                  //     // Next button logic
                                  //     _controller.nextPage();
                                  //   },
                                  //   child: Text('Next'),
                                  // ),
                                ],
                              ),
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
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: GestureDetector(
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.fromLTRB(35, 13, 35, 13),
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 8),
                      height: MediaQuery.of(context).size.height * 0.21,
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
                                      childAspectRatio: 0.7,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                final item = dataList[index];
                                return Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: mainColor),
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
                                                  fontWeight: FontWeight.w700),
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
                                                    left: 8,
                                                    right: 8,
                                                    top: 4,
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
                                                          BorderRadius.circular(
                                                              4)),
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
                                                          BorderRadius.circular(
                                                              4)),
                                                  padding: EdgeInsets.all(4),
                                                  child: Icon(
                                                    Icons.info_outline_rounded,
                                                    size: 15,
                                                    color: white,
                                                  )),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: 1.5, right: 1.5),
                                                  decoration: BoxDecoration(
                                                      color: mainColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
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
                                                          BorderRadius.circular(
                                                              4)),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
