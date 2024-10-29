import 'dart:io';
import 'admin.dart';
import 'user.dart';

void menu() {
  print("Menu :");
  print("1. Admin Mode");
  print("2. Play");
  print("3. Exit");
}

void clearScreen() {
  print("\x1B[2J\x1B[0;0H");
}

void adminPage(Admin admin) {
  clearScreen();
  while (true) {
    print("Welcome to Admin Mode :");
    print("1. Add Question ");
    print("2. Check User");
    print("3. Back to Menu");
    stdout.write("Choose your option : ");
    int choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        admin.addQuestion();
        break;
      case 2:
        admin.displayUsers();
        break;
      case 3:
        return;
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

  for (int count = 0; count < admin.questions.length; count++) {
    var question = admin.questions[count];
    print("Question: ${count + 1}. ${question.question}");

    // Display choices
    question.choices.forEach((key, value) => print("$key: $value"));

    stdout.write("Choose the answer(s) (separate with commas): ");
    String userInput = stdin.readLineSync()!.toUpperCase();

    // Split the user's input by commas and trim any whitespace
    List<String> userAnswers =
        userInput.split(',').map((s) => s.trim()).toList();

    // Check each user's answer
    for (var userAnswer in userAnswers) {
      if (question.anwers.contains(userAnswer)) {
        score += 1;
      }
    }

    print("");
  }

  // Display final score
  print("Your final score: $score out of ${admin.questions.length}");

  // Collect user information
  stdout.write("Enter your name: ");
  String userName = stdin.readLineSync()!;
  stdout.write("Enter your age: ");
  int userAge = int.parse(stdin.readLineSync()!);

  // Create a new user object and add it to the list
  User user = User(name: userName, age: userAge, score: score);
  admin.addUser(user);
  //print(user);

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
        adminPage(admin);
        break;
      case 2:
        playerMode(admin);
        break;
      case 3:
        print("Exit! bye");
        exit(0);
      default:
        print("Please choose the valid choice");
    }
  }
}
