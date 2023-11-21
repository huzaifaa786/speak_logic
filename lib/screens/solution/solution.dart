import 'package:books/screens/utils/drawer/drawer.dart';
import 'package:books/values/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SolutionScreen extends StatefulWidget {
  const SolutionScreen({super.key});

  @override
  State<SolutionScreen> createState() => _SolutionScreenState();
}

class _SolutionScreenState extends State<SolutionScreen> {
  TextEditingController _textEditingController = TextEditingController();
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
            child:
                SideDrawer(), // Use your custom drawer content widget here
          ),
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
                    'Solution',
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
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text('Solution',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: mainColor)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                      'It is impossible to learn proper communication without being aware of the principle of communication. That is why it is important to learn the principle of communication.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 6, right: 30),
                  child: Text('Learning The Principle',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: mainColor)),
                ),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                      text:
                          'In order to understand a given set of principles and work with it, it must be learned. The Speak Logic Project provides us with the opportunity to learn the principle of communication. If your goal is to learn the principle with the help of an instructor, there is no need to have a book. If your goal is to learn the principle with the help of a book,',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' click here ',
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text:
                              'by going to the book section and downloading the following',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, left: 20, bottom: 5, right: 30),
                  child: Text(
                    'Understanding The Principle of \nCommunication Application Modeling \nTutorial Communication Domain\nFundamental of Communication Book 1 \nFundamental of Communication Book 1 \nFundamental of Communication Book 3\nApplication Modeling Tutorial Theory\nDomain Communication/Information\nAnalysis Guidelines',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                      'In addition to the list above, you can download software to help you with the analysis of communication. You may find that it is useful to use the software from the list to help you with the analysis of your applications. click here to visit the software page and download your choice of software',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 30),
                  child: Text('Given that a corrected version of our communication is very portable, our location is irrelevant. For more information about Speak Logic at your location, click here or contact us',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
                ),
             
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 6, right: 30),
                  child: Text('Learning The Principle',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: mainColor)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                      'As a principle dependent entity, we learn a given set of principles and then apply it to execute our applications. By understanding the relationship between us and the principle entity, we can see that our parents give us feedback in order to execute our applications; see Principle of Communication exercises 757 and 759 for more information',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
