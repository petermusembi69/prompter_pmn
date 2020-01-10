import 'option.dart';
import 'terminal.dart';

final _terminal = const Terminal();

class Prompter {
  askBinary(String prompt) {
    String input = _ask('$prompt (y/n)>');
    print(_terminal.checkBinary(input));
    try {
      if (_terminal.checkBinary(input) == 'Not Applicable\n') {
        askBinary(prompt);
      }
    } catch (err) {
      askBinary(prompt);
    }
  }

  askMultiple(String prompt, List<Option> options) {
    _terminal.clearScreen();
    final input = _ask(prompt, options);
    try {
      return options[int.parse(input)].value;
    } catch (err) {
      askMultiple(prompt, options);
    }
  }

  _ask(String prompt, [List<Option> options]) {
    _terminal.printPrompt(prompt);
    _terminal.printOption(options);
    return _terminal.collectInput();
  }
}
