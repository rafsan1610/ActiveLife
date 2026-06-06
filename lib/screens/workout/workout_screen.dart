import 'package:flutter/material.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Workout Plans"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          WorkoutCard(
            title: "Push Ups",
            description: "3 Sets × 15 Reps",
            icon: Icons.fitness_center,
          ),
          WorkoutCard(
            title: "Squats",
            description: "3 Sets × 20 Reps",
            icon: Icons.accessibility_new,
          ),
          WorkoutCard(
            title: "Plank",
            description: "60 Seconds",
            icon: Icons.timer,
          ),
          WorkoutCard(
            title: "Running",
            description: "20 Minutes",
            icon: Icons.directions_run,
          ),
        ],
      ),
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const WorkoutCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange, size: 40),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}
