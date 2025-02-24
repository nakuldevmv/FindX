import 'package:flutter/material.dart';

void notifySnackBar(
  BuildContext context,
  String message, {
  Duration duration = const Duration(seconds: 4),
}) {
  ScaffoldMessenger.of(context).clearSnackBars();

  final snackBar = SnackBar(
    backgroundColor: Colors.black45,
    content: Center(child: Text(message)),
    duration: duration,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
