import 'package:calc/widgets/equal.dart';
import 'package:calc/widgets/numbers.dart';
import 'package:calc/widgets/operatorButton.dart';
import 'package:flutter/material.dart';
import 'package:calc/calcMethods.dart';

class CalculatorWidget extends StatefulWidget {
  @override
  _CalculatorWidgetState createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  String _displayValue = '0';
  String _operator = '';
  int _firstOperand = 0;
  int _secondOperand = 0;

  void _onNumberPressed(String number) {
    setState(() {
      if (_displayValue == '0') {
        _displayValue = number;
      } else {
        _displayValue += number;
      }
    });
  }

  void _onOperatorPressed(String operator) {
    setState(() {
      _operator = operator;
      _firstOperand = int.parse(_displayValue);
      _displayValue = '0';
    });
  }

  void _onEqualPressed() {
    setState(() {
      _secondOperand = int.parse(_displayValue);
      num result = switchOperation(_firstOperand, _secondOperand, _operator);
      _displayValue = result.toString();
      _operator = '';
      _firstOperand = 0;
      _secondOperand = 0;
    });
  }

  num switchOperation(int a, int b, String operator) {
    switch (operator) {
      case '+':
        return CalcMethods.summation(a, b);
      case '-':
        return CalcMethods.subtraction(a, b);
      case '*':
        return CalcMethods.multiplication(a, b);
      case '/':
        return CalcMethods.division(a, b);
      default:
        throw ArgumentError("Invalid operator");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _displayValue,
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ),
          Divider(height: 1.0),
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                children: [
                  // Inside the CalculatorWidget class
                  Row(
                    children: [
                      NumberButton(
                        number: '7',
                        onPressed: _onNumberPressed,
                      ),
                      NumberButton(
                        number: '8',
                        onPressed: _onNumberPressed,
                      ),
                      NumberButton(
                        number: '9',
                        onPressed: _onNumberPressed,
                      ),
                    ],
                  ),

                  // Inside the CalculatorWidget class
                  Row(
                    children: [
                      NumberButton(
                        number: '4',
                        onPressed: _onNumberPressed,
                      ),
                      NumberButton(
                        number: '5',
                        onPressed: _onNumberPressed,
                      ),
                      NumberButton(
                        number: '6',
                        onPressed: _onNumberPressed,
                      ),
                    ],
                  ),

                  // Inside the CalculatorWidget class
                  Row(
                    children: [
                      NumberButton(
                        number: '1',
                        onPressed: _onNumberPressed,
                      ),
                      NumberButton(
                        number: '2',
                        onPressed: _onNumberPressed,
                      ),
                      NumberButton(
                        number: '3',
                        onPressed: _onNumberPressed,
                      ),
                    ],
                  ),

                  // Inside the CalculatorWidget class
                  Row(
                    children: [
                      NumberButton(
                        number: '0',
                        onPressed: _onNumberPressed,
                      ),
                      NumberButton(
                        number: '.',
                        onPressed: _onNumberPressed,
                      ),
                      NumberButton(
                        number: 'c',
                        onPressed: _onNumberPressed,
                      ),
                    ],
                  ),

                  // Inside the CalculatorWidget class
                  Row(
                    children: [
                      OperatorButton(
                        operator: '+',
                        onPressed: _onOperatorPressed,
                      ),
                      OperatorButton(
                        operator: '-',
                        onPressed: _onOperatorPressed,
                      ),
                      OperatorButton(
                        operator: '*',
                        onPressed: _onOperatorPressed,
                      ),
                      OperatorButton(
                        operator: '/',
                        onPressed: _onOperatorPressed,
                      ),
                    ],
                  ),
                  // Inside the CalculatorWidget class
                  // Inside the CalculatorWidget class
                  Row(
                    children: [
                      Equal(
                        operator: '=',
                        onPressed: _onEqualPressed,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
