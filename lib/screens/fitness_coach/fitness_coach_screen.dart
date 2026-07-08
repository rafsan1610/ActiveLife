import 'package:flutter/material.dart';

class FitnessCoachScreen extends StatelessWidget {
  const FitnessCoachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fitness Coach"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          CoachCard(
            level: "Beginner",
            exercise: "Walking & Stretching",
            duration: "20 Minutes",
            calories: "120 kcal",
            tip: "Start slowly and maintain proper posture.",
            color: Colors.green,
          ),

          SizedBox(height: 15),

          CoachCard(
            level: "Intermediate",
            exercise: "Running + Push Ups",
            duration: "35 Minutes",
            calories: "300 kcal",
            tip: "Maintain a steady pace and stay hydrated.",
            color: Colors.orange,
          ),

          SizedBox(height: 15),

          CoachCard(
            level: "Advanced",
            exercise: "HIIT + Strength Training",
            duration: "60 Minutes",
            calories: "650 kcal",
            tip: "Warm up before exercise and cool down afterward.",
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

class CoachCard extends StatelessWidget {
  final String level;
  final String exercise;
  final String duration;
  final String calories;
  final String tip;
  final Color color;

  const CoachCard({
    super.key,
    required this.level,
    required this.exercise,
    required this.duration,
    required this.calories,
    required this.tip,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  child: const Icon(Icons.fitness_center, color: Colors.white),
                ),

                const SizedBox(width: 15),

                Text(
                  level,
                  style: TextStyle(
                    color: color,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const Divider(height: 30),

            infoTile(Icons.sports_gymnastics, "Exercise", exercise),

            infoTile(Icons.timer, "Duration", duration),

            infoTile(Icons.local_fire_department, "Calories Burn", calories),

            const SizedBox(height: 15),

            const Text(
              "Coach Tip",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),

            const SizedBox(height: 8),

            Text(tip, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget infoTile(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(
            "$title : ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
