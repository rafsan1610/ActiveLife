import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../auth/login_screen.dart';
import '../bmi/bmi_screen.dart';
import '../calories/calories_screen.dart';
import '../workout/workout_screen.dart';
import '../diet/diet_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ActiveLife Dashboard"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(user?.email ?? "No Email"),
                subtitle: const Text("Logged In User"),
              ),
            ),

            const SizedBox(height: 25),

            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WorkoutScreen(),
                        ),
                      );
                    },
                    child: dashboardCard(
                      "Workout",
                      Icons.fitness_center,
                      Colors.orange,
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DietScreen(),
                        ),
                      );
                    },
                    child: dashboardCard(
                      "Diet Plan",
                      Icons.restaurant,
                      Colors.green,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BMIScreen(),
                        ),
                      );
                    },
                    child: dashboardCard(
                      "BMI",
                      Icons.monitor_weight,
                      Colors.purple,
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CaloriesScreen(),
                        ),
                      );
                    },
                    child: dashboardCard(
                      "Calories",
                      Icons.local_fire_department,
                      Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget dashboardCard(String title, IconData icon, Color color) {
    return Card(
      elevation: 5,
      child: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
