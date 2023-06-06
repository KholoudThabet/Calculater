import 'package:flutter/material.dart';

class Equal extends StatelessWidget {
  final void Function() onPressed;
  final String operator;

  const Equal({
    Key? key,
    required this.onPressed,
    required this.operator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => onPressed(),
          child: Text(operator),
        ),
      ),
    );
  }
}
