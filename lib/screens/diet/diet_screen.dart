import 'package:flutter/material.dart';

class DietScreen extends StatelessWidget {
  const DietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diet Plan"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          DietCard(meal: "Breakfast", food: "Oats, Banana, Milk"),
          DietCard(meal: "Lunch", food: "Rice, Chicken, Vegetables"),
          DietCard(meal: "Evening Snack", food: "Apple and Nuts"),
          DietCard(meal: "Dinner", food: "Fish, Salad, Soup"),
        ],
      ),
    );
  }
}

class DietCard extends StatelessWidget {
  final String meal;
  final String food;

  const DietCard({super.key, required this.meal, required this.food});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: const Icon(Icons.restaurant, color: Colors.green, size: 40),
        title: Text(meal, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(food),
      ),
    );
  }
}
