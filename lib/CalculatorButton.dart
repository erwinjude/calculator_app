import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final Function callback;
  CalculatorButton({this.fillColor, this.textColor, this.text, this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: SizedBox(
        width: 65,
        height: 65,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              color: Color(textColor),
            ),
          ),
          onPressed: () {
            callback(text);
          },
          color: Color(fillColor),
        ),
      ),
    );
  }
}
