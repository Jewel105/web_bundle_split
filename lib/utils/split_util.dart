import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:path/path.dart' as path;
import 'package:web_bundle_split/js/js_template.dart';

class SplitUtil {
  /// 拆分 main.dart.js
  /// split main.dart.js
  static splitMainJs(String output, int chunkSize) async {
    final String mainJsFilePath = path.join(output, 'main.dart.js');
    final File mainJsFile = File(mainJsFilePath);

    if (!mainJsFile.existsSync()) {
      throw Exception('main.dart.js not found.');
    }
    // split main.dart.js
    List<String> files = await splitFile(
      file: mainJsFile,
      chunkSize: chunkSize,
      output: output,
      fileName: 'main.dart',
    );
    final String jsTemplate =
        JsTemplate.mainJsTemplate.replaceFirst('[]', jsonEncode(files));
    mainJsFile.writeAsString(jsTemplate);
  }

  /// 拆分文件
  /// split file
  static Future<List<String>> splitFile({
    required File file,
    required int chunkSize,
    required String output,
    required String fileName,
  }) async {
    // 读取整个文件内容为字节数组
    // Read the entire file into a byte list.
    final List<int> contentBytes = await file.readAsBytes();

    int fileIndex = 1;
    List<Future> futures = [];
    List<String> files = [];

    // Split files according to file size.
    for (int i = 0; i < contentBytes.length; i += chunkSize) {
      // 截取一部分字节
      // Truncate a part of bytes
      List<int> chunk = contentBytes.sublist(
        i,
        i + chunkSize > contentBytes.length
            ? contentBytes.length
            : i + chunkSize,
      );
      String hash = generateHash(chunk);
      String chunkFileName = '$fileName.$fileIndex.$hash.js';
      files.add(chunkFileName);
      String chunkFilePath = path.join(output, chunkFileName);
      File chunkFile = File(chunkFilePath);
      // 写入拆分后的文件
      // Write to the split files
      futures.add(chunkFile.writeAsBytes(chunk));
      fileIndex++;
    }
    // wait for all futures to complete
    // 等待所有写入完成
    await Future.wait(futures);

    return files;
  }

  /// 根据字节生成hash
  /// Generate hash
  static String generateHash(List<int> contentBytes) {
    Digest hash = sha256.convert(contentBytes);
    String fullHash = hash.toString();
    var length = fullHash.length;
    return fullHash.substring(0, 4) + fullHash.substring(length - 4, length);
  }
}
