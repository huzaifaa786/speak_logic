import 'package:books/models/question_model.dart';
import 'package:books/screens/Question/questioncontroller.dart';
import 'package:books/screens/utils/drawer/drawer.dart';
import 'package:books/static/question%20container.dart';
import 'package:books/values/colors.dart';
import 'package:books/values/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  TextEditingController _textEditingController = TextEditingController();
 fetchQuestions() async {
    await questionContainer.getquestion();
    setState(() {});
  }

  @override
  void initState() {
    fetchQuestions();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
      return GetBuilder<QuestionController>(
      builder: (controller) =>  Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: Drawer(
          child: SideDrawer(), // Use your custom drawer content widget here
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.22,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(right: 20, left: 20),
                  decoration: BoxDecoration(color: mainColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Questions',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: white),
                      ),
                      Divider(),
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        decoration: BoxDecoration(
                          color: white.withOpacity(0.8),
                          border: Border.all(color: borderGreen, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                ),
                                child: TextField(
                                  controller: _textEditingController,
                                  decoration: InputDecoration(
                                    hintText: 'Search Here',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    contentPadding: EdgeInsets.only(left: 20),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.search),
                                onPressed: () {
                                  // Perform the action when the button is pressed
                                  String searchText = _textEditingController.text;
                                  print('Search: $searchText');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 20,),
                    ],
                  )),
              Image.asset(
                'assets/images/image 8.png',
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: RichText(
                  text: TextSpan(
                      text: 'Some Compiled',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Questions',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: ' and',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: ' Answers',
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 85, top: 5),
                child: RichText(
                  text: TextSpan(
                      text:
                          'Here are some compiled questions and answers. If you have any more questions, visit the',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                          fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' “contact” ',
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: 'page',
                          style: TextStyle(
                              color: hintColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w400),
                        ),
                      ]),
                ),
              ),
             Container(
              height: MediaQuery.of(context).size.height * 0.6,
               child: ListView.builder(
               itemCount: controller.questions.length,
               itemBuilder: (context, index) {
                 Question question = controller.questions[index];
             
                 return Padding(
                   padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                   child: QuestionContainer(question: question),
                 );
               },
             ),
             ),

              Padding(
                padding:
                    const EdgeInsets.only(left: 20, right: 20, ),
                child: Divider(
                  color: mainColor,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                child: Text(
                  'While those who are aware of The Speak Logic Project can make adjustment to their communications from the learning of the principle, people who are unaware of the project and do not understand the principle of communication may continue to struggle. In order for the project to be effective, knowledge of The Speak Logic Project must be spread and you can help us do that. In order to make other people aware of the project, you can do the following:',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              
            ],
          ),
        )),
      ),
    );
  }
}
