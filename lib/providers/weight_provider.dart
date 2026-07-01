class WeightProvider {
  static double currentWeight = 0;

  static List<double> weightHistory = [];

  static void saveWeight(double weight) {
    currentWeight = weight;

    if (weightHistory.isEmpty || weightHistory.last != weight) {
      weightHistory.add(weight);
    }
  }

  static double getWeight() {
    return currentWeight;
  }

  static List<double> getHistory() {
    return weightHistory.reversed.toList();
  }

  static bool hasWeight() {
    return currentWeight > 0;
  }

  static void clearWeight() {
    currentWeight = 0;
    weightHistory.clear();
  }
}
