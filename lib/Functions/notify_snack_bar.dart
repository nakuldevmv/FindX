import 'package:flutter/material.dart';

void notifySnackBar(
  BuildContext context,
  String message, {
  Duration duration = const Duration(seconds: 4),
}) {
  // Remove any existing snackbars
  ScaffoldMessenger.of(context).clearSnackBars();

  // Create a default SnackBar
  final snackBar = SnackBar(
    backgroundColor: Colors.black45,
    content: Center(child: Text(message)),
    duration: duration,
  );

  // Show the snackbar
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
