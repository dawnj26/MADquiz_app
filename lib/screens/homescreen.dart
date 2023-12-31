import 'package:flutter/material.dart';
import 'package:quiz_app/components/question.dart';
import 'package:quiz_app/components/welcome.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPlay = false;

  void startGame() {
    setState(() {
      isPlay = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade100,
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: Colors.red.shade300,
      ),
      // Check if Play button is pressed, if pressed then
      // go to Question widget
      body: isPlay ? const Question() : Welcome(startGame),
    );
  }
}
