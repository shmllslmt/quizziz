import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizbrain = QuizBrain();

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
  // To check whether user answer is correct or not
  bool isCorrect = false;

  // To keep track of our current position (with regards to the questions and answers)
  int counter = 0;

  // To keep track of the score by adding some icons into it
  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 7,
          child: Center(
            child: Text(
              quizbrain.getQuestion(),
              style: TextStyle(color: Colors.white70, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        // This is the true button
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
                // if user clicked the true button and the answer is also true
                if(quizbrain.getAnswer()) {
                  isCorrect = true;
                }

                setState(() {
                  // if user answer is correct
                  if(isCorrect) {
                    scoreKeeper.add(Icon(Icons.check, color: Colors.green,));
                  }
                  // if user answer is incorrect
                  else {
                    scoreKeeper.add(Icon(Icons.close, color: Colors.red,));
                  }

                  // reset the isCorrect value
                  isCorrect = false;

                  // if we are at the last question, reset to the first
                  if(counter == quizbrain.getTotalQuestion()-1){
                    quizbrain.resetCounter();
                    scoreKeeper.clear();
                  }
                  // else we are going to proceed to the next question
                  else {
                    quizbrain.updateCounter();
                  }
                });
              },
            ),
          ),
        ),
        // This is the false button
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
                if(quizbrain.getAnswer() == false) {
                  isCorrect = true;
                }
                setState(() {
                  // if user answer is correct
                  if(isCorrect) {
                    scoreKeeper.add(Icon(Icons.check, color: Colors.green,));
                  }
                  // if user answer is incorrect
                  else {
                    scoreKeeper.add(Icon(Icons.close, color: Colors.red,));
                  }

                  // reset the isCorrect value
                  isCorrect = false;

                  // if we are at the last question, reset to the first
                  if(counter == quizbrain.getTotalQuestion()-1){
                    quizbrain.resetCounter();
                    scoreKeeper.clear();
                  }
                  // else we are going to proceed to the next question
                  else {
                   quizbrain.updateCounter();
                  }
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

/*
Question1: 'Are plants always green?', false,
Question2: 'Are boats always float?', false,
Question3: 'Approximately one quarter of human bones are in the feet', true,
* */
