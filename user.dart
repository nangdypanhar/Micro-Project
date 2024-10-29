class User {
  final String name;
  final int age;
  final int _score;

  int get score => _score;

  User({required this.name, required this.age, required int score})
      : _score = score;

  @override
  String toString() {
    return "User( \nname: $name,\nage: $age ,\nscore: $score)";
  }
}

