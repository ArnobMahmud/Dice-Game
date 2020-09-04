import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DiceGame(),
    );
  }
}

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  var index1 = 0;
  var index2 = 0;

  var dice = [
    'assets/d1.png',
    'assets/d2.png',
    'assets/d3.png',
    'assets/d4.png',
    'assets/d5.png',
    'assets/d6.png'
  ];

  var random1 = Random.secure();
  var random2 = Random.secure();
  var x, y, z;
  var sum = 0;

  void _changeDice() {
    setState(() {
      index1 = random1.nextInt(6);
      index2 = random2.nextInt(6);

      x = index1;
      y = index2;
      x++;
      y++;
      z = x + y;
      sum += z;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: Text(
          'Dice Game',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body:
       Column(
        children: [
          SizedBox(height: 20),
          if (z == 7) ...[
            Text(
              '*******Game Over*******',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.red[500]),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Highest Score : ${sum - z}',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.purple[300],),
            ),
          ] else ...[
            Text(
              'Total Score : $sum',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.purple[300],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Your Score : $z',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.green[600],
                  fontWeight: FontWeight.w600),
            ),
          ],
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                dice[index1],
                width: 120,
                height: 250,
              ),
              SizedBox(width: 40),
              Image.asset(
                dice[index2],
                width: 120,
                height: 250,
              ),
            ],
          ),
          SizedBox(height: 40),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(4, 6),
                  blurRadius: 10,
                  spreadRadius: 1,
                  color: Colors.blueGrey,
                ),
              ],
            ),
            child: RaisedButton(
                color: Colors.brown[200],
                padding: EdgeInsets.all(20),
                child: Text(
                  'ROLL',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),
                onPressed: _changeDice),
          ),
        ],
      ),
    );
  }
}
