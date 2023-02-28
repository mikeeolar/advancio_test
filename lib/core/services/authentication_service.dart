import 'package:advancio_test/core/helpers/sql_helper.dart';

class AuthenticationService {
  Future<int> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final id = await SQLHelper.createUser(
        fullName: fullName, email: email, password: password);
    return id;
  }

  Future<int> setPin({
    required int id,
    required String pin,
  }) async {
    final result = await SQLHelper.updateUser(
      id: id,
      pin: pin,
    );
    return result;
  }
}
