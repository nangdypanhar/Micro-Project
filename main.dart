import 'dart:io';
import 'admin.dart';
import 'user.dart';

void menu() {
  print("Menu :");
  print("1. Play");
  print("2. Admin Mode");
  print("3. Exit");
}

void clearScreen() {
  print("\x1B[2J\x1B[0;0H");
}

void adminPage(Admin admin) {
  clearScreen();
  while (true) {
    print("Welcome to Admin Mode :");
    print("1. Check User");
    print("2. Add Question ");
    print("3. Remove Question");
    print("4. Back to Menu");
    stdout.write("Choose your option : ");
    int choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        admin.displayUsers();
        break;
      case 2:
        admin.addQuestion();
        break;
      case 3:
        admin.deleteQuestion();
        break;
      case 4:
        return;
      default:
        print("Please choose the valid option");
    }
  }
}

void playerMode(Admin admin) {
  clearScreen();
  print("Welcome to Player Mode!");

  if (admin.questions.isEmpty) {
    print("No questions available. Please add questions in Admin Mode.");
    return;
  }

  int score = 0;
  int totalScore = 0;

  for (int count = 0; count < admin.questions.length; count++) {
    var question = admin.questions[count];

    if (question.answers.length > 1) {
      print("Question: ${count + 1}. ${question.question} ( Multiple Answers)");
    } else {
      print("Question: ${count + 1}. ${question.question}");
    }

    question.choices.forEach((key, value) => print("$key: $value"));

    if (question.answers.length > 1) {
      stdout.write("Choose the answers (seperated by comma): ");
    } else {
      stdout.write("Choose the answer: ");
    }

    String userInput = stdin.readLineSync()!.toUpperCase();

    List<String> userAnswers =
        userInput.split(',').map((s) => s.trim()).toList();

    for (var userAnswer in userAnswers) {
      totalScore += 1;
      if (question.answers.contains(userAnswer)) {
        score += 1;
      }
    }

    print("");
  }

  print("Your final score: $score out of ${totalScore}");

  stdout.write("Enter your name: ");
  String userName = stdin.readLineSync()!;
  stdout.write("Enter your age: ");
  int userAge = int.parse(stdin.readLineSync()!);

  User newUser = User(name: userName, age: userAge, score: score);
  admin.addUser(newUser);

  print("Good Luck!!!!");
}

void main() {
  Admin admin = Admin();
  while (true) {
    menu();
    stdout.write("Choose your option : ");
    int choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        playerMode(admin);
        break;
      case 2:
        adminPage(admin);
        break;
      case 3:
        print("Exit! bye");
        exit(0);
      default:
        print("Please choose the valid choice");
    }
  }
}
