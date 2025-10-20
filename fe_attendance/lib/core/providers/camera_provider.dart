import 'package:flutter/material.dart';

class CameraProvider extends ChangeNotifier {
  // Placeholder for camera state and controller
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  Future<void> initCamera() async {
    _isInitialized = true;
    notifyListeners();
  }
}
