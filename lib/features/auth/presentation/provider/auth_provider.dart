import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unique_admin_application/core/config/get_it_setup.dart';
import 'package:unique_admin_application/data/repository/auth_repository.dart';
import 'package:unique_admin_application/helper/exception_handler.dart';
import 'package:unique_admin_application/utils/dialog_services.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  AuthProvider({required this.authRepository});

  bool signingUser = false;

  User? userdata;

  void signInUser(String email, String password, Function callback) async {
    signingUser = true;
    notifyListeners();
    try {
      userdata = await authRepository.signInWithEmailPassword(
          email: email, password: password);
      callback();
    } catch (e) {
      final errorMessage = handleExceptionWithMessage(e);
      getIt<DialogServices>().showMessageError(errorMessage);
    } finally {
      signingUser = false;
    }
    notifyListeners();
  }
}
