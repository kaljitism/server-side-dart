import 'dart:io';

void main() {
  File file = File('./file.txt');
  Future<String> fileContents = file.readAsString();

  fileContents.then((String contents) {
    print(contents);
  });
}
