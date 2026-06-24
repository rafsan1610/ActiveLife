import '../models/user_model.dart';

class WorkoutGenerator {
  static List<Map<String, String>> generate(UserModel user) {
    List<Map<String, String>> workout = [];

    /// WEIGHT LOSS
    if (user.goal == "Weight Loss") {
      if (user.weight >= 90) {
        workout = [
          {"title": "Brisk Walking", "desc": "45 Minutes Daily"},
          {"title": "Cycling", "desc": "30 Minutes"},
          {"title": "Low Impact Cardio", "desc": "20 Minutes"},
        ];
      } else if (user.activityLevel == "Beginner") {
        workout = [
          {"title": "Walking", "desc": "30 Minutes Daily"},
          {"title": "Jumping Jacks", "desc": "3 Sets × 20"},
          {"title": "Bodyweight Squats", "desc": "3 Sets × 15"},
        ];
      } else if (user.activityLevel == "Intermediate") {
        workout = [
          {"title": "Running", "desc": "30 Minutes"},
          {"title": "Push Ups", "desc": "4 Sets × 20"},
          {"title": "Burpees", "desc": "3 Sets × 15"},
        ];
      } else {
        workout = [
          {"title": "HIIT Training", "desc": "40 Minutes"},
          {"title": "Sprint Intervals", "desc": "10 Rounds"},
          {"title": "Mountain Climbers", "desc": "4 Sets × 30"},
        ];
      }
    }
    /// WEIGHT GAIN
    else if (user.goal == "Weight Gain") {
      if (user.weight < 60) {
        workout = [
          {"title": "Bench Press", "desc": "4 Sets × 10"},
          {"title": "Deadlift", "desc": "4 Sets × 8"},
          {"title": "Squats", "desc": "4 Sets × 12"},
          {"title": "Pull Ups", "desc": "3 Sets × 10"},
        ];
      } else {
        workout = [
          {"title": "Dumbbell Press", "desc": "4 Sets × 12"},
          {"title": "Lunges", "desc": "4 Sets × 15"},
          {"title": "Leg Press", "desc": "4 Sets × 12"},
        ];
      }
    }
    /// MAINTAIN WEIGHT
    else {
      if (user.age > 40) {
        workout = [
          {"title": "Walking", "desc": "30 Minutes"},
          {"title": "Stretching", "desc": "15 Minutes"},
          {"title": "Yoga", "desc": "20 Minutes"},
        ];
      } else {
        workout = [
          {"title": "Jogging", "desc": "20 Minutes"},
          {"title": "Push Ups", "desc": "3 Sets × 15"},
          {"title": "Stretching", "desc": "15 Minutes"},
        ];
      }
    }

    return workout;
  }
}
