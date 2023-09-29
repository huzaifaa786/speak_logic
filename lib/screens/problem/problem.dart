import 'package:books/values/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProblemScreen extends StatefulWidget {
  const ProblemScreen({super.key});

  @override
  State<ProblemScreen> createState() => _ProblemScreenState();
}

class _ProblemScreenState extends State<ProblemScreen> {
  TextEditingController _textEditingController = TextEditingController();
    final CarouselController _controller = CarouselController();
 final List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
    final List<String> items = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(children: [
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
                      fontSize: 40, fontWeight: FontWeight.w700, color: white),
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
                SizedBox(height: 120,),
                 Padding(
                      padding: const EdgeInsets.only(top: 18.0, bottom: 12),
                      child: Stack(
                        children: [
                          CarouselSlider(
                            // carouselController: _controller,
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
              ],
            )),
      ]),
    )));
  }
}
