import 'package:books/static/bookox.dart';
import 'package:books/values/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchBook extends StatefulWidget {
  const SearchBook({super.key});

  @override
  State<SearchBook> createState() => _SearchBookState();
}

class _SearchBookState extends State<SearchBook> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.22,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(right: 20, left: 20),
            decoration: BoxDecoration(color: mainColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Book',
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
                // SizedBox(height: 20,),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(top: 10,left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Search Result :',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.red,
                    fontWeight: FontWeight.w500),
              ),
              Text('The Psychology of Money'),
            ],
          ),
        ),
        BookBox(
          text: 'The Psychology of Money',
        ),
        BookBox(
          text: 'The Psychology of Money',
        ),
        BookBox(
          text: 'The Psychology of Money',
        ),
        BookBox(
          text: 'The Psychology of Money',
        ),
        BookBox(
          text: 'The Psychology of Money',
        ),
      ]),
    )));
  }
}
