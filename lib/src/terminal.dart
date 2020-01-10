import 'dart:io';
import 'option.dart';

class Terminal {
  const Terminal();

  void printPrompt(String prompt) {
    stdout.writeln(prompt);
  }

  void printOption(List<Option> options) {
    if (options != null) {
      options.asMap().forEach((index, values) {
        stdout.writeln('[$index] - ${values.label}');
      });
    }
    stdout.writeln("Enter a choice\n");
    stdout.write(">");
  }

  void clearScreen() {
    if (Platform.isWindows) {
      stdout.write('\x1B[2J\x1B[0f');
    } else {
      stdout.write('\x1B[2J\x1B[3J\x1B[H');
    }
  }

  String checkBinary(String input) {
    if (input[0].contains('y')) {
      return "Awesome yea dat way";
    } else if (input[0].contains('n')) {
      return "Okay, sit down son";
    } else {
      return 'Not Applicable\n';
    }
  }

  String collectInput() {
    return stdin.readLineSync();
  }
}
