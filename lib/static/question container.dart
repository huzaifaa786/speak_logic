import 'package:books/models/question_model.dart';
import 'package:books/values/colors.dart';
import 'package:flutter/material.dart';

class QuestionContainer extends StatefulWidget {
  final Question question;

  const QuestionContainer({required this.question, Key? key}) : super(key: key);

  @override
  _QuestionContainerState createState() => _QuestionContainerState();
}

class _QuestionContainerState extends State<QuestionContainer> {
  bool isExpanded = false;
  double paddingValue = 5.0; // Adjust this value based on your preference

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: questioncontainercolor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              widget.question.mquestion!,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            trailing: GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Icon(
                isExpanded ? Icons.remove : Icons.add,
                color: mainColor,
              ),
            ),
          ),
          AnimatedCrossFade(
            duration: Duration(milliseconds: 300),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: Container(), // Empty container when collapsed
            secondChild: Padding(
              padding: EdgeInsets.only(top: paddingValue),
              child: Padding(
                padding: const EdgeInsets.only(top :5.0,bottom: 10, left: 15,right: 15),
                child: Text(
                  widget.question.answer!,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
