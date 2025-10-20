import 'package:flutter/material.dart';

class LoadingDialog {
  static void show(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 12),
            Text(message ?? 'Loading'),
          ],
        ),
      ),
    );
  }

  static void hide(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).pop();
}
