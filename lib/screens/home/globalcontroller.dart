import 'package:books/api/api.dart';
import 'package:books/helpers/loading.dart';
import 'package:books/models/problem.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  static GlobalController instance = Get.find();

  List<Config> appConfig = [];
  getData() async {
    LoadingHelper.show();
    var url = 'https://demo.cashwecan.com/api/settings';

    // var data = {};
    // print(data);
    var response = await Api.execute(url: url);

    List<Config> config = <Config>[];
    for (var van in response['settings']) {
      config.add(Config(van));
    }
    appConfig = config;
    LoadingHelper.dismiss();
    update();
  }
}
