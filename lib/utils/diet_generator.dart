import '../models/user_model.dart';

class DietGenerator {
  static List<Map<String, String>> generate(UserModel user) {
    List<Map<String, String>> meals = [];

    if (user.goal == "Weight Loss") {
      meals = [
        {"meal": "Breakfast", "food": "Oatmeal + Green Tea + Boiled Egg"},
        {"meal": "Lunch", "food": "Grilled Chicken + Salad"},
        {"meal": "Snack", "food": "Apple + Almonds"},
        {"meal": "Dinner", "food": "Fish + Vegetables"},
      ];
    } else if (user.goal == "Weight Gain") {
      meals = [
        {"meal": "Breakfast", "food": "4 Eggs + Milk + Peanut Butter"},
        {"meal": "Lunch", "food": "Rice + Chicken + Potato"},
        {"meal": "Snack", "food": "Banana + Nuts"},
        {"meal": "Dinner", "food": "Fish + Rice"},
      ];
    } else {
      meals = [
        {"meal": "Breakfast", "food": "Eggs + Whole Wheat Toast"},
        {"meal": "Lunch", "food": "Rice + Vegetables + Chicken"},
        {"meal": "Snack", "food": "Fruit Salad"},
        {"meal": "Dinner", "food": "Fish + Salad"},
      ];
    }

    return meals;
  }
}
