import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginViewModel =
    ChangeNotifierProvider((ref) => LoginViewModel());

class LoginViewModel extends ChangeNotifier {
  
  bool isLoading = false;
  bool isObscured = true;


  void toggleObscure() {
    isObscured = !isObscured;
    notifyListeners();
  }

  void login(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    
    await Future.delayed(const Duration(seconds: 1));

    isLoading = false;
    notifyListeners();

    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacementNamed(context, '/home');
  }
}
