import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'locator.dart';
import 'config/app_routes.dart';
import 'config/theme.dart';
import 'core/providers/auth_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const FaceAttendanceApp());
}

class FaceAttendanceApp extends StatelessWidget {
  const FaceAttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        // Other providers can be registered here
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Face Attendance',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
