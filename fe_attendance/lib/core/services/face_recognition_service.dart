import '../network/api_client.dart';
import '../../config/constants.dart';

class FaceRecognitionService {
  final ApiClient api;
  FaceRecognitionService(this.api);

  Future<Map<String, dynamic>> verifyFace(Map<String, dynamic> payload) async {
    final dio = api.dio;
    final resp = await dio.post('${AppConstants.BASE_URL_PYTHON_AI}/verify', data: payload);
    return resp.data as Map<String, dynamic>;
  }
}
