class WorkoutProgressProvider {
  static final Map<String, bool> workouts = {
    "Push Ups": false,
    "Squats": false,
    "Running": false,
    "Plank": false,
    "Jumping Jacks": false,
  };

  static void toggleWorkout(String workout) {
    workouts[workout] = !(workouts[workout] ?? false);
  }

  static Map<String, bool> getWorkouts() {
    return workouts;
  }

  static int completedCount() {
    return workouts.values.where((e) => e).length;
  }

  static int totalCount() {
    return workouts.length;
  }

  static double progress() {
    return (completedCount() / totalCount()) * 100;
  }

  static void reset() {
    workouts.updateAll((key, value) => false);
  }
}
