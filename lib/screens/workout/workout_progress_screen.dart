import 'package:flutter/material.dart';

import '../../providers/workout_progress_provider.dart';

class WorkoutProgressScreen extends StatefulWidget {
  const WorkoutProgressScreen({super.key});

  @override
  State<WorkoutProgressScreen> createState() => _WorkoutProgressScreenState();
}

class _WorkoutProgressScreenState extends State<WorkoutProgressScreen> {
  @override
  Widget build(BuildContext context) {
    final workouts = WorkoutProgressProvider.getWorkouts();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Workout Progress"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.fitness_center, size: 90, color: Colors.orange),

            const SizedBox(height: 15),

            const Text(
              "Today's Workout",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: ListView(
                children: workouts.keys.map((exercise) {
                  return Card(
                    elevation: 4,
                    child: CheckboxListTile(
                      value: workouts[exercise],
                      activeColor: Colors.orange,
                      title: Text(
                        exercise,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          WorkoutProgressProvider.toggleWorkout(exercise);
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 10),

            LinearProgressIndicator(
              minHeight: 12,
              value: WorkoutProgressProvider.progress() / 100,
              backgroundColor: Colors.grey.shade300,
              color: Colors.orange,
            ),

            const SizedBox(height: 15),

            Text(
              "${WorkoutProgressProvider.completedCount()} / ${WorkoutProgressProvider.totalCount()} Exercises Completed",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              "${WorkoutProgressProvider.progress().toStringAsFixed(0)}% Completed",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.refresh),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    WorkoutProgressProvider.reset();
                  });
                },
                label: const Text(
                  "Reset Progress",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
