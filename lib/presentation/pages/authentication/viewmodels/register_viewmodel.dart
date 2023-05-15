import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerViewModel = ChangeNotifierProvider((ref) => RegisterViewModel());

class RegisterViewModel extends ChangeNotifier {
  bool isLoading = false;
  bool isObscured = true;

  void toggleObscure() {
    isObscured = !isObscured;
    notifyListeners();
  }

  void register(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    isLoading = false;
    notifyListeners();

    Navigator.pushNamed(context, '/register-verification');
  }
}
