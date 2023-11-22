import 'package:books/screens/utils/drawer/drawer.dart';
import 'package:books/screens/video/videocontroller.dart';
import 'package:books/screens/video/videoplay.dart';
import 'package:books/static/heading.dart';
import 'package:books/static/videobox.dart';
import 'package:books/values/colors.dart';
import 'package:books/values/controller.dart';
import 'package:books/values/string.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final List<String> imgList = [
    'assets/images/image 7.png',
    'assets/images/image 7.png',
    'assets/images/image 7.png',
  ];
  int _current = 0;
  TextEditingController _textEditingController = TextEditingController();

  fetchBooks() async {
    await videoController.getvideo();
    setState(() {});
  }

  @override
  void initState() {
    fetchBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoController>(
      builder: (controller) => Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
          ),
          drawer: Drawer(
            child: SideDrawer(), // Use your custom drawer content widget here
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(children: [
                Headingcontainer(
                  controller: _textEditingController,
                  text: 'Video',
                ),
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
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Watch our videos',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Watch the videos below to learn more about SLPSoft products and how they can best serve you. The videos provide some quick overviews of our software and will help you get accustomed to our products. We are currently in the process of creating more videos regarding the modeling process, and we encourage you check this page in the future for updated videos. Please contact us for any further information about our products.',
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 2, right: 2, bottom: 4, top: 5),
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: GridView.builder(
                      // scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 0.63,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: controller.videos.length,
                      itemBuilder: (context, index) {
                        final item = controller.videos[index];
                        return Stack(
                          children: [
                            Column(
                              children: [
                                VideoBox(
                                    onPressed: () {
                                      Get.to(VideoPlay(
                                          link: controller.videos[index].link));
                                    },
                                    title: controller.videos[index].title,
                                    text: controller.videos[index].type),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ]),
            ),
          )),
    );
  }
}
