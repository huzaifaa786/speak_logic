import 'package:books/api/api.dart';
import 'package:books/helpers/loading.dart';
import 'package:books/models/video_model.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class VideoController extends GetxController {
  static VideoController instance = Get.find();
 List<Video> videos = [];
  getvideo() async {
    LoadingHelper.show();
    var url = 'https://demo.cashwecan.com/api/videos';

    // var data = {};
    // print(data);
    var response = await Api.execute(url: url);

      List<Video> video = <Video>[];
      for (var van in response['videos']) {
        video.add(Video(van));
      }
      videos = video;
      LoadingHelper.dismiss();
      update();

  }
}