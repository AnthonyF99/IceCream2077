import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isConnected = false;

  bool get isConnected => _isConnected;

  void logIn() {
    _isConnected = true;
    notifyListeners();
  }

  void logOut() {
    _isConnected = false;
    notifyListeners();
  }
}
