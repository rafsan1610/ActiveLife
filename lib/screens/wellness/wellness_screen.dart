import 'package:flutter/material.dart';

import '../../providers/user_provider.dart';

class WellnessScreen extends StatelessWidget {
  const WellnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserProvider.getUser();

    List<String> tips = [];

    if (user == null) {
      tips = ["Complete your profile first."];
    } else if (user.goal == "Weight Loss") {
      tips = [
        "🚶 Walk at least 45 minutes daily.",
        "🥗 Eat low-calorie healthy meals.",
        "💧 Drink at least 3 liters of water.",
        "🏋 Do cardio exercises 5 days a week.",
        "😴 Sleep 7-8 hours every night.",
        "🚫 Avoid sugary drinks and junk food.",
      ];
    } else if (user.goal == "Weight Gain") {
      tips = [
        "🍗 Eat high-protein foods.",
        "🥛 Drink milk every day.",
        "🥚 Eat eggs and healthy fats.",
        "🏋 Focus on strength training.",
        "🍌 Eat bananas and nuts.",
        "😴 Sleep at least 8 hours.",
      ];
    } else {
      tips = [
        "🥗 Eat a balanced diet.",
        "🚶 Walk at least 30 minutes.",
        "💧 Drink enough water.",
        "🏋 Exercise regularly.",
        "😴 Sleep 7-8 hours.",
        "🧘 Reduce stress and stay active.",
      ];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wellness Tips"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.teal,
              child: Icon(Icons.favorite, color: Colors.white, size: 40),
            ),

            const SizedBox(height: 20),

            Text(
              user == null
                  ? "Complete Your Profile"
                  : "${user.name}'s Wellness Tips",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: ListView.builder(
                itemCount: tips.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.only(bottom: 15),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.teal,
                        child: Icon(Icons.check, color: Colors.white),
                      ),
                      title: Text(
                        tips[index],
                        style: const TextStyle(fontSize: 16),
                      ),
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
