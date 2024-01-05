import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  const ButtonComponent(
      {required this.onPressed, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
