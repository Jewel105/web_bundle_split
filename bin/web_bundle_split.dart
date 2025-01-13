import 'package:args/command_runner.dart';
import 'package:web_bundle_split/command/split_main.dart';

void main(List<String> arguments) {
  CommandRunner('web_bundle_split', 'Splitting web bundles')
    ..addCommand(SplitMain())
    ..run(arguments);
}
