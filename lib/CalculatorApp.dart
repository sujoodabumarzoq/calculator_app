import 'package:flutter/material.dart';
import 'package:calculator_app/buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  double firstNumber = 0.0;
  double secondNumber = 0.0;
  var input = '';
  var output = '';
  var operation = '';
  var hideInput = false;
  var outputSize = 34.0;

  void onButtonClick(value) {
    if (value == 'AC') {
      input = '';
      output = '';
    } else if (value == '<') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == '=') {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll('X', '*');
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        input = output;
        hideInput = true;
        outputSize = 52.0;
      }
    } else {
      input = input + value;
      hideInput = false;
      outputSize = 34.0;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    hideInput ? '' : input,
                    style: const TextStyle(
                      fontSize: 48,
                      color: Color(0xff4A55A2),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    output,
                    style: TextStyle(
                      fontSize: outputSize,
                      color:const Color(0xff4A55A2),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          Row(children: [
            CalculatorButton(
              text: 'AC',
              buttonBGcolor: const Color(0xff4A55A2),
              tColor: const Color(0xffA0BFE0),
              onPressed: () => onButtonClick('AC'),
            ),
            CalculatorButton(
              text: '/',
              buttonBGcolor: const Color(0xff4A55A2),
              tColor: const Color(0xffA0BFE0),
              onPressed: () => onButtonClick('/'),
            ),
            CalculatorButton(
              text: '<',
              buttonBGcolor: const Color(0xff4A55A2),
              tColor: const Color(0xffA0BFE0),
              onPressed: () => onButtonClick('<'),
            ),
          ]),
          Row(children: [
            CalculatorButton(
              text: '7',
              buttonBGcolor: const Color(0xff4A55A2),

              onPressed: () => onButtonClick('7'),
            ),
            CalculatorButton(
              text: '8',
              buttonBGcolor: const Color(0xff4A55A2),

              onPressed: () => onButtonClick('8'),
            ),
            CalculatorButton(
              buttonBGcolor: const Color(0xff4A55A2),

              text: '9',
              onPressed: () => onButtonClick('9'),
            ),
            CalculatorButton(
              text: 'X',
              buttonBGcolor: const Color(0xff4A55A2),
              tColor:const  Color(0xffA0BFE0),
              onPressed: () => onButtonClick('X'),
            ),
          ]),
          Row(children: [
            CalculatorButton(
              buttonBGcolor: const Color(0xff4A55A2),

              text: '4',
              onPressed: () => onButtonClick('4'),
            ),
            CalculatorButton(
              buttonBGcolor: const Color(0xff4A55A2),

              text: '5',
              onPressed: () => onButtonClick('5'),
            ),
            CalculatorButton(
              buttonBGcolor: const Color(0xff4A55A2),

              text: '6',
              onPressed: () => onButtonClick('6'),
            ),
            CalculatorButton(
              text: '-',
              buttonBGcolor:  const Color(0xff4A55A2),
              tColor: const Color(0xffA0BFE0),
              onPressed: () => onButtonClick('-'),
            ),
          ]),
          Row(children: [
            CalculatorButton(
              buttonBGcolor: const Color(0xff4A55A2),

              text: '1',
              onPressed: () => onButtonClick('1'),
            ),
            CalculatorButton(
              buttonBGcolor: const Color(0xff4A55A2),

              text: '2',
              onPressed: () => onButtonClick('2'),
            ),
            CalculatorButton(
              buttonBGcolor: const Color(0xff4A55A2),

              text: '3',
              onPressed: () => onButtonClick('3'),
            ),
            CalculatorButton(
              text: '+',
              buttonBGcolor: const Color(0xff4A55A2),
              tColor: const Color(0xffA0BFE0),
              onPressed: () => onButtonClick('+'),
            ),
          ]),
          Row(children: [
            CalculatorButton(
              text: '%',
              buttonBGcolor: const Color(0xff4A55A2),
              tColor:const  Color(0xffA0BFE0),
              onPressed: () => onButtonClick('%'),
            ),
            CalculatorButton(
              buttonBGcolor: const Color(0xff4A55A2),

              text: '0',
              onPressed: () => onButtonClick('0'),
            ),
            CalculatorButton(
              buttonBGcolor: const Color(0xff4A55A2),

              text: '.',
              onPressed: () => onButtonClick('.'),
            ),
            CalculatorButton(
              text: '=',
              buttonBGcolor: const Color(0xffA0BFE0),
              onPressed: () => onButtonClick('='),
            ),
          ]),
        ],
      ),
    );
  }
}
