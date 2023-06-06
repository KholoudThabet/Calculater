import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  final String number;
  final Function(String) onPressed;

  const NumberButton({
    required this.number,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => onPressed(number),
          child: Text(number),
        ),
      ),
    );
  }
}
