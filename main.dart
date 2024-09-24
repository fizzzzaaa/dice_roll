import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(DiceApp());

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  @override
  _DiceScreenState createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> with TickerProviderStateMixin {
  int _diceNumber1 = 1;
  int _diceNumber2 = 1;
  int _diceNumber3 = 1;
  int _diceNumber4 = 1;

  late AnimationController _controller1;
  late Animation<double> _animation1;

  late AnimationController _controller2;
  late Animation<double> _animation2;

  late AnimationController _controller3;
  late Animation<double> _animation3;

  late AnimationController _controller4;
  late Animation<double> _animation4;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation1 = Tween<double>(begin: 0, end: 2 * pi).animate(_controller1);

    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation2 = Tween<double>(begin: 0, end: 2 * pi).animate(_controller2);

    _controller3 = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation3 = Tween<double>(begin: 0, end: 2 * pi).animate(_controller3);

    _controller4 = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation4 = Tween<double>(begin: 0, end: 2 * pi).animate(_controller4);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    super.dispose();
  }

  void _rolDice1() {
    _controller1.forward(from: 0); // Start animation
    setState(() {
      _diceNumber1 = Random().nextInt(6) + 1;
    });
  }

  void _rolDice2() {
    _controller2.forward(from: 0);
    setState(() {
      _diceNumber2 = Random().nextInt(6) + 1;
    });
  }

  void _rolDice3() {
    _controller3.forward(from: 0);
    setState(() {
      _diceNumber3 = Random().nextInt(6) + 1;
    });
  }

  void _rolDice4() {
    _controller4.forward(from: 0);
    setState(() {
      _diceNumber4 = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roll'),
        backgroundColor: Colors.deepOrange,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.deepOrangeAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDiceColumn(
                  'Rolling Number: $_diceNumber1',
                  'images/dice-$_diceNumber1.png',
                  _animation1,
                  _rolDice1,
                ),
                SizedBox(width: 100),
                _buildDiceColumn(
                  'Rolling Number: $_diceNumber2',
                  'images/dice-$_diceNumber2.png',
                  _animation2,
                  _rolDice2,
                ),
              ],
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDiceColumn(
                  'Rolling Number: $_diceNumber3',
                  'images/dice-$_diceNumber3.png',
                  _animation3,
                  _rolDice3,
                ),
                SizedBox(width: 100),
                _buildDiceColumn(
                  'Rolling Number: $_diceNumber4',
                  'images/dice-$_diceNumber4.png',
                  _animation4,
                  _rolDice4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiceColumn(String text, String imagePath, Animation<double> animation, VoidCallback onPressed) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Transform.rotate(
              angle: animation.value,
              child: Image.asset(
                imagePath,
                height: 100,
              ),
            );
          },
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: onPressed,
          child: Text(' Roll the Dice '),
        ),
      ],
    );
  }
}



