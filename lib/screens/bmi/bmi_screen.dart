import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  double bmi = 0;
  String category = "";
  String recommendation = "";
  Color bmiColor = Colors.grey;

  void calculateBMI() {
    double height = double.tryParse(heightController.text.trim()) ?? 0;

    double weight = double.tryParse(weightController.text.trim()) ?? 0;

    if (height <= 0 || weight <= 0) return;

    double heightInMeter = height / 100;

    double result = weight / (heightInMeter * heightInMeter);

    String status;
    String advice;
    Color statusColor;

    if (result < 18.5) {
      status = "Underweight";
      advice =
          "You should increase your calorie intake and follow a healthy weight gain diet.";
      statusColor = Colors.orange;
    } else if (result < 25) {
      status = "Normal Weight";
      advice = "Great! Maintain your current healthy lifestyle.";
      statusColor = Colors.green;
    } else if (result < 30) {
      status = "Overweight";
      advice = "Try regular exercise and a balanced diet to reduce weight.";
      statusColor = Colors.amber;
    } else {
      status = "Obese";
      advice =
          "Consult a healthcare professional and follow a structured weight loss plan.";
      statusColor = Colors.red;
    }

    setState(() {
      bmi = result;
      category = status;
      recommendation = advice;
      bmiColor = statusColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const Icon(Icons.monitor_weight, size: 90, color: Colors.purple),

            const SizedBox(height: 20),

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

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: calculateBMI,
                child: const Text(
                  "Calculate BMI",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 25),

            if (bmi > 0)
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20),

                  child: Column(
                    children: [
                      Text(
                        bmi.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: bmiColor,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        category,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: bmiColor,
                        ),
                      ),

                      const SizedBox(height: 15),

                      Text(
                        recommendation,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),

                      const SizedBox(height: 20),

                      const Divider(),

                      const Text(
                        "Healthy BMI Range: 18.5 - 24.9",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
