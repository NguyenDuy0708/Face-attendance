import 'package:flutter/material.dart';
import '../../../config/app_routes.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => AppRoutes.router.goNamed('studentAttendance'),
              child: const Text('Scan Face'),
            ),
            ElevatedButton(
              onPressed: () => AppRoutes.router.goNamed('studentHistory'),
              child: const Text('History'),
            ),
          ],
        ),
      ),
    );
  }
}
