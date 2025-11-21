// Fareed 12032192
// CSCI410 Mobile Application Project 1

import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const HaircutEstimatorApp());
}

class HaircutEstimatorApp extends StatelessWidget {
  const HaircutEstimatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
