// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:books/helpers/utils.dart';
import 'package:books/models/books_model.dart';
import 'package:books/screens/home/homecontroller.dart';
import 'package:books/screens/pdf/pdf_view.dart';
import 'package:books/screens/utils/drawer/drawer.dart';
import 'package:books/values/colors.dart';
import 'package:books/values/controller.dart';
import 'package:books/values/string.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController _textEditingController = TextEditingController();
  int _current = 0;
  var i;
  // Future<List<DataModel>> loadJsonData() async {
  //   final String jsonString = await rootBundle.loadString('assets/data.json');
  //   final List<dynamic> jsonData = json.decode(jsonString);
  //   return jsonData.map((json) => DataModel.fromJson(json)).toList();
  // }

  fetchBooks() async {
    await homeController.getbook();
    setState(() {});
  }

  @override
  void initState() {
    fetchBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
    final List<String> imgList = [
      'assets/images/image 7.png',
      'assets/images/image 7.png',
      'assets/images/image 7.png',
    ];
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HomeController>(
          builder: (controller) => SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.22,
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
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),
                                  ),
                                  child: TextField(
                                    onChanged: controller.searchBooks,
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
                                  color:
                                      const Color.fromARGB(255, 220, 214, 214),
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
                                    String searchText =
                                        _textEditingController.text;
                                    controller.searchBooks(searchText);
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
                                        // _current = index;
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
                        if (controller.Searchbooks.isNotEmpty)
                          for (i = 0;
                              i <= controller.Searchbooks.length;
                              i = i + 2)
                            Padding(
                              padding: const EdgeInsets.only(bottom:8.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: mainColor),
                                          borderRadius: BorderRadius.circular(5)),
                                      // height: 300,
                                        width: MediaQuery.of(context).size.width*0.4,
                            
                                      child: Column(
                                        children: [
                                          SvgPicture.network(
                                            Image_URL +
                                                controller.Searchbooks[i].image!,
                                            height: 160,
                                            fit: BoxFit.cover,
                                            placeholderBuilder: (BuildContext
                                                    context) =>
                                                Container(
                                                    padding: const EdgeInsets.all(
                                                        30.0),
                                                    child:
                                                        const CircularProgressIndicator()),
                                          ),
                                          // CachedNetworkImage(
                                          //   imageUrl: Image_URL +
                                          //       controller.Searchbooks[index].image!,
                                          //   height: 160,
                                          //   fit: BoxFit.cover,
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 4.0, bottom: 6),
                                            child: Text(
                                              controller.Searchbooks[i].name!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(() => PDFScreen(
                                                        path: '${BASEURL}' +
                                                            controller
                                                                .Searchbooks[i]
                                                                .pdf!,
                                                      ));
                                                },
                                                child: Container(
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
                                                  bottomLeft: Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5))),
                                          child: Text(
                                            controller.Searchbooks[i].pdf_download
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w800,
                                                color: white),
                                          ),
                                        ))
                                  ],
                                ),
                                if (i + 1 < controller.Searchbooks.length)
                                  Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border.all(color: mainColor),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        // height: 300,
                                        width: MediaQuery.of(context).size.width*0.4,
                                        child: Column(
                                          children: [
                                            SvgPicture.network(
                                              Image_URL +
                                                  controller
                                                      .Searchbooks[i + 1].image!,
                                              height: 160,
                                              fit: BoxFit.cover,
                                              placeholderBuilder: (BuildContext
                                                      context) =>
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              30.0),
                                                      child:
                                                          const CircularProgressIndicator()),
                                            ),
                                            // CachedNetworkImage(
                                            //   imageUrl: Image_URL +
                                            //       controller.Searchbooks[index].image!,
                                            //   height: 160,
                                            //   fit: BoxFit.cover,
                                            // ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4.0, bottom: 6),
                                              child: Text(
                                                controller
                                                    .Searchbooks[i + 1].name!,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.to(() => PDFScreen(
                                                          path: '${BASEURL}' +
                                                              controller
                                                                  .Searchbooks[
                                                                      i + 1]
                                                                  .pdf!,
                                                        ));
                                                  },
                                                  child: Container(
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
                                              controller
                                                  .Searchbooks[i + 1].pdf_download
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w800,
                                                  color: white),
                                            ),
                                          ))
                                    ],
                                  )
                              ]),
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
      ),
    );
  }
}
