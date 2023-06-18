import 'package:emotion_detection/controller/services/auth_services.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  bool? response;
  Future<void> isUserAuthenticated(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    response = await AuthServices.checkAuthStatus();
    isLoading = false;
    notifyListeners();
  }
}
