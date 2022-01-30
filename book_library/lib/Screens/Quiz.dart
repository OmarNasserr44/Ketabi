import 'package:book_library/GetX/GetX.dart';
import 'package:book_library/Widgets/BackArrow.dart';
import 'package:book_library/constants/QuizQuestions.dart';
import 'package:book_library/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizScreen();
  }
}

class _QuizScreen extends State<QuizScreen> {
  final questionController = Get.find<QuestionsController>();

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < questionController.questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: backGColor3,
        body: Stack(
          children: [
            BackArrow(screenSize: screenSize),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: _questionIndex < questionController.questions.length
                  ? Quiz(
                      answerQuestion: _answerQuestion,
                      questionIndex: _questionIndex,
                      questions: questionController.questions,
                    ) //Quiz
                  : Result(_totalScore),
            ),
          ],
        ),
        //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'].toString(),
        ), //Question
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']), answer['text'].toString());
        }).toList()
      ],
    ); //Column
  }
}

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(screenSize.width / 10),
      child: Container(
        height: screenSize.height / 3.5,
        width: screenSize.width,
        child: ListView(
          children: [
            Text(
              questionText,
              style: TextStyle(
                  fontSize: screenSize.width / 13, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ), //Text
    ); //Container
  }
}

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: screenSize.height / 40),
      child: GestureDetector(
        onTap: selectHandler,
        child: Container(
          width: screenSize.width / 1.2,
          height: screenSize.height / 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenSize.width / 35),
            color: bannerColor,
          ),
          child: Center(
              child: ListView(
            children: [
              Text(
                answerText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: screenSize.width / 18),
              ),
            ],
          )),
          //RaisedButton
        ),
      ),
    ); //Container
  }
}

class Result extends StatelessWidget {
  final int resultScore;

  Result(this.resultScore);

  //Remark Logic
  String get resultPhrase {
    Get.find<ControllerGetX>().quizResult = resultScore.toString();
    String resultText;
    if (resultScore >= 3) {
      resultText = 'نتيجة رائعة!';
      print(resultScore);
    } else if (resultScore == 2) {
      resultText = 'احسنــت';
      print(resultScore);
    } else if (resultScore == 1) {
      resultText = 'تحتاج الى قليل من التركيز';
    } else {
      resultText = 'اعد قراءة الكتاب';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          Text(
            'النتيجة  ' '$resultScore',
            textDirection: TextDirection.rtl,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          MaterialButton(
            child: Text(
              'ارسل النتيجة',
            ), //Text
            textColor: Colors.blue,
            onPressed: () async {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: bannerColor,
                content: Text(
                  "برجاء الانتظار",
                  style: TextStyle(
                      color: Colors.white, fontSize: screenSize.width / 20),
                ),
              ));
              await Get.find<ControllerGetX>().sendEmail();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: bannerColor,
                content: Text(
                  "تم ارسال النتيجة بنجاح",
                  style: TextStyle(
                      color: Colors.white, fontSize: screenSize.width / 20),
                ),
              ));
            },
          ), //FlatButton
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}
