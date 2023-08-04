import 'package:flutter/material.dart';

class CardHome extends StatefulWidget {
  const CardHome({super.key, required this.title});

  final String title;

  @override
  State<CardHome> createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Text(
        widget.title,
        style: TextStyle(color: Theme.of(context).colorScheme.background),
      ),
    );
  }
}
