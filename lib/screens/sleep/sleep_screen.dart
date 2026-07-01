import 'package:flutter/material.dart';

import '../../providers/sleep_provider.dart';

class SleepScreen extends StatefulWidget {
  const SleepScreen({super.key});

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  final TextEditingController sleepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sleep Tracker"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.bedtime, size: 90, color: Colors.deepPurple),

            const SizedBox(height: 20),

            const Text(
              "Track Your Sleep",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            TextField(
              controller: sleepController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: "Hours Slept",
                hintText: "Example: 7.5",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.nightlight_round),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (sleepController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter your sleep hours"),
                      ),
                    );
                    return;
                  }

                  final hours =
                      double.tryParse(sleepController.text.trim()) ?? 0;

                  if (hours <= 0 || hours > 24) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Sleep hours must be between 1 and 24"),
                      ),
                    );
                    return;
                  }

                  SleepProvider.saveSleep(hours);

                  setState(() {});

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Sleep data saved successfully"),
                    ),
                  );
                },
                label: const Text("Save Sleep", style: TextStyle(fontSize: 18)),
              ),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.bedtime, color: Colors.deepPurple),
                title: const Text("Today's Sleep"),
                subtitle: Text(
                  SleepProvider.hasSleepData()
                      ? "${SleepProvider.getSleep()} Hours"
                      : "No Sleep Data",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
