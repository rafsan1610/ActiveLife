class SleepProvider {
  static double sleepHours = 0;

  static void saveSleep(double hours) {
    sleepHours = hours;
  }

  static double getSleep() {
    return sleepHours;
  }

  static bool hasSleepData() {
    return sleepHours > 0;
  }

  static void clearSleep() {
    sleepHours = 0;
  }
}
