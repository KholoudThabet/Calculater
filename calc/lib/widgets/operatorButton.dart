import 'package:flutter/material.dart';

class OperatorButton extends StatelessWidget {
  final String operator;
  final Function(String) onPressed;

  const OperatorButton({
    required this.operator,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => onPressed(operator),
          child: Text(operator),
        ),
      ),
    );
  }
}
