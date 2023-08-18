import 'package:flutter/material.dart';

class BaseBody extends StatefulWidget {
  const BaseBody({super.key, required this.child});

  final Widget child;

  @override
  State<BaseBody> createState() => _BaseBodyState();
}

class _BaseBodyState extends State<BaseBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: widget.child,
    );
  }
}
