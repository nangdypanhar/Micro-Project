class Question {
  String question;
  Map<String, Object> choices;
  List<String> answers;

  Question(
      {required this.question, required this.choices, required this.answers});

  Map<String, Object> toJson() => {
        'question': question,
        'choices': choices,
        'answers': answers,
      };

  Question.fromJson(Map<String, dynamic> json)
      : question = json['question'] as String,
        choices = Map<String, String>.from(json['choices'] as Map),
        answers = List<String>.from(json['answers'] as List);

  @override
  String toString() {
    return '''{
      "question": "$question",
      "choices": {
        ${choices.entries.map((entry) => '"${entry.key}": "${entry.value}"').join(', ')}
      },
      "answer": ${answers.map((a) => '"$a"').toList()}
    }''';
  }
}
