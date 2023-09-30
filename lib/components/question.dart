import 'package:flutter/material.dart';
import 'package:quiz_app/data/list_questions.dart';

class Question extends StatelessWidget {
  const Question({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Content(),
    );
  }
}

// Contents inside the Padding Widget
class Content extends StatefulWidget {
  const Content({
    super.key,
  });

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  var i = 0;
  var score = 0;
  var isFinished = false;

  // List of data
  final question = QUESTIONS;
  final answers = ANSWERS;

  // Reset the game variables
  void restartGame() {
    setState(() {
      isFinished = false;
      i = 0;
      score = 0;
    });
  }

  void answer(bool n) {
    setState(() {
      // Check if the answer is correct
      if (n == answers[i]) score++;

      // After answering all questions change isFinished to true
      // to move to Score widget
      if (i == question.length - 1) {
        isFinished = true;
        return;
      }
      i++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Check if the game isFinished, if it is finished then call the
    // Score widget and pass the score and restart function
    return isFinished
        ? Score(score, restartGame)
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Question 1',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                question[i],
                style: const TextStyle(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () => answer(true),
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.orange.shade300),
                        child: const Text(
                          'True',
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () => answer(false),
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.orange.shade300),
                          child: const Text(
                            'False',
                            style: TextStyle(color: Colors.black),
                          ))),
                ],
              ),
            ],
          );
  }
}

class Score extends StatelessWidget {
  // Store the total score and the address of restart function
  const Score(this.totalScore, this.restart, {super.key});

  final int totalScore;
  final VoidCallback restart;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Score:',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          '$totalScore / 3',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
            // this will Call the restart function from the Contents
            // widget and it will run there to restart the game
            onPressed: restart,
            child: const Text('Play again'))
      ],
    );
  }
}
