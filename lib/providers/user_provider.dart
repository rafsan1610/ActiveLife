import '../models/user_model.dart';

class UserProvider {
  static UserModel? currentUser;

  static void saveUser(UserModel user) {
    currentUser = user;
  }

  static UserModel? getUser() {
    return currentUser;
  }

  static bool hasUser() {
    return currentUser != null;
  }

  static void clearUser() {
    currentUser = null;
  }
}
