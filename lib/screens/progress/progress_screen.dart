import 'package:flutter/material.dart';

import '../../providers/sleep_provider.dart';
import '../../providers/weight_provider.dart';
import '../../providers/workout_progress_provider.dart';
import '../../providers/user_provider.dart';

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
    final user = UserProvider.getUser();

    double stepProgress = steps / goal;

    double workoutProgress = WorkoutProgressProvider.progress();

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        title: const Text("Progress Dashboard"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      child: Icon(Icons.person, size: 35),
                    ),

                    const SizedBox(width: 20),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user?.name ?? "No Profile",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            user == null
                                ? "Complete Profile"
                                : "${user.goal} • ${user.activityLevel}",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: progressCard(
                    Icons.monitor_weight,
                    Colors.orange,
                    "Weight",
                    WeightProvider.hasWeight()
                        ? "${WeightProvider.getWeight()} kg"
                        : "--",
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: progressCard(
                    Icons.bedtime,
                    Colors.deepPurple,
                    "Sleep",
                    SleepProvider.hasSleepData()
                        ? "${SleepProvider.getSleep()} hr"
                        : "--",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: progressCard(
                    Icons.fitness_center,
                    Colors.orange,
                    "Workout",
                    "${workoutProgress.toStringAsFixed(0)}%",
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: progressCard(
                    Icons.directions_walk,
                    Colors.green,
                    "Steps",
                    "$steps",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Daily Steps",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 15),

            LinearProgressIndicator(
              minHeight: 12,
              value: stepProgress > 1 ? 1 : stepProgress,
              backgroundColor: Colors.grey.shade300,
              color: Colors.teal,
            ),

            const SizedBox(height: 15),

            Text(
              "$steps / $goal Steps",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    steps += 500;
                  });
                },
                icon: const Icon(Icons.add),
                label: const Text(
                  "Add 500 Steps",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    if (steps >= 500) {
                      steps -= 500;
                    }
                  });
                },
                icon: const Icon(Icons.remove),
                label: const Text(
                  "Remove 500 Steps",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      "Overall Progress",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    LinearProgressIndicator(
                      minHeight: 12,
                      value: workoutProgress / 100,
                      backgroundColor: Colors.grey.shade300,
                      color: Colors.orange,
                    ),

                    const SizedBox(height: 15),

                    Text(
                      "${workoutProgress.toStringAsFixed(0)}% Workout Completed",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget progressCard(IconData icon, Color color, String title, String value) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: color.withOpacity(.15),
              child: Icon(icon, color: color, size: 28),
            ),

            const SizedBox(height: 12),

            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            Text(title, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
