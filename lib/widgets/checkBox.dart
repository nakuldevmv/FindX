import 'package:flutter/material.dart';

class checkBox extends StatefulWidget {
  const checkBox({super.key});

  @override
  State<checkBox> createState() => _checkBoxState();
}

class _checkBoxState extends State<checkBox> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      child: Text("data"),
    );
  }
}
