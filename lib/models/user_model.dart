class UserModel {
  final String uid;
  final String name;
  final int age;
  final String gender;
  final double height;
  final double weight;
  final String goal;
  final String activityLevel;

  // New fields
  final double bmi;
  final String bmiStatus;
  final String recommendation;

  UserModel({
    required this.uid,
    required this.name,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.goal,
    required this.activityLevel,
    required this.bmi,
    required this.bmiStatus,
    required this.recommendation,
  });

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "name": name,
      "age": age,
      "gender": gender,
      "height": height,
      "weight": weight,
      "goal": goal,
      "activityLevel": activityLevel,
      "bmi": bmi,
      "bmiStatus": bmiStatus,
      "recommendation": recommendation,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map["uid"] ?? "",
      name: map["name"] ?? "",
      age: map["age"] ?? 0,
      gender: map["gender"] ?? "",
      height: (map["height"] ?? 0).toDouble(),
      weight: (map["weight"] ?? 0).toDouble(),
      goal: map["goal"] ?? "",
      activityLevel: map["activityLevel"] ?? "",
      bmi: (map["bmi"] ?? 0).toDouble(),
      bmiStatus: map["bmiStatus"] ?? "",
      recommendation: map["recommendation"] ?? "",
    );
  }
}
