import 'package:flutter/material.dart';
import 'package:nzinga/default_settings/app_text/app_text.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Your Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppText(
              text: 'A verification email has been sent to your email address. Please verify your email to continue.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.0),
          
          ],
        ),
      ),
    );
  }
}
