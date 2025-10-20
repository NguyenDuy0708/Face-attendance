import 'package:flutter/material.dart';
import '../services/attendance_service.dart';
import '../../locator.dart';

class AttendanceProvider extends ChangeNotifier {
  final AttendanceService _service = locator<AttendanceService>();
  List<dynamic> _history = [];

  List<dynamic> get history => _history;

  Future<void> loadHistory(int studentId) async {
    _history = await _service.fetchHistory(studentId);
    notifyListeners();
  }
}
