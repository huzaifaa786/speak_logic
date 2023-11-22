import 'package:books/api/api.dart';
import 'package:books/helpers/loading.dart';
import 'package:books/models/solution.dart';
import 'package:get/get.dart';

class SolutionController extends GetxController {
  static SolutionController instance = Get.find();

  List<Solution> solutions = [];
  getsolution() async {
    LoadingHelper.show();
    var url = 'https://demo.cashwecan.com/api/settings';

    // var data = {};
    // print(data);
    var response = await Api.execute(url: url);

      List<Solution> solution = <Solution>[];
      for (var van in response['settings']) {
        solution.add(Solution(van));
      }
      solutions = solution;
      LoadingHelper.dismiss();
      print(solutions);
      update();

  }



}