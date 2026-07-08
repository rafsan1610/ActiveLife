import 'package:flutter/material.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  bool workoutReminder = true;
  bool waterReminder = true;
  bool sleepReminder = false;
  bool dietReminder = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Reminders"),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.deepOrange,
              child: Icon(
                Icons.notifications_active,
                color: Colors.white,
                size: 40,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Manage Your Daily Reminders",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            Card(
              child: SwitchListTile(
                secondary: const Icon(Icons.fitness_center),
                title: const Text("Workout Reminder"),
                subtitle: const Text("Daily at 7:00 AM"),
                value: workoutReminder,
                onChanged: (value) {
                  setState(() {
                    workoutReminder = value;
                  });
                },
              ),
            ),

            Card(
              child: SwitchListTile(
                secondary: const Icon(Icons.water_drop),
                title: const Text("Water Reminder"),
                subtitle: const Text("Every 2 Hours"),
                value: waterReminder,
                onChanged: (value) {
                  setState(() {
                    waterReminder = value;
                  });
                },
              ),
            ),

            Card(
              child: SwitchListTile(
                secondary: const Icon(Icons.restaurant),
                title: const Text("Meal Reminder"),
                subtitle: const Text("Breakfast • Lunch • Dinner"),
                value: dietReminder,
                onChanged: (value) {
                  setState(() {
                    dietReminder = value;
                  });
                },
              ),
            ),

            Card(
              child: SwitchListTile(
                secondary: const Icon(Icons.bedtime),
                title: const Text("Sleep Reminder"),
                subtitle: const Text("10:30 PM"),
                value: sleepReminder,
                onChanged: (value) {
                  setState(() {
                    sleepReminder = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.save),
                label: const Text(
                  "Save Reminder Settings",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Reminder settings saved successfully."),
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
