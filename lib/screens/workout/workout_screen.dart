import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../../utils/workout_generator.dart';

class WorkoutScreen extends StatelessWidget {
  final UserModel user;

  const WorkoutScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final workouts = WorkoutGenerator.generate(user);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Workout Plan"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text(user.name),
                subtitle: Text("${user.goal} • ${user.activityLevel}"),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: workouts.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.only(bottom: 15),
                    child: ListTile(
                      leading: const Icon(
                        Icons.fitness_center,
                        color: Colors.orange,
                      ),
                      title: Text(
                        workouts[index]["title"]!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(workouts[index]["desc"]!),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
