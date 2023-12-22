import 'dart:io';

abstract class ReadFileProvider {
  Future<String> read(String path);
}

class DefaultReadFileProvider extends ReadFileProvider {
  @override
  Future<String> read(String path) {
    File file = new File(path);
    return file.readAsString();
  }
}
