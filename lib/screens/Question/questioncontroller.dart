import 'package:books/api/api.dart';
import 'package:books/helpers/loading.dart';
import 'package:books/models/question_model.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class QuestionController extends GetxController {
  static QuestionController instance = Get.find();
 List<Question> questions = [];
  getquestion() async {
    LoadingHelper.show();
    var url = 'https://demo.cashwecan.com/api/questions';

    // var data = {};
    // print(data);
    var response = await Api.execute(url: url);

      List<Question> mquestions = <Question>[];
      for (var van in response['questions']) {
        mquestions.add(Question(van));
      }
      questions = mquestions;
      LoadingHelper.dismiss();
      update();

  }
}