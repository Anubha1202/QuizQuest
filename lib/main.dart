import 'dart:ffi';
//import 'question.dart';
import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizbrain quizbrain = Quizbrain();
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Quizzler(),
        ),
      ),
    ),
  ));
}

class Quizzler extends StatefulWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  @override
  //List<Icon>
  //List<String>
  // List<String> questions = [
  //   'Bats are blind',
  //   'it takes a sloth two weeks to digest a meal.',
  //   'An ant can lift 1,000 times its body weight'
  // ];
  // List<bool> answer = [
  //   false,
  //   true,
  //   false,
  // ];
  // List<Question> questionbank = [
  //   Question(q: 'Bats are blind.', a: false),
  //   Question(q: 't takes a sloth two weeks to digest a meal.', a: true),
  //   Question(q: 'An ant can lift 1,000 times its body weight.', a: false),
  // ];
  void checkanswer(bool userpickeranswer) {
    bool correctanswer = quizbrain.getcorrectans();
    setState(() {
      if (quizbrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        quizbrain.reset();
        Scorekeeper = [];
      } else {
        if (userpickeranswer == correctanswer) {
          // print('user got it right');
          Scorekeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          //print('user got it wrong');
          Scorekeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }

        quizbrain.nextquestion();
      }
    });
  }

  List<Icon> Scorekeeper = [];
  // Question q1=Question(q: 'Bats are blind', a:false);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () {},
                child: Text(
                  //  quizbrain.questionbank[questnumber].questionText, //only string wala part needed jo ki question text ke name se,question bank is property of quiz brain
                  quizbrain.getQuestiontext(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            //flex: 2,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  // bool correctans = quizbrain
                  //     .questionbank[questnumber].questionAnswer; //answer chaiye
                  // bool correctans = quizbrain.getcorrectans();
                  //
                  // setState(() {
                  //   quizbrain.nextquestion();
                  // });

                  // 1.setState(() {
                  //   questnumber++;
                  // });
                  checkanswer(true);
                },
                child: Text(
                  'TRUE',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20.0),
                ),
              ),
            ),
          ),
          Expanded(
            //    flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  //
                  checkanswer(false);
                },
                child: Text(
                  'FALSE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          Row(
            // children: <Widget>[
            //   Icon(
            //     Icons.check,
            //     size: 30.0,
            //     color: Colors.green,
            //   ),
            //   Icon(
            //     Icons.close,
            //     size: 30.0,
            //     color: Colors.red,
            //   ),
            //   Icon(
            //     Icons.close,
            //     size: 30.0,
            //     color: Colors.red,
            //   ),
            //   Icon(
            //     Icons.close,
            //     size: 30.0,
            //     color: Colors.red,
            //   ),
            //   Icon(
            //     Icons.close,
            //     size: 30.0,
            //     color: Colors.red,
            //   ),
            children: Scorekeeper,
          ),
        ],
      ),
    );
  }
}
/*
Q1: MY MOTHER/'S DAUGHTER IS CUTIEEE
HERE/'S MEANS THAT TO NOT CONFUSE COMPUTER FOR ENDING STRING WE ADD / THIS TO OUR STRING
 */
/*
q1 Bats are blind.-false
q2t takes a sloth two weeks to digest a meal.--True
q3 An ant can lift 1,000 times its body weight.--false
 */
