// ignore_for_file: prefer_const_constructors

import 'package:books/helpers/utils.dart';
import 'package:books/static/bookBox.dart';
import 'package:books/static/bookox.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:books/screens/home/homecontroller.dart';
import 'package:books/screens/pdf/pdf_view.dart';
import 'package:books/static/svgImageLoader.dart';
import 'package:books/values/colors.dart';
import 'package:books/values/controller.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
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

  fetchBooks() async {
    if (homeController.Searchbooks.isEmpty)
      await homeController.getbook();

    if(globalController.appConfig.isEmpty)
      await globalController.getData();

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
      'assets/images/Home/image 2.jpg',
      'assets/images/Home/image9-e.jpg',
      'assets/images/Home/IMG7_V3.jpg',
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
                        if(globalController.appConfig.isNotEmpty)
                        Text(
                          globalController.appConfig[12].description!,
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
                        GridView.builder(
                           padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 20,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: controller.Searchbooks.length,
                          itemBuilder: (context, index) {
                            // final item = controller.Searchbooks[index];
                            return BookCard(index: index);
                          },
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
