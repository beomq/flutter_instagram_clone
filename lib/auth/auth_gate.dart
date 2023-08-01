import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:instagram_clone/tab/tab_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? clientId = dotenv.env['CLIENT_ID'];

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providerConfigs: [
              const EmailProviderConfiguration(),
              GoogleProviderConfiguration(
                clientId: '$clientId',
              ),
            ],
            headerBuilder: (context, constraints, _) {
              return const Center(
                child: Text(
                  'instagram clone',
                  style: TextStyle(fontSize: 40),
                ),
              );
            },
          );
        }

        // Render your application if authenticated
        return const TabPage();
      },
    );
  }
}
