import 'package:args/command_runner.dart';

import '../utils/split_util.dart';

// flutter pub run web_bundle_split split
class SplitCommand extends Command {
  @override
  String get description => "Splits a large file into smaller chunks.";

  @override
  String get name => "split";

  /// 添加参数解析
  /// add arguments to the command
  SplitCommand() {
    argParser.addOption(
      'output',
      abbr: 'o',
      help: 'Output path after packing, default: ./build/web',
    );
    argParser.addOption(
      'chunk-size',
      abbr: 's',
      help: 'Chunk size in bytes, default: 1024 * 300 (300kb) ',
    );
  }

  @override
  Future<void> run() async {
    // 解析命令行参数
    // parse command line arguments
    String? output = argResults?['output'];
    int? chunkSize = argResults?['chunk-size'];
    output ??= './build/web';
    chunkSize ??= 1024 * 300;

    // main.dart.js
    SplitUtil.splitMainJs(output, chunkSize);
  }
}
