import 'package:flutter/material.dart';

class WaterScreen extends StatefulWidget {
  const WaterScreen({super.key});

  @override
  State<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  int glasses = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Water Tracker"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Daily Water Intake",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            Icon(Icons.water_drop, size: 100, color: Colors.blue.shade400),

            const SizedBox(height: 20),

            Text(
              "$glasses Glasses",
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  glasses++;
                });
              },
              icon: const Icon(Icons.add),
              label: const Text("Add Glass"),
            ),

            const SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  if (glasses > 0) glasses--;
                });
              },
              icon: const Icon(Icons.remove),
              label: const Text("Remove Glass"),
            ),
          ],
        ),
      ),
    );
  }
}
