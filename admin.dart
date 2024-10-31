import 'dart:convert';
import 'dart:io';
import 'question.dart';
import 'user.dart';

class Admin {
  List<User> users = [];
  List<Question> questions = [];
  final userData = File('userData.json');
  final questionData = File('questions.json');

  Admin() {
    loadQuestionsFromFile();
    loadUserFromFile();
  }

  void saveQuestionsToFile() {
    List<Map<String, Object>> jsonList =
        questions.map((question) => question.toJson()).toList();
    loadQuestionsFromFile();
    questionData.writeAsStringSync(jsonEncode(jsonList));
  }

  void loadQuestionsFromFile() {
    if (!questionData.existsSync()) {
      print("No saved questions found.");
      return;
    }

    String jsonString = questionData.readAsStringSync();
    List<dynamic> jsonData = jsonDecode(jsonString);
    questions = jsonData.map((json) => Question.fromJson(json)).toList();
  }

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

    stdout.write("Enter your answer separated by commas: ");
    List<String> answer = stdin
        .readLineSync()!
        .toUpperCase()
        .split(',')
        .map((s) => s.trim())
        .toList();

    Question newQuestion = Question(
      question: question,
      choices: choices,
      answers: answer,
    );

    questions.add(newQuestion);
    saveQuestionsToFile();
    loadQuestionsFromFile();
    print("Questions added successfully");
  }

  void deleteQuestion() {
    if (questions.isEmpty) {
      print("No question found ! Please add question");
    } else {
      int count = 1;
      for (var question in questions) {
        print("$count.${question.question}");
        count++;
      }
      stdout.write('Choose your opt to delete : ');
      int opt = int.parse(stdin.readLineSync()!);
      questions.removeAt(opt - 1);
      print("Question remove successfully");
      saveQuestionsToFile();
      loadQuestionsFromFile();
    }
  }

  void loadUserFromFile() {
    if (!userData.existsSync()) {
      print("No user found");
      return;
    }

    String jsonString = userData.readAsStringSync();
    List<dynamic> jsonData = jsonDecode(jsonString);
    users = jsonData.map((json) => User.fromJson(json)).toList();
  }

  void addUser(User newUser) {
    users.add(newUser);
    String jsonString = jsonEncode(users.map((user) => user.toJson()).toList());
    userData.writeAsStringSync(jsonString);
    loadUserFromFile();
  }

  void displayUsers() {
    if (users.isEmpty) {
      print("No users have played the quiz yet :( ");
    } else {
      print("User Information:");
      print("Username         Age           Score");

      for (var user in users) {
        print(
            "${user.name.padRight(16)} ${user.age.toString().padRight(12)} ${user.score}");
      }
    }
  }
}
