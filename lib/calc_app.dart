import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = '';
  Widget btn1(var textt1) {
    return Expanded(
        child: OutlinedButton(
            onPressed: () {
              setState(() {
                result = result + textt1;
              });
            },
            child: Text(
              textt1,
              style: TextStyle(
                fontSize: 35.0,
              ),
            )));
  }

  Widget btn2(var textt2) {
    return Expanded(
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                result = result + textt2;
              });
            },
            child: Text(
              textt2,
              style: TextStyle(
                fontSize: 35.0,
              ),
            )));
  }

  clear() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Calculator")),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Text(
                result,
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
            ),
            Row(
              children: [
                btn1('('),
                btn1(')'),
                btn1('/'),
                Expanded(
                    child: ElevatedButton(
                        onPressed: clear,
                        child: Text(
                          "C",
                          style: TextStyle(
                            fontSize: 35.0,
                          ),
                        ))),
              ],
            ),
            Row(
              children: [
                btn1("7"),
                btn1("8"),
                btn1("9"),
                btn2('-'),
              ],
            ),
            Row(
              children: [
                btn1("4"),
                btn1("5"),
                btn1("6"),
                btn2('+'),
              ],
            ),
            Row(
              children: [
                btn1("1"),
                btn1("2"),
                btn1("3"),
                btn2('*'),
              ],
            ),
            Row(
              children: [
                btn1('.'),
                btn1("0"),
                btn1(','),
                Expanded(
                    child: ElevatedButton(
                        onPressed: output,
                        child: Text(
                          "=",
                          style: TextStyle(
                            fontSize: 35.0,
                          ),
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
