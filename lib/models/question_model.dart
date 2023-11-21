class Question {
  int? id;
  String? question;
  String? answer;

  Question(question) {
    id = question['id'];
    question = question['question'];
    answer = question['answer'];
  }
}
