import 'package:books/api/api.dart';
import 'package:books/helpers/loading.dart';
import 'package:books/models/problem.dart';
import 'package:get/get.dart';

class ProblemController extends GetxController {
  static ProblemController instance = Get.find();


    List<Problem> problems = [];
  getproblem() async {
    LoadingHelper.show();
    var url = 'https://demo.cashwecan.com/api/settings';

    // var data = {};
    // print(data);
    var response = await Api.execute(url: url);

      List<Problem> problem = <Problem>[];
      for (var van in response['settings']) {
        problem.add(Problem(van));
      }
      problems = problem;
      LoadingHelper.dismiss();
      print(problems);
      update();

  }


}