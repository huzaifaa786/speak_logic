import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImageLoader extends StatefulWidget {
   SvgImageLoader({Key? key, this.path}) : super(key: key);

  String? path;

  @override
  State<SvgImageLoader> createState() => _SvgImageLoaderState();
}

class _SvgImageLoaderState extends State<SvgImageLoader> {
  var file;
  //  @override
  // void initState() {
  //   super.initState();
  //   cacheImage();
  // }

  // cacheImage()async{
  // file = await DefaultCacheManager().getSingleFile(widget.path!);

  // }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/images/book.svg');
    
  }
}
