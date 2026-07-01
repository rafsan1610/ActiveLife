class WellnessProvider {
  static List<String> tips = [];

  static void setTips(List<String> newTips) {
    tips = newTips;
  }

  static List<String> getTips() {
    return tips;
  }

  static bool hasTips() {
    return tips.isNotEmpty;
  }

  static void clearTips() {
    tips.clear();
  }
}
