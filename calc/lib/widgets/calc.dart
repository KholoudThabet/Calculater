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
                  Row(
                    children: [
                      _buildNumberButton('7'),
                      _buildNumberButton('8'),
                      _buildNumberButton('9'),
                    ],
                  ),
                  Row(
                    children: [
                      _buildNumberButton('4'),
                      _buildNumberButton('5'),
                      _buildNumberButton('6'),
                    ],
                  ),
                  Row(
                    children: [
                      _buildNumberButton('1'),
                      _buildNumberButton('2'),
                      _buildNumberButton('3'),
                    ],
                  ),
                  Row(
                    children: [
                      _buildNumberButton('0'),
                      _buildNumberButton('.'),
                      _buildNumberButton('C'),
                    ],
                  ),
                  Row(
                    children: [
                      _buildOperatorButton('+'),
                      _buildOperatorButton('-'),
                      _buildOperatorButton('*'),
                      _buildOperatorButton('/'),
                    ],
                  ),
                  Row(
                    children: [
                      _buildEqualButton(),
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

  Widget _buildNumberButton(String number) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => _onNumberPressed(number),
          child: Text(number),
        ),
      ),
    );
  }

  Widget _buildOperatorButton(String operator) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => _onOperatorPressed(operator),
          child: Text(operator),
        ),
      ),
    );
  }

  Widget _buildEqualButton() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: _onEqualPressed,
          child: Text('='),
        ),
      ),
    );
  }
}
