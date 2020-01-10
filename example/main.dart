import 'package:prompter_pmn/src/option.dart';
import 'package:prompter_pmn/prompter_pmn.dart';

void main() {
  final List<Option> options = [
    new Option('red', 'bloody'),
    new Option('blue', 'flyy'),
    new Option('green', 'veggy'),
    new Option('alpha', 'the harry porter clock')
  ];

  final prompter = new Prompter();
  final value = prompter.askMultiple('What color do you want', options);
  print(value);
  prompter.askBinary('Do you like dart');
} 