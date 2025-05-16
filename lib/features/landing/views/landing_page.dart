import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'features/widgets/navbar.dart';
import 'features/landing/widgets/info_section.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;
        final email = user?.email ?? 'Guest';

        return Scaffold(
          body: ListView(
            children: [
              Navbar(email: email),
              InfoSection(),
            ],
          ),
        );
      },
    );
  }
}