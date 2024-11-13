import 'package:findx/find_x/findX.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'FindX',
      debugShowCheckedModeBanner: false,
      home: FindX(),
    );
  }
}
