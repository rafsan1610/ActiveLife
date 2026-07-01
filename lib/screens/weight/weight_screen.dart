import 'package:flutter/material.dart';

import '../../providers/weight_provider.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weight Tracker"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.monitor_weight, size: 90, color: Colors.orange),

            const SizedBox(height: 20),

            const Text(
              "Track Your Weight",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            TextField(
              controller: weightController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: "Current Weight (kg)",
                hintText: "Example: 72",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.monitor_weight),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (weightController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter your weight")),
                    );
                    return;
                  }

                  final weight =
                      double.tryParse(weightController.text.trim()) ?? 0;

                  if (weight <= 0 || weight > 300) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Enter a valid weight")),
                    );
                    return;
                  }

                  WeightProvider.saveWeight(weight);

                  weightController.clear();

                  setState(() {});

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Weight saved successfully")),
                  );
                },
                label: const Text(
                  "Save Weight",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.monitor_weight, color: Colors.orange),
                title: const Text("Current Weight"),
                subtitle: Text(
                  WeightProvider.hasWeight()
                      ? "${WeightProvider.getWeight()} kg"
                      : "No Weight Saved",
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Weight History",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            if (WeightProvider.getHistory().isEmpty)
              const Card(child: ListTile(title: Text("No History Available")))
            else
              ...WeightProvider.getHistory().map(
                (weight) => Card(
                  child: ListTile(
                    leading: const Icon(Icons.history),
                    title: Text("$weight kg"),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
