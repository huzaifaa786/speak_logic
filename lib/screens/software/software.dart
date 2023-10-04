import 'package:books/helpers/book_data_helper.dart';
import 'package:books/models/books_model.dart';
import 'package:books/screens/utils/drawer/drawer.dart';
import 'package:books/static/button.dart';
import 'package:books/static/heading.dart';
import 'package:books/values/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SoftwareScreen extends StatefulWidget {
  const SoftwareScreen({super.key});

  @override
  State<SoftwareScreen> createState() => _SoftwareScreenState();
}

class _SoftwareScreenState extends State<SoftwareScreen> {
  int _current = 0;
  final List<String> imgList = [
    'assets/images/image 7.png',
    'assets/images/image 7.png',
    'assets/images/image 7.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: SideDrawer(),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Headingcontainer(
              text: 'Software',
            ),
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
            Container(
              padding: EdgeInsets.only(left: 9, right: 9, bottom: 4, top: 5),
              height: MediaQuery.of(context).size.height * 0.4,
              child: FutureBuilder<List<DataModel>>(
                future: loadJsonData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
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
                                  border: Border.all(color: mainColor),
                                  borderRadius: BorderRadius.circular(5)),
                              height: 230,
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    item.image,
                                    height: 160,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4.0, bottom: 2),
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
                                          width: 41,
                                          decoration: BoxDecoration(
                                              color: mainColor,
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          padding: EdgeInsets.only(
                                              left: 4,
                                              right: 4,
                                              top: 2,
                                              bottom: 4),
                                          child: Icon(
                                            Icons.download_for_offline_rounded,
                                            size: 15,
                                            color: white,
                                          )),
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 1.5, right: 1.5),
                                          decoration: BoxDecoration(
                                              color: mainColor,
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          padding: EdgeInsets.all(4),
                                          child: Icon(
                                            Icons.download_for_offline_rounded,
                                            size: 15,
                                            color: white,
                                          )),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: mainColor,
                                              borderRadius:
                                                  BorderRadius.circular(4)),
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
                                                  BorderRadius.circular(4)),
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
                                                  BorderRadius.circular(4)),
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
                                      left: 6, right: 6, bottom: 6, top: 8),
                                  decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5))),
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
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Align(
                  alignment: Alignment.topRight,
                  child: Button(
                    title: 'Explore More',
                    onPressed: () {},
                    buttonWidth: 0.38,
                    textcolor: white,
                  )),
            )
          ],
        ),
      )),
    );
  }
}
