// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  static SharedPreferences? sharedPreferences;

  static const String _USER_ID = "USER_ID";
  static const String _USER_EMAIL = "USER_EMAIL";
  static const String _FIRST_NAME = "FIRST_NAME";
  static const String _LAST_NAME = "LAST_NAME";
  static const String _OTHER_NAMES = "OTHER_NAME";
  static const String _DOB = "DOB";
  static const String _GENDER = "GENDER";
  static const String _IS_BVN_LINKED = "IS_BVN_LINKED";
  static const String _USER_NAME = "USER_NAME";
  static const String _USER_PHONE = "USER_PHONE";
  static const String _BANK_NAME = "BANK_NAME";
  static const String _USER_BVN = "USER_BVN";
  static const String _DEFAULT_CARD = "DEFAULT_CARD";
  static const String _USER_PASSWORD = "USER_PASSWORD";
  static const String _USER_PIN = "USER_PIN";
  static const String _USER_ACCOUNT_NO = "USER_ACCOUNT_NO";
  static const String AUTH_TOKEN = "TOKEN";
  static const String _AUTH_REFRESH_TOKEN = "REFRESH_TOKEN";
  static const String _HAS_ON_BOARDED = "HAS_ON_BOARDED";
  static const String IS_SIGNED_IN = "IS_SIGNED_IN";
  static const String _IS_CONTACTS_SAVED = "IS_CONTACTS_SAVED";

  static const String _DEVICE_ID = 'DEVICE-ID';
  static const String _FIREBASE_MESSAGGING_TOKEN = 'FIREBASE_MESSAGGING_TOKEN';

  static Future<void> initializeSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void setAuthToken({required String token}) {
    SessionService.sharedPreferences!.setString(AUTH_TOKEN, token);
  }

  static String getAuthToken({String? defaultToken}) {
    String? value = SessionService.sharedPreferences!.getString(AUTH_TOKEN);
    if (value == null) {
      return defaultToken!;
    }
    return value;
  }

  static void setRefreshAuthToken({required String refreshToken}) {
    SessionService.sharedPreferences!
        .setString(_AUTH_REFRESH_TOKEN, refreshToken);
  }

  static String getRefreshAuthToken({String? defaultToken}) {
    String? value =
        SessionService.sharedPreferences!.getString(_AUTH_REFRESH_TOKEN);
    if (value == null) {
      return defaultToken!;
    }
    return value;
  }

  static void setUserId({required int userId}) {
    SessionService.sharedPreferences!.setInt(_USER_ID, userId);
  }

  static int get getUserId {
    return SessionService.sharedPreferences!.getInt(_USER_ID)!;
  }

  static void setBankName({required String bankName}) {
    SessionService.sharedPreferences!.setString(_BANK_NAME, bankName);
  }

  static String get getBankName {
    return SessionService.sharedPreferences!.getString(_BANK_NAME)!;
  }

  static void setUserEmail({required String userEmail}) {
    SessionService.sharedPreferences!.setString(_USER_EMAIL, userEmail);
  }

  static String getUserEmail() {
    return SessionService.sharedPreferences!.getString(_USER_EMAIL)!;
  }

  static void setDefaultCard({required int defaultCard}) {
    SessionService.sharedPreferences!.setInt(_DEFAULT_CARD, defaultCard);
  }

  static int get getDefaultCard {
    return SessionService.sharedPreferences!.getInt(_DEFAULT_CARD) ?? 0;
  }

  static void setUsername({required String username}) {
    SessionService.sharedPreferences!.setString(_USER_NAME, username);
  }

  static String getUsername({String? defaultUsername}) {
    String? value = SessionService.sharedPreferences!.getString(_USER_NAME);
    if (value == null) {
      return defaultUsername!;
    }
    return value;
  }

  static void setUserPhone({required String userPhone}) {
    SessionService.sharedPreferences!.setString(_USER_PHONE, userPhone);
  }

  static String get getUserPhone {
    return SessionService.sharedPreferences!.getString(_USER_PHONE) ?? '';
  }

  static void setFirstName({required String firstName}) {
    SessionService.sharedPreferences!.setString(_FIRST_NAME, firstName);
  }

  static String get getFirstName {
    return SessionService.sharedPreferences!.getString(_FIRST_NAME)!;
  }

  static void setLastName({required String lastName}) {
    SessionService.sharedPreferences!.setString(_LAST_NAME, lastName);
  }

  static String get getLastName {
    return SessionService.sharedPreferences!.getString(_LAST_NAME)!;
  }

  static void setOtherNames({required String otherNames}) {
    SessionService.sharedPreferences!.setString(_OTHER_NAMES, otherNames);
  }

  static String get getOtherName {
    return SessionService.sharedPreferences!.getString(_OTHER_NAMES)!;
  }

  static void setDOB({required String dob}) {
    SessionService.sharedPreferences!.setString(_DOB, dob);
  }

  static String get getDOB {
    return SessionService.sharedPreferences!.getString(_DOB)!;
  }

  static void setGENDER({required String gender}) {
    SessionService.sharedPreferences!.setString(_GENDER, gender);
  }

  static String get getGender {
    return SessionService.sharedPreferences!.getString(_GENDER)!;
  }

  static void setUserBVN({required String userBVN}) {
    SessionService.sharedPreferences!.setString(_USER_BVN, userBVN);
  }

  static String get getUserBVN {
    return SessionService.sharedPreferences!.getString(_USER_BVN)!;
  }

  static void setUserAccountNo({required String userAccountNo}) {
    SessionService.sharedPreferences!
        .setString(_USER_ACCOUNT_NO, userAccountNo);
  }

  static String getUserAccountNo() {
    return SessionService.sharedPreferences!.getString(_USER_ACCOUNT_NO)!;
  }

  static void setUserPassword({
    required String password,
  }) {
    SessionService.sharedPreferences!.setString(
      _USER_PASSWORD,
      password,
    );
  }

  static String get getUserPassword {
    return SessionService.sharedPreferences!.getString(_USER_PASSWORD)!;
  }

  static void setUserPin({required String pin}) {
    SessionService.sharedPreferences!.setString(_USER_PIN, pin);
  }

  static String get getUserPin {
    return SessionService.sharedPreferences!.getString(_USER_PIN)!;
  }

  static void setDeviceId({required String deviceId}) {
    SessionService.sharedPreferences!.setString(_DEVICE_ID, deviceId);
  }

  static String getDeviceId() {
    return SessionService.sharedPreferences!.getString(_DEVICE_ID) ?? "";
  }

  static void setFirebaseToken({required String firebaseToken}) {
    SessionService.sharedPreferences!
        .setString(_FIREBASE_MESSAGGING_TOKEN, firebaseToken);
  }

  static String getFirebaseToken() {
    return SessionService.sharedPreferences!
            .getString(_FIREBASE_MESSAGGING_TOKEN) ??
        "";
  }

  static void setUserHasOnboarded({required bool hasOnboarded}) {
    SessionService.sharedPreferences!.setBool(_HAS_ON_BOARDED, hasOnboarded);
  }

  static bool getHasOnboarded({bool defaultValue = false}) {
    bool? value = SessionService.sharedPreferences!.getBool(_HAS_ON_BOARDED);
    if (value == null) {
      return defaultValue;
    }
    return value;
  }

  static void setIsSignedIn({required bool isSignedIn}) {
    SessionService.sharedPreferences!.setBool(IS_SIGNED_IN, isSignedIn);
  }

  static bool getIsSignedIn({bool defaultValue = false}) {
    bool? value = SessionService.sharedPreferences!.getBool(IS_SIGNED_IN);
    if (value == null) {
      return defaultValue;
    }
    return value;
  }

  static void setIsCantactSaved({required bool isContactsSaved}) {
    SessionService.sharedPreferences!
        .setBool(_IS_CONTACTS_SAVED, isContactsSaved);
  }

  static bool getCantactSaved({bool defaultValue = false}) {
    bool? value = SessionService.sharedPreferences!.getBool(_IS_CONTACTS_SAVED);
    if (value == null) {
      return defaultValue;
    }
    return value;
  }

  static void setIsBVNLinked({required bool isBVNLinked}) {
    SessionService.sharedPreferences!.setBool(_IS_BVN_LINKED, isBVNLinked);
  }

  static bool getIsBVNLinked({bool defaultValue = false}) {
    bool? value = SessionService.sharedPreferences!.getBool(_IS_BVN_LINKED);
    if (value == null) {
      return defaultValue;
    }
    return value;
  }

  static void setBoolean(String key, bool value) {
    SessionService.sharedPreferences!.setBool(key, value);
  }

  static bool getBoolean(String key, bool defaultValue) {
    final value = SessionService.sharedPreferences!.getBool(key);
    if (value == null) {
      return defaultValue;
    }
    return value;
  }

  static void remove(String key) {
    if (SessionService.sharedPreferences!.containsKey(key)) {
      SessionService.sharedPreferences!.remove(key);
    }
  }
}
