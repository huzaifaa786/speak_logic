import 'package:books/helpers/book_data_helper.dart';
import 'package:books/models/books_model.dart';
import 'package:books/screens/Books/bookcontroller.dart';
import 'package:books/screens/utils/drawer/drawer.dart';
import 'package:books/static/announcement.dart';
import 'package:books/static/search.dart';
import 'package:books/values/colors.dart';
import 'package:books/values/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyBook extends StatefulWidget {
  const MyBook({super.key});

  @override
  State<MyBook> createState() => _MyBookState();
}

class _MyBookState extends State<MyBook> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: Drawer(
          child: SideDrawer(), // Use your custom drawer content widget here
        ),
        body: SafeArea(
            child: Column(
          children: [
            Announcementhead(
              controller: _textEditingController,
              text: 'My Books',
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SearchInput(),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 0.7,
                // child: FutureBuilder<List<DataModel>>(
                //   future: loadJsonData(),
                //   builder: (context, snapshot) {
                //     if (snapshot.connectionState == ConnectionState.waiting) {
                //       return Center(
                //         child:
                //             CircularProgressIndicator(), // Show loading indicator.
                //       );
                //     } else if (snapshot.hasError) {
                //       return Center(
                //         child: Text('Error: ${snapshot.error}'),
                //       );
                //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                //       return Center(
                //         child: Text('No data available.'),
                //       );
                //     } else {
                //       final dataList = snapshot.data!;

                //     }
                //   },
                // ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.63,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12),
                  itemCount: controller.books.length,
                  itemBuilder: (context, index) {
                    final item = controller.books[index];
                    return Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              border: Border.all(color: mainColor),
                              borderRadius: BorderRadius.circular(5)),
                          // height: 300,
                          child: Wrap(
                            children: [
                              SvgPicture.network(
                                Image_URL + controller.books[index].image!,
                                height: 160,
                                fit: BoxFit.cover,
                                placeholderBuilder: (BuildContext context) =>
                                    Container(
                                        padding: const EdgeInsets.all(30.0),
                                        child:
                                            const CircularProgressIndicator()),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 2, bottom: 2),
                                child: Text(
                                  controller.books[index].name!,
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
                                        borderRadius: BorderRadius.circular(4)),
                                    padding: EdgeInsets.only(
                                        left: 4, right: 4, top: 2, bottom: 2),
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
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
