import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';

class CustomDialogBox {
  static void show(
    BuildContext context,
    VoidCallback onPressed,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Locattion permission denied!',
            style: TextStyle(fontSize: 20),
          ),
          content: const Text(
            'Please turn on location permissions in the settings.\nPermissions > Location > Allow',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: onPressed,
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () {
                AppSettings.openAppSettings();
              },
              child: const Text('Open App Settings'),
            ),
          ],
        );
      },
    );
  }
}

class CustomSnackbar {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green[100],
        content: Text(
          message,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          textColor: Colors.green[900],
          label: 'Close',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}
