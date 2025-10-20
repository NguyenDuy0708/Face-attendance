import 'package:get_it/get_it.dart';
import 'core/network/api_client.dart';
import 'core/services/auth_service.dart';
import 'core/services/attendance_service.dart';
import 'core/services/face_recognition_service.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerSingleton<ApiClient>(ApiClient());
  locator.registerLazySingleton<AuthService>(
    () => AuthService(locator<ApiClient>()),
  );
  locator.registerLazySingleton<AttendanceService>(
    () => AttendanceService(locator<ApiClient>()),
  );
  locator.registerLazySingleton<FaceRecognitionService>(
    () => FaceRecognitionService(locator<ApiClient>()),
  );
}
