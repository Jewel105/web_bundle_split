- [English](README.md)

# web_bundle_split

一个用于分割 Web 包的 Flutter 插件。

## 功能

该插件主要用于分割 Web 包。通过将其分割成多个较小的文件块，能够实现更好的资源管理和加载性能。

## 版本

当前版本：0.0.1

## 安装

要使用该插件，请在你的 `pubspec.yaml` 文件中添加以下内容：

```yaml
dependencies:
  web_bundle_split: ^0.0.1
```

然后运行

```
flutter pub get
```

## 使用

该插件通过命令行工具运行。使用以下命令运行分割功能：

```
flutter pub run web_bundle_split split
```

### Command Parameters

- -o 或 --output: 打包后的输出路径，默认为 ./build/web。
- -s 或 --chunk-size: 每个文件块的大小（字节），默认值为 1024 \* 300（300KB）。

## 示例

以下是一个使用示例：

```
flutter pub run web_bundle_split split -o./output -s 512000
```

以上示例将 `main.dart.js` 文件分割成多个大小为 500KB（512000 字节）的文件块，并输出到 `./output` 目录。
