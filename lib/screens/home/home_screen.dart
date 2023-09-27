// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:books/models/books_model.dart';
import 'package:books/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _textEditingController = TextEditingController();
  Future<List<DataModel>> loadJsonData() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((json) => DataModel.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, color: white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(right: 20, left: 20),
              decoration: BoxDecoration(color: mainColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Books',
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
                      border: Border.all(
                          color: borderGreen, width: 1),
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
                ],
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 0.7,
                child: FutureBuilder<List<DataModel>>(
                  future: loadJsonData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child:
                            CircularProgressIndicator(), // Show loading indicator.
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
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 320,
                                childAspectRatio: 0.65,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: dataList.length,
                        itemBuilder: (context, index) {
                          final item = dataList[index];
                          return Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: mainColor),
                                    borderRadius: BorderRadius.circular(5)),
                                // height: 300,
                                child: Wrap(
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
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        // DropdownButton<String>(
                                        //   value: 'One',
                                        //   icon: Visibility(
                                        //       visible: false,
                                        //       child:
                                        //           Icon(Icons.arrow_downward)),
                                        //   iconSize: 12,
                                        //   elevation: 4,
                                        //   style: const TextStyle(
                                        //       color: white),
                                        //   underline: Container(
                                        //     height: 0,
                                        //     color: white,
                                        //   ),
                                        //   // borderRadius: ,
                                        //   onChanged: (String? newValue) {
                                        //     setState(() {
                                        //       // dropdownValue = newValue!;
                                        //     });
                                        //   },
                                        //   items: <String>[
                                        //     'One',
                                        //     'Two',
                                        //     'Free',
                                        //     'Four'
                                        //   ].map<DropdownMenuItem<String>>(
                                        //       (String value) {
                                        //     return DropdownMenuItem<String>(
                                        //       value: value,
                                        //       child: Container(
                                        //           padding: EdgeInsets.all(4),
                                        //           decoration: BoxDecoration(
                                        //               borderRadius:
                                        //                   BorderRadius.circular(
                                        //                       4),
                                        //               color: mainColor),
                                        //           child: Text(value)),
                                        //     );
                                        //   }).toList(),
                                        // ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: mainColor,
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          padding: EdgeInsets.only(
                                              left: 8,
                                              right: 8,
                                              top: 4,
                                              bottom: 4),
                                          child: Text(
                                            'Pdf',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: white),
                                          ),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: 1.5, right: 1.5),
                                            decoration: BoxDecoration(
                                                color: mainColor,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
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
            ),
          ],
        ),
      ),
    );
  }
}
