// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:books/models/books_model.dart';
import 'package:books/screens/Books/bookcontroller.dart';
import 'package:books/screens/Books/search_book.dart';
import 'package:books/screens/home/homecontroller.dart';
import 'package:books/static/bookBox.dart';
import 'package:books/values/colors.dart';
import 'package:books/values/controller.dart';
import 'package:books/values/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  TextEditingController _textEditingController = TextEditingController();
  // Future<List<DataModel>> loadJsonData() async {
  //   final String jsonString = await rootBundle.loadString('assets/data.json');
  //   final List<dynamic> jsonData = json.decode(jsonString);
  //   return jsonData.map((json) => DataModel.fromJson(json)).toList();
  // }

  fetchOrder() async {
    await bookController.getbook();
    setState(() {});
  }

  @override
  void initState() {
    fetchOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.22,
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
                                  String searchText = _textEditingController.text;
                                  controller.searchBooks(searchText);
                                  print('Search: $searchText');
                                  // Perform the action when the button is pressed
          
                                  print('Search: $searchText');
          
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SearchBook()));
                                  print('object');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                 Container(
                  padding: EdgeInsets.all(12),
                   child: GridView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
