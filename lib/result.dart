import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore,this.resetQuiz);

  String get resultPhrase {
    var resultText='You did it';
    if(resultScore<=8)
    {
      resultText='You are Awesome and Innocent';
    }
    else if(resultScore<=12)
    {
      resultText='Pretty Likeable';
    }
    else if(resultScore<=16)
    {
      resultText='You are ... Strange';
    }
    else
    {
      resultText='You are So Bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(children: <Widget>[Text(resultPhrase,
          style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),
        ) ,
        FlatButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('Restart Quiz!'),
          onPressed: resetQuiz),
          ]
        )
    );
  }
}