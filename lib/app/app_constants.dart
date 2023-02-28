import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  AppConstants._();

  static get kBaseUrl => dotenv.get('KBaseUrl', fallback: '');

  static get paystackPublicKey => dotenv.get('PaystackPublicKey', fallback: '');

  static get paystackSecretKey => dotenv.get('PaystackSecretKey', fallback: '');

  static get oAuthClientId => dotenv.get('OAuthClientId', fallback: '');
}
