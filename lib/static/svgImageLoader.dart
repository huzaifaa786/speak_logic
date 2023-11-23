import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImageLoader extends StatelessWidget {
   SvgImageLoader({super.key, this.path});

String? path;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File>(
        future: DefaultCacheManager().getSingleFile('https://svgshare.com/i/U7p.svg'),
        builder: (
          _,
          AsyncSnapshot<File> snapshot,
        ) {
          if (snapshot.hasData) {
            return SvgPicture.file(snapshot.data!);
          } else {
            return Container();
          }
        });
  }
}
