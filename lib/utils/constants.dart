import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static String get apiUrl => dotenv.env['API_BASE_URL'] ?? 'http://localhost.com/api';
}
