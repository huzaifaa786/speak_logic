import 'package:books/api/api.dart';
import 'package:books/helpers/loading.dart';
import 'package:books/models/software_model.dart';
import 'package:books/values/string.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class SoftwareController extends GetxController {
  static SoftwareController instance = Get.find();
  List<Software> softwares = [];
  getsoftware() async {
    LoadingHelper.show();
    var url = 'https://demo.cashwecan.com/api/softwares';

    var response = await Api.execute(
      url: url,
    );

    List<Software> software = <Software>[];
    for (var van in response['softwares']) {
      software.add(Software(van));
    }
    softwares = software;
    LoadingHelper.dismiss();
    print(softwares);
    update();
  }
}
