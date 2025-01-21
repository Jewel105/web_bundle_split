# web_bundle_split
A Flutter plugin for splitting web bundles.
## Functionality
This plugin is mainly used to split web bundles, especially for handling the main.dart.js file. It splits it into several smaller chunks to achieve better resource management and loading performance.
## Version
Current version: 0.0.1
## Installation
To use this plugin, add the following to your pubspec.yaml file:
```
dependencies:
  web_bundle_split: ^0.0.1
```
Then run:
```
flutter pub get
```
## Usage
This plugin is operated through a command-line tool. Use the following command to run the splitting function:
```
flutter pub run web_bundle_split split
```
### Command Parameters
- -o or --output: The output path after packing, default is ./build/web.
- -s or --chunk-size: The size of each file chunk in bytes, default is 1024 * 300 (300kb).
## Example
Here is an example of use:
```
flutter pub run web_bundle_split split -o./output -s 512000
```
The above example splits the main.dart.js file into multiple file chunks, each with a size of 500KB (512000 bytes), and outputs them to the ./output directory.