import 'package:logger/logger.dart';

class CustomLogger {
  static final logger = Logger();

  static d(String tag, String message) {
    logger.d("$tag : $message", time: DateTime.now());
  }

  static e(String tag, String message, Object? error) {
    logger.e("$tag : $message", time: DateTime.now(), error: error);
  }

}