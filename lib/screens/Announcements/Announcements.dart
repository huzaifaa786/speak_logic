import 'package:books/static/announcement.dart';
import 'package:books/static/button.dart';
import 'package:books/static/heading.dart';
import 'package:books/static/search.dart';
import 'package:books/values/colors.dart';
import 'package:flutter/material.dart';

class Announcements extends StatefulWidget {
  const Announcements({super.key});

  @override
  State<Announcements> createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Announcementhead(
            controller: _textEditingController,
            text: 'Announcements',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SearchInput(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 12),
            child: Row(
              children: [
                Text(
                  '1',
                  style: TextStyle(fontSize: 23, color: Colors.grey),
                ),
                Icon(
                  Icons.arrow_right_alt,
                  color: Colors.black,
                ),
                Text('Announcements',
                    style:
                        TextStyle(fontSize: 23, fontWeight: FontWeight.w700)),
                Icon(
                  Icons.arrow_right_alt,
                  color: Colors.black,
                ),
                Text('12-12-223',
                    style: TextStyle(fontSize: 23, color: Colors.grey))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 12),
            child: Text(
                'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, seLorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim add diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                  title: 'View more',
                  onPressed: () {},
                  textcolor: white,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 12),
            child: Row(
              children: [
                Text(
                  '2',
                  style: TextStyle(fontSize: 23, color: Colors.grey),
                ),
                Icon(
                  Icons.arrow_right_alt,
                  color: Colors.black,
                ),
                Text('Announcements',
                    style:
                        TextStyle(fontSize: 23, fontWeight: FontWeight.w700)),
                Icon(
                  Icons.arrow_right_alt,
                  color: Colors.black,
                ),
                Text('12-12-223',
                    style: TextStyle(fontSize: 23, color: Colors.grey))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 12),
            child: Text(
                'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, seLorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim add diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                  title: 'View more',
                  onPressed: () {},
                  textcolor: white,
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
