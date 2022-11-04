import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/exeption/auth_exeption.dart';
import 'package:todo_list_provider/app/services/user_service.dart';

class RegisterController extends ChangeNotifier {
  final UserService _userService;
  String? error;
  bool success = false;
  bool loading = false;

  RegisterController({required UserService userService})
      : _userService = userService;
  Future<void> registerUser(String email, String password) async {
    try {
      error = null;
      success = false;
      notifyListeners();
      final user = await _userService.register(email, password);
      if (user != null) {
        //sucesso
        success = true;
      } else {
        //erro
        error = 'Erro ao registrar usuário';
      }
    } on AuthException catch (e) {
      error = e.message;
    } finally {
      notifyListeners();
    }
  }
}
