import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlue.shade500,
        appBar: AppBar(
          title: Center(
              child: Text(
            'Dicee',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          )),
          backgroundColor: Colors.lightBlue.shade500,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  //Declaring the Variables
  int leftDiceNumber = Random().nextInt(6) + 1;
  int rightDiceNumber = Random().nextInt(6) + 1;
  int leftDiceScore = 0;
  int rightDiceScore = 0;
  bool answer;
  //Declaring the Functions
  void generateRandom() {
    //We Don't want the zero AS the range will be (0 ~ 5)
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;
  }

  bool checkSimilar() {
    answer = false;
    if (leftDiceNumber == rightDiceNumber) {
      answer = true;
    }
    return answer;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "Left Score: $leftDiceScore",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Right Score: $rightDiceScore",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              //flex: 2,
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    generateRandom();
                    if (checkSimilar()) {
                      leftDiceScore += 1;
                    }
                  });
                },
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
            ),
            Expanded(
              //flex: 1,
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    generateRandom();
                    if (checkSimilar()) {
                      rightDiceScore += 1;
                    }
                  });
                },
                child: Image(
                  image: AssetImage("images/dice$rightDiceNumber.png"),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
