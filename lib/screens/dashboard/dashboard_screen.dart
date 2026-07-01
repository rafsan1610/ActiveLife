import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../providers/user_provider.dart';
import '../../providers/sleep_provider.dart';
import '../../providers/weight_provider.dart';
import '../../providers/workout_progress_provider.dart';

import '../auth/login_screen.dart';
import '../profile/profile_screen.dart';
import '../workout/workout_screen.dart';
import '../diet/diet_screen.dart';
import '../bmi/bmi_screen.dart';
import '../calories/calories_screen.dart';
import '../water/water_screen.dart';
import '../sleep/sleep_screen.dart';
import '../progress/progress_screen.dart';
import '../weight/weight_screen.dart';
import '../wellness/wellness_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    final user = UserProvider.getUser();

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        title: const Text("ActiveLife"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        elevation: 0,

        actions: [
          IconButton(
            icon: const Icon(Icons.logout),

            onPressed: () async {
              await FirebaseAuth.instance.signOut();

              UserProvider.clearUser();

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    "Hello ${firebaseUser?.email?.split('@')[0] ?? "User"} 👋",

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  if (user != null) ...[
                    Text(
                      "Goal : ${user.goal}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      "BMI : ${user.bmi.toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      user.bmiStatus,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      user.recommendation,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),
                  ] else
                    const Text(
                      "Complete your profile to unlock all features.",

                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: infoCard(
                          Icons.monitor_weight,
                          Colors.orange,
                          WeightProvider.hasWeight()
                              ? "${WeightProvider.getWeight()} kg"
                              : "--",
                          "Weight",
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: infoCard(
                          Icons.bedtime,
                          Colors.deepPurple,
                          SleepProvider.hasSleepData()
                              ? "${SleepProvider.getSleep()} hr"
                              : "--",
                          "Sleep",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: infoCard(
                          Icons.fitness_center,
                          Colors.orange,
                          "${WorkoutProgressProvider.progress().toStringAsFixed(0)}%",
                          "Workout",
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: infoCard(
                          Icons.water_drop,
                          Colors.blue,
                          "0 / 8",
                          "Water",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            GridView.count(
              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),

              crossAxisCount: 2,

              crossAxisSpacing: 15,

              mainAxisSpacing: 15,

              childAspectRatio: 1.08,

              children: [
                dashboardCard(
                  context,
                  "Workout",
                  Icons.fitness_center,
                  Colors.orange,
                  () {
                    if (!UserProvider.hasUser()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please complete your profile first"),
                        ),
                      );
                      return;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            WorkoutScreen(user: UserProvider.getUser()!),
                      ),
                    );
                  },
                ),

                dashboardCard(
                  context,
                  "Diet",
                  Icons.restaurant,
                  Colors.green,
                  () {
                    if (!UserProvider.hasUser()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please complete your profile first"),
                        ),
                      );
                      return;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            DietScreen(user: UserProvider.getUser()!),
                      ),
                    );
                  },
                ),

                dashboardCard(
                  context,
                  "Profile",
                  Icons.person,
                  Colors.indigo,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ProfileScreen()),
                    );
                  },
                ),

                dashboardCard(
                  context,
                  "BMI",
                  Icons.monitor_weight,
                  Colors.purple,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const BMIScreen()),
                    );
                  },
                ),

                dashboardCard(
                  context,
                  "Calories",
                  Icons.local_fire_department,
                  Colors.red,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CaloriesScreen()),
                    );
                  },
                ),

                dashboardCard(
                  context,
                  "Water",
                  Icons.water_drop,
                  Colors.blue,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const WaterScreen()),
                    );
                  },
                ),

                dashboardCard(
                  context,
                  "Sleep",
                  Icons.bedtime,
                  Colors.deepPurple,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SleepScreen()),
                    );
                  },
                ),

                dashboardCard(
                  context,
                  "Weight",
                  Icons.monitor_weight,
                  Colors.orange,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const WeightScreen()),
                    );
                  },
                ),

                dashboardCard(
                  context,
                  "Wellness",
                  Icons.favorite,
                  Colors.teal,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const WellnessScreen()),
                    );
                  },
                ),

                dashboardCard(
                  context,
                  "Progress",
                  Icons.show_chart,
                  Colors.green,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ProgressScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget infoCard(IconData icon, Color color, String value, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: color.withOpacity(.15),
            child: Icon(icon, color: color),
          ),

          const SizedBox(height: 10),

          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),

          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        ],
      ),
    );
  }

  Widget dashboardCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: color.withOpacity(.15),
                child: Icon(icon, color: color, size: 30),
              ),

              const SizedBox(height: 15),

              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
