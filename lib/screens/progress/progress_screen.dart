import 'package:flutter/material.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  int steps = 0;
  final int goal = 10000;

  @override
  Widget build(BuildContext context) {
    double progress = steps / goal;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Progress"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Text(
              "Daily Step Goal",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            CircularProgressIndicator(
              value: progress > 1 ? 1 : progress,
              strokeWidth: 12,
            ),

            const SizedBox(height: 25),

            Text(
              "$steps / $goal Steps",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  steps += 500;
                });
              },
              icon: const Icon(Icons.directions_walk),
              label: const Text("Add 500 Steps"),
            ),

            const SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  if (steps >= 500) {
                    steps -= 500;
                  }
                });
              },
              icon: const Icon(Icons.remove),
              label: const Text("Remove 500 Steps"),
            ),
          ],
        ),
      ),
    );
  }
}
