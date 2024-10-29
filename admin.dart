import 'dart:io';
import 'question.dart';
import 'user.dart';

class Admin {
  final List<User> users = [];
  final List<Question> questions = [
    Question(
      question: "What is the capital of France?",
      choices: {'A': "Paris", 'B': "London", 'C': "Rome", 'D': "Berlin"},
      anwers: ["B"],
    ),
    Question(
      question: "Which planet is known as the Red Planet?",
      choices: {'A': "Earth", 'B': "Mars", 'C': "Jupiter", 'D': "Venus"},
      anwers: ["B"],
    ),
    Question(
      question: "Which is the Progamming languagge?",
      choices: {'A': "C++", 'B': "Cobra", 'C': "Python", 'D': "Java"},
      anwers: ["A", 'C', "D"],
    ),
  ];

  void addQuestion() {
    Map<String, Object> choices = {};
    int asciiCode = 'A'.codeUnitAt(0);
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
    List<String> answer = stdin
        .readLineSync()!
        .toUpperCase()
        .split(',')
        .map((s) => s.trim())
        .toList();
    Question newQuestion = Question(
      question: question,
      choices: choices,
      anwers: answer,
    );

    questions.add(newQuestion);
    print(newQuestion);

    print("Question add successfully");

  }

  void displayUsers() {
    if (users.isEmpty) {
      print("No users have played the quiz yet :( ");
    }
    else {
      print("User Information:");
      for (var user in users) {
        print(user);
      }
    }
  }
}
