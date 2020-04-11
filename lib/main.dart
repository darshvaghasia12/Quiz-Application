import 'package:flutter/material.dart';

import './Quiz.dart';

import './result.dart';

void main() {
  runApp(MyApp()); 
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}
class _MyAppState extends State<MyApp>{
   final _questions = const[
      {'questionText':'What is Your Name',
      'answers':[{'text':'Ayush','score':10},{'text':'Darsh','score':6},{'text':'Dhrutik','score':5},{'text':'Krish','score':1}]},
      {'questionText':'What is your Age',  
      'answers':[{'text':'18','score':3},{'text':'19','score':1},{'text':'20','score':4},{'text':'22','score':1}]},
      {'questionText':'What is your Gender',
      'answers':[{'text':'Male','score':1},{'text':'Female','score':1}]},
      ];
  var _questionIndex = 0;
  var _totalScore=0;

  void _resetQuiz() {
    setState(() {
    _questionIndex=0;
    _totalScore=0;
    });
    
  }
  _answerQuestion(int score) {

    _totalScore +=score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if(_questionIndex<_questions.length) {
      print('We have more Questions');
    }
    else 
    {
      print('No More New Questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("DARSH MUSIC")),
        body: _questionIndex<_questions.length ? 
        Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,)  
        : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
