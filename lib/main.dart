import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 7,
          child: Center(
            child: Text(
              'This is where the question is going to go.',
              style: TextStyle(color: Colors.white70, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.green),
                  foregroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white),
                  shape: MaterialStateProperty.resolveWith(
                          (states) => BeveledRectangleBorder())),
              child: Text('True'),
              onPressed: () {
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.resolveWith((states) => Colors.red),
                  foregroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white),
                  shape: MaterialStateProperty.resolveWith(
                          (states) => BeveledRectangleBorder())),
              child: Text('False'),
              onPressed: () {
              },
            ),
          ),
        ),
        //TODO: Add a Row widget here as your scorekeeper
      ],
    );
  }
}

/*
Question1: 'Are plants always green?', false,
Question2: 'Are boats always float?', false,
Question3: 'Approximately one quarter of human bones are in the feet', true,
* */