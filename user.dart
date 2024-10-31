class User {
  final String name;
  final int age;
  final int _score;

  int get score => _score;

  User({required this.name, required this.age, required int score})
      : _score = score;

  Map<String, Object> toJson() => {
        'name': name,
        'age': age,
        'score': score,
      };

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        age = json['age'] as int,
        _score = json['score'] as int;

  @override
  String toString() {
    return "User( \nname: $name,\nage: $age ,\nscore: $score)";
  }
}
