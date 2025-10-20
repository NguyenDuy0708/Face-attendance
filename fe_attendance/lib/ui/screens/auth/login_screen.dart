import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/providers/auth_provider.dart';
import '../../widgets/custom_button.dart';
import '../../../config/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController(
    text: 'student@example.com',
  );
  final TextEditingController _password = TextEditingController(
    text: 'password',
  );

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _email,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _password,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: 'Login',
              onPressed: () async {
                await auth.login(_email.text, _password.text);
                if (auth.userRole == 'teacher') {
                  AppRoutes.router.goNamed('teacherHome');
                } else {
                  AppRoutes.router.goNamed('studentHome');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
