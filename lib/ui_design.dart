import 'package:firebase_practice_project/authentication.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthenticationScreen(),
    );
  }
}

class AuthenticationScreen extends StatelessWidget {
  final AuthenticationService _auth = AuthenticationService();

  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Firebase Auth'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Example: Sign up
                String error = await _auth.signUp(
                  email: 'example@email.com',
                  password: 'password123',
                );
                if (error == null) {
                  print('Sign up successful');
                } else {
                  print('Error: $error');
                }
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Example: Sign in
                String error = await _auth.signIn(
                  email: 'example@email.com',
                  password: 'password123',
                );
                if (error == null) {
                  print('Sign in successful');
                } else {
                  print('Error: $error');
                }
              },
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Example: Sign out
                await _auth.signOut();
                print('Sign out successful');
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
