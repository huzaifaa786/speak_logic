import 'package:books/helpers/utils.dart';
import 'package:books/screens/pdf/pdf_view.dart';
import 'package:books/static/svgImageLoader.dart';
import 'package:books/values/colors.dart';
import 'package:books/values/controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BookCard extends StatelessWidget {
  BookCard({super.key, this.index});
  int? index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: mainColor),
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
                SvgPicture.asset('assets/images/book.svg',
                height: 160,
                fit: BoxFit.cover,
                placeholderBuilder: (BuildContext context) => Container(
                    padding: const EdgeInsets.all(30.0),
                    child: const CircularProgressIndicator()),
              ),
              // SvgImageLoader(path: homeController.Searchbooks[index!].image!,),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 6),
                child: Text(
                  homeController.Searchbooks[index!].name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => PDFScreen(
                            path: '${BASEURL}' +
                                homeController.Searchbooks[index!].pdf!,
                          ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(4)),
                      padding:
                          EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 4),
                      child: Text(
                        'Pdf',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: white),
                      ),
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      customButton: Container(
                          margin: EdgeInsets.only(left: 1.5, right: 1.5),
                          decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(4)),
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            Icons.download_for_offline_rounded,
                            size: 15,
                            color: white,
                          )),
                      items: [
                        DropdownMenuItem(
                          value: 'pdf',
                          child: Text('pdf'),
                        ),
                        DropdownMenuItem(
                          value: 'epub',
                          child: Text('ePub'),
                        ),
                      ],
                      onChanged: (value) {
                        homeController.handleDownload(
                            homeController.Searchbooks[index!], value);
                      },
                      dropdownStyleData: DropdownStyleData(
                        width: 100,
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.white,
                        ),
                        offset: const Offset(0, 4),
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(4)),
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        Icons.info_outline_rounded,
                        size: 15,
                        color: white,
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 1.5, right: 1.5),
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(4)),
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        Icons.search,
                        size: 15,
                        color: white,
                      )),
                  Container(
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(4)),
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
              padding: EdgeInsets.only(left: 6, right: 6, bottom: 6, top: 8),
              decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: Text(
                homeController.Searchbooks[index!].pdf_download.toString(),
                style: TextStyle(
                    fontSize: 10, fontWeight: FontWeight.w800, color: white),
              ),
            ))
      ],
    );
  }
}
