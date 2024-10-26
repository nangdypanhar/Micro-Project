class User {
  final String name;
  final int age;
  final double _score;

  double get score => _score;

  User({required this.name, required this.age, required double score})
      : _score = score;

  @override
  String toString() {
    return "User( \nname: $name,\nage: $age ,\nscore: $score)";
  }
}

