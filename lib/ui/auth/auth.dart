import 'package:finance_manager/ui/auth/widgets/sign_in.dart';
import 'package:finance_manager/ui/auth/widgets/sign_up.dart';
import 'package:finance_manager/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isSignIn = true;

  void _handleSignIn(String email, String password) {
    logger.i('Sign in with email: $email, password: $password');
    
    context.go('/home');
  }

  void _handleSignUp(String email, String password) {
    logger.i('Sign up with email: $email, password: $password');

    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _isSignIn
              ? SignInWidget(onSignIn: _handleSignIn)
              : SignUpWidget(onSignUp: _handleSignUp),
            TextButton(
              onPressed: () {
                setState(() {
                  _isSignIn = !_isSignIn;
                });
              },
              child: Text(
                _isSignIn
                  ? 'Don\'t have an account? Sign Up'
                  : 'Already have an account? Sign In',
              ),
            )
          ],
        ),
      )
    );
  }
}