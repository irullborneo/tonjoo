import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static final String _api =
      dotenv.env['API'] ?? 'https://test-android.tongkolspace.com';
  
  static String baseUrl() {
    return _api;
  }
}
