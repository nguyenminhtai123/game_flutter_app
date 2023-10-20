import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jankenpon_app/btn_widget.dart';
import 'package:jankenpon_app/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class Jankenpon {
  String? userPick;
  String? computerPick;
  String? result;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
