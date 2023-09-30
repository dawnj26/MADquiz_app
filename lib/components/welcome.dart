import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome(this.startGame, {super.key});
  final VoidCallback startGame;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/quiz_banner.png'),
        const Text(
          'Play the Quiz Game!',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: OutlinedButton(
              onPressed: startGame,
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.orange.shade300),
              child: const Text(
                'Play',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        )
      ],
    );
  }
}
