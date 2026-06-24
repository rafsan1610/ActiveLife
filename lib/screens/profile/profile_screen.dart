import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../../providers/user_provider.dart';
import '../diet/diet_screen.dart';
import '../workout/workout_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  String gender = "Male";
  String goal = "Weight Loss";
  String activityLevel = "Beginner";

  double bmi = 0;
  String bmiStatus = "";
  String recommendation = "";

  void calculateBMI() {
    double height = double.tryParse(heightController.text.trim()) ?? 0;
    double weight = double.tryParse(weightController.text.trim()) ?? 0;

    if (height <= 0 || weight <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter height and weight")),
      );
      return;
    }

    double heightMeter = height / 100;
    double result = weight / (heightMeter * heightMeter);

    String status;
    String advice;

    if (result < 18.5) {
      status = "Underweight";
      advice = "Weight Gain Program Recommended";
    } else if (result < 25) {
      status = "Normal Weight";
      advice = "Maintain Weight Program Recommended";
    } else if (result < 30) {
      status = "Overweight";
      advice = "Weight Loss Program Recommended";
    } else {
      status = "Obese";
      advice = "Strict Weight Loss Program Recommended";
    }

    setState(() {
      bmi = result;
      bmiStatus = status;
      recommendation = advice;
    });
  }

  UserModel buildUser() {
    return UserModel(
      uid: "local_user",
      name: nameController.text.trim(),
      age: int.tryParse(ageController.text) ?? 0,
      gender: gender,
      height: double.tryParse(heightController.text) ?? 0,
      weight: double.tryParse(weightController.text) ?? 0,
      goal: goal,
      activityLevel: activityLevel,
      bmi: bmi,
      bmiStatus: bmiStatus,
      recommendation: recommendation,
    );
  }

  bool saveProfile() {
    if (nameController.text.trim().isEmpty ||
        ageController.text.trim().isEmpty ||
        heightController.text.trim().isEmpty ||
        weightController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all profile fields")),
      );

      return false;
    }

    if (bmi == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please calculate BMI first")),
      );

      return false;
    }

    final user = buildUser();

    UserProvider.saveUser(user);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Profile Saved Successfully")));

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(radius: 55, child: Icon(Icons.person, size: 60)),

            const SizedBox(height: 20),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Full Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Age",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            DropdownButtonFormField(
              value: gender,
              decoration: const InputDecoration(
                labelText: "Gender",
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: "Male", child: Text("Male")),
                DropdownMenuItem(value: "Female", child: Text("Female")),
              ],
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            const SizedBox(height: 15),

            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Height (cm)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Weight (kg)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            DropdownButtonFormField(
              value: goal,
              decoration: const InputDecoration(
                labelText: "Goal",
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: "Weight Loss",
                  child: Text("Weight Loss"),
                ),
                DropdownMenuItem(
                  value: "Weight Gain",
                  child: Text("Weight Gain"),
                ),
                DropdownMenuItem(
                  value: "Maintain Weight",
                  child: Text("Maintain Weight"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  goal = value!;
                });
              },
            ),

            const SizedBox(height: 15),

            DropdownButtonFormField(
              value: activityLevel,
              decoration: const InputDecoration(
                labelText: "Activity Level",
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: "Beginner", child: Text("Beginner")),
                DropdownMenuItem(
                  value: "Intermediate",
                  child: Text("Intermediate"),
                ),
                DropdownMenuItem(value: "Advanced", child: Text("Advanced")),
              ],
              onChanged: (value) {
                setState(() {
                  activityLevel = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.monitor_weight),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                ),
                onPressed: calculateBMI,
                label: const Text(
                  "Calculate BMI",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 20),

            if (bmi > 0)
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "BMI : ${bmi.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        bmiStatus,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),

                      const SizedBox(height: 15),

                      Text(
                        recommendation,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  saveProfile();
                },
                child: const Text(
                  "Save Profile",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.fitness_center),
                onPressed: () {
                  if (!saveProfile()) return;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          WorkoutScreen(user: UserProvider.getUser()!),
                    ),
                  );
                },
                label: const Text("Generate Workout Plan"),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.restaurant),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (!saveProfile()) return;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DietScreen(user: UserProvider.getUser()!),
                    ),
                  );
                },
                label: const Text("Generate Diet Plan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
