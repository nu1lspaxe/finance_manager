import 'package:finance_manager/ui/styles.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends StatefulWidget {
  final Function(String, String) onSignUp;

  const SignUpWidget({super.key, required this.onSignUp});

  @override 
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Styles.paddingMedium,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign Up',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: Styles.spacingXLarge),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: Styles.spacingMedium),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: Styles.spacingMedium),
          TextField(
            controller: _confirmPasswordController,
            obscureText: _obscurePassword,
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: Styles.spacingLarge),
          ElevatedButton(
            onPressed: () {
              widget.onSignUp(
                _emailController.text,
                _passwordController.text,
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, Styles.buttonHeight),
            ),
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}