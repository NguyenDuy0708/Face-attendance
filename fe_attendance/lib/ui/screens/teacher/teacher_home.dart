import 'package:flutter/material.dart';
import '../../../config/app_routes.dart';

class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teacher Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => AppRoutes.router.goNamed('teacherReport'),
              child: const Text('View Reports'),
            ),
          ],
        ),
      ),
    );
  }
}
