class Question {
  int? id;
  String? mquestion;
  String? answer;

  Question(question) {
    id = question['id'];
    mquestion = question['question'];
    answer = question['answer'];
  }
}
