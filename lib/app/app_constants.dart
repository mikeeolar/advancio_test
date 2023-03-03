import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  AppConstants._();

  static get kBaseUrl => dotenv.get('KBaseUrl', fallback: '');
  static get kBaseAPIKEY => dotenv.get('kAPIKEY', fallback: '');
}
