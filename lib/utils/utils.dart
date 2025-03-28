import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(),
);

class Utils {
  static String loadEnv(String key) {
    final value = dotenv.env[key];
    if (value == null) {
      throw Exception('$key is not found in .env');
    }
    return value;
  }
}