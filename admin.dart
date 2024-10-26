import 'dart:io';
import 'question.dart';
import 'user.dart';

class Admin {
  final List<User> users = [];
  final List<Question> questions = [];

  void addQuestion() {
    Map<String, Object> choices = {};
    int asciiCode = 'a'.codeUnitAt(0);
    stdout.write('Enter your question : ');
    String question = stdin.readLineSync()!;
    stdout.write('How many choices: ');
    int ch = int.parse(stdin.readLineSync()!);
    while (ch > 0) {
      stdout.write("Enter your choices : ${String.fromCharCode(asciiCode)}. ");
      String choice = stdin.readLineSync()!;
      choices[String.fromCharCode(asciiCode)] = choice;
      asciiCode++;
      ch--;
    }

    stdout.write("Enter your answer seperated by commas: ");
    List<String> answer =
        stdin.readLineSync()!.split(',').map((s) => s.trim()).toList();
    Question newQuestion = Question(
      question: question,
      choices: choices,
      anwers: answer,
    );

    questions.add(newQuestion);

    print("Question add successfully");
  }
}
