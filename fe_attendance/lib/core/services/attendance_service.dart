import '../network/api_client.dart';

class AttendanceService {
  final ApiClient api;
  AttendanceService(this.api);

  Future<List<dynamic>> fetchHistory(int studentId) async {
    final resp = await api.get('/students/$studentId/attendance');
    return resp.data as List<dynamic>;
  }
}
