import 'package:args/command_runner.dart';

class SplitMain extends Command {
  @override
  String get description => "Splits a large file into smaller chunks.";

  @override
  String get name => "split";

  /// 添加参数解析
  /// add arguments to the command
  SplitMain() {
    argParser.addOption('input', abbr: 'i', help: 'Path to the input file');
  }

  @override
  Future<void> run() async {
    // 解析命令行参数
    String? input = argResults?['input'];
    input ??= './build/web/main.js.dart';

    print('Splitting file: $input');
  }
}
