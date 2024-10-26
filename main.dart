import 'dart:io';
import 'admin.dart';

void menu() {
  clearScreen();
  print("Menu :");
  print("1. Admin Mode");
  print("2. Play");
  print("3. Exit");
}

void clearScreen() {
  print("\x1B[2J\x1B[0;0H");
}

void adminPage() {
  clearScreen();
  Admin admin = Admin();
  while (true) {
    print("Welcome to Admin Mode :");
    print("1. Add Question ");
    print("2. Check User");
    print("3. Back to Menu");
    stdout.write("Choose your opt : ");
    int choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        admin.addQuestion();
        break;
      case 3:
        return;
    }
  }
}

void main() {
  while (true) {
    menu();
    stdout.write("Choose your opt : ");
    int choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        adminPage();
        break;
      case 2:
        print("Play");
      case 3:
        print("Exit! bye");
        exit(0);
      default:
        print("Please choose the valid choice");
    }
  }
}
