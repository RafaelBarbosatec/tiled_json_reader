import 'package:flutter/services.dart';

abstract class ReadFileProvider {
  Future<String> read(String path);
}

class RootBundleReadFileProvider extends ReadFileProvider {
  @override
  Future<String> read(String path) {
    return rootBundle.loadString(path);
  }
}
