import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  int _score = 0;

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What is the capital of France?',
      'answers': ['Paris', 'Berlin', 'Madrid', 'Rome'],
      'correctAnswer': 'Paris',
    },
    {
      'questionText': 'Which programming language is Flutter based on?',
      'answers': ['Dart', 'Java', 'Python', 'Swift'],
      'correctAnswer': 'Dart',
    },
    {
      'questionText': 'What year was Flutter first released?',
      'answers': ['2010', '2015', '2017', '2019'],
      'correctAnswer': '2015',
    },
  ];

  void _answerQuestion(String selectedAnswer) {
    if (_questions[_questionIndex]['correctAnswer'] == selectedAnswer) {
      _score += 1;
    }
    _questionIndex += 1;
    setState(() {}); // Unnecessary setState call
  }

  void _resetQuiz() {
    _questionIndex = 0;
    _score = 0;
    Navigator.pop(context); // Incorrect navigation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Quiz App'),
      ),
      body: Column(
        children: [
          Text(
            _questions[_questionIndex]['questionText'],
            style: TextStyle(fontSize: 20),
          ),
          ...( _questions[_questionIndex]['answers'] as List<String>).map((answer) {
            return ElevatedButton(
              onPressed: () => _answerQuestion(answer),
              child: Text(answer),
            );
          }).toList(),
          if (_questionIndex == _questions.length) // Incorrect condition
            RaisedButton(
              child: Text('Restart Quiz'),
              onPressed: _resetQuiz,
            ),
        ],
      ),
    );
  }
}
