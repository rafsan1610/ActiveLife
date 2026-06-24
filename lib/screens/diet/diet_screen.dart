import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../../utils/diet_generator.dart';

class DietScreen extends StatelessWidget {
  final UserModel user;

  const DietScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final meals = DietGenerator.generate(user);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Diet Plan"),
        backgroundColor: Colors.green,
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
                itemCount: meals.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.only(bottom: 15),
                    child: ListTile(
                      leading: const Icon(
                        Icons.restaurant,
                        color: Colors.green,
                      ),
                      title: Text(
                        meals[index]["meal"]!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(meals[index]["food"]!),
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
