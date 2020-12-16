import 'package:flutter/material.dart';
import 'CalculatorButton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  @override
  CalculatorAppState createState() => CalculatorAppState();
}

class CalculatorAppState extends State<CalculatorApp> {
  String history = '';
  String current = '';

  void numClick(String text) {
    setState(() {
      if (current == '') {
        if (text != ')' &&
            text != '%' &&
            text != '/' &&
            text != '*' &&
            text != '-' &&
            text != '+') {
          current += text;
        }
      } else if (current == '0') {
        if (text != '0') {
          current += text;
        }
      } else if (current == 'Undefined') {
        current = '';
        history = '';
        current += text;
      } else if (current == '(') {
        if (text != '(') {
          current += text;
        }
      } else
        current += text;
    });
  }

  void allClear(String text) {
    setState(() {
      history = '';
      current = '';
    });
  }

  void equal(String text) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(current);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        history = current;
        if (eval.toString() == 'Infinity')
          current = 'Undefined';
        else if (eval >= 0 || eval <= 0)
          current = eval.toString();
        else {
          current = '';
          history = '';
        }
      });
    } catch (e) {
      allClear('AC');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment(1, 1),
              child: Text(
                history,
                style: TextStyle(fontSize: 24, color: Colors.white12),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment(1, 1),
              child: Text(
                current,
                style: TextStyle(fontSize: 48, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  text: 'AC',
                  textColor: 0xFF1C1C1C,
                  fillColor: 0xFFD4D4D2,
                  callback: allClear,
                ),
                CalculatorButton(
                  text: '(',
                  textColor: 0xFF1C1C1C,
                  fillColor: 0xFFD4D4D2,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: ')',
                  textColor: 0xFF1C1C1C,
                  fillColor: 0xFFD4D4D2,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '/',
                  textColor: 0xFFFFFFFF,
                  fillColor: 0xFFFF9500,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  text: '7',
                  textColor: 0xFFFFFFFF,
                  fillColor: 0xFF505050,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '8',
                  textColor: 0xFFFFFFFF,
                  fillColor: 0xFF505050,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '9',
                  textColor: 0xFFFFFFFF,
                  fillColor: 0xFF505050,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '*',
                  textColor: 0xFFFFFFFF,
                  fillColor: 0xFFFF9500,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  text: '4',
                  textColor: 0xFFFFFFFF,
                  fillColor: 0xFF505050,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '5',
                  textColor: 0xFFFFFFFF,
                  fillColor: 0xFF505050,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '6',
                  textColor: 0xFFFFFFFF,
                  fillColor: 0xFF505050,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '-',
                  textColor: 0xFFFFFFFF,
                  fillColor: 0xFFFF9500,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  text: '1',
                  textColor: 0xFFFFFFFF,
                  fillColor: 0xFF505050,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '2',
                  textColor: 0xFFFFFFFF,
                  fillColor: 0xFF505050,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '3',
                  textColor: 0xFFFFFFFF,
                  fillColor: 0xFF505050,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '+',
                  textColor: 0xFFFFFFFF,
                  fillColor: 0xFFFF9500,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  text: '.',
                  textColor: 0xFF1C1C1C,
                  fillColor: 0xFFD4D4D2,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '0',
                  textColor: 0xFFFFFFFF,
                  fillColor: 0xFF505050,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '%',
                  textColor: 0xFF1C1C1C,
                  fillColor: 0xFFD4D4D2,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '=',
                  textColor: 0xFFFFFFFF,
                  fillColor: 0xFFFF9500,
                  callback: equal,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
