import 'dart:io';

void main() {
  List<Map<String, Object>> questions = [
    {
      "question": "What is the capital of Cambodia?",
      "choices": {
        "A": "Phnom Penh",
        "B": "New York",
        "C": "Tokoyo",
      },
      "answer": ["Phnom Penh"],
    }
  ];

  questions.forEach((questionMap) {
    // Extracting the data
    String question = questionMap["question"] as String;
    Map<String, String> choices = questionMap["choices"] as Map<String, String>;
    List<String> answer = questionMap["answer"] as List<String>;

    // Printing the question
    print("Question: $question");

    // Printing the choices
    choices.forEach(
      (key, value) {
        print("$key. $value");
      },
    );
    // Printing the correct answer
    stdout.write("Choose: ");
    String userInput = stdin.readLineSync()!.toUpperCase();
    print(userInput);
    if (answer.contains(choices[userInput])) {
      print("Correct");
    } else {
      print("Incorrect");
    }
  });
}
